"""N9 diagnostic overlay: frozen device facts and bounded source-cue policy mirror.

The A01–A12 baseline remains tied to the older diagnostic. This module uses the
new diagnostic without turning a policy projection into device PRESENTED evidence.
"""
from __future__ import annotations

from collections import Counter
import json
import re
from pathlib import Path

import run

DIAG = run.ROOT / "caption-diagnostics-1.3.5-20260929-155802.txt"
DIAG_SHA256 = "13b1f29cdf6ea180dadb67bf91de6a7b085412fb132880d8cd07585cf5ac5171"
RESULT = run.ROOT / "scoreboard/results/n9-evidence.json"
CASES = {
    "A13": {"block": 1, "words": [25, 97], "owned_ms": [7040, 28920],
            "event_words": [73, 97], "event_owned_ms": [20732, 28920],
            "failure": "semantic_anchor_leak", "requests": [3, 5],
            "frozen_blackout_ms": [7160, 28949]},
    "A14": {"block": 17, "words": [1219, 1240], "owned_ms": [384639, 391744],
            "failure": "event_review", "requests": [21, 22],
            "frozen_blackout_ms": [384647, 391748]},
}


def _trace(lines: list[str], kind: str) -> list[dict]:
    rows = []
    for number, line in enumerate(lines, 1):
        marker = f" | {kind} | "
        if marker not in line:
            continue
        stamp, detail = line.split(marker, 1)
        rows.append({"line": number, "at": int(stamp), **run.fields(detail)})
    return rows


def _source_intervals(start: int, end: int) -> list[dict]:
    """Mirror Java's latest-active raw cue, clipped to the owned event window."""
    cues = run.source_cues()
    cuts = sorted({start, end} | {t for cue in cues for t in
                  (cue["start_ms"], cue["end_ms"]) if start < t < end})
    intervals = []
    for left, right in zip(cuts, cuts[1:]):
        active = [cue for cue in cues if cue["start_ms"] <= left < cue["end_ms"]
                  and cue["text"].strip()]
        cue = max(active, key=lambda row: (row["start_ms"], row["cue"])) if active else None
        intervals.append({"start_ms": left, "end_ms": right,
                          "cue": cue["cue"] if cue else None,
                          "text": "[原文 / Original] " + cue["text"] if cue else None})
    return intervals


def policy_at(case: dict, position_ms: int, *, translated: str | None = None) -> dict:
    """Mirror the event-owned fallback decision; never infer device presentation."""
    start, end = case["owned_ms"]
    if not start <= position_ms < end:
        return {"decision": "outside_owned_event", "text": None}
    if translated:
        return {"decision": "caption", "text": translated}
    if case["failure"] == "event_review":
        return {"decision": "event_source", "text": "[原文 / Original] " + case["event_source"],
                "end_ms": end}
    interval = next((row for row in _source_intervals(start, end)
                     if row["start_ms"] <= position_ms < row["end_ms"]), None)
    if interval and interval["text"]:
        return {"decision": "source_cue", "text": interval["text"],
                "cue": interval["cue"], "end_ms": min(end, interval["end_ms"])}
    return {"decision": "no_source_cue", "text": None}


