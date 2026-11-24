#!/usr/bin/env python3
"""Offline-only Mebuki reply fixture. Never forwards a request to a live site."""
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlsplit
from email.parser import BytesParser
from email.policy import default
import argparse, json

class Handler(BaseHTTPRequestHandler):
    log_path = None
    def respond(self, code, data):
        payload = json.dumps(data).encode("utf-8")
        self.send_response(code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(payload)))
        self.end_headers()
        self.wfile.write(payload)

    def do_GET(self):
        if urlsplit(self.path).path != "/api/trial/trending":
            return self.respond(404, {"error": "not found"})
        self.respond(200, {"threads": [
            {"slug": "LOCALdemoA0", "name": "Offline reply fixture",
             "messageCount": 3, "imageUrl": ""}
        ]})

    def do_POST(self):
        path = urlsplit(self.path).path
        if path != "/t/LOCALdemoA0":
            return self.respond(404, {"error": "unsupported"})
        size = int(self.headers.get("Content-Length", "-1"))
        if size < 0 or size > 30000:
            return self.respond(413, {"error": "invalid size"})
        raw = self.rfile.read(size)
        content_type = self.headers.get("Content-Type", "")
        if not content_type.startswith("multipart/form-data; boundary="):
            return self.respond(415, {"error": "expected multipart"})
        # Parse only known public-client field names.
        parser = BytesParser(policy=default)
        message = parser.parsebytes(
            ("Content-Type: " + content_type + "\r\nMIME-Version: 1.0\r\n\r\n").encode() + raw
        )
        fields = {}
        for part in message.iter_parts():
            name = part.get_param("name", header="content-disposition")
            if not name:
                return self.respond(400, {"error": "missing field name"})
            fields[name] = part.get_content()
        allowed = {"content", "replyToId", "showUsername", "showThreadOwner"}
        valid = ("content" in fields
                 and "showUsername" in fields
                 and "showThreadOwner" in fields
                 and set(fields) <= allowed)
        cookie_present = "mock_session=offline-test" in self.headers.get("Cookie", "")
        if self.log_path:
            with open(self.log_path, "a", encoding="utf8") as out:
                out.write(json.dumps({
                    "path": path, "method": "POST",
                    "fieldNames": sorted(fields),
                    "knownFieldsOnly": valid,
                    "cookiePresent": cookie_present,
                    "contentBytes": len(fields.get("content", "").encode("utf8")),
                    "contentValueRedacted": True,
                }) + "\n")
        if not cookie_present:
            return self.respond(401, {"error": "fake session required"})
        if not valid:
            return self.respond(400, {"error": "invalid multipart"})
        self.respond(200, {"fixture": "received", "successNotVerified": True})

    def log_message(self, *_args): pass

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--port", type=int, default=18766)
    parser.add_argument("--log", required=True)
    args = parser.parse_args()
    Handler.log_path = args.log
    ThreadingHTTPServer(("127.0.0.1", args.port), Handler).serve_forever()

if __name__ == "__main__":
    main()
