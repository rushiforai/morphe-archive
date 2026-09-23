"""Summarize capture_live.py artifacts offline; never starts ADB or touches a device.

Usage: python diagnostics/steamlink-hitches/summarize_capture.py CAPTURE_DIRECTORY
Writes device-summary.json and device-events.json in that directory (or --output).
"""
from __future__ import annotations

import argparse
from collections import Counter
import datetime as dt
import json
from pathlib import Path
import re
import statistics


LOG_LINE = re.compile(
    r"^\s*(?P<epoch>\d+\.\d+)\s+(?P<pid>\d+)\s+(?P<tid>\d+)\s+"
    r"(?P<priority>[VDIWEFAS])\s+(?P<tag>.*?)\s*:\s?(?P<message>.*)$"
)
EVENT_PATTERNS = {
    "fec_retry": r"SVLFEC:.*retry.*packets",
    "fec_entire_frame_drop": r"SVLFEC: frame \d+ was entirely dropped",
    "fec_late_metadata": r"\[SVLFEC\] received late metadata",
    "fec_submit_without_metadata": r"\[SVLFEC\] accepting a frame for submission without metadata",
    "fec_unrecoverable": r"SVLFEC Received ExperiencedAnUnrecoverableError",
    "decoder_input_unavailable": r"\[SVLDecoder\] Unable to acquire input buffer",
    "decoder_queue_input_error": r"\[SVLDecoder\] Failed to queue input buffer",
    "decoder_dequeue_output_error": r"\[SVLDecoder\] Dequeue output buffer error",
    "decoder_unrecoverable": r"\[SVLDecoder\] Unrecoverable error was sent",
    "decoder_latest_image_error": r"\[SVLDecoder\] Failed to acquire latest image!",
    "decoder_invalid_metadata_drop": r"\[SVLDecoder\] Invalid frame metadata.*dropping",
    "renderer_no_frame_after_wait": r"\[XRRenderer\] Panic! No frames served even after waiting!",
    "leak_renderer_missing_metadata": r"\[XRRenderer\] Failed to get frame metadata for frame",
    "leak_renderer_invalid_hardware_buffer": r"\[XRRenderer\] No valid hardware buffer recieved from decoder",
    "leak_renderer_client_buffer_error": r"\[XRRenderer\] Failed to get client buffer from decoder",
    "leak_renderer_egl_image_error": r"\[XRRenderer\] Failed to create EGLImageKHR from decoded image hardware buffer",
    "buffer_consumer_null": r"Buffer item consumer returned null buffer",
    "explicit_gc_log": r"Explicit.*GC freed",
}


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8-sig", errors="replace") if path.is_file() else ""


def utc(epoch: float | None) -> str | None:
    return dt.datetime.fromtimestamp(epoch, dt.timezone.utc).isoformat() if epoch is not None else None


def span(values: list[float]) -> dict:
    return {"count": len(values), "first_epoch": values[0] if values else None,
            "last_epoch": values[-1] if values else None,
            "first_utc": utc(values[0]) if values else None,
            "last_utc": utc(values[-1]) if values else None,
            "span_s": round(values[-1] - values[0], 6) if len(values) > 1 else None}


def stats(points: list[tuple[float, float]], unit: str) -> dict:
    if not points:
        return {"sample_count": 0, "unit": unit, "available": False}
    points = sorted(points)
    x0 = points[0][0]
    xs = [x - x0 for x, _ in points]
    ys = [y for _, y in points]
    xm, ym = statistics.mean(xs), statistics.mean(ys)
    denominator = sum((x - xm) ** 2 for x in xs)
    slope = sum((x - xm) * (y - ym) for x, y in zip(xs, ys)) / denominator if denominator else None
    delta = ys[-1] - ys[0]
    return {"available": True, "unit": unit, "sample_count": len(points),
            "first": ys[0], "last": ys[-1], "minimum": min(ys), "maximum": max(ys),
            "mean": round(ym, 6), "delta": delta, "span_s": round(xs[-1], 6),
            "linear_slope_per_minute": round(slope * 60, 6) if slope is not None else None,
            "endpoint_direction": "higher" if delta > 0 else "lower" if delta < 0 else "unchanged",
            "increasing_steps": sum(b > a for a, b in zip(ys, ys[1:])),
            "decreasing_steps": sum(b < a for a, b in zip(ys, ys[1:]))}


