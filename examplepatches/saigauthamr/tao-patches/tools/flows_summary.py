"""Summarize a mitmproxy flow file: one line per request, filtered to app-related hosts."""
import sys
from mitmproxy import io, http

IGNORE = ("instagram", "facebook", "clients4.google", "whatsapp", "youtube", "googlevideo", "gstatic", "android.clients.google", "play.googleapis", "mtalk")

with open(sys.argv[1], "rb") as f:
    flows = [x for x in io.FlowReader(f).stream() if isinstance(x, http.HTTPFlow)]
t0 = flows[0].request.timestamp_start if flows else 0
for fl in flows:
    r = fl.request
    if any(s in r.pretty_host for s in IGNORE):
        continue
    resp = fl.response
    dur = (resp.timestamp_end - r.timestamp_start) * 1000 if resp and resp.timestamp_end else -1
    print(f"{r.timestamp_start - t0:7.1f}s {r.method:5} {resp.status_code if resp else 'ERR':>3} "
          f"{len(r.raw_content or b''):>6}B> {len(resp.raw_content or b'') if resp else 0:>7}B< {dur:7.0f}ms "
          f"{r.pretty_host}{r.path[:110]}" + (f"  !{fl.error.msg}" if fl.error else ""))
