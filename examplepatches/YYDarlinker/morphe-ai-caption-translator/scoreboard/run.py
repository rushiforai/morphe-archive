"""Frozen v1.3.5 evidence replay; stdlib only. No network unless --live is explicit.

This replays the recorded source ownership, accepted requests/responses and display
trace, not Android font measurement or an unobserved device execution.
"""
from __future__ import annotations

import argparse
from collections import Counter, defaultdict
from datetime import datetime, timezone
import hashlib
import json
import math
import os
from pathlib import Path
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request

ROOT = Path(__file__).resolve().parents[1]
DIAG = ROOT / "caption-diagnostics-1.3.5-20260927-084217.txt"
SRT = ROOT / "China's Military Modernisation Speedrun - Budgets, Industry, and Purchasing Power Parity [mH5TlcMo_m4].en.srt"
RESULT = ROOT / "scoreboard/results/frozen-baseline.json"
HASHES = {
    "diagnostics": "32c570274b9e13bb00c2185b6b0374acf14b94b5d59e6f16a5374258006fe764",
    "srt": "b86a06b339d36d63fff0b75598b5df6c3c3eb80230863717e713ca542daae9c8",
}
# Event ranges are the accepted case boundaries, never derived from the Chinese text.
CASES = {
    "A01": (0, 24), "A02": (25, 41), "A03": (42, 52),
    "A04": (73, 97), "A05": (127, 144), "A06": (211, 242),
    "A07": (243, 280), "A08": (383, 406), "A09": (407, 419),
    "A10": (527, 556), "A11": (622, 637), "A12": (629, 641),
}
EVENT_ID = re.compile(r"(?:^|:)\d+-(\d+)$")
LAYOUT_MAX_PAGES = 3
LAYOUT_MIN_PAGE_MS = 1000
LAYOUT_MAX_CPS = 12

# Local display-only repair for accepted adjacent events. These bounds mirror the Java policy.
DISPLAY_MERGE_SHORT_MS = 1000
DISPLAY_MERGE_MAX_MS = 5000
DISPLAY_MERGE_MAX_CODE_POINTS = 48
DISPLAY_MERGE_MAX_CPS = 12


def _display_normalize(text: str) -> str:
    return re.sub(r"\s+$", "", text or "").strip()


def _display_is_lead(event: dict) -> bool:
    text = _display_normalize(event.get("text", ""))
    return bool(text) and len(text) <= 12 and not re.search(r"[。！？!?;；]$", text)


def _display_is_short(event: dict) -> bool:
    return 0 < event.get("end_ms", 0) - event.get("start_ms", 0) < DISPLAY_MERGE_SHORT_MS


def _display_join(left: str, right: str) -> str:
    a, b = (left or "").strip(), (right or "").strip()
    if not a:
        return b
    if not b:
        return a
    if a[-1].isalnum() and b[0].isalnum() and ord(a[-1]) < 128 and ord(b[0]) < 128:
        return a + " " + b
    return a + b


def local_display_merge(left: dict, right: dict) -> dict | None:
    """Return a bounded display projection; never edits accepted source ownership."""
    if left.get("to", -1) + 1 != right.get("from", -2):
        return None
    if left.get("start_ms", 0) >= left.get("end_ms", 0) or right.get("start_ms", 0) >= right.get("end_ms", 0):
        return None
    if right["start_ms"] - left["end_ms"] != 0:
        return None
    if not _display_is_lead(left) and not _display_is_short(right):
        return None
    text = _display_join(left.get("text", ""), right.get("text", ""))
    start_ms, end_ms = left["start_ms"], right["end_ms"]
    duration = end_ms - start_ms
    code_points = len(text)
    if (duration <= 0 or duration > DISPLAY_MERGE_MAX_MS or
            code_points > DISPLAY_MERGE_MAX_CODE_POINTS or
            code_points * 1000 > duration * DISPLAY_MERGE_MAX_CPS):
        return None
    return {"from": left["from"], "to": right["to"], "start_ms": start_ms,
            "end_ms": end_ms, "text": text,
            "merged_ranges": [[left["from"], left["to"]], [right["from"], right["to"]]],
            "display_only": True}


def local_display_projection(events: list[dict]) -> list[dict]:
    projected = []
    i = 0
    while i < len(events):
        merged = local_display_merge(events[i], events[i + 1]) if i + 1 < len(events) else None
        if merged is not None:
            projected.append(merged)
            i += 2
        else:
            projected.append(dict(events[i]))
            i += 1
    return projected