def parse_meminfo(text: str) -> dict:
    result = {}
    for key, pattern in {
        "total_pss_kib": r"TOTAL PSS:\s*(\d+)",
        "total_rss_kib": r"TOTAL RSS:\s*(\d+)",
        "total_swap_kib": r"TOTAL SWAP(?: PSS)?\s*\(KB\):\s*(\d+)",
        "graphics_pss_kib": r"^\s*Graphics:\s*(\d+)",
    }.items():
        match = re.search(pattern, text, re.MULTILINE)
        if match:
            result[key] = int(match.group(1))
    for label, key in (("Native Heap", "native_heap"), ("Dalvik Heap", "dalvik_heap"),
                       ("EGL mtrack", "egl_mtrack"), ("GL mtrack", "gl_mtrack")):
        match = re.search(r"^\s*" + re.escape(label) + r"\s+((?:\d+[ \t]+)*\d+)[ \t]*$",
                          text.replace("\r", ""), re.MULTILINE)
        if not match:
            continue
        values = [int(v) for v in match.group(1).split()]
        result[key + "_pss_kib"] = values[0]
        # Heap Size/Alloc/Free are the last 3 columns; SwapPss variants can add a
        # preceding column, so do not hard-code the allocation column's index.
        if label.endswith("Heap") and len(values) >= 8:
            result[key + "_size_kib"] = values[-3]
            result[key + "_allocated_kib"] = values[-2]
            result[key + "_free_kib"] = values[-1]
    return result


def parse_system(text: str) -> dict:
    result = {"psi": {}}
    lines = text.replace("\r", "").splitlines()
    epoch = next((line.strip() for line in lines if re.fullmatch(r"\d{9,}\.\d+", line.strip())), None)
    if epoch:
        result["device_epoch"] = float(epoch)
    for label, key in (("MemAvailable", "mem_available_kib"), ("VmRSS", "proc_status_rss_kib"),
                       ("VmSwap", "proc_status_swap_kib"), ("Threads", "threads")):
        match = re.search(r"^" + label + r":\s*(\d+)", text, re.MULTILINE)
        if match:
            result[key] = int(match.group(1))
    # capture_live.py concatenates memory, CPU, then I/O PSI without labels.
    # Each resource starts with 'some'; newer kernels can also provide CPU full.
    groups = []
    for line in lines:
        match = re.fullmatch(r"(some|full) avg10=([\d.]+) avg60=([\d.]+) avg300=([\d.]+) total=(\d+)", line.strip())
        if match:
            kind, a10, a60, a300, total = match.groups()
            if kind == "some":
                groups.append({})
            if groups:
                groups[-1][kind] = {"avg10_percent": float(a10), "avg60_percent": float(a60),
                                   "avg300_percent": float(a300), "total_us": int(total)}
    if len(groups) == 3:
        result["psi"] = dict(zip(("memory", "cpu", "io"), groups))
    else:
        result["psi_parse_warning"] = f"Expected 3 unlabelled PSI resource groups, found {len(groups)}; no resource labels inferred."
    return result


def clock_epoch(text: str) -> float | None:
    match = re.search(r"^\s*(\d{9,}\.\d+)\s*$", text, re.MULTILINE)
    return float(match.group(1)) if match else None