def score() -> dict:
    run.ensure(run.sha256(DIAG) == DIAG_SHA256, "N9 diagnostic fingerprint changed")
    run.ensure(run.sha256(run.SRT) == run.HASHES["srt"], "N9 source SRT fingerprint changed")
    lines = DIAG.read_text(encoding="utf-8").splitlines()
    # The chronological extended history is canonical. Earlier excerpts repeat it.
    begin = lines.index("[Extended history: chronological; last 24h; up to 8 MiB per channel]")
    stop = lines.index("[Extended quality evidence; captured only while debug enabled]")
    history = lines[begin:stop]
    records = {r["request"]: {"line": number, "source": json.loads(r["source"]),
                               "response": json.loads(r["response"]) if r["response"] else None}
               for number, line in enumerate(lines, 1) if line.startswith('{"at":')
               for r in [json.loads(line)]}
    token_line = next(line for line in lines if line.startswith("Tokens："))
    match = re.fullmatch(r"Tokens：([\d,]+) = 输入 ([\d,]+) \+ 输出 ([\d,]+)", token_line)
    run.ensure(match is not None, "N9 token audit missing")
    total, prompt, completion = [int(value.replace(",", "")) for value in match.groups()]
    run.ensure(total == prompt + completion, "N9 token audit does not balance")
    rejected = _trace(history, "REBUILD_EVENTS_REJECTED")
    accepted = _trace(history, "REBUILD_EVENTS_ACCEPTED")
    warnings = _trace(history, "REBUILD_QUALITY_WARNING")
    no_progress = _trace(history, "REBUILD_REPAIR_NO_PROGRESS")
    fallback_begin = _trace(history, "REBUILD_FALLBACK_BEGIN")
    fallback_end = _trace(history, "REBUILD_FALLBACK_END")
    selected = _trace(history, "REBUILD_SELECTED")
    presented = _trace(history, "REBUILD_PRESENTED")
    results = {}
    for name, definition in CASES.items():
        block, (first, last) = definition["block"], definition.get("event_words", definition["words"])
        request_rows = [records[n] for n in definition["requests"]]
        run.ensure(all(r["source"]["block"] == f"b{block}_{r['source']['owned_tokens'][0][0]}_{r['source']['owned_tokens'][-1][0]}"
                       for r in request_rows), f"{name}: block identity drift")
        source = request_rows[-1]["source"]
        event = next(e for e in request_rows[0]["response"]["events"]
                     if e["from"] == first and e["to"] == last)
        run.ensure(event["source"] == " ".join(token for idx, token in source["owned_tokens"]
                                                 if first <= idx <= last), f"{name}: source quote drift")
        block_times = source["diagnostic_only_source_times"]
        run.ensure([block_times[0][1], block_times[-1][2]] == definition["owned_ms"] if name == "A13" else True,
                   f"{name}: block time drift")
        times = [row for row in source["diagnostic_only_source_times"]
                 if first <= row[0] <= last]
        run.ensure([times[0][1], times[-1][2]] == definition.get("event_owned_ms", definition["owned_ms"]),
                   f"{name}: event time drift")
        blackout = definition["frozen_blackout_ms"]
        observed_begin = [row for row in fallback_begin if row.get("reason", "").startswith(definition["failure"])
                          or (name == "A13" and row.get("reason", "").startswith("failed:" + definition["failure"]))]
        observed_end = [row for row in fallback_end if row.get("reason", "").startswith(definition["failure"])
                        or (name == "A13" and row.get("reason", "").startswith("failed:" + definition["failure"]))]
        run.ensure(any(int(row["position"]) == blackout[0] for row in observed_begin),
                   f"{name}: fallback onset drift")
        run.ensure(any([int(row["start"]), int(row["end"])] == blackout for row in observed_end),
                   f"{name}: fallback end drift")
        status_rows = [row for row in selected if row.get("text") == "字幕暂不可用"
                       and int(row.get("time", -1)) == blackout[0]]
        run.ensure(status_rows and any(row.get("mode") == "status" and
                   row.get("text") == "字幕暂不可用" and row["at"] >= status_rows[0]["at"]
                   for row in presented), f"{name}: frozen status display missing")
        same_block_rejections = [row for row in rejected if row.get("block") == str(block)]
        same_block_accepts = [row for row in accepted if row.get("block") == str(block)]
        if name == "A13":
            run.ensure([int(row["request"]) for row in same_block_rejections] == [3, 5],
                       "A13: two anchor rejections expected")
            run.ensure(not same_block_accepts, "A13: rejected block unexpectedly accepted")
        else:
            run.ensure([int(row["request"]) for row in same_block_accepts] == [21, 22],
                       "A14: accepted review response drift")
            run.ensure(any(row.get("block") == str(block) for row in no_progress),
                       "A14: repair no-progress record missing")
            risk_lines = [line for line in history if " | REBUILD_QUALITY_WARNING | " in line
                          and "block=17;" in line and
                          "possible_subject_attachment range=1219-1240:" in line]
            run.ensure(len(risk_lines) == 2,
                       "A14: frozen subject-attachment warning drift")
            repaired = request_rows[1]["response"]["events"]
            run.ensure([(e["from"], e["to"]) for e in repaired[:2]] == [(1219, 1229), (1230, 1240)]
                       and source["owned_tokens"][1229 - source["owned_tokens"][0][0]][1] == "deng"
                       and source["owned_tokens"][1230 - source["owned_tokens"][0][0]][1] == "reduced"
                       and 1229 in source["avoid_event_end_after"],
                       "A14: repair's protected Deng/reduced split drift")
        policy_case = {**definition, "event_source": event["source"]}
        intervals = ([{"start_ms": definition["owned_ms"][0],
                       "end_ms": definition["owned_ms"][1], "cue": None,
                       "text": "[原文 / Original] " + event["source"]}]
                     if name == "A14" else _source_intervals(*definition["owned_ms"]))
        readable = sum(row["end_ms"] - row["start_ms"] for row in intervals if row["text"])
        result = {**definition, "status": "未验证", "display_evidence": "冻结状态已显示；新策略仅离线镜像，真机待验",
                  "source": event["source"], "rejected_translation": event["text"] if name == "A13" else None,
                  "accepted_translation": event["text"] if name == "A14" else None,
                  "frozen": {"blackout_duration_ms": blackout[1] - blackout[0],
                             "fallback_begin_lines": [begin + row["line"] for row in observed_begin],
                             "fallback_end_lines": [begin + row["line"] for row in observed_end],
                             "status_selected_lines": [begin + row["line"] for row in status_rows],
                             "request_record_lines": [r["line"] for r in request_rows],
                             "rejection_lines": [begin + row["line"] for row in same_block_rejections],
                             "acceptance_lines": [begin + row["line"] for row in same_block_accepts],
                             "repair_no_progress_lines": [begin + row["line"] for row in no_progress
                                                          if row.get("block") == str(block)],
                             "review_warning_lines": [begin + row["line"] for row in warnings
                                                      if row.get("block") == str(block)]},
                  "policy_mirror": {"decision_at_blackout_onset": policy_at(policy_case, blackout[0]),
                                    "readable_source_ms_in_owned_window": readable,
                                    "status_only_ms_in_owned_window": definition["owned_ms"][1] - definition["owned_ms"][0] - readable,
                                    "source_cue_intervals": intervals,
                                    "device_presented_verified": False}}
        if name == "A14":
            result["status"] = "真风险已裁决；新版真机待验"
            result["display_evidence"] = "冻结旧状态已显示；N9 原文兜底仅离线镜像，真机待验"
            result["review_adjudication"] = {
                "decision": "keep_semantic_block",
                "risk": "possible_subject_attachment",
                "repair_candidate_risk": "dependent_boundary",
                "accepted_translation_displayable": False,
                "new_live_requests": 0,
                "new_live_tokens": 0,
            }
        results[name] = result
    # A13's first visible failure state in the original playback must not be
    # projected backward to A04's later 20.732 s event.
    results["A13"]["policy_mirror"]["no_future_source_at_7160"] = (
        "who cares" not in policy_at(CASES["A13"], 7160)["text"].lower())
    return {"layer": "n9_frozen_facts_plus_java_policy_mirror", "input_sha256":
            {"diagnostics": DIAG_SHA256, "srt": run.HASHES["srt"]},
            "limits": ["N9 raw word times are estimated from SRT cue order, not speech alignment.",
                       "Policy mirror predicts decisions; no new Android PRESENTED trace exists.",
                       "A13/A14 are additive to the immutable A01–A12 baseline."],
            "frozen_token_audit": {"total_tokens": total, "input_tokens": prompt,
                                   "output_tokens": completion},
            "cases": results}


def main() -> None:
    result = score()
    RESULT.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"N9: A13/A14 captured; {result['frozen_token_audit']['total_tokens']} frozen tokens; {RESULT}")


if __name__ == "__main__":
    main()
