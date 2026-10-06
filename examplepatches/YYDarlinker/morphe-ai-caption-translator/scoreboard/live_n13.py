"""One explicit N13 provider attempt for frozen A14 block 17; no automatic retry."""
from __future__ import annotations

import argparse
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import time
import urllib.error
import urllib.request

import live_n7
import n9
import run


BLOCK = "b17_1219_1299"
SOURCE_IDS = [1219, 1299]
MAX_ATTEMPTS = 4
PROMPT_SHA256 = "d841cf104e07cb2330f3143c538981979f8ba062dc6582c322f6dc8460ad0379"
ARCHIVE_GLOB = "live-n13-block17-*.json"


def frozen_repair_payload() -> dict:
    """Use the recorded request 22 input, minus diagnostic-only fields."""
    run.ensure(run.sha256(n9.DIAG) == n9.DIAG_SHA256, "N11 diagnostic hash changed")
    records = (json.loads(line) for line in n9.DIAG.read_text(encoding="utf-8").splitlines()
               if line.startswith('{"at":'))
    matches = [row for row in records if row.get("request") == 22]
    run.ensure(len(matches) == 1, "Expected exactly one frozen request 22")
    payload = json.loads(matches[0]["source"])
    run.ensure(payload.get("block") == BLOCK, "Frozen request is not A14 block 17")
    tokens = payload["owned_tokens"]
    run.ensure([tokens[0][0], tokens[-1][0]] == SOURCE_IDS and
               [item[0] for item in tokens] == list(range(1219, 1300)),
               "Frozen request 22 source ownership changed")
    run.ensure(payload.get("repair", "").startswith("Advisory fidelity review") and
               "possible_subject_attachment range=1219-1240" in payload["repair"],
               "Frozen A14 repair instruction changed")
    run.ensure(payload["source_text"] == " ".join(item[1] for item in tokens),
               "Frozen request source text changed")
    return {name: value for name, value in payload.items()
            if not name.startswith("diagnostic_only_")}


def previous_usage(directory: Path) -> tuple[int, int, int, int]:
    """Count attempts before a new call, including sent calls that never returned."""
    attempts = prompt_tokens = completion_tokens = total_tokens = 0
    for path in directory.glob(ARCHIVE_GLOB):
        record = json.loads(path.read_text(encoding="utf-8"))
        run.ensure(record.get("block") == BLOCK and record.get("source_ids") == SOURCE_IDS,
                   f"Invalid N13 attempt archive: {path.name}")
        count = record.get("api_attempts")
        run.ensure(type(count) is int and count in (0, 1),
                   f"Invalid N13 attempt count: {path.name}")
        attempts += count
        usage = record.get("token_usage", {})
        prompt_tokens += usage.get("prompt_tokens", 0)
        completion_tokens += usage.get("completion_tokens", 0)
        total_tokens += usage.get("total_tokens", 0)
    return attempts, prompt_tokens, completion_tokens, total_tokens


def body_for(payload: dict, prompt: str, model: str, host: str) -> dict:
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
    if any(host == domain or host.endswith("." + domain) for domain in
           ("dashscope.aliyuncs.com", "dashscope-intl.aliyuncs.com",
            "dashscope-us.aliyuncs.com", "maas.aliyuncs.com")) or host in (
            "api.siliconflow.cn", "api.siliconflow.com"):
        body["enable_thinking"] = False
    if ((host.endswith(".maas.aliyuncs.com") or "dashscope.aliyuncs.com" in host)
            and (model == "qwen3.8-flash" or model.startswith("qwen3.8-flash-"))):
        body["response_format"] = run.online_schema()
        body["presence_penalty"] = 0
    if host == "api.anthropic.com":
        body.pop("response_format")
    return body


