"""Summarize two zero-API N15r layout exports without altering historical results."""
import json
import statistics
import sys
from pathlib import Path


def percentile(values, p):
    ordered = sorted(values)
    return ordered[round((len(ordered) - 1) * p)]


def summary(path):
    data = json.loads(Path(path).read_text(encoding="utf-8"))
    events = data["events"]
    pages = [page for event in events for page in event["pages"]]
    lengths = [len(page["text"]) for page in pages]
    durations = [(page["end"] - page["start"]) / 1000 for page in pages]
    cps = [length / duration for length, duration in zip(lengths, durations)]
    return {
        "font_px": data["preferred_font_px"],
        "width_px": data["viewport_width_px"],
        "events": len(events),
        "pages": len(pages),
        "fallback_events": sum(bool(event["fallback"]) for event in events),
        "one_line_percent": round(100 * sum(page["lines"] == 1 for page in pages) / len(pages), 1),
        "12_to_18_percent": round(100 * sum(12 <= n <= 18 for n in lengths) / len(pages), 1),
        "length_median": statistics.median(lengths),
        "length_p90": percentile(lengths, .9),
        "duration_median_s": round(statistics.median(durations), 3),
        "duration_p90_s": round(percentile(durations, .9), 3),
        "cps_median": round(statistics.median(cps), 2),
        "cps_p90": round(percentile(cps, .9), 2),
        "page_counts": {f"{e['from']}-{e['to']}": len(e["pages"]) for e in events},
    }


def main(before_path, after_path, output_path):
    before, after = summary(before_path), summary(after_path)
    assert before["events"] == after["events"] == 540
    counts_before = before.pop("page_counts")
    counts_after = after.pop("page_counts")
    assert counts_before.keys() == counts_after.keys()
    changed = sum(counts_before[key] != counts_after[key] for key in counts_before)
    result = {
        "source": "N15r captured-events.json; N17a pagination code; Robolectric SDK28 StaticLayout",
        "before": before,
        "after": after,
        "events_with_changed_page_count": changed,
        "note": "Same 1121px proxy viewport and 12–18 soft band; only measured font changed. Zero API calls.",
    }
    Path(output_path).write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main(*sys.argv[1:])
