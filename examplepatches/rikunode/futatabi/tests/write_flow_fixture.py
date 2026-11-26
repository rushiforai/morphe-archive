"""Local-only, synthetic Aimoge/Animanch write-flow fixture.

No upstream proxying, no real credentials, no public posting. Run on 127.0.0.1.
"""
import argparse
import base64
import hashlib
import json
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import parse_qs, urlsplit

THREAD_UUID = "01900000-0000-7000-8000-000000000111"
THREAD_BOARD = "7666191"
TOKEN = "fixture-credential-not-real"
ALTCHA_SALT = "fixture-salt"
ALTCHA_CHALLENGE = hashlib.sha256((ALTCHA_SALT + "42").encode()).hexdigest()
ALTCHA_SIGNATURE = "a" * 64
ONE_PIXEL_JPEG = base64.b64decode(
    "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAP//////////////////////////////////////////////////////////////////////////////////////"
    "2wBDAf//////////////////////////////////////////////////////////////////////////////////////"
    "wAARCAAFAAUDASIAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAb/xAAVEAEBAAAAAAAAAAAAAAAAAAABAP/EABUBAQEAAAAAAAAAAAAAAAAAAAEC/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8ArwD/2Q=="
)

def json_bytes(data):
    return json.dumps(data, ensure_ascii=False, separators=(",", ":")).encode("utf-8")


