#!/usr/bin/env python3
"""Disposable Android autofill fixture; adb reverse tcp:8766 tcp:8766.

Use http://localhost:8766/login for a saved login and
http://127.0.0.1:8766/login to check a different hostname. The credentials below
are public fixture values, not an account. Request bodies are never logged or
saved. Do not select a real credential in the provider's password picker.
"""
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import parse_qs, urlparse

USERNAME = "morphe-autofill-test-20260928"
PASSWORD = "MorpheOnly7491test"
PRIVATE_USERNAME = "morphe-autofill-private-20260928"
PRIVATE_PASSWORD = "MorphePrivate7491"


class Handler(BaseHTTPRequestHandler):
    def log_message(self, *_):
        pass

    def valid_host(self):
        return self.headers.get("Host") in ("localhost:8766", "127.0.0.1:8766")

    def do_GET(self):
        if not self.valid_host():
            self.send_error(400)
            return
        route = urlparse(self.path)
        if route.path == "/signed-in":
            matched = parse_qs(route.query).get("matched") == ["yes"]
            body = ("<h1>Fixture signed in</h1><p>Expected dummy login matched: "
                    + ("yes" if matched else "no")
                    + '</p><a href="/login">Return to login</a>')
        elif route.path == "/login":
            body = """<h1>Morphe autofill fixture</h1>
<p>Use only the disposable fixture credential.</p>
<form method="post" action="/login" autocomplete="on">
<label for="username">Fixture username</label>
<input id="username" name="username" type="text" autocomplete="username">
<label for="password">Fixture password</label>
<input id="password" name="password" type="password" autocomplete="current-password">
<button type="submit">Sign in to fixture</button></form>"""
        else:
            self.send_error(404)
            return
        self.send_response(200)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Cache-Control", "no-store")
        self.end_headers()
        self.wfile.write(("""<!doctype html><html><head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Morphe autofill fixture</title>
<style>body{font:20px sans-serif;padding:20px}input,button{display:block;
font:inherit;box-sizing:border-box;width:100%;margin:12px 0 24px;padding:12px}</style>
</head><body>""" + body + "</body></html>").encode())

    def do_POST(self):
        if not self.valid_host() or self.path != "/login":
            self.send_error(400)
            return
        try:
            length = int(self.headers.get("Content-Length", "0"))
        except ValueError:
            self.send_error(400)
            return
        if not 0 < length <= 4096:
            self.send_error(400)
            return
        fields = parse_qs(self.rfile.read(length).decode("utf-8", errors="replace"))
        matched = any(fields.get("username") == [username]
                      and fields.get("password") == [password]
                      for username, password in [(USERNAME, PASSWORD),
                                                 (PRIVATE_USERNAME, PRIVATE_PASSWORD)])
        self.send_response(303)
        self.send_header("Location", "/signed-in?matched=" + ("yes" if matched else "no"))
        self.send_header("Cache-Control", "no-store")
        self.end_headers()


if __name__ == "__main__":
    print("Autofill fixture listening on loopback port 8766", flush=True)
    ThreadingHTTPServer(("127.0.0.1", 8766), Handler).serve_forever()
