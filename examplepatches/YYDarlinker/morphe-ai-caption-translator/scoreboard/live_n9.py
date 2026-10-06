"""One explicit N9 provider call, hard-scoped to current planner block 1 (25–97)."""
from __future__ import annotations

from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import time
import urllib.error
import urllib.request

import live_n7
import run

PAYLOADS = run.ROOT / "scoreboard/results/live-n7-current-payloads.json"
MAX_N9_ATTEMPTS = 3


def main() -> int:
    artifact = json.loads(PAYLOADS.read_text(encoding="utf-8"))
    prompt = run.current_prompt()
    run.ensure(artifact["runtime_prompt_sha256"] == hashlib.sha256(prompt.encode()).hexdigest(),
               "Current Java prompt changed; regenerate planner payloads before live N9")
    payload = artifact["blocks"][1]
    run.ensure(payload["block"] == "b1_25_97" and
               [payload["owned_tokens"][0][0], payload["owned_tokens"][-1][0]] == [25, 97],
               "N9 must only call block 1, words 25–97")
    key, base, model = (os.environ.get("MORPHE_P4_" + name, "").strip()
                        for name in ("API_KEY", "BASE_URL", "MODEL"))
    run.ensure(key and base and model, "MORPHE_P4 credentials are required")
    prior = list((run.ROOT / "scoreboard/results").glob("live-n9-block1-*.json"))
    attempts = sum(json.loads(path.read_text(encoding="utf-8")).get("api_attempts", 0)
                   for path in prior)
    run.ensure(attempts < MAX_N9_ATTEMPTS, "N9 block-1 live budget exhausted")
    endpoint, host = run.api_endpoint(base)
    limit = min(3072, max(1000, len(payload["source_text"]) * 2 + 600))
    body = {"model": model, "stream": False, "max_tokens": limit,
            "messages": [{"role": "system", "content": "Return valid JSON only. " + prompt},
                         {"role": "user", "content": json.dumps(payload, ensure_ascii=False,
                                                                 separators=(",", ":"))}],
            "response_format": {"type": "json_object"}}
    if host == "api.openai.com":
        body["max_completion_tokens"] = body.pop("max_tokens")
    if host in ("api.minimax.io", "api.minimaxi.com"):
        body["reasoning_split"] = True
    if host == "api.deepseek.com":
        body["thinking"] = {"type": "disabled"}
    if host.endswith(".maas.aliyuncs.com") or "dashscope.aliyuncs.com" in host:
        body["enable_thinking"] = False
        if model == "qwen3.8-flash" or model.startswith("qwen3.8-flash-"):
            body["response_format"] = run.online_schema()
            body["presence_penalty"] = 0
    elif host in ("api.siliconflow.cn", "api.siliconflow.com"):
        body["enable_thinking"] = False
    if host == "api.anthropic.com":
        body.pop("response_format")
    header = "api-key" if host.endswith((".openai.azure.com", ".services.ai.azure.com")) else "Authorization"
    auth = key if header == "api-key" else "Bearer " + key
    output = {"layer": "live_n9_block1_generated_only", "block": 1, "source_ids": [25, 97],
              "captured_at_utc": datetime.now(timezone.utc).isoformat(),
              "prompt_sha256": hashlib.sha256(prompt.encode()).hexdigest(), "model": model,
              "display_evidence": "none", "api_attempts": 0, "output_budget_tokens": limit,
              "status": "not_sent"}
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    target = run.ROOT / "scoreboard/results" / f"live-n9-block1-{stamp}.json"
    run.ensure(not target.exists(), "N9 result path already exists")
    target.write_text(json.dumps(output, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    request = urllib.request.Request(endpoint, data=json.dumps(body, ensure_ascii=False).encode(),
                                     headers={"Content-Type": "application/json; charset=utf-8",
                                              "Accept": "application/json", header: auth}, method="POST")
    output["api_attempts"] = 1
    output["status"] = "sent"
    target.write_text(json.dumps(output, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    started = time.monotonic_ns()
    try:
        with urllib.request.build_opener(run.NoRedirect()).open(request, timeout=45) as response:
            raw = response.read(2 * 1024 * 1024 + 1)
        run.ensure(len(raw) <= 2 * 1024 * 1024, "Provider response too large")
        reply = json.loads(raw)
        choice = reply["choices"][0]
        output["usage"] = reply.get("usage", {})
        output["finish_reason"] = choice.get("finish_reason")
        content = choice.get("message", {}).get("content") or ""
        plan = json.loads(content)
        live_n7.validate(plan, payload)
        output["response"] = plan
        output["status"] = "source_ownership_ok" if output["finish_reason"] != "length" else "output_truncated"
    except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError, ValueError,
            KeyError, IndexError, TypeError, OSError) as exc:
        output["status"] = "failed_" + type(exc).__name__
        output["error"] = str(exc)[:160]
    finally:
        output["wall_ms"] = round((time.monotonic_ns() - started) / 1_000_000, 1)
        target.write_text(json.dumps(output, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"{output['status']} | attempts=1 | usage={output.get('usage', {})} | {target}")
    return 0 if output["status"] == "source_ownership_ok" else 2


if __name__ == "__main__":
    raise SystemExit(main())
