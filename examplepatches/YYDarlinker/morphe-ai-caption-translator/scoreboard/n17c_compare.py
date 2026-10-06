"""Compare two glyph-calibrated, zero-API N15r StaticLayout replay exports.

Page lengths count Unicode code points, including punctuation, as RebuildPageLayout
does. The eight-CJK-cell minimum uses the runtime-exported half-cell counts.
Historical N15r/N17b exports and the frozen scoreboard are never modified.
"""
import hashlib
import json
import statistics
import sys
from collections import Counter
from pathlib import Path


# These are the existing N15r/N17a rules, verified against each runtime export.
EXPECTED_HARD_CONSTRAINTS = {
    "max_lines": 2,
    "minimum_page_ms": 1200,
    "max_cps": 8,
    "minimum_display_half_cells": 16,
}


def percentile(values, p):
    ordered = sorted(values)
    return ordered[round((len(ordered) - 1) * p)]


def percent(count, total):
    return round(100 * count / total, 1) if total else 0.0


def distribution(counts, total):
    return {key: {"pages": count, "percent": percent(count, total)}
            for key, count in counts.items()}


def event_key(event):
    return f"{event['block']}:{event['from']}-{event['to']}"


def hard_violations(events, constraints):
    """Mirror the existing Java replay assertions without relaxing any threshold."""
    violations = []
    minimum = constraints["minimum_page_ms"]
    minimum_cells = constraints["minimum_display_half_cells"]

    def add(event, reason, page=None):
        row = {"event": event_key(event), "reason": reason}
        if page is not None:
            row["page"] = page
        violations.append(row)

    for event in events:
        pages = event["pages"]
        if bool(event["fallback"]) != (not pages):
            add(event, "fallback_consistency")
        if not pages:
            continue
        event_duration = event["end"] - event["start"]
        forced_short = event_duration < minimum and len(pages) == 1
        if len(pages) * minimum > event_duration and not forced_short:
            add(event, "event_page_count_cap")
        at = event["start"]
        joined = []
        for index, page in enumerate(pages, 1):
            duration = page["end"] - page["start"]
            length = len(page["text"])
            if page["code_points"] != length:
                add(event, "code_point_count", index)
            if not 1 <= page["lines"] <= constraints["max_lines"]:
                add(event, "line_limit", index)
            if duration <= 0:
                add(event, "positive_duration", index)
            if duration < minimum and not forced_short:
                add(event, "minimum_page_duration", index)
            if length * 1000 > constraints["max_cps"] * duration:
                add(event, "maximum_cps", index)
            if (event["display_half_cells"] >= minimum_cells
                    and page["display_half_cells"] < minimum_cells):
                add(event, "minimum_display_cells", index)
            if page["start"] != at:
                add(event, "contiguous_page_times", index)
            if page["start"] < event["start"] or page["end"] > event["end"]:
                add(event, "event_window", index)
            at = page["end"]
            joined.append(page["text"])
        if at != event["end"]:
            add(event, "complete_event_time")
        if "".join(joined) != event["text"]:
            add(event, "exact_text_coverage")
    return violations


def load_export(path):
    raw = Path(path).read_bytes()
    data = json.loads(raw.decode("utf-8"))
    if data["hard_constraints"] != EXPECTED_HARD_CONSTRAINTS:
        raise ValueError("Replay constraints differ from the existing N15r/N17a rules")
    if data["api_calls"] != 0 or data["api_tokens"] != 0:
        raise ValueError("N17c replay must use zero API calls and tokens")
    if data["font_input_unit"] != "glyph_height_px":
        raise ValueError("N17c comparison requires glyph targets, not historical em proxies")
    events = {event_key(event): event for event in data["events"]}
    if len(events) != len(data["events"]):
        raise ValueError("Duplicate captured-event identities in replay")
    if data["event_count"] != len(events) or len(events) != 540:
        raise ValueError("Expected the same 540 captured accepted Chinese events")
    return data, events, hashlib.sha256(raw).hexdigest()


