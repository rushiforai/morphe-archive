"""Loopback-only static renderer fixture server, rooted at the bundled assets."""
from http.server import ThreadingHTTPServer, SimpleHTTPRequestHandler
from functools import partial
from pathlib import Path
root=Path(__file__).resolve().parents[1]/'patches/src/main/resources/bdcrusher-lyrics'
handler=partial(SimpleHTTPRequestHandler,directory=str(root))
ThreadingHTTPServer(('127.0.0.1',8766),handler).serve_forever()
