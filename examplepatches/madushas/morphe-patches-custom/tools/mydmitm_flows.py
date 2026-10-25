"""Write every completed HTTP flow to /tmp/opencode/flows.jsonl (unbuffered)."""
import json
from mitmproxy import http

OUT = "/tmp/opencode/flows.jsonl"
PROBE_PATHS = {"/generate_204", "/gen_204"}


def request(flow: http.HTTPFlow) -> None:
    # Connectivity probes (Android system validation + app precheck) expect 204.
    if flow.request.path.split("?")[0] in PROBE_PATHS:
        flow.response = http.Response.make(204, b"", {})


def response(flow: http.HTTPFlow) -> None:
    try:
        entry = {
            "ts": flow.response.timestamp_end,
            "client_conn": {
                "sni": flow.client_conn.sni,
                "tls": bool(flow.client_conn.tls_version),
            },
            "request": {
                "method": flow.request.method,
                "url": flow.request.pretty_url,
                "headers": dict(flow.request.headers),
                "body": flow.request.get_text(strict=False),
            },
            "response": {
                "status": flow.response.status_code,
                "headers": dict(flow.response.headers),
                "body": flow.response.get_text(strict=False),
            },
        }
        with open(OUT, "a") as f:
            f.write(json.dumps(entry, ensure_ascii=False) + "\n")
    except Exception as e:  # never break the proxy
        with open(OUT, "a") as f:
            f.write(json.dumps({"addon_error": str(e)}) + "\n")