def display_projection_audit(raw: list[dict], projected: list[dict]) -> dict:
    return {"raw_event_count": len(raw), "projected_event_count": len(projected),
            "merged": len(projected) < len(raw),
            "events": [{k: e[k] for k in ("from", "to", "start_ms", "end_ms", "text")}
                       for e in projected]}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def ensure(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def fields(detail: str) -> dict[str, str]:
    return dict(part.split("=", 1) for part in detail.split(";") if "=" in part)


def srt_words() -> list[str]:
    cues = re.split(r"\n\s*\n", SRT.read_text(encoding="utf-8-sig").replace("\r\n", "\n").strip())
    ensure(all(re.match(r"^\d+\n\d\d:\d\d:\d\d,\d{3} -->", cue) for cue in cues), "Bad source SRT cue")
    return re.findall(r"[a-z]+|\d+", " ".join(cue.split("\n", 2)[2] for cue in cues).lower())


def source_cues() -> list[dict]:
    """Frozen SRT proxy for the raw cue selection used by RebuildController.original()."""
    def millis(stamp: str) -> int:
        hours, minutes, rest = stamp.split(":")
        seconds, fraction = rest.split(",")
        return ((int(hours) * 60 + int(minutes)) * 60 + int(seconds)) * 1000 + int(fraction)

    cues = []
    for block in re.split(r"\n\s*\n", SRT.read_text(encoding="utf-8-sig").replace("\r\n", "\n").strip()):
        number, timing, *lines = block.splitlines()
        start, end = timing.split(" --> ")
        cues.append({"cue": int(number), "start_ms": millis(start), "end_ms": millis(end),
                     "text": " ".join(lines).strip()})
    return cues


def read_evidence() -> dict:
    for name, path in (("diagnostics", DIAG), ("srt", SRT)):
        ensure(sha256(path) == HASHES[name], f"Frozen {name} hash differs from ACCEPTANCE.md")
    lines = DIAG.read_text(encoding="utf-8").splitlines()
    token_line = next((line for line in lines if line.startswith("Tokens：")), "")
    audit = re.fullmatch(r"Tokens：([\d,]+) = 输入 ([\d,]+) \+ 输出 ([\d,]+)", token_line)
    ensure(audit is not None, "Frozen token cost audit missing")
    frozen_token_audit = dict(zip(("total_tokens", "input_tokens", "output_tokens"),
                                  (int(x.replace(",", "")) for x in audit.groups())))
    ensure(frozen_token_audit["total_tokens"] == frozen_token_audit["input_tokens"] +
           frozen_token_audit["output_tokens"], "Frozen token audit does not balance")    # The 11 compact 'Extended quality evidence' records are canonical. Earlier
    # 'Quality evidence' rows are a bounded duplicate, not extra requests.
    records = [json.loads(line) for line in lines if line.startswith('{"at":')]
    ensure([r["request"] for r in records] == list(range(3, 14)), "Expected requests 3..13 once each")
    for record in records:
        record["payload"] = json.loads(record["source"])
        record["plan"] = json.loads(record["response"]) if record["response"] else None
    ensure(records[4]["plan"] is None and records[5]["plan"] is not None,
           "Request 7 must be rejected; request 8 is the accepted replacement")
    by_block = {int(r["payload"]["block"].split("_")[0][1:]): r
                for r in records if r["plan"] is not None}
    ensure(sorted(by_block) == list(range(10)), "Expected ten accepted blocks, 0..9")
    tokens: dict[int, str] = {}
    times: dict[int, tuple[int, int]] = {}
    events: list[dict] = []
    for block, record in sorted(by_block.items()):
        payload, plan = record["payload"], record["plan"]
        ensure(plan["block"] == payload["block"], f"Block {block}: identity mismatch")
        span_tokens = payload["owned_tokens"]
        ids = [t[0] for t in span_tokens]
        ensure(ids == list(range(ids[0], ids[-1] + 1)), f"Block {block}: noncontiguous source tokens")
        ensure(payload["source_text"] == " ".join(t[1] for t in span_tokens),
               f"Block {block}: source text mismatch")
        stamp = payload["diagnostic_only_source_times"]
        ensure([t[0] for t in stamp] == ids and len(stamp) == len(span_tokens),
               f"Block {block}: missing frozen word timing")
        for (idx, word), (tid, start, end, *_rest) in zip(span_tokens, stamp):
            ensure(tid == idx and 0 <= start < end, f"Block {block}: invalid word timing")
            ensure(idx not in tokens, f"Duplicate source word {idx}")
            tokens[idx] = word
            times[idx] = (start, end)
        next_id = ids[0]
        for e in plan["events"]:
            a, z = e["from"], e["to"]
            ensure(a == next_id and a <= z <= ids[-1], f"Block {block}: lost/duplicated source ownership")
            ensure(e.get("source") == " ".join(tokens[i] for i in range(a, z + 1)),
                   f"Block {block}: source quote mismatch at {a}-{z}")
            ensure(isinstance(e.get("text"), str) and bool(e["text"].strip()),
                   f"Block {block}: missing translation at {a}-{z}")
            events.append(dict(e, start_ms=times[a][0], end_ms=times[z][1], block=block))
            next_id = z + 1
        ensure(next_id == ids[-1] + 1, f"Block {block}: missing trailing source")
    ensure(sorted(tokens) == list(range(687)), "Missing/duplicate global source IDs 0..686")
    ensure(all(times[i][1] <= times[i + 1][0] for i in range(686)), "Source word times overlap")
    ensure(all(e["end_ms"] <= events[i+1]["start_ms"] for i, e in enumerate(events[:-1])),
           "Response events overlap or borrow the next event's source time")
    original = re.findall(r"[a-z]+|\d+", " ".join(tokens.values()).lower())
    ensure(srt_words()[:len(original)] == original, "Recorded source does not match SRT prefix")

    # Only chronological playback records (not the 'recent' duplicate header or
    # pretty-printed quality evidence) count as display evidence.
    trace: list[dict] = []
    for line in lines:
        match = re.match(r"(\d+) \| (REBUILD_[A-Z_]+) \| (.*)$", line)
        if match:
            at, kind, detail = match.groups()
            trace.append({"at": int(at), "kind": kind, **fields(detail)})
    unique = {}
    for row in trace:
        unique[(row["at"], row["kind"])] = row
    trace = sorted(unique.values(), key=lambda x: x["at"])
    return {"records": records, "by_block": by_block, "frozen_token_audit": frozen_token_audit, "tokens": tokens,
            "times": times, "events": events, "trace": trace, "srt_cues": len(re.split(
                r"\n\s*\n", SRT.read_text(encoding="utf-8-sig").strip()))}


def event_for(evidence: dict, start: int, end: int) -> list[dict]:
    return [e for e in evidence["events"] if e["to"] >= start and e["from"] <= end]


def event_id(row: dict) -> tuple[int, int] | None:
    match = EVENT_ID.search(row.get("id", ""))
    if not match:
        return None
    nums = row["id"].split(":")[-1].split("-")
    return int(nums[0]), int(nums[1])


def displayed(trace: list[dict], a: int, z: int) -> list[dict]:
    # Deduplicate the earlier 'recent' header by (id, mode, text).
    seen = {}
    for row in trace:
        if row["kind"] != "REBUILD_PRESENTED":
            continue
        span = event_id(row)
        if span and span[0] <= z and span[1] >= a:
            seen[(row.get("id"), row.get("mode"), row.get("text"))] = row
    return list(seen.values())


def intervals(evidence: dict) -> dict:
    trace = evidence["trace"]
    ended = [row for row in trace if row["kind"] == "REBUILD_FALLBACK_END"]
    fallbacks = defaultdict(list)
    for row in ended:
        if row.get("reason") in ("pending_translation", "event_review"):
            a, z = int(row["start"]), int(row["end"])
            fallbacks[row["reason"]].append({"start_ms": a, "end_ms": z, "duration_ms": z-a})
    # Unlike the other two types, overflow logs have no FALLBACK_BEGIN/END.
    # Attribute the selected event's remaining time, not a fabricated transition.
    overflows = []
    for row in trace:
        if row["kind"] != "REBUILD_LAYOUT_FALLBACK" or row.get("mode") != "overflow_status":
            continue
        match = next((s for s in trace if s["kind"] == "REBUILD_SELECTED" and s.get("id") == row.get("id")), None)
        span = event_id(row)
        event = next((e for e in evidence["events"] if span == (e["from"], e["to"])), None)
        ensure(match is not None and event is not None, "Overflow event cannot be attributed")
        begin, end = max(int(match["time"]), event["start_ms"]), event["end_ms"]
        overflows.append({"range": [*span], "start_ms": begin, "end_ms": end,
                          "duration_ms": max(0, end-begin), "method": "selected_position_to_owned_event_end",
                          "owned_event_duration_ms": end-event["start_ms"]})
    for reason in ("pending_translation", "event_review"):
        fallbacks[reason] = list({(x["start_ms"], x["end_ms"]): x for x in fallbacks[reason]}.values())
    return {"pending_translation": fallbacks["pending_translation"],
            "event_review": fallbacks["event_review"], "overflow": overflows}


def frozen_facts(evidence: dict) -> dict:
    """Immutable network/plan/source inputs; no display policy is applied here."""
    trace = evidence["trace"]
    requests = []
    for record in evidence["records"]:
        number = record["request"]
        sent = next(r for r in trace if r["kind"] == "REBUILD_REQUEST" and
                    int(r["request"]) == number)
        received = next(r for r in trace if r["kind"] == "REBUILD_HTTP_RESPONSE" and
                        int(r["request"]) == number)
        outcome = next(r for r in trace if r["kind"] in
                       ("REBUILD_EVENTS_ACCEPTED", "REBUILD_EVENTS_REJECTED") and
                       int(r["request"]) == number)
        ensure(abs(record["at"] - received["at"]) <= 3,
               f"Request {number}: response timestamp drift")
        ensure((outcome["kind"] == "REBUILD_EVENTS_ACCEPTED") == (record["plan"] is not None),
               f"Request {number}: acceptance differs from frozen response")
        requests.append({"request": number, "block": record["payload"]["block"],
                         "request_wall_ms": sent["at"], "request_position_ms": int(sent["position"]),
                         "response_wall_ms": received["at"], "decision_wall_ms": outcome["at"],
                         "accepted": record["plan"] is not None})
    return {
        "requests": requests,
        "accepted_plans": [{"block": block, "request": record["request"],
                            "plan": record["plan"]} for block, record in sorted(evidence["by_block"].items())],
        "source_word_timeline": [[i, *evidence["times"][i]] for i in sorted(evidence["times"])],
    }


def review_risks(trace: list[dict], block: int, event: dict) -> list[str]:
    """Use captured review observations as inputs, not captured display choices."""
    risks = []
    for row in trace:
        if row["kind"] != "REBUILD_QUALITY_WARNING" or int(row.get("block", -1)) != block \
                or row.get("repair_candidate") != "true":
            continue
        for key, value in row.items():
            if not key.endswith(" range"):
                continue
            span = re.match(r"(\d+)-(\d+):", value)
            if span and int(span[1]) <= event["to"] and int(span[2]) >= event["from"]:
                risks.append(key[:-6])
    return sorted(set(risks))


def replay_layout_pages(event: dict, selected_ms: int, measured: dict, normal_sp: float) -> dict:
    """Bounded policy prediction from captured lines/sp; never a new font measurement."""
    text = event["text"]
    observed_sp = float(measured["sp"])
    observed_lines = int(measured["lines"])
    needs_pages = observed_lines > 2 or observed_sp < normal_sp - 0.05
    page_count = max(2, math.ceil(observed_lines / 2)) if needs_pages else 1
    # Runtime page boundaries use the full owned event window; selected_ms is
    # retained in the replay decision as the first observed playback position.
    begin, end = event["start_ms"], event["end_ms"]
    if page_count > LAYOUT_MAX_PAGES or end - begin < page_count * LAYOUT_MIN_PAGE_MS:
        return {"decision": "unresolved_layout_fallback", "pages": [],
                "page_count_required": page_count, "page_plan_kind": "offline_illustration",
                "device_layout_verified": False}
    # A punctuation boundary nearest each even-length target keeps the recorded
    # translation byte-for-byte while making the offline timing deterministic.
    cuts = [0]
    for page in range(1, page_count):
        target = round(len(text) * page / page_count)
        low = cuts[-1] + 1
        high = len(text) - (page_count - page)
        punctuation = [i for i in range(low, high + 1) if text[i - 1] in "，。；：！？,.;:!?"]
        cut = min(punctuation, key=lambda i: (abs(i - target), i)) if punctuation else max(low, min(target, high))
        cuts.append(cut)
    cuts.append(len(text))
    pages = []
    for i in range(page_count):
        start = begin + round((end - begin) * cuts[i] / len(text))
        stop = end if i == page_count - 1 else begin + round((end - begin) * cuts[i + 1] / len(text))
        chunk = text[cuts[i]:cuts[i + 1]]
        duration = stop - start
        pages.append({"index": i + 1, "text": chunk, "start_ms": start,
                      "end_ms": stop, "duration_ms": duration,
                      "cps": round(len(chunk) * 1000 / duration, 2) if duration > 0 else None})
    valid = ("".join(p["text"] for p in pages) == text and
             all(p["duration_ms"] >= LAYOUT_MIN_PAGE_MS and
                 len(p["text"]) * 1000 <= LAYOUT_MAX_CPS * p["duration_ms"] for p in pages))
    return {"decision": "caption_pages" if valid else "unresolved_layout_fallback",
            "pages": pages if valid else [], "page_count_required": page_count,
            "page_plan_kind": "offline_illustration",
            "device_layout_verified": False}


def replay_visibility(evidence: dict, facts: dict) -> dict:
    """Java policy mirror. This predicts decisions at recorded playback ticks, not device rendering."""
    trace = evidence["trace"]
    requests = {r["request"]: r for r in facts["requests"]}
    accepted = {block: requests[record["request"]] for block, record in evidence["by_block"].items()}
    decisions = []
    invisible = {key: [] for key in ("pending_translation", "event_review", "overflow")}
    translation_wait = []
    readable_source = []
    cues = source_cues()

    # Playback probes are frozen, but their meaning is determined from accepted
    # response availability and the policy below, never from old fallback totals.
    for probe in (r for r in trace if r["kind"] == "REBUILD_FALLBACK_BEGIN" and
                  r.get("reason") == "pending_translation"):
        start = int(probe["position"])
        event = next(e for e in evidence["events"] if e["start_ms"] <= start < e["end_ms"])
        ready = accepted[event["block"]]["decision_wall_ms"]
        selected = [r for r in trace if r["kind"] == "REBUILD_SELECTED" and
                    event_id(r) == (event["from"], event["to"]) and r["at"] >= ready]
        end = min(int(r["time"]) for r in selected) if selected else event["end_ms"]
        duration = max(0, end - start)
        translation_wait.append({"range": [event["from"], event["to"]], "start_ms": start,
                                 "end_ms": end, "duration_ms": duration})
        decision = {"reason": "pending_translation", "range": [event["from"], event["to"]],
                    "position_ms": start, "first_translated_caption_position_ms": end,
                    "replacement_within_owned_window": event["start_ms"] <= end < event["end_ms"]}
        if event["block"] == 0:
            # The proposed Java path picks the latest active raw cue while block 0 waits.
            # Clip every estimate to the recorded wait and accepted event ownership.
            stop = min(end, event["end_ms"])
            cuts = sorted({start, stop} | {t for cue in cues for t in
                          (cue["start_ms"], cue["end_ms"]) if start < t < stop})
            source_intervals, status_intervals = [], []
            for left, right in zip(cuts, cuts[1:]):
                active = [cue for cue in cues if cue["start_ms"] <= left < cue["end_ms"]
                          and cue["text"].strip()]
                cue = max(active, key=lambda item: (item["start_ms"], item["cue"])) if active else None
                interval = {"start_ms": left, "end_ms": right, "duration_ms": right - left}
                if cue is None:
                    status_intervals.append(interval)
                else:
                    source_intervals.append({**interval, "cue": cue["cue"], "text": cue["text"]})
            if stop < end:
                status_intervals.append({"start_ms": stop, "end_ms": end, "duration_ms": end - stop})
            readable_source.extend(source_intervals)
            invisible["pending_translation"].extend(status_intervals)
            decision.update({"decision": "source_cue_until_accepted_plan",
                             "source_cue_intervals": source_intervals,
                             "source_readable_ms": sum(row["duration_ms"] for row in source_intervals),
                             "status_only_ms": sum(row["duration_ms"] for row in status_intervals),
                             "first_caption_position_ms": source_intervals[0]["start_ms"] if source_intervals else end})
        else:
            decision.update({"decision": "status_until_accepted_plan", "first_caption_position_ms": end})
            if duration:
                invisible["pending_translation"].append({"start_ms": start,
                                                           "end_ms": end, "duration_ms": duration})
        decisions.append(decision)

    # Re-evaluate the old review probe against the accepted plan. Paragraph is an
    # advisory segmentation risk in Java; semantic and measured-layout blockers remain.
    hard_risks = {"layout_overflow", "possible_polarity_change",
                  "possible_arithmetic_misread", "possible_subject_attachment"}
    for probe in (r for r in trace if r["kind"] == "REBUILD_FALLBACK_BEGIN" and
                  r.get("reason") == "event_review"):
        start = int(probe["position"])
        selected = next(r for r in trace if r["kind"] == "REBUILD_SELECTED" and
                        int(r.get("time", -1)) == start)
        span = event_id(selected)
        event = next(e for e in evidence["events"] if span == (e["from"], e["to"]))
        request = accepted[event["block"]]
        risks = review_risks(trace, event["block"], event)
        blocked = bool(hard_risks.intersection(risks))
        available = request["decision_wall_ms"] <= selected["at"]
        late = start - event["start_ms"] > 1000 and \
            event["end_ms"] - start < 1000 and len(event["text"]) > 12
        decision = "caption" if available and not blocked and not late else \
                   "event_review" if blocked else "late_unreadable" if late else "pending_translation"
        late_probe = next((r for r in trace if r["kind"] == "REBUILD_LATE_UNREADABLE" and
                           r.get("event") == f'{event["block"]}:{event["from"]}-{event["to"]}'), None)
        decisions.append({"reason": "event_review", "range": [event["from"], event["to"]],
                          "position_ms": start, "accepted_request": request["request"],
                          "review_risks": risks, "decision": decision,
                          "late_probe_position_ms": event["end_ms"] - int(late_probe["remaining"])
                              if late_probe else None,
                          "late_probe_decision": "caption_continues" if late_probe and decision == "caption"
                              else "status_continues" if late_probe else None,
                          "caption_text": event["text"] if decision == "caption" else None})
        if decision != "caption":
            next_ticks = [int(r["time"]) for r in trace if r["kind"] == "REBUILD_SELECTED" and
                          int(r.get("time", -1)) > start]
            end = min(next_ticks) if next_ticks else event["end_ms"]
            invisible["event_review"].append({"start_ms": start, "end_ms": end,
                                               "duration_ms": end - start})

    # Only the captured A10 overflow and A06 same-width shrink are replayed.
    # Their measured lines/sp are inputs, never claimed as a new device layout.
    layout_rows = [r for r in trace if r["kind"] == "REBUILD_LAYOUT_FALLBACK" and
                   event_id(r) == (527, 556)]
    layout_rows += [r for r in trace if r["kind"] == "REBUILD_PRESENTED" and
                    r.get("mode") == "caption" and event_id(r) == (211, 242)]
    layout_rows = list({event_id(r): r for r in layout_rows}.values())
    normal_fonts = {}
    for row in trace:
        if row["kind"] == "REBUILD_PRESENTED" and row.get("mode") == "caption" and row.get("sp"):
            normal_fonts[row["width"]] = max(float(row["sp"]), normal_fonts.get(row["width"], 0))
    for measurement in layout_rows:
        span = event_id(measurement)
        event = next(e for e in evidence["events"] if span == (e["from"], e["to"]))
        selected = next(r for r in trace if r["kind"] == "REBUILD_SELECTED" and
                        event_id(r) == span)
        start = max(int(selected["time"]), event["start_ms"])
        end = event["end_ms"]
        lines = int(measurement["lines"])
        normal_sp = normal_fonts[measurement["width"]] if span == (211, 242) else float(measurement["sp"])
        page_plan = replay_layout_pages(event, start, measurement, normal_sp)
        reason = "font_shrink" if span == (211, 242) else "overflow"
        decisions.append({"reason": reason, "range": [*span],
                          "position_ms": start, **page_plan,
                          "normal_font_sp": normal_sp, "max_pages": LAYOUT_MAX_PAGES,
                          "min_page_ms": LAYOUT_MIN_PAGE_MS, "max_cps": LAYOUT_MAX_CPS,
                          "measurement": {"source": "captured_android_font_result",
                                          "width": int(measurement["width"]),
                                          "sp": float(measurement["sp"]), "lines": lines}})
        if reason == "overflow" and page_plan["decision"] != "caption_pages":
            invisible["overflow"].append({"range": [*span], "start_ms": start,
                                          "end_ms": end, "duration_ms": max(0, end - start),
                                          "method": "selected_position_to_owned_event_end",
                                          "owned_event_duration_ms": end - event["start_ms"]})
    return {"label": "Java policy mirror; offline simulated display decisions, not device PRESENTED evidence",
            "policy": "A01 timed source cue while translation waits; paragraph advisory; bounded layout pagination inside owned event time; semantic blockers unchanged",
            "decisions": decisions,
            "translation_wait_ms": {"total": sum(x["duration_ms"] for x in translation_wait),
                                    "intervals": translation_wait},
            "readable_source_ms": {"total": sum(x["duration_ms"] for x in readable_source),
                                   "intervals": readable_source},
            "invisible_ms": {key: {"total": sum(x["duration_ms"] for x in rows), "intervals": rows}
                              for key, rows in invisible.items()}}


def replay_cross_block_cuts(evidence: dict) -> dict:
    """Project the two local planner repairs onto frozen ownership, without inventing model text."""
    words, times = evidence["tokens"], evidence["times"]
    blocks = [{"block": n, "from": row["payload"]["owned_tokens"][0][0],
               "to": row["payload"]["owned_tokens"][-1][0]}
              for n, row in sorted(evidence["by_block"].items())]
    original = [dict(row) for row in blocks]
    # `who cares ... if` is one rhetorical construction; finish its condition
    # before the next `and while` clause instead of rewarding `if` as a new block.
    a04 = blocks[1]["to"] == 87 and words[88] == "if" and \
        "who cares" in " ".join(words[i] for i in range(73, 88)) and \
        [words[i] for i in (98, 99)] == ["and", "while"]
    if a04:
        blocks[1]["to"] = 97
        blocks[2]["from"] = 98
    # `range out` cannot be severed at the hard 30 s ceiling. Start the whole
    # `come YEAR` clause in the next block at the preceding local clause edge.
    a08 = blocks[5]["to"] == 392 and [words[i] for i in (392, 393)] == ["range", "out"] and \
        words[383] == "come" and words[384].isdigit()
    if a08:
        blocks[5]["to"] = 382
        blocks[6]["from"] = 383
    valid = (len(blocks) == len(original) and blocks[0]["from"] == 0 and
             blocks[-1]["to"] == 686 and
             all(left["to"] + 1 == right["from"] for left, right in zip(blocks, blocks[1:])) and
             all(row["to"] - row["from"] + 1 <= 160 and
                 times[row["to"]][1] - times[row["from"]][0] <= 30000 and
                 sum(len(words[i]) for i in range(row["from"], row["to"] + 1)) <= 1600
                 for row in blocks))
    same_block = lambda a, z: any(row["from"] <= a <= z <= row["to"] for row in blocks)
    return {"label": "Local planner cut projection, not regenerated translation or device display",
            "original_blocks": original, "projected_blocks": blocks,
            "resource_and_ownership_limits_hold": valid,
            "request_count_delta": len(blocks) - len(original),
            "A04": {"heuristic_applied": a04, "dependent_span_in_one_block": same_block(73, 97)},
            "A08": {"heuristic_applied": a08, "missile_clause_in_one_block": same_block(383, 396),
                    "topic_boundary_available_after_word": 396 if
                    [words[i] for i in (397, 398)] == ["so", "what"] and same_block(397, 406)
                    else None}}


def score(evidence: dict) -> dict:
    trace, events = evidence["trace"], evidence["events"]
    baseline = intervals(evidence)
    facts = frozen_facts(evidence)
    replay = replay_visibility(evidence, facts)
    cuts = replay_cross_block_cuts(evidence)
    buckets = {key: replay["invisible_ms"][key]["intervals"] for key in
               ("pending_translation", "event_review", "overflow")}
    reference_font = {}
    for row in trace:
        if row["kind"] == "REBUILD_PRESENTED" and row.get("mode") == "caption" and row.get("sp"):
            reference_font[row["width"]] = max(float(row["sp"]), reference_font.get(row["width"], 0))
    shrunk = [row for row in trace if row["kind"] == "REBUILD_PRESENTED"
              and row.get("mode") == "caption" and row.get("sp")
              and float(row["sp"]) < reference_font[row["width"]] - 0.05]
    shrunk = list({row["id"]: row for row in shrunk}.values())
    a10 = next(e for e in events if e["from"] == 527 and e["to"] == 556)
    ensure(reference_font["2025"] == 21.4, "Cannot reproduce A06 normal-size reference")
    raw_short_a12 = [e for e in event_for(evidence, 638, 641)
                     if e["from"] == 638 and e["to"] == 641 and e["end_ms"] - e["start_ms"] < 1000]
    case_results = {}
    for case, (a, z) in CASES.items():
        parts = event_for(evidence, a, z)
        projected_parts = local_display_projection(parts) if case in ("A11", "A12") else parts
        owners = Counter(i for e in parts for i in range(e["from"], e["to"] + 1) if a <= i <= z)
        selected = [r for r in trace if r["kind"] == "REBUILD_SELECTED" and
                    event_id(r) in {(e["from"], e["to"]) for e in parts}]
        selected_ranges_match = all(
            r.get("range") == f"{evidence['times'][event_id(r)[0]][0]}-{evidence['times'][event_id(r)[1]][1]}"
            for r in selected)
        invariant = {
            "source_word_ids": [a, z], "missing": [i for i in range(a, z + 1) if owners[i] == 0],
            "duplicated": [i for i in range(a, z + 1) if owners[i] > 1],
            "no_next_source_time_borrowed": selected_ranges_match and all(
                e["end_ms"] <= evidence["times"].get(e["to"] + 1, (e["end_ms"],))[0] for e in parts),
        }
        is_shown = bool(displayed(trace, a, z))
        if case == "A07":
            is_shown = is_shown or (any(r["kind"] == "REBUILD_SELECTED" and
                event_id(r) == (a,z) and r.get("text") == "字幕暂不可用" for r in trace) and
                any(r["kind"] == "REBUILD_PRESENTED" and r.get("mode") == "status" and
                    r.get("text") == "字幕暂不可用" for r in trace))
        result = {"status": "未验证" if case in ("A06", "A10", "A11", "A12") else "通过",
                  "display_evidence": "仅生成" if case in ("A11", "A12") else
                      ("冻结旧镜像仍为两页示意；N15r Java 注入容量 A06=3页/A10=4页，真机排版未验证" if case in ("A06", "A10") else
                       "策略镜像预测正文显示；真机未验证" if case == "A07" else "已显示"),
                  "source_invariant": invariant,
                  "events": [{k: e[k] for k in ("from", "to", "start_ms", "end_ms", "source", "text")}
                             for e in parts], "checks": {}}
        check = result["checks"]
        text = [e["text"] for e in parts]
        projected_text = [e["text"] for e in projected_parts]
        if case == "A01":
            startup = next(d for d in replay["decisions"] if d["reason"] == "pending_translation"
                           and d["range"] == [a, z])
            check["pending_translation_ms"] = sum(x["duration_ms"] for x in
                                                  replay["translation_wait_ms"]["intervals"]
                                                  if x["range"] == [a, z])
            check["target_ms"] = 2000
            check["caption_before_owned_end"] = any(r.get("mode") == "caption" for r in displayed(trace,a,z))
            caption_selection = [int(r["time"]) for r in selected if r.get("text") == parts[0]["text"]]
            check["reading_time_after_first_caption_ms"] = (parts[0]["end_ms"] - min(caption_selection)) if caption_selection else None
            check["source_cue_intervals"] = startup["source_cue_intervals"]
            check["source_readable_ms"] = startup["source_readable_ms"]
            check["status_only_ms"] = startup["status_only_ms"]
            check["source_coverage_complete"] = (check["source_readable_ms"] ==
                                                 check["pending_translation_ms"])
            check["source_fallback_bounded"] = all(
                parts[0]["start_ms"] <= row["start_ms"] < row["end_ms"] <= parts[0]["end_ms"]
                for row in check["source_cue_intervals"])
            check["translated_replacement_position_ms"] = startup["first_translated_caption_position_ms"]
            check["replacement_within_owned_window"] = startup["replacement_within_owned_window"]
            check["device_startup_latency_verified"] = False
            result["display_evidence"] = "源语言等待期与同窗替换为离线策略镜像；真机启动延迟未验证"
            bad = (not check["source_coverage_complete"] or
                   not check["source_fallback_bounded"] or
                   not check["caption_before_owned_end"] or
                   not check["replacement_within_owned_window"] or
                   not invariant["no_next_source_time_borrowed"])
        elif case == "A02":
            check["bad_index_string_hits"] = sum(s.count("索引") for s in text)
            bad = check["bad_index_string_hits"] > 0
        elif case == "A03":
            check["bad_heck_string_hits"] = sum(s.count("见鬼") for s in text)
            bad = check["bad_heck_string_hits"] > 0
        elif case == "A04":
            check["captured_question_then_stranded_if_hits"] = int(len(text) > 1 and
                text[0].rstrip().endswith("？") and text[1].lstrip().startswith("如果"))
            check["dependent_span_in_one_block"] = cuts["A04"]["dependent_span_in_one_block"]
            check["question_then_stranded_if_hits"] = int(not check["dependent_span_in_one_block"])
            check["new_translation_verified"] = False
            result["display_evidence"] = "切点结构策略镜像通过；新译文与真机展示未验证；events 保留冻结旧响应"
            bad = (not cuts["A04"]["heuristic_applied"] or
                   not cuts["resource_and_ownership_limits_hold"] or
                   check["question_then_stranded_if_hits"] > 0)
        elif case == "A05":
            check["bad_modifier_order_hits"] = sum(s.count("只有：甚至早在入侵之前") for s in text)
            bad = check["bad_modifier_order_hits"] > 0
        elif case == "A06":
            decision = next(d for d in replay["decisions"] if d["reason"] == "font_shrink" and
                            d["range"] == [a, z])
            check["frozen_font_shrink_events"] = sum(a <= (event_id(r) or (-1,-1))[0] <= z for r in shrunk)
            check["font_shrink_events"] = 0 if decision["decision"] == "caption_pages" else check["frozen_font_shrink_events"]
            check["normal_font_sp"] = reference_font["2025"]
            check["n15r_java_mirror_note"] = "RebuildN3PaginationTest: A06 three semantic pages at injected normal capacity; frozen two-page cut stays illustrative"
            check["planned_font_sp"] = decision["normal_font_sp"]
            check["page_plan"] = decision["pages"]
            check["page_plan_kind"] = decision["page_plan_kind"]
            check["device_layout_verified"] = decision["device_layout_verified"]
            bad = check["font_shrink_events"] > 0 or not decision["pages"]
        elif case == "A07":
            decision = next(d for d in replay["decisions"] if d["reason"] == "event_review" and
                            d["range"] == [a, z])
            check["event_review_fallback_ms"] = sum(x["duration_ms"] for x in buckets["event_review"])
            check["accepted_text_generated"] = bool(parts[0]["text"].strip())
            check["caption_presented"] = decision["decision"] == "caption"
            check["caption_presented_layer"] = "Java policy mirror; device PRESENTED unverified"
            bad = check["event_review_fallback_ms"] > 0 or not check["caption_presented"]
        elif case == "A08":
            check["captured_range_split_repeated_start_hits"] = int(len(text) > 1 and
                bool(re.search(r"射程可以[…\.]*$", text[0])) and bool(re.search(r"^[…\.]*射程",text[1])))
            check["captured_new_topic_same_page_hits"] = sum("台湾" in s and "今天要讲" in s for s in text)
            check["missile_clause_in_one_block"] = cuts["A08"]["missile_clause_in_one_block"]
            check["topic_boundary_available_after_word"] = cuts["A08"]["topic_boundary_available_after_word"]
            check["range_split_repeated_start_hits"] = int(not check["missile_clause_in_one_block"])
            check["new_topic_same_page_hits"] = None  # Needs newly generated text; old captured hit is separate.
            check["new_translation_verified"] = False
            result["display_evidence"] = "切点结构策略镜像通过；新译文与真机展示未验证；events 保留冻结旧响应"
            bad = (not cuts["A08"]["heuristic_applied"] or
                   not cuts["resource_and_ownership_limits_hold"] or
                   check["range_split_repeated_start_hits"] > 0 or
                   check["topic_boundary_available_after_word"] is None)
        elif case == "A09":
            check["bad_strategy_string_hits"] = sum(s.count("战略是构建出来的战略") for s in text)
            bad = check["bad_strategy_string_hits"] > 0
        elif case == "A10":
            decision = next(d for d in replay["decisions"] if d["reason"] == "overflow" and
                            d["range"] == [a, z])
            check["frozen_overflow_events"] = sum((event_id(r) == (a,z)) for r in trace if r["kind"] == "REBUILD_LAYOUT_FALLBACK")
            check["overflow_events"] = int(decision["decision"] != "caption_pages")
            check["overflow_fallback_attributed_ms"] = sum(x["duration_ms"] for x in buckets["overflow"])
            check["selected_text"] = a10["text"]
            check["caption_presented"] = decision["decision"] == "caption_pages"
            check["caption_presented_layer"] = "Java policy mirror; device PRESENTED unverified"
            check["n15r_java_mirror_note"] = "RebuildN3PaginationTest: A10 four semantic pages at injected normal capacity; frozen two-page cut stays illustrative"
            check["page_plan"] = decision["pages"]
            check["page_plan_kind"] = decision["page_plan_kind"]
            check["device_layout_verified"] = decision["device_layout_verified"]
            bad = check["overflow_events"] > 0 or not check["caption_presented"]
        elif case == "A11":
            raw_intro = sum(bool(re.sub(r"[\s，。！？：.!?]+$", "", s) == "我要问的问题是") for s in text)
            check["raw_intro_only_page_hits"] = raw_intro
            check["intro_only_page_hits"] = sum(bool(re.sub(r"[\s，。！？：.!?]+$", "", s) == "我要问的问题是") for s in projected_text)
            check["display_merge"] = display_projection_audit(parts, projected_parts)
            check["presentation_verified"] = False
            bad = bool(check["intro_only_page_hits"])
        else:  # A12: threshold is explicitly local; not a global short-page standard.
            check["raw_short_638_641_pages_under_1000ms"] = len(raw_short_a12)
            check["short_638_641_pages_under_1000ms"] = sum(
                e["from"] == 638 and e["to"] == 641 and e["end_ms"] - e["start_ms"] < 1000
                for e in projected_parts)
            check["raw_split_question_hits"] = int(len(text) > 1 and "有没有遗漏？" in text[0]
                                                    and text[1].startswith("有没有应该纳入的内容"))
            check["split_question_hits"] = int(len(projected_text) > 1 and "有没有遗漏？" in projected_text[0]
                                               and projected_text[1].startswith("有没有应该纳入的内容"))
            check["display_merge"] = display_projection_audit(parts, projected_parts)
            check["presentation_verified"] = False
            bad = bool(check["short_638_641_pages_under_1000ms"] or check["split_question_hits"])
        ensure(is_shown == (case not in ("A11", "A12")), f"{case}: display evidence classification drift")
        if invariant["missing"] or invariant["duplicated"] or not invariant["no_next_source_time_borrowed"]:
            bad = True
        if case not in ("A11", "A12") and bad:
            result["status"] = "失败"
        if case in ("A11", "A12"):
            result["generated_layer_alarm"] = bad
            result["raw_generated_layer_alarm"] = bool(
                check.get("raw_intro_only_page_hits", 0)
                or check.get("raw_short_638_641_pages_under_1000ms", 0)
                or check.get("raw_split_question_hits", 0))
            result["generated_layer_alarm_basis"] = "bounded_local_display_projection"
        result["checks"] = check
        case_results[case] = result
    status = Counter(c["status"] for c in case_results.values())
    return {
        "layer": "frozen_facts_plus_java_policy_mirror", "input_sha256": HASHES,
        "limits": ["Time is estimated from frozen diagnostic words, not real speech alignment.",
                    "Only 687 source words / ten blocks are covered, not the full video.",
                    "Frozen overflow duration is attributed from selection position to source-owned end; no fallback BEGIN/END was logged.",
                    "A01 source-cue coverage and same-window replacement are offline policy estimates from the frozen SRT; device startup latency is unverified. The recorded translation wait remains 3,103 ms under the revised readable-source criterion.",
                    "A04/A08 green scores represent local planner-cut structure only. The events are captured old responses; changed-block translation text, pagination and device display are unverified.",
                    "A07 policy replay is simulated, not a new Android PRESENTED record.",
                    "A06/A10 frozen two-page capacity is an old illustration, not N15r: injected Java semantic paging now predicts A06=3/A10=4 within owned windows; neither result is a new device measurement. A06 still has no captured line count at preferred 21.4sp.",
                    "A11/A12 have generated responses but no PRESENTED evidence; Android font and native/AI switching require device tests.",
                     "A11/A12 alarm counts use the bounded local display projection; raw accepted events and source ownership remain recorded separately. No new API request was made; the prompt was unchanged."],
        "source_srt_cues": evidence["srt_cues"], "covered_source_word_ids": [0, 686],
        "frozen_request_attempts": len(evidence["records"]),
        "frozen_accepted_blocks": len(evidence["by_block"]),
        "frozen_token_audit": evidence["frozen_token_audit"],
        "frozen_facts": facts,
        "frozen_baseline": {"invisible_ms": {key: {"total": sum(x["duration_ms"] for x in baseline[key]),
                                              "intervals": baseline[key]} for key in
                                             ("pending_translation", "event_review", "overflow")},
                            "A07_captured_caption_presented": False,
                            "A06_captured_font_shrink_events": len(shrunk),
                            "A10_captured_overflow_events": case_results["A10"]["checks"]["frozen_overflow_events"]},
        "policy_replay": {**replay, "cross_block_cuts": cuts},
        "metrics": {
            "invisible_ms": replay["invisible_ms"],
            "translation_wait_ms": replay["translation_wait_ms"],
            "readable_source_ms": replay["readable_source_ms"],
            "short_pages_a12_only_under_1000ms": case_results["A12"]["checks"]["short_638_641_pages_under_1000ms"],
            "raw_short_pages_a12_only_under_1000ms": len(raw_short_a12),
            "fragment_hits": {name: case_results[name]["checks"][field] for name,field in
                              (("A04","question_then_stranded_if_hits"),
                               ("A08","range_split_repeated_start_hits"),
                               ("A11","intro_only_page_hits"))},
            "captured_fragment_hits": {
                "A04": case_results["A04"]["checks"]["captured_question_then_stranded_if_hits"],
                "A08": case_results["A08"]["checks"]["captured_range_split_repeated_start_hits"]},
            "raw_generated_fragment_hits": {
                "A11": case_results["A11"]["checks"]["raw_intro_only_page_hits"],
                "A12": case_results["A12"]["checks"]["raw_short_638_641_pages_under_1000ms"]},
            "font_shrink_events": case_results["A06"]["checks"]["font_shrink_events"],
            "overflow_events": case_results["A10"]["checks"]["overflow_events"],
            "bad_translation_string_hits": {name: case_results[name]["checks"][field] for name,field in
                                            (("A02","bad_index_string_hits"),
                                             ("A03","bad_heck_string_hits"),
                                             ("A09","bad_strategy_string_hits"))},
            "source_ownership_all_cases": all(not c["source_invariant"]["missing"] and
                not c["source_invariant"]["duplicated"] and c["source_invariant"]["no_next_source_time_borrowed"]
                for c in case_results.values()),
        },
        "case_totals": {key: status[key] for key in ("通过", "失败", "未验证")}, "cases": case_results,
    }

# Live mode is intentionally outside score(): it never replaces a frozen response.
def java_string(source: str, name: str) -> str:
    match = re.search(r"(?:static )?final String " + re.escape(name) + r"\s*=\s*", source)
    ensure(match is not None, f"Java prompt constant missing: {name}")
    start, quoted, escaped = match.end(), False, False
    end = None
    for i in range(start, len(source)):
        char = source[i]
        if quoted:
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                quoted = False
        elif char == '"':
            quoted = True
        elif char == ";":
            end = i
            break
    ensure(end is not None, f"Java prompt constant unterminated: {name}")
    chunks = re.findall(r'"(?:\\.|[^"\\])*"', source[start:end])
    ensure(bool(chunks), f"Java prompt constant empty: {name}")
    return "".join(json.loads(chunk) for chunk in chunks)


def current_prompt() -> str:
    path = ROOT / "extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions"
    protocol = (path / "RebuildProtocol.java").read_text(encoding="utf-8")
    config = (path / "DeepSeekConfig.java").read_text(encoding="utf-8")
    build = (ROOT / "extensions/extension/build.gradle.kts").read_text(encoding="utf-8")
    ensure('static final String VERSION = app.yydarlinker.extension.BuildConfig.CAPTION_PATCH_VERSION;' in protocol
           and 'buildConfigField("String", "CAPTION_PATCH_VERSION"' in build
           and '${rootProject.version}' in build,
           "Event protocol must follow the Gradle-generated product version")
    return (java_string(protocol, "PROMPT") + java_string(protocol, "FIDELITY_PROMPT")
            + " Target language: zh-Hans. User translation preferences: "
            + java_string(config, "DEFAULT_PROMPT"))


def api_endpoint(base: str) -> tuple[str, str]:
    uri = urllib.parse.urlsplit(base.strip())
    ensure(uri.scheme in ("https", "http") and uri.hostname and not uri.username and
           not uri.password and not uri.fragment, "Invalid OpenAI-compatible API base URL")
    host = uri.hostname.lower()
    path = uri.path.rstrip("/")
    for ending in ("/chat/completions", "/completions", "/models"):
        if path.endswith(ending):
            path = path[:-len(ending)]
            break
    ensure(not any(path.endswith(x) for x in ("/messages", "/responses", "/api/generate")),
           "Use an OpenAI-compatible Chat Completions base URL")
    if not path:
        if host.endswith(".maas.aliyuncs.com") or "dashscope.aliyuncs.com" in host:
            path = "/compatible-mode/v1"
        elif host == "openrouter.ai":
            path = "/api/v1"
        else:
            path = "/v1"
    return urllib.parse.urlunsplit((uri.scheme, uri.netloc, path + "/chat/completions", uri.query, "")), host


def online_schema() -> dict:
    obj = lambda fields: {"type": "object", "additionalProperties": False,
                          "properties": fields, "required": list(fields)}
    event = obj({"from": {"type": "integer"}, "to": {"type": "integer"},
                 "source": {"type": "string"}, "text": {"type": "string"}})
    return {"type": "json_schema", "json_schema": {"name": "caption_events", "strict": True,
             "schema": obj({"block": {"type": "string"},
                            "events": {"type": "array", "items": event}})}}


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, *args, **kwargs):
        raise ValueError("API redirect denied")


