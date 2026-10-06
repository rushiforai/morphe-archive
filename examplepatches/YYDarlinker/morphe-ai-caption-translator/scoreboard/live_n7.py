"""Explicit, bounded N7 live replay of current Java-planner payloads (0..686)."""
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

import run


def load_payloads(path: Path, evidence: dict) -> list[dict]:
    artifact = json.loads(path.read_text(encoding="utf-8"))
    run.ensure(artifact.get("layer") == "current_planner_payloads_for_bounded_live_replay" and
               artifact.get("source_ids") == [0, 686], "Not an N7 current-planner payload export")
    run.ensure(artifact.get("runtime_prompt_sha256") == hashlib.sha256(run.current_prompt().encode("utf-8")).hexdigest(),
               "Python prompt extraction differs from the Java runtime prompt")
    payloads = artifact["blocks"]
    run.ensure(artifact.get("block_count") == len(payloads), "Planner block count mismatch")
    run.ensure(isinstance(payloads, list) and len(payloads) > 0, "Planner payload export is empty")
    next_id = 0
    for block, payload in enumerate(payloads):
        tokens = payload["owned_tokens"]
        frozen_payload = evidence["by_block"][block]["payload"]
        run.ensure(payload["block"] == f"b{block}_{next_id}_{tokens[-1][0]}", "Planner block identity/order mismatch")
        run.ensure([word[0] for word in tokens] == list(range(next_id, tokens[-1][0] + 1)), "Planner ownership gap")
        run.ensure(all(evidence["tokens"][i] == word for i, word in tokens), "Planner changed a source word")
        run.ensure(payload["source_text"] == " ".join(word for _, word in tokens), "Planner source_text mismatch")
        run.ensure(payload["display_hint"] == frozen_payload["display_hint"] and
                   payload["source_order"] == frozen_payload["source_order"],
                   "Captured display/source-order metadata differs")
        run.ensure("repair" not in payload, "Replay must use first requests only")
        next_id = tokens[-1][0] + 1
    run.ensure(next_id == 687, "Planner export does not cover all 687 captured words")
    return payloads


def validate(plan: dict, payload: dict) -> None:
    expected = payload["owned_tokens"]
    run.ensure(plan.get("block") == payload["block"], "block identity mismatch")
    run.ensure(isinstance(plan.get("events"), list) and plan["events"], "empty event list")
    next_id = expected[0][0]
    for event in plan["events"]:
        a, z = event["from"], event["to"]
        run.ensure(a == next_id and a <= z <= expected[-1][0], "source ownership gap/overlap")
        run.ensure(event["source"] == " ".join(expected[i - expected[0][0]][1] for i in range(a, z + 1)),
                   "source quote mismatch")
        run.ensure(isinstance(event["text"], str) and bool(event["text"].strip()), "empty translation")
        next_id = z + 1
    run.ensure(next_id == expected[-1][0] + 1, "missing trailing source words")