class Handler(BaseHTTPRequestHandler):
    log_file = None

    def log_message(self, fmt, *args):
        return

    def record(self, method, body=b""):
        # Never record bearer values or user credentials. Fixtures use synthetic strings.
        record = {
            "method": method,
            "path": self.path,
            "contentType": self.headers.get("Content-Type", ""),
            "bodyBytes": len(body),
            "sha256": hashlib.sha256(body).hexdigest() if body else None,
        }
        if self.log_file:
            with Path(self.log_file).open("a", encoding="utf-8") as f:
                f.write(json.dumps(record, ensure_ascii=False) + "\n")

    def reply(self, status, body, content_type="application/json"):
        self.send_response(status)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def body(self):
        n = int(self.headers.get("Content-Length", "0"))
        if n < 0 or n > 30_000_000:
            raise ValueError("invalid size")
        return self.rfile.read(n)

    def do_GET(self):
        self.record("GET")
        path = urlsplit(self.path).path
        if path == "/client-policy":
            self.reply(200, json_bytes({
                "boardKey": "aimg", "maxBodyLength": 4000,
                "maxFileSizeBytes": 20_971_520, "threadsPerHour": 60,
                "threadCreationCooldownSeconds": 60,
                "replyCreationCooldownSeconds": 10
            }))
        elif path == "/altcha":
            self.reply(200, json_bytes({"algorithm": "SHA-256", "challenge": ALTCHA_CHALLENGE,
                "salt": ALTCHA_SALT, "signature": ALTCHA_SIGNATURE, "maxnumber": 100}))
        elif path == "/catalog/aimg":
            self.reply(200, json_bytes({"threads": [{
                "id": THREAD_UUID,
                "opPost": {"body": "Mock Aimoge thread", "attachment": None},
                "replyCount": 1
            }]}))
        elif path == "/thread/" + THREAD_UUID + "/public":
            self.reply(200, json_bytes({"posts": [{
                "id": "fakepost1", "seq": 1, "body": "Mock Aimoge reply",
                "createdAt": "2026-11-23T09:00:00Z", "attachment": None,
                "postSequenceNo": 1000000000001
            }]}))
        elif path in ("/", "/animanch/"):
            html = (
                "<!doctype html><html><body><div id='catalog'>"
                "<div id='recents' class='row'>"
                "<a href='https://bbs.animanch.com/board/7666191/' class='card'>"
                "<div class='d-flex'><img src='https://bbs.animanch.com/thumb_s/7666191/'>"
                "<div class='card-body'>Mock Animanch thread<p class='threadCount'>5</p>"
                "</div></div></a></div></div></body></html>"
            )
            self.reply(200, html.encode(), "text/html; charset=utf-8")
        elif path == "/board/" + THREAD_BOARD + "/":
            html = (
                "<html><body><article id='reslist'>"
                "<li id='res1' class='list-group-item'><span class='resposted'>26/11/25(Wed) 12:00:00</span><div class='resbody good1'>"
                "<p>Mock Animanch first post</p></div></li>"
                "<li id='res2' class='list-group-item'><span class='resposted'>26/11/25(Wed) 12:00:00</span><div class='resbody good1'>"
                "<p>Mock Animanch reply</p></div></li>"
                "</article></body></html>"
            )
            self.reply(200, html.encode(), "text/html; charset=utf-8")
        elif path == "/thumb_s/" + THREAD_BOARD + "/":
            self.reply(200, ONE_PIXEL_JPEG, "image/jpeg")
        else:
            self.reply(404, json_bytes({"error": "not found"}))

    def do_POST(self):
        body = self.body()
        self.record("POST", body)
        path = urlsplit(self.path).path
        if path == "/app-authorizations":
            request = json.loads(body)
            if not request.get("redirectUri", "").startswith("http://127.0.0.1:18765/"):
                return self.reply(400, json_bytes({"error": "bad callback"}))
            return self.reply(201, json_bytes({
                "authorizationUrl": "https://example.invalid/mock-user-consent",
                "id": "01900000-0000-7000-8000-000000000112",
                "expiresAt": "2026-11-23T20:00:00Z"
            }))
        if path == "/app-credentials":
            return self.reply(201, json_bytes({
                "credential": TOKEN,
                "credentialId": "01900000-0000-7000-8000-000000000113",
                "expiresAt": "2099-12-31T00:00:00Z"
            }))
        if path == "/attachments/presign":
            if self.headers.get("x-aimg-token") != TOKEN:
                return self.reply(401, json_bytes({"error": "not authorized"}))
            return self.reply(200, json_bytes({
                "attachmentId": "01900000-0000-7000-8000-000000000114",
                "uploadUrl": "http://127.0.0.1:18766/mock-upload",
                "reused": False
            }))
        if path in ("/threads/aimg", "/threads/" + THREAD_UUID + "/posts"):
            if self.headers.get("x-aimg-token") != TOKEN:
                return self.reply(401, json_bytes({"error": "not authorized"}))
            request = json.loads(body)
            try:
                proof = json.loads(base64.b64decode(request["altcha"], validate=True))
                valid = proof == {"algorithm": "SHA-256", "challenge": ALTCHA_CHALLENGE,
                    "salt": ALTCHA_SALT, "signature": ALTCHA_SIGNATURE, "number": 42}
            except (KeyError, ValueError, TypeError):
                valid = False
            if not valid:
                return self.reply(403, json_bytes({"error": "invalid fixture proof"}))
            if path == "/threads/aimg" and not (request.get("attachmentId") or request.get("attachmentIds")):
                return self.reply(400, json_bytes({"error": "image required"}))
            if not request.get("body") or not request.get("deleteKey"):
                return self.reply(422, json_bytes({"error": "missing fields"}))
            return self.reply(201, json_bytes({
                "post": {"id": "01900000-0000-7000-8000-000000000115"},
                "thread": {"id": THREAD_UUID}, "url": "https://example.invalid/mock-post"
            }))
        if self.path == "/inc/comment.php?preCheck":
            values = parse_qs(body.decode())
            if "text" not in values:
                return self.reply(400, b"missing text", "text/plain")
            return self.reply(200, b"ok", "text/plain")
        if path == "/inc/comment.php":
            values = parse_qs(body.decode())
            if "text" not in values:
                return self.reply(400, b"missing text", "text/plain")
            return self.reply(200, json_bytes({
                "number": "42", "thread": THREAD_BOARD,
                "jump": "https://example.invalid/mock-post"
            }))
        if path == "/upload/":
            if b'name="file1"' not in body or b'name="upname"' not in body:
                return self.reply(400, b"invalid multipart", "text/plain")
            return self.reply(200, b"uploaded", "text/plain")
        return self.reply(404, b"not found", "text/plain")

    def do_PUT(self):
        body = self.body()
        self.record("PUT", body)
        if self.path == "/mock-upload":
            return self.reply(200, b"ok", "text/plain")
        return self.reply(404, b"not found", "text/plain")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--port", type=int, default=18766)
    parser.add_argument("--log", type=str)
    args = parser.parse_args()
    Handler.log_file = args.log
    with ThreadingHTTPServer(("127.0.0.1", args.port), Handler) as srv:
        srv.serve_forever()


if __name__ == "__main__":
    main()