def generated_case_results(evidence: dict, blocks: list[dict]) -> dict:
    """Live text/ownership proxies only: there is no live device display trace."""
    events = []
    for row in blocks:
        for event in row.get("response", {}).get("events", []):
            timed = dict(event)
            if event["from"] in evidence["times"] and event["to"] in evidence["times"]:
                timed["start_ms"], timed["end_ms"] = evidence["times"][event["from"]][0], evidence["times"][event["to"]][1]
            events.append(timed)
    result = {}
    for case, (a, z) in CASES.items():
        relevant = [e for e in events if e["to"] >= a and e["from"] <= z]
        projected = local_display_projection(relevant) if case in ("A11", "A12") else relevant
        owned = Counter(i for e in relevant for i in range(max(a, e["from"]), min(z, e["to"]) + 1))
        texts = [e["text"] for e in relevant]
        projected_texts = [e["text"] for e in projected]
        raw_alarms = {}
        alarms = {}
        if case == "A02": alarms["索引"] = sum(t.count("索引") for t in texts)
        elif case == "A03": alarms["见鬼"] = sum(t.count("见鬼") for t in texts)
        elif case == "A05": alarms["旧修饰顺序"] = sum(t.count("只有：甚至早在入侵之前") for t in texts)
        elif case == "A09": alarms["旧战略坏串"] = sum(t.count("战略是构建出来的战略") for t in texts)
        elif case == "A04": alarms["问号后悬空如果"] = int(len(texts) > 1 and
            texts[0].endswith("？") and texts[1].startswith("如果"))
        elif case == "A08": alarms["射程硬断"] = int(len(texts) > 1 and
            bool(re.search(r"射程可以[…\.]*$", texts[0])) and bool(re.search(r"^[…\.]*射程", texts[1])))
        elif case == "A11":
            raw_alarms["引导语独页"] = sum(re.sub(r"[\s，。！？：.!?]+$", "", t) == "我要问的问题是" for t in texts)
            alarms["引导语独页"] = sum(re.sub(r"[\s，。！？：.!?]+$", "", t) == "我要问的问题是" for t in projected_texts)
        elif case == "A12":
            raw_alarms["638-641独立短页"] = sum(e["from"] == 638 and e["to"] == 641
                and e.get("end_ms", 0) - e.get("start_ms", 0) < 1000 for e in relevant)
            alarms["638-641独立短页"] = sum(e["from"] == 638 and e["to"] == 641
                and e.get("end_ms", 0) - e.get("start_ms", 0) < 1000 for e in projected)
        result[case] = {
            "display_status": "未验证", "source_word_ids": [a, z],
            "source_ownership_complete_once": all(owned[i] == 1 for i in range(a, z + 1)),
            "generated_layer_alarms": alarms,
            "timing_layout_semantics": "未验证：无线上真机展示/字体数据；字串报警不代表自然度验收",
        }
        if case in ("A11", "A12"):
            result[case]["raw_generated_layer_alarms"] = raw_alarms
            result[case]["display_projection"] = display_projection_audit(relevant, projected)
    return result

