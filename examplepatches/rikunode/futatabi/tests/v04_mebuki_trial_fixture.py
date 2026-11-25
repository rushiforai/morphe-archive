"""Offline fixture for Mebuki public-trial catalogue and thumbnails; no external forwarding."""
from http.server import ThreadingHTTPServer, BaseHTTPRequestHandler
from PIL import Image
from io import BytesIO
import argparse, json
from http.cookies import SimpleCookie, CookieError

def valid_session(header):
    cookies = SimpleCookie()
    try:
        cookies.load(header)
    except CookieError:
        return False
    session = cookies.get("mock_session")
    return session is not None and session.value in (
        "offline-test", "x-fixture", "discord-fixture"
    )

class Handler(BaseHTTPRequestHandler):
    image = None
    log_file = None
    def do_GET(self):
        if self.path == "/":
            body = b"<html><body><h1>Offline Login Fixture</h1><p>Fake session cookie only.</p></body></html>"
            mimetype = "text/html"
        elif self.path == "/api/auth/get-session":
            cookie = self.headers.get("Cookie", "")
            body = (b'{"user":{"id":"fake"},"session":{"id":"fake"}}' if valid_session(cookie) else b'null')
            mimetype = "application/json"
        elif self.path in ("/api/catalog", "/api/thread/LOCALdemoA0/messages"):
            if not valid_session(self.headers.get("Cookie", "")):
                self.send_response(302)
                self.send_header("Location", "/")
                self.end_headers()
                return
            # Synthetic examples for shape capture only, not asserted as the real contract.
            body = json.dumps({"fixtureOnly": True, "items": [{"id": "fake", "content": "synthetic"}]}).encode()
            mimetype = "application/json"
        elif self.path == "/api/trial/trending":
            body = json.dumps({"threads": [
                {"slug": "LOCALdemoA0", "name": "テスト用スレA", "messageCount": 12,
                 "imageUrl": "http://127.0.0.1:18766/uploads/attachments/aa/bb/fake/thumb.jpg"},
                {"slug": "LOCALdemoB0", "name": "テスト用スレB", "messageCount": 23,
                 "imageUrl": ""}
            ]}, ensure_ascii=False).encode("utf8")
            mimetype = "application/json"
        elif self.path == "/uploads/attachments/aa/bb/fake/thumb.jpg":
            body = self.image
            mimetype = "image/jpeg"
        else:
            self.send_error(404)
            return
        self.send_response(200)
        self.send_header("Content-Type", mimetype)
        if self.path == "/": self.send_header("Set-Cookie", "mock_session=offline-test; Path=/; HttpOnly; SameSite=Lax")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)
        with open(self.log_file, "a", encoding="utf8") as out:
            out.write(json.dumps({"method": "GET", "path": self.path, "bytes": len(body)}) + "\n")
    def log_message(self, *_): pass

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--port", type=int, default=18766)
    parser.add_argument("--log", required=True)
    args = parser.parse_args()
    image = Image.new("RGB", (8, 8), (40, 100, 180))
    buffer = BytesIO()
    image.save(buffer, "JPEG")
    Handler.image = buffer.getvalue()
    Handler.log_file = args.log
    ThreadingHTTPServer(("127.0.0.1", args.port), Handler).serve_forever()