def one_attempt() -> Path:
    directory = run.ROOT / "scoreboard/results"
    directory.mkdir(exist_ok=True)
    lock = directory / ".live-n13-block17.lock"
    # Atomic lock prevents two concurrent invocations from each seeing three prior calls.
    descriptor = os.open(lock, os.O_CREAT | os.O_EXCL | os.O_WRONLY)
    try:
        os.close(descriptor)
        prior, prior_prompt, prior_completion, prior_total = previous_usage(directory)
        run.ensure(prior < MAX_ATTEMPTS, "N13 block-17 live budget exhausted")
        payload = frozen_repair_payload()
        prompt = run.current_prompt()
        prompt_hash = hashlib.sha256(prompt.encode("utf-8")).hexdigest()
        run.ensure(prompt_hash == PROMPT_SHA256, "Checked-in prompt differs from frozen N11 prompt")
        key, base, model = (os.environ.get("MORPHE_P4_" + name, "").strip()
                            for name in ("API_KEY", "BASE_URL", "MODEL"))
        run.ensure(key and base and model, "MORPHE_P4 credentials and model are required")
        run.ensure(model == "qwen3.8-flash", "N13 live control uses frozen qwen3.8-flash model")
        endpoint, host = run.api_endpoint(base)
        body = body_for(payload, prompt, model, host)
        limit = body.get("max_tokens", body.get("max_completion_tokens"))
        stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%S%fZ")
        target = directory / f"live-n13-block17-{stamp}.json"
        output = {
            "layer": "live_n13_block17_generated_only", "block": BLOCK,
            "source_ids": SOURCE_IDS, "captured_at_utc": datetime.now(timezone.utc).isoformat(),
            "diagnostic_sha256": n9.DIAG_SHA256, "prompt_sha256": prompt_hash,
            "payload_sha256": hashlib.sha256(json.dumps(payload, ensure_ascii=False,
                                                        sort_keys=True).encode("utf-8")).hexdigest(),
            "endpoint_sha256": hashlib.sha256(endpoint.encode("utf-8")).hexdigest(),
            "model": model, "output_budget_tokens": limit,
            "policy": "frozen request 22 repair; one block-17 attempt; no retry or redirect",
            "display_evidence": "none", "production_parser_verified": False,
            "prior_n13_attempts": prior,
            "prior_n13_reported_tokens": {"prompt_tokens": prior_prompt,
                                          "completion_tokens": prior_completion,
                                          "total_tokens": prior_total},
            "api_attempts": 0, "status": "prepared", "token_usage": {},
        }

        def save() -> None:
            temporary = target.with_suffix(".tmp")
            temporary.write_text(json.dumps(output, ensure_ascii=False, indent=2) + "\n",
                                 encoding="utf-8")
            temporary.replace(target)

        save()
        header = ("api-key" if host.endswith((".openai.azure.com", ".services.ai.azure.com"))
                  else "Authorization")
        auth = key if header == "api-key" else "Bearer " + key
        request = urllib.request.Request(
            endpoint, data=json.dumps(body, ensure_ascii=False).encode("utf-8"),
            headers={"Content-Type": "application/json; charset=utf-8",
                     "Accept": "application/json", header: auth}, method="POST")
        output["api_attempts"] = 1
        output["status"] = "sent"
        save()  # A crash after this point still spends one of four attempts.
        started = time.monotonic_ns()
        try:
            with urllib.request.build_opener(run.NoRedirect()).open(request, timeout=45) as response:
                raw = response.read(2 * 1024 * 1024 + 1)
            run.ensure(len(raw) <= 2 * 1024 * 1024, "Provider response exceeds 2 MiB")
            reply = json.loads(raw)
            usage = reply.get("usage", {})
            output["usage"] = usage
            reported_prompt = usage.get("prompt_tokens")
            reported_completion = usage.get("completion_tokens")
            reported_total = usage.get("total_tokens")
            if reported_total is None and isinstance(reported_prompt, int) and isinstance(
                    reported_completion, int):
                reported_total = reported_prompt + reported_completion
            output["token_usage"] = {
                "prompt_tokens": reported_prompt, "completion_tokens": reported_completion,
                "total_tokens": reported_total, "provider_reported": bool(usage)}
            output["cumulative_n13_tokens"] = {
                "prompt_tokens": prior_prompt + (reported_prompt or 0),
                "completion_tokens": prior_completion + (reported_completion or 0),
                "total_tokens": prior_total + (reported_total or 0)}
            choice = reply["choices"][0]
            output["finish_reason"] = choice.get("finish_reason")
            content = choice.get("message", {}).get("content") or ""
            output["response_text"] = content
            plan = json.loads(content)
            live_n7.validate(plan, payload)
            output["response"] = plan
            output["status"] = ("source_ownership_ok; production_parser_pending"
                                if output["finish_reason"] != "length" else "output_truncated")
        except urllib.error.HTTPError as exc:
            output["status"] = "http_failure"
            output["http_status"] = exc.code
        except (urllib.error.URLError, TimeoutError, ValueError, KeyError, IndexError,
                TypeError, OSError) as exc:
            output["status"] = "failed_" + type(exc).__name__
        finally:
            output["wall_ms"] = round((time.monotonic_ns() - started) / 1_000_000, 1)
            save()
        return target
    finally:
        lock.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--live", action="store_true", help="EXPLICIT: spend one block-17 API attempt")
    args = parser.parse_args()
    run.ensure(args.live, "No request sent; pass --live explicitly")
    target = one_attempt()
    archive = json.loads(target.read_text(encoding="utf-8"))
    print(f"{archive['status']} | attempt={archive['prior_n13_attempts'] + 1}/{MAX_ATTEMPTS} "
          f"| usage={archive['token_usage']} | {target}")
    return 0 if archive["status"].startswith("source_ownership_ok") else 2


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (ValueError, FileNotFoundError, KeyError, FileExistsError) as error:
        raise SystemExit("N13 live request not sent: " + str(error))