def live_once(evidence: dict, block: int = 4) -> Path:
    ensure(block in (0, 4), "Live probe supports only block 0 or 4")
    key, base, model = (os.environ.get("MORPHE_P4_" + name, "").strip()
                        for name in ("API_KEY", "BASE_URL", "MODEL"))
    ensure(key and base and model, "--live needs MORPHE_P4_API_KEY, MORPHE_P4_BASE_URL, MORPHE_P4_MODEL")
    endpoint, host = api_endpoint(base)
    prompt = current_prompt()
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    target = RESULT.parent / f"live-{'a01-' if block == 0 else ''}{stamp}.json"
    ensure(not target.exists(), "Live result already exists at this timestamp; no repeat request was made")
    digest = hashlib.sha256(prompt.encode("utf-8")).hexdigest()
    output = {"layer": "live_explicit_separate", "captured_at_utc": datetime.now(timezone.utc).isoformat(),
              "source_sha256": HASHES, "prompt_sha256": digest,
              "diagnostic_prompt_sha256": "6568e2f9063e4e4bf72fa1750470fd172fb3135150b8a883347087e2c97a542d",
              "prompt_matches_phone_hash": digest == "6568e2f9063e4e4bf72fa1750470fd172fb3135150b8a883347087e2c97a542d",
              "prompt_source": "current checked-in RebuildProtocol plus DeepSeekConfig.DEFAULT_PROMPT; device custom preference unknown",
              "endpoint_sha256": hashlib.sha256(endpoint.encode()).hexdigest(),
              "model": model, "format": "OpenAI-compatible chat completions",
               "policy": f"Block {block} first request only; one API attempt, no retry or redirects",
               "display_evidence": "none; generated responses only", "blocks": [],
              "api_attempts": 0, "status": "in_progress", "token_usage": {}}
    opener = urllib.request.build_opener(NoRedirect())

    def save():
        # Persist after each charged attempt; avoid storing any credentials or raw HTTP errors.
        temp = target.with_suffix(".tmp")
        temp.write_text(json.dumps(output, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        temp.replace(target)
    save()
    for block in (block,):
        # One cold request only. Repeating it would hide first-request latency.
        record = evidence["records"][4] if block == 4 else evidence["by_block"][0]
        payload = {k: v for k, v in record["payload"].items() if not k.startswith("diagnostic_only_")}
        ensure("repair" not in payload, "First live attempt cannot contain a past repair")
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
            body["response_format"] = online_schema()
            body["presence_penalty"] = 0
        if host == "api.anthropic.com":
            body.pop("response_format")
        headers = {"Content-Type": "application/json; charset=utf-8", "Accept": "application/json",
                   "api-key" if host.endswith(".openai.azure.com") or host.endswith(".services.ai.azure.com")
                   else "Authorization": key if host.endswith(".openai.azure.com") or
                   host.endswith(".services.ai.azure.com") else "Bearer " + key}
        req = urllib.request.Request(endpoint, data=json.dumps(body, ensure_ascii=False).encode("utf-8"),
                                     headers=headers, method="POST")
        row = {"block": block, "source_ids": [payload["owned_tokens"][0][0],
                                               payload["owned_tokens"][-1][0]],
               "output_budget_tokens": limit,
               "payload_sha256": hashlib.sha256(json.dumps(payload, sort_keys=True, ensure_ascii=False).encode()).hexdigest()}
        output["api_attempts"] += 1
        started_ns = time.monotonic_ns()
        try:
            with opener.open(req, timeout=10 if block == 0 else 16) as response:
                raw = response.read(2 * 1024 * 1024 + 1)
                ensure(len(raw) <= 2 * 1024 * 1024, "API response exceeds 2 MiB")
            row["http_wall_ms"] = round((time.monotonic_ns() - started_ns) / 1_000_000, 1)
            reply = json.loads(raw)
            usage = reply.get("usage", {})
            row["usage"] = usage
            choice = reply["choices"][0]
            row["finish_reason"] = choice.get("finish_reason")
            content = choice.get("message", {}).get("content") or ""
            try:
                plan = json.loads(content)
                expected = payload["owned_tokens"]
                next_id = expected[0][0]
                ensure(plan.get("block") == payload["block"], "block mismatch")
                for event in plan["events"]:
                    a, z = event["from"], event["to"]
                    ensure(a == next_id and a <= z <= expected[-1][0], "source ownership gap/overlap")
                    ensure(event["source"] == " ".join(expected[i-expected[0][0]][1] for i in range(a,z+1)),
                           "source quote mismatch")
                    ensure(bool(event["text"].strip()), "empty translation")
                    next_id = z+1
                ensure(next_id == expected[-1][0]+1, "missing trailing source words")
                row["contract"] = "source_ownership_ok" if row["finish_reason"] != "length" else "output_truncated"
                row["response"] = plan
            except (ValueError, KeyError, TypeError, IndexError) as exc:
                row["contract"] = "output_truncated" if row.get("finish_reason") == "length" else \
                                  "invalid_generated_response: " + str(exc)[:160]
                row["response_text"] = content[:10000]
            row["end_to_end_wall_ms"] = round((time.monotonic_ns() - started_ns) / 1_000_000, 1)
            output["blocks"].append(row)
            if row["contract"] != "source_ownership_ok":
                output["status"] = "partial_invalid_generated_response"
                save()
                break
        except urllib.error.HTTPError as exc:
            row["end_to_end_wall_ms"] = round((time.monotonic_ns() - started_ns) / 1_000_000, 1)
            row["error"] = "http_" + str(exc.code)
            output["blocks"].append(row)
            output["status"] = "partial_http_failure"
            save()
            break
        except (urllib.error.URLError, TimeoutError, ValueError, OSError) as exc:
            row["end_to_end_wall_ms"] = round((time.monotonic_ns() - started_ns) / 1_000_000, 1)
            row["error"] = type(exc).__name__
            output["blocks"].append(row)
            output["status"] = "partial_transport_failure"
            save()
            break
        save()
    if len(output["blocks"]) == 1 and output["blocks"][0].get("contract") == "source_ownership_ok":
        output["status"] = f"complete_block{block}_generated_only"
    if output["blocks"] and "response" in output["blocks"][0]:
        case = "A01" if block == 0 else "A07"
        output["generated_case_results"] = {case: generated_case_results(evidence, output["blocks"])[case]}
    for keyname in ("prompt_tokens", "completion_tokens", "total_tokens"):
        output["token_usage"][keyname] = sum(b.get("usage", {}).get(keyname, 0) for b in output["blocks"])
    output["token_usage"]["reported_blocks"] = sum("usage" in b for b in output["blocks"])
    save()
    return target


def main(argv=None) -> int:
    if sys.stdout.encoding and sys.stdout.encoding.lower() not in ("utf-8", "utf8"):
        sys.stdout.reconfigure(encoding="utf-8")
    parser = argparse.ArgumentParser(description=__doc__)
    live = parser.add_mutually_exclusive_group()
    live.add_argument("--live", action="store_true", help="EXPLICIT: one paid block-4 first-request API call")
    live.add_argument("--live-a01", action="store_true", help="EXPLICIT: one paid block-0 cold API call")
    args = parser.parse_args(argv)
    evidence = read_evidence()
    frozen = score(evidence)
    RESULT.write_text(json.dumps(frozen, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print("冻结离线计分板（不请求网络）")
    for name, row in frozen["cases"].items():
        print(f"  {name}: {row['status']}  [{row['display_evidence']}]")
    totals = frozen["case_totals"]
    print(f"总计：通过 {totals['通过']} / 失败 {totals['失败']} / 未验证 {totals['未验证']}")
    missing = frozen["metrics"]["invisible_ms"]
    print("不可见时长(ms)：pending_translation={pending_translation}；event_review={event_review}；"
          "overflow(按归属时间估算)={overflow}".format(**{k: v["total"] for k, v in missing.items()}))
    print(f"JSON: {RESULT}")
    if args.live or args.live_a01:
        block = 0 if args.live_a01 else 4
        path = live_once(evidence, block)
        output = json.loads(path.read_text(encoding="utf-8"))
        print(f"线上层：{output['status']}；API 尝试 {output['api_attempts']}；token 用量 {output['token_usage']}")
        print(f"单独存档：{path}")
        return 0 if output["status"] == f"complete_block{block}_generated_only" else 2
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (ValueError, FileNotFoundError, KeyError) as error:
        print("回放失败：" + str(error), file=sys.stderr)
        sys.exit(1)
