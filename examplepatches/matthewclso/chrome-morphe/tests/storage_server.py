#!/usr/bin/env python3
"""Local-only cookie/localStorage fixture. Access on device through adb reverse tcp:8765."""
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse, parse_qs
import json

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        url = urlparse(self.path)
        query = parse_qs(url.query)
        value = query.get("value", [None])[0]
        if value not in (None, "regular", "private", "custom"):
            self.send_error(400)
            return
        self.send_response(200)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Cache-Control", "no-store")
        self.end_headers()
        script = ""
        if url.path == "/clear":
            script = "localStorage.removeItem('morphe_fixture');document.cookie='morphe_fixture=; Path=/; Max-Age=0';"
        elif value:
            script = "localStorage.setItem('morphe_fixture', %s);document.cookie='morphe_fixture=%s; Path=/; SameSite=Lax';" % (json.dumps(value), value)
        html = """<!doctype html><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Morphe storage fixture</title><style>body{font:22px sans-serif;padding:24px}</style>
<h1>Morphe storage fixture</h1><p id="cookie"></p><p id="storage"></p>
<script>%s
document.getElementById('cookie').textContent='Cookie: '+(document.cookie||'(empty)');
document.getElementById('storage').textContent='Storage: '+(localStorage.getItem('morphe_fixture')||'(empty)');
</script>""" % script
        self.wfile.write(html.encode())

HTTPServer(("127.0.0.1", 8765), Handler).serve_forever()
