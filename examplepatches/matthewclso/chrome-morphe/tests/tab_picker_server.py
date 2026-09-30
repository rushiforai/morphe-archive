#!/usr/bin/env python3
"""Disposable tab titles, icons and viewport targets; no accounts or persistent data."""
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlsplit, parse_qs
import struct
import zlib


def icon(index):
    colors = [(40, 130, 230), (230, 90, 60), (30, 170, 100)]
    color = colors[(index - 1) % len(colors)]
    rows = b"".join(b"\0" + bytes(color) * 32 for _ in range(32))
    def chunk(kind, body):
        return struct.pack("!I", len(body)) + kind + body + struct.pack("!I", zlib.crc32(kind + body))
    return b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack("!2I5B", 32, 32, 8, 2, 0, 0, 0)) + chunk(b"IDAT", zlib.compress(rows)) + chunk(b"IEND", b"")


class Handler(BaseHTTPRequestHandler):
    def log_message(self, *_):
        pass

    def do_GET(self):
        parsed = urlsplit(self.path)
        if parsed.path.startswith("/icon/"):
            try:
                body = icon(int(parsed.path.rsplit("/", 1)[1]))
            except ValueError:
                self.send_error(404)
                return
            mime = "image/png"
        else:
            query = parse_qs(parsed.query)
            try:
                index = max(1, min(9, int(query.get("tab", ["1"])[0])))
            except ValueError:
                self.send_error(400)
                return
            mode = "Private" if query.get("private") == ["1"] else "Regular"
            title = f"Morphe {mode} {index}"
            links = " ".join(f'<p><a target="_blank" href="/?tab={n}&private={int(mode == "Private")}">Open fixture {n}</a></p>' for n in range(1, 6))
            body = f"""<!doctype html><html><head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{title}</title><link rel="icon" type="image/png" href="/icon/{index}">
<style>body{{margin:0;font:20px sans-serif;background:#f6f9fc;color:#123}}main{{padding:20px}}
button,input{{font:inherit;padding:12px}}footer{{padding:20px;background:#def}}</style></head>
<body><main><h1>{title}</h1><p>Disposable tab-picker fixture.</p>
<button onclick="document.title='{title} updated';document.querySelector('link').href='/icon/{index+1}'">Update title and icon</button>
<p><input placeholder="Fixture text field"></p>{links}<div style="height:2400px">Scroll to bottom</div></main>
<footer><button onclick="this.textContent='Bottom target reached'">Bottom target</button></footer></body></html>""".encode()
            mime = "text/html; charset=utf-8"
        self.send_response(200)
        self.send_header("Content-Type", mime)
        self.send_header("Cache-Control", "no-store")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)


if __name__ == "__main__":
    HTTPServer(("127.0.0.1", 8766), Handler).serve_forever()
