#!/usr/bin/env python3
"""Replay a captured HTTP response, byte-for-byte body, for one offline emulator test.

Capture files are deliberately kept in ignored apk-inspection; never commit
the third-party body/cookies. No external network access by this server.
"""
from __future__ import annotations
import argparse
import os
from datetime import datetime, timezone
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

CAPTURE = Path(__file__).resolve().parents[1] / "apk-inspection" / "may-replay"
LOG = CAPTURE / "replay-requests.log"
CATALOG_PATH = "/aimoge/futaba.php?mode=cat"
THREAD_PATH = "/aimoge/res/1449110872.htm"
MODE_FILE = CAPTURE / "mode.txt"


def catalog_variant() -> bytes:
    original = (CAPTURE / "may-catalog.response-body.bin").read_bytes()
    mode = MODE_FILE.read_text(encoding="ascii").strip() if MODE_FILE.is_file() else "full"
    if mode == "full":
        return original
    import re
    if mode == "single-real" or mode.startswith("real-"):
        table = re.search(rb"<table[^>]*id=[\'\"]cattable[\'\"][^>]*>", original, re.I)
        if table is None:
            raise ValueError("Cannot find source cattable")
        first_cell_end = original.find(b"</td>", table.end())
        if first_cell_end < 0:
            raise ValueError("Cannot find source table cell")
        fragment = original[table.start():first_cell_end + 5]
        if mode == "real-short-href":
            fragment = re.sub(rb"res/\d+\.htm", b"res/1001.htm", fragment, count=1)
        elif mode == "real-local-image":
            fragment = re.sub(rb"src='[^']+'", b"src='/aimoge/thumb/1.png'", fragment, count=1)
        elif mode == "real-image-cat-local":
            fragment = re.sub(rb"src='[^']+'", b"src='/aimoge/cat/1795265158529s.jpg'", fragment, count=1)
        elif mode == "real-image-cat-short":
            fragment = re.sub(rb"src='[^']+'", b"src='/b/cat/1s.jpg'", fragment, count=1)
        elif mode == "real-image-thumb-jpg":
            fragment = re.sub(rb"src='[^']+'", b"src='/aimoge/thumb/1795265158529s.jpg'", fragment, count=1)
        elif mode == "real-no-target":
            fragment = fragment.replace(b" target='_blank'", b"", 1)
        elif mode == "real-no-dimensions":
            fragment = re.sub(rb" width=\d+ height=\d+", b"", fragment, count=1)
        elif mode == "real-no-br":
            fragment = fragment.replace(b"<br>", b"", 2)
        elif mode == "real-synthetic-text":
            fragment = re.sub(rb"<small>.*?</small>", b"<small>futatabi test</small>", fragment, count=1)
            fragment = re.sub(rb"<font size=2>\d+</font>", b"<font size=2>1</font>", fragment, count=1)
        elif mode != "single-real":
            raise ValueError(f"Unknown real-cell variant {mode!r}")
        return (b"<!DOCTYPE html><html><head><meta charset=Shift_JIS></head><body>"
                + fragment + b"</tr></table></body></html>")
    if mode == "synthetic-valid-minimal":
        return (b"<!DOCTYPE html><html><head><meta charset=Shift_JIS></head><body>"
                b"<table id=\'cattable\'><tr><td><a href=\'res/1001.htm\'>"
                b"<img src=\'/aimoge/thumb/1795265158529s.jpg\'></a>"
                b"<small>futatabi test</small><font size=2>1</font>"
                b"</td></tr></table></body></html>")
    if mode in ("synthetic-target", "synthetic-no-target", "synthetic-no-dimensions", "synthetic-no-br",
                "synthetic-valid-image", "synthetic-valid-no-target",
                "synthetic-valid-no-dimensions", "synthetic-valid-no-br"):
        target = " target=\'_blank\'" if mode not in ("synthetic-no-target", "synthetic-valid-no-target") else ""
        dims = " width=50 height=50" if mode not in ("synthetic-no-dimensions", "synthetic-valid-no-dimensions") else ""
        br = "<br>" if mode not in ("synthetic-no-br", "synthetic-valid-no-br") else ""
        imgsrc = "/aimoge/thumb/1795265158529s.jpg" if mode.startswith("synthetic-valid") else "/aimoge/thumb/1.png"
        html = ("<!DOCTYPE html><html><head><meta charset=Shift_JIS></head><body>"
                "<table border=1 align=center id=\'cattable\'><tr><td>"
                f"<a href=\'res/1001.htm\'{target}>"
                f"<img src=\'{imgsrc}\' border=0{dims} alt=\'\' loading=\'lazy\'></a>"
                f"{br}<small>futatabi test</small>{br}<font size=2>1</font>"
                "</td></tr></table></body></html>")
        return html.encode("shift_jis")
    raise ValueError(f"Unrecognized replay mode {mode!r}")

class ReplayHandler(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"

    def log_message(self, format, *args):
        with LOG.open("a", encoding="utf-8") as f:
            f.write(
                f"{datetime.now(timezone.utc).isoformat()} "
                f"method={self.command} path={self.path!r} "
                f"ua={self.headers.get('User-Agent', '<missing>')!r}\n"
            )

    def do_GET(self):
        self.log_message("request")
        images = {
            "/aimoge/src/1795265158529.jpg": "first-src.jpg",
            "/aimoge/thumb/1795265449925s.jpg": "first-thumb.jpg",
        }
        if self.path in images:
            data = (CAPTURE / images[self.path]).read_bytes()
            self.send_response(200)
            self.send_header("Content-Type", "image/jpeg")
            self.send_header("Content-Length", str(len(data)))
            self.end_headers()
            self.wfile.write(data)
            return
        if self.path == CATALOG_PATH:
            raw = (CAPTURE / "may-catalog.response-headers.txt").read_bytes()
            data = catalog_variant()
            framing = f"{len(data):X}\r\n".encode("ascii") + data + b"\r\n0\r\n\r\n"
        elif self.path == THREAD_PATH:
            raw = (CAPTURE / "may-thread.response-headers.txt").read_bytes()
            data = (CAPTURE / "may-thread.response-body.bin").read_bytes()
            framing = data  # Captured Content-Length response, not chunked.
        else:
            self.send_error(404, "Not captured")
            return
        self.wfile.write(raw.rstrip(b"\r\n") + b"\r\n\r\n")
        self.wfile.write(framing)
        self.wfile.flush()
        self.close_connection = True

    def do_POST(self):
        self.send_error(403, "Read-only replay")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=18766)
    args = ap.parse_args()
    if args.port != 18766:
        ap.error("Only test port 18766 supported")
    if not (CAPTURE / "may-catalog.response-body.bin").is_file():
        ap.error("Capture missing")
    with ThreadingHTTPServer(("127.0.0.1", args.port), ReplayHandler) as server:
        print(f"Exact may catalog replay listening at 127.0.0.1:{args.port}", flush=True)
        server.serve_forever()

if __name__ == "__main__":
    main()
