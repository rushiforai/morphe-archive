#!/usr/bin/env python3
"""Offline futaba-shaped fixture for futatabi's mandatory ADB reverse gate.

This is NOT the Android in-process bridge. No external requests are made.
"""
from __future__ import annotations

import argparse
import base64
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlsplit, parse_qs

PORT = 18765
# Self-contained 1x1 PNG image; network access is neither required nor permitted.
PNG = base64.b64decode(
    "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+/l1cAAAAASUVORK5CYII="
)
BASE = "/aimoge/"
TITLE = "futatabi test board"
THREAD_ID = 1001


def sjis_html(body: str) -> bytes:
    # Shift_JIS does not encode all Unicode characters. Leave any such characters
    # as numeric references so HTML parsers still receive their original values.
    return (
        "<!DOCTYPE html><html lang='ja'><head>"
        "<meta http-equiv='Content-Type' content='text/html; charset=Shift_JIS'>"
        f"<title>{TITLE}</title></head><body>{body}</body></html>"
    ).encode("shift_jis", errors="xmlcharrefreplace")


def catalog() -> bytes:
    return sjis_html(
        "<table id='cattable'><tbody><tr><td>"
        f"<a href='res/{THREAD_ID}.htm'>"
        f"<img src='thumb/1.png' width='80' height='80'></a>"
        "<br><small>futatabi catalog fixture</small><br>"
        "<font size='2'>1</font>"
        "</td></tr></tbody></table>"
    )


def thread() -> bytes:
    return sjis_html(
        "<form action='futaba.php?guid=on' method='POST'>"
        "<input name='com'><input type='submit' value='write'></form>"
        "<div class='thre'>"
        "No.1001 <a href='/aimoge/src/1.png' target='_blank'>"
        "<img src='/aimoge/thumb/1.png' width='80' height='80'></a>"
        "<blockquote>futatabi thread fixture</blockquote>"
        "<table><tr><td class='rtd'>No.1002 "
        "<blockquote>futatabi reply fixture</blockquote></td></tr></table>"
        "</div>"
    )


class FixtureHandler(BaseHTTPRequestHandler):
    def log_message(self, fmt: str, *args: object) -> None:
        # Persist request method/path/User-Agent for the emulator registration gate.
        from datetime import datetime, timezone
        line = (
            f"{datetime.now(timezone.utc).isoformat()} "
            f"client={self.client_address[0]} port={self.server.server_port} method={self.command} "
            f"path={getattr(self, 'path', '<unparsed>')!r} "
            f"ua={getattr(self, 'headers', {}).get('User-Agent', '<missing>')!r}\n"
        )
        log_path = Path(__file__).resolve().parent.parent / "docs" / "gate-evidence" / "fixture-access.log"
        log_path.parent.mkdir(parents=True, exist_ok=True)
        with log_path.open("a", encoding="utf-8") as log:
            log.write(line)

    def send_body(self, status: int, payload: bytes, kind: str) -> None:
        self.send_response(status)
        self.send_header("Content-Type", kind)
        self.send_header("Content-Length", str(len(payload)))
        self.send_header("Cache-Control", "no-store")
        self.end_headers()
        self.wfile.write(payload)

    def do_POST(self) -> None:
        self.send_body(403, b"Read-only fixture", "text/plain; charset=utf-8")

    def do_GET(self) -> None:
        parsed = urlsplit(self.path)
        path = parsed.path
        query = parse_qs(parsed.query)
        if path in (BASE, BASE + "futaba.php") and (
            path == BASE or query.get("mode") == ["cat"]
        ):
            self.send_body(200, catalog(), "text/html; charset=Shift_JIS")
        elif path in (BASE + f"res/{THREAD_ID}.htm", BASE + "res.htm"):
            self.send_body(200, thread(), "text/html; charset=Shift_JIS")
        elif path in (BASE + "thumb/1.png", BASE + "src/1.png"):
            self.send_body(200, PNG, "image/png")
        else:
            self.send_body(404, b"Not found", "text/plain; charset=utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--port", type=int, default=PORT)
    args = parser.parse_args()
    if args.port not in (PORT, 18766, 80):
        parser.error("Use port 18765 (default), 18766 (emulator gate), or 80 (diagnostic only)")
    with ThreadingHTTPServer(("127.0.0.1", args.port), FixtureHandler) as server:
        print(f"Fixture ready: http://127.0.0.1:{args.port}/aimoge/", flush=True)
        server.serve_forever()


if __name__ == "__main__":
    main()
