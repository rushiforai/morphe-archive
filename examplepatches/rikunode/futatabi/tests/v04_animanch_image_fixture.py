#!/usr/bin/env python3
"""Local-only 12-cell Animanch image latency fixture. Never proxies upstream."""
from http.server import ThreadingHTTPServer, BaseHTTPRequestHandler
from pathlib import Path
from io import BytesIO
from PIL import Image
import argparse, json, time

class Handler(BaseHTTPRequestHandler):
    jpeg = None
    log_path = None
    def do_GET(self):
        path = self.path.split("?",1)[0]
        if path == "/":
            cards = []
            for i in range(10001,10013):
                cards.append(f"<a href='/board/{i}/' class='card'><div class='d-flex'><img src='/thumb_s/{i}/'><div class='card-body'>Fixture thread {i}<p class='threadCount'>12</p></div></div></a>")
            body=("<html><body>"+ "".join(cards)+"</body></html>").encode()
            mime="text/html; charset=utf-8"
        elif path.startswith("/thumb_s/") and path.endswith("/") and path[9:-1].isdigit():
            time.sleep(.25)
            body=self.jpeg; mime="image/jpeg"
        elif path.startswith("/board/") and path.endswith("/"):
            body=b"<html><body><li id='res123'><span class='resposted'>26/11/25(Wed) 12:00:00</span><div class='resbody'>hello</div></li></body></html>"
            mime="text/html; charset=utf-8"
        else:
            self.send_error(404);return
        self.send_response(200)
        self.send_header("Content-Type",mime)
        self.send_header("Content-Length",str(len(body)))
        self.end_headers()
        self.wfile.write(body)
        if self.log_path:
            with open(self.log_path,"a",encoding="utf-8") as stream:
                stream.write(json.dumps({"path":path,"bytes":len(body)})+"\n")
    def log_message(self,*args): pass

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("--port",type=int,default=18766)
    ap.add_argument("--log",required=True)
    a=ap.parse_args()
    img=Image.new("RGB",(512,288),(65,95,140))
    f=BytesIO();img.save(f,"JPEG",quality=85)
    Handler.jpeg=f.getvalue();Handler.log_path=a.log
    ThreadingHTTPServer(("127.0.0.1",a.port),Handler).serve_forever()
if __name__ == "__main__": main()