def replay(payloads: list[dict], evidence: dict, round_number: int, resume: Path | None = None) -> Path:
    key, base, model = (os.environ.get("MORPHE_P4_" + name, "").strip()
                        for name in ("API_KEY", "BASE_URL", "MODEL"))
    run.ensure(key and base and model, "N7 live replay needs configured MORPHE_P4 credentials")
    endpoint, host = run.api_endpoint(base)
    prompt = run.current_prompt()
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    target = resume or run.RESULT.parent / f"live-n7-round{round_number}-{stamp}.json"
    run.ensure(resume is not None or not target.exists(), "Live result path already exists")
    output = {
        "layer": "live_current_planner_generated_only", "scope": "captured source words 0..686; all A01..A12",
        "captured_at_utc": datetime.now(timezone.utc).isoformat(), "round": round_number,
        "source_sha256": run.HASHES, "prompt_sha256": hashlib.sha256(prompt.encode("utf-8")).hexdigest(),
        "planner_payload_sha256": hashlib.sha256(json.dumps(payloads, ensure_ascii=False, sort_keys=True).encode("utf-8")).hexdigest(),
        "endpoint_sha256": hashlib.sha256(endpoint.encode()).hexdigest(), "model": model,
        "policy": "one first attempt per current planner block; no repair/retry/redirect",
        "display_evidence": "none", "planned_blocks": len(payloads), "blocks": [],
        "api_attempts": 0, "status": "in_progress", "token_usage": {},
    }
    if resume is not None:
        prior = json.loads(target.read_text(encoding="utf-8"))
        run.ensure(prior["round"] == round_number and prior["prompt_sha256"] == output["prompt_sha256"]
                   and prior["planner_payload_sha256"] == output["planner_payload_sha256"]
                   and prior["model"] == model and len(prior["blocks"]) < len(payloads),
                   "Cannot resume a different or completed replay")
        run.ensure([b["block"] for b in prior["blocks"]] == list(range(len(prior["blocks"]))),
                   "Resume record has nonsequential blocks")
        output = prior

    def save() -> None:
        temp = target.with_suffix(".tmp")
        temp.write_text(json.dumps(output, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        temp.replace(target)

    opener = urllib.request.build_opener(run.NoRedirect())
    save()
    for block in range(len(output["blocks"]), len(payloads)):
        payload = payloads[block]
        limit = min(3072, max(1000, len(payload["source_text"]) * 2 + 600))
        body = {"model": model, "stream": False, "max_tokens": limit,
                "messages": [{"role": "system", "content": "Return valid JSON only. " + prompt},
                             {"role": "user", "content": json.dumps(payload, ensure_ascii=False, separators=(",", ":"))}],
                "response_format": {"type": "json_object"}}
        if host == "api.openai.com":
            body["max_completion_tokens"] = body.pop("max_tokens")
        if host in ("api.minimax.io", "api.minimaxi.com"):
            body["reasoning_split"] = True
        if host == "api.deepseek.com":
            body["thinking"] = {"type": "disabled"}
        if any(host == name or host.endswith("." + name) for name in
               ("dashscope.aliyuncs.com", "dashscope-intl.aliyuncs.com",
                "dashscope-us.aliyuncs.com", "maas.aliyuncs.com")) or host in ("api.siliconflow.cn", "api.siliconflow.com"):
            body["enable_thinking"] = False
        if ((host.endswith(".maas.aliyuncs.com") or "dashscope.aliyuncs.com" in host) and
                (model == "qwen3.8-flash" or model.startswith("qwen3.8-flash-"))):
            body["response_format"] = run.online_schema()
            body["presence_penalty"] = 0
        if host == "api.anthropic.com":
            body.pop("response_format")
        headers = {"Content-Type": "application/json; charset=utf-8", "Accept": "application/json",
                   "api-key" if host.endswith(".openai.azure.com") or host.endswith(".services.ai.azure.com")
                   else "Authorization": key if host.endswith(".openai.azure.com") or
                   host.endswith(".services.ai.azure.com") else "Bearer " + key}
        row = {"block": block, "source_ids": [payload["owned_tokens"][0][0], payload["owned_tokens"][-1][0]],
               "output_budget_tokens": limit,
               "payload_sha256": hashlib.sha256(json.dumps(payload, ensure_ascii=False, sort_keys=True).encode()).hexdigest()}
        request = urllib.request.Request(endpoint, data=json.dumps(body, ensure_ascii=False).encode("utf-8"),
                                         headers=headers, method="POST")
        output["api_attempts"] += 1
        started_ns = time.monotonic_ns()
        try:
            with opener.open(request, timeout=45) as response:
                raw = response.read(2 * 1024 * 1024 + 1)
                run.ensure(len(raw) <= 2 * 1024 * 1024, "API response exceeds 2 MiB")
            reply = json.loads(raw)
            row["usage"] = reply.get("usage", {})
            choice = reply["choices"][0]
            row["finish_reason"] = choice.get("finish_reason")
            content = choice.get("message", {}).get("content") or ""
            try:
                plan = json.loads(content)
                validate(plan, payload)
                row["contract"] = "source_ownership_ok" if row["finish_reason"] != "length" else "output_truncated"
                row["response"] = plan
            except (ValueError, KeyError, TypeError, IndexError) as exc:
                row["contract"] = "output_truncated" if row["finish_reason"] == "length" else "invalid_generated_response: " + str(exc)[:160]
                row["response_text"] = content[:10000]
            row["wall_ms"] = round((time.monotonic_ns() - started_ns) / 1_000_000, 1)
            output["blocks"].append(row)
            if row["contract"] != "source_ownership_ok":
                output["status"] = "partial_invalid_generated_response"
                save()
                continue
        except urllib.error.HTTPError as exc:
            row["error"] = "http_" + str(exc.code)
            output["blocks"].append(row)
            output["status"] = "partial_http_failure"
            save()
            continue
        except (urllib.error.URLError, TimeoutError, ValueError, OSError) as exc:
            row["error"] = type(exc).__name__
            output["blocks"].append(row)
            output["status"] = "partial_transport_failure"
            save()
            continue
        save()
        print(f"N7 round {round_number}: block {block + 1}/{len(payloads)} {row['contract']}", flush=True)

    if len(output["blocks"]) == len(payloads):
        valid = all(b.get("contract") == "source_ownership_ok" for b in output["blocks"])
        output["status"] = "complete_generated_only" if valid else "complete_with_invalid_blocks"
        output["generated_case_results"] = run.generated_case_results(evidence, output["blocks"])
        output["four_case_alarm_total"] = sum(sum(output["generated_case_results"][c]["generated_layer_alarms"].values())
                                              for c in ("A02", "A03", "A05", "A09"))
        output["all_case_alarm_total"] = sum(sum(c["generated_layer_alarms"].values())
                                             for c in output["generated_case_results"].values())
        output["global_source_ownership_complete_once"] = valid
    for field in ("prompt_tokens", "completion_tokens", "total_tokens"):
        output["token_usage"][field] = sum(b.get("usage", {}).get(field, 0) for b in output["blocks"])
    output["token_usage"]["reported_blocks"] = sum("usage" in b for b in output["blocks"])
    save()
    return target


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--payloads", type=Path, required=True)
    parser.add_argument("--round", type=int, required=True, choices=range(4))
    parser.add_argument("--resume", type=Path)
    args = parser.parse_args()
    evidence = run.read_evidence()
    payloads = load_payloads(args.payloads, evidence)
    target = replay(payloads, evidence, args.round, args.resume)
    result = json.loads(target.read_text(encoding="utf-8"))
    print(f"{result['status']} | {result['token_usage']} | {target}")
    return 0 if result["status"] == "complete_generated_only" else 2


if __name__ == "__main__":
    raise SystemExit(main())