def summary(data, layout_sha256):
    events = data["events"]
    pages = [page for event in events for page in event["pages"]]
    if not pages:
        raise ValueError("Replay contains no presented translated pages")
    lengths = [len(page["text"]) for page in pages]
    durations = [(page["end"] - page["start"]) / 1000 for page in pages]
    if any(duration <= 0 for duration in durations):
        raise ValueError("Replay contains non-positive page durations")
    cps = [length / duration for length, duration in zip(lengths, durations)]
    violations = hard_violations(events, data["hard_constraints"])
    length_hits = sum(12 <= length <= 18 for length in lengths)
    duration_hits = sum(2 <= duration <= 3.5 for duration in durations)
    return {
        "layout_sha256": layout_sha256,
        "width_px": data["viewport_width_px"],
        "glyph_height_target_px": data["glyph_height_target_px"],
        "glyph_height_measured_px": data["glyph_height_measured_px"],
        "text_size_em_px": data["text_size_em_px"],
        "font_metrics_height_px": data["font_metrics_height_px"],
        "font_metrics_top_bottom_px": data["font_metrics_top_bottom_px"],
        "events": len(events),
        "pages": len(pages),
        "fallback_events": sum(bool(event["fallback"]) for event in events),
        "documented_original_fallback_word_ids": data["documented_original_fallback_word_ids"],
        "accepted_chinese_word_ids": data["accepted_chinese_word_ids"],
        "one_line_percent": percent(sum(page["lines"] == 1 for page in pages), len(pages)),
        "12_to_18_percent": percent(length_hits, len(pages)),
        "2_to_3_5_s_percent": percent(duration_hits, len(pages)),
        "both_soft_bands_percent": percent(sum(12 <= length <= 18 and 2 <= duration <= 3.5
                                               for length, duration in zip(lengths, durations)), len(pages)),
        "length_median": statistics.median(lengths),
        "length_p10": percentile(lengths, .1),
        "length_p90": percentile(lengths, .9),
        "length_min": min(lengths),
        "length_max": max(lengths),
        "duration_median_s": round(statistics.median(durations), 3),
        "duration_p10_s": round(percentile(durations, .1), 3),
        "duration_p90_s": round(percentile(durations, .9), 3),
        "duration_min_s": min(durations),
        "duration_max_s": max(durations),
        "cps_median": round(statistics.median(cps), 2),
        "cps_p90": round(percentile(cps, .9), 2),
        "length_distribution": distribution({
            "below_12": sum(length < 12 for length in lengths),
            "12_to_18": length_hits,
            "above_18": sum(length > 18 for length in lengths),
        }, len(pages)),
        "duration_distribution": distribution({
            "below_2_s": sum(duration < 2 for duration in durations),
            "2_to_3_5_s": duration_hits,
            "above_3_5_s": sum(duration > 3.5 for duration in durations),
        }, len(pages)),
        "hard_constraint_violations": len(violations),
        "hard_violation_counts_by_reason": dict(sorted(Counter(row["reason"] for row in violations).items())),
        "hard_violation_details": violations,
    }


def compare(portrait_path, landscape_path, output_path):
    portrait_data, portrait_events, portrait_sha = load_export(portrait_path)
    landscape_data, landscape_events, landscape_sha = load_export(landscape_path)
    for data, width, glyph in ((portrait_data, 1163, 25.6), (landscape_data, 2042, 55.5)):
        if (data["viewport_width_px"] != width
                or abs(data["glyph_height_target_px"] - glyph) > .001):
            raise ValueError(f"Expected N17c representative layout box {width}px / glyph {glyph}px")
    for field in ("corpus_sha256", "prompt_sha256", "hard_constraints"):
        if portrait_data[field] != landscape_data[field]:
            raise ValueError(f"Replay inputs differ: {field}")
    if portrait_events.keys() != landscape_events.keys():
        raise ValueError("Replay accepted-event identities differ")
    changed = []
    for key, before in portrait_events.items():
        after = landscape_events[key]
        for field in ("text", "start", "end", "display_half_cells"):
            if before[field] != after[field]:
                raise ValueError(f"Replay event {key} differs: {field}")
        if len(before["pages"]) != len(after["pages"]):
            changed.append({"event": key, "portrait_pages": len(before["pages"]),
                            "landscape_pages": len(after["pages"])})
    portrait = summary(portrait_data, portrait_sha)
    landscape = summary(landscape_data, landscape_sha)
    result = {
        "source": "N15r captured-events.json; unchanged N17a pagination; Robolectric SDK28 StaticLayout",
        "corpus_sha256": portrait_data["corpus_sha256"],
        "prompt_sha256": portrait_data["prompt_sha256"],
        "hard_constraints": portrait_data["hard_constraints"],
        "portrait": portrait,
        "landscape": landscape,
        "page_count_delta_landscape_minus_portrait": landscape["pages"] - portrait["pages"],
        "events_with_changed_page_count": len(changed),
        "changed_page_counts": changed,
        "api_calls": 0,
        "api_tokens": 0,
        "note": "Viewport widths are caption layout boxes (1163/2042px), not screen widths. "
                "Glyph targets (25.6/55.5px) use the runtime font solver; em and FontMetrics "
                "height are separate measurements. This SDK28 desktop proxy is not phone glyph verification. "
                "Page lengths include punctuation; soft bands stay 12–18 code points and 2–3.5s. "
                "The 108 documented original fallback word IDs belong to the captured failed block, "
                "outside the 540 accepted-event layout-fallback count. Historical results are preserved.",
    }
    Path(output_path).write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return result


if __name__ == "__main__":
    if len(sys.argv) != 4:
        raise SystemExit("Usage: python scoreboard/n17c_compare.py PORTRAIT_JSON LANDSCAPE_JSON OUTPUT_JSON")
    compare(*sys.argv[1:])
