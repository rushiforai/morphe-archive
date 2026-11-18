"""Execute actual car source policy and shelf grouping with independent fixtures."""
from pathlib import Path
import subprocess
import tempfile
import unittest
import threading
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / "extensions/wuplay-gearslip/src/main/java/nl/johninnl/wuplaycar"
class WuplayCarHomeTests(unittest.TestCase):
    def test_source_policy_and_shelves(self):
        required = [JAVA / "CarStreamPolicy.java", JAVA / "StreamRateProbe.java", JAVA / "ShelfGroups.java", JAVA / "AutoplayQueue.java"]
        for source in required:
            self.assertTrue(source.is_file(), f"Missing car Home implementation: {source.name}")
        with tempfile.TemporaryDirectory() as tmp:
            result = subprocess.run(["javac", "-d", tmp, *map(str, required), str(ROOT / "tests/fixtures/wuplay-car/CarHomeProbe.java")], text=True, capture_output=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            class Fixture(BaseHTTPRequestHandler):
                def do_HEAD(self):
                    if self.headers.get("X-Test") != "required":
                        self.send_error(403)
                        return
                    if self.path == "/fallback.mp4":
                        self.send_error(405)
                        return
                    self.reply()
                def do_GET(self):
                    self.reply()
                def reply(self):
                    manifest = b'#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=4000000\nlow.m3u8\n#EXT-X-STREAM-INF:BANDWIDTH=14000000\nhigh.m3u8\n'
                    if self.path == "/master.m3u8":
                        self.send_response(200)
                        self.send_header("Content-Type", "application/vnd.apple.mpegurl")
                        self.send_header("Content-Length", str(len(manifest)))
                        self.end_headers()
                        if self.command != "HEAD": self.wfile.write(manifest)
                    else:
                        ranged = self.path == "/fallback.mp4"
                        self.send_response(206 if ranged else 200)
                        self.send_header("Content-Type", "text/html" if self.path == "/error" else "video/mp4")
                        self.send_header("Content-Length", "1" if ranged else "75000000")
                        if ranged: self.send_header("Content-Range", "bytes 0-0/75000000")
                        self.end_headers()
                def log_message(self, *args): pass
            server = ThreadingHTTPServer(("127.0.0.1", 0), Fixture)
            thread = threading.Thread(target=server.serve_forever, daemon=True)
            thread.start()
            try:
                result = subprocess.run(["java", "-cp", tmp, "nl.johninnl.wuplaycar.CarHomeProbe", f"http://127.0.0.1:{server.server_port}"], text=True, capture_output=True)
                self.assertEqual(result.returncode, 0, result.stderr)
            finally:
                server.shutdown()
                server.server_close()
                thread.join()