def summarize(capture: Path, output: Path) -> dict:
    metadata = json.loads(read_text(capture / "capture.json"))
    samples = [json.loads(line) for line in read_text(capture / "samples.jsonl").splitlines() if line.strip()]
    if not samples:
        raise ValueError("Capture contains no samples")
    samples.sort(key=lambda sample: sample["host_epoch"])
    pids = {int(token) for sample in samples for token in str(sample.get("pid", "")).split() if token.isdigit()}
    if metadata.get("initial_pid"):
        pids.add(int(metadata["initial_pid"]))
    parsed = [{"host_epoch": row["host_epoch"], "pid": row.get("pid"),
               "memory": parse_meminfo(row.get("meminfo", "")),
               "system": parse_system(row.get("system", ""))} for row in samples]
    memory_keys = sorted({key for row in parsed for key in row["memory"]})
    memory = {key: stats([(row["host_epoch"], row["memory"][key]) for row in parsed if key in row["memory"]], "KiB")
              for key in memory_keys}
    system = {}
    for key in ("mem_available_kib", "proc_status_rss_kib", "proc_status_swap_kib", "threads"):
        system[key] = stats([(row["system"].get("device_epoch", row["host_epoch"]), row["system"][key])
                             for row in parsed if key in row["system"]], "count" if key == "threads" else "KiB")
    psi = {}
    for resource in ("memory", "cpu", "io"):
        psi[resource] = {}
        for kind in ("some", "full"):
            metrics = {}
            for metric in ("avg10_percent", "avg60_percent", "avg300_percent", "total_us"):
                points = [(row["system"].get("device_epoch", row["host_epoch"]),
                           row["system"]["psi"][resource][kind][metric]) for row in parsed
                          if kind in row["system"]["psi"].get(resource, {})]
                metrics[metric] = stats(points, "microseconds" if metric == "total_us" else "percent")
            psi[resource][kind] = metrics
    thermal_points = []
    for sample in samples:
        match = re.search(r"Thermal Status:\s*(\d+)", sample.get("thermal", ""))
        if match:
            thermal_points.append((sample["host_epoch"], int(match.group(1))))
    thermal_after = re.search(r"Thermal Status:\s*(\d+)", read_text(capture / "thermal-after.txt"))
    compiled = {kind: re.compile(pattern) for kind, pattern in EVENT_PATTERNS.items()}
    events, all_epochs, app_epochs = [], [], []
    counts = Counter({kind: 0 for kind in compiled})
    error_codes = Counter()
    retry_packets = 0
    retry_packets_observed = 0
    unparsed_lines = 0
    for line_number, line in enumerate(read_text(capture / "logcat-live.txt").splitlines(), 1):
        match = LOG_LINE.match(line)
        if not match:
            unparsed_lines += 1
            continue
        epoch, pid = float(match["epoch"]), int(match["pid"])
        all_epochs.append(epoch)
        if pids and pid not in pids:
            continue
        app_epochs.append(epoch)
        message = match["message"]
        kinds = [kind for kind, pattern in compiled.items() if pattern.search(message)]
        if not kinds:
            continue
        event = {"device_epoch": epoch, "utc": utc(epoch), "pid": pid, "tid": int(match["tid"]),
                 "priority": match["priority"], "tag": match["tag"].strip(),
                 "kinds": kinds, "message": message, "log_line": line_number}
        counts.update(kinds)
        packets = re.search(r"retry\s*\((\d+) packets\)", message)
        if packets and "fec_retry" in kinds:
            event["requested_retry_packets"] = int(packets.group(1))
            retry_packets += event["requested_retry_packets"]
            retry_packets_observed += 1
        error = re.search(r"error:\s*(-?\d+)", message)
        if error:
            event["error_code"] = int(error.group(1))
            error_codes.update([str(event["error_code"])])
        events.append(event)
    events.sort(key=lambda event: event["device_epoch"])
    clock_start = clock_epoch(read_text(capture / "clocks-start.txt"))
    clock_end = clock_epoch(read_text(capture / "clocks-end.txt"))
    warnings = sorted({row["system"]["psi_parse_warning"] for row in parsed if "psi_parse_warning" in row["system"]})
    if len(pids) != 1 or any(not row.get("pid") for row in samples):
        warnings.append("Process absence/change detected; aggregate memory slopes must not be interpreted as one uninterrupted process.")
    if any(not row["memory"] for row in parsed):
        warnings.append("At least 1 process meminfo sample could not be parsed.")
    limitations = [
        "Log events are observed messages, not user-confirmed physical hitches or a count of displayed dropped frames.",
        "FEC retry packet totals are summed requests, not unique packets lost on the network; multiple messages can describe one incident.",
        "Memory endpoint changes and least-squares slopes are descriptive; no finding here proves absence of a small, intermittent, capped, or driver-owned leak.",
        "PSS/RSS from dumpsys and /proc/status have different accounting, particularly graphics memtrack; do not subtract them as a leak measure.",
        "Repeated dumpsys meminfo collection can trigger explicit GC/object enumeration and suspend app threads. GC or scheduling pauses during this capture can be observer effects; compare a capture without periodic dumpsys before attributing them to normal app behavior.",
        "Thermal summary reports Thermal Status only; cached temperature values and current HAL readings are not mixed, and status alone does not establish a hitch cause.",
        "Capture-clock, sample, logcat, and configured Perfetto spans are separate. This tool does not parse Perfetto or assert its actual covered duration.",
    ]
    summary = {
        "schema_version": 1, "run_id": metadata.get("run_id"), "package": metadata.get("package"),
        "scope": "Offline summary of passive device capture; no device actions; no physical-hitch attribution",
        "timing": {"host_start_epoch": metadata.get("host_start_epoch"), "requested_capture_s": metadata.get("seconds"),
                   "configured_perfetto_s": metadata.get("perfetto_seconds"),
                   "device_capture_clocks": span([value for value in (clock_start, clock_end) if value is not None]),
                   "sample_host_times": span([row["host_epoch"] for row in parsed]),
                   "logcat_all_process_times": span(all_epochs), "logcat_app_times": span(app_epochs)},
        "process_ids_observed": sorted(pids), "sample_count": len(samples),
        "sample_collection_cost_s": stats([(row["host_epoch"], row["capture_cost_s"]) for row in samples if "capture_cost_s" in row], "seconds"),
        "memory_before": parse_meminfo(read_text(capture / "meminfo-before.txt")),
        "memory_after": parse_meminfo(read_text(capture / "meminfo-after.txt")),
        "memory_sample_statistics": memory, "system_sample_statistics": system, "psi_sample_statistics": psi,
        "thermal_status": {"sample_statistics": stats(thermal_points, "Android thermal status code"),
                           "observed_codes": sorted({value for _, value in thermal_points}),
                           "after_code": int(thermal_after.group(1)) if thermal_after else None},
        "logs": {"scope": "Messages from observed Steam Link PID(s), over full captured logcat interval",
                 "event_counts": dict(counts), "selected_log_lines": len(events), "unparsed_lines_including_headers": unparsed_lines,
                 "requested_retry_packet_sum": retry_packets, "retry_lines_with_packet_count": retry_packets_observed,
                 "error_code_counts": dict(error_codes),
                 "leak_candidate_error_count": sum(value for kind, value in counts.items() if kind.startswith("leak_"))},
        "warnings": warnings, "limitations": limitations,
    }
    output.mkdir(parents=True, exist_ok=True)
    (output / "device-summary.json").write_text(json.dumps(summary, indent=2, allow_nan=False) + "\n", encoding="utf-8")
    event_document = {"schema_version": 1, "run_id": metadata.get("run_id"), "clock": "device logcat epoch seconds",
                      "scope": "Observed app log messages; not confirmed physical hitches. Multiple kinds can match 1 line.",
                      "logcat_app_span": span(app_epochs), "event_counts": dict(counts), "events": events}
    (output / "device-events.json").write_text(json.dumps(event_document, indent=2, allow_nan=False) + "\n", encoding="utf-8")
    return summary


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("capture", type=Path)
    parser.add_argument("--output", type=Path, help="Defaults to the capture directory")
    args = parser.parse_args()
    capture = args.capture.resolve()
    output = (args.output or capture).resolve()
    result = summarize(capture, output)
    print(json.dumps({"output": str(output), "sample_count": result["sample_count"],
                      "event_counts": result["logs"]["event_counts"],
                      "leak_candidate_error_count": result["logs"]["leak_candidate_error_count"],
                      "thermal_codes": result["thermal_status"]["observed_codes"],
                      "warnings": result["warnings"]}, indent=2))


if __name__ == "__main__":
    main()
