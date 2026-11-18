"""Replay guarded Hogwarts Mystery gameplay on an isolated Windows Android emulator.

Screen frames and OCR stay in memory. Only known label matches and check results
are printed. Launch the game on a disposable AVD before running this script.
"""
import argparse
import base64
import io
import json
import math
import os
from pathlib import Path
import queue
import re
import shutil
import struct
import subprocess
import threading
import time


PACKAGE = "com.tinyco.potter"
DEFAULT_AVD = "Morphe_Hogwarts_QoL_API35"
WORKER = Path(__file__).with_name("hogwarts_ocr.ps1")
ADB_FALLBACK = Path(os.environ.get("ANDROID_HOME", Path(os.environ.get("LOCALAPPDATA", "")) / "Android/Sdk")) / "platform-tools/adb.exe"
LABELS = (
    "Harry Potter", "Hogwarts Mystery", "Start", "Continue", "Next", "Close", "OK",
    "Select", "Done", "Rowan", "Penny", "Diagon Alley", "Hogwarts", "Great Hall",
    "Ollivanders", "Charms Classroom", "Potions Classroom", "Charms", "Potions",
    "Begin", "Talk", "Explore", "Collect", "Claim", "Rewards", "Wardrobe",
    "Hair", "Outfits", "Settings", "Year 1", "Choose your character",
)
SENSITIVE = re.compile(
    r"\b(?:account info|log[ -]?in|sign[ -]?in|password|e[ -]?mail|player id|"
    r"purchase[sd]?|buy|checkout|billing|payment|google play games|"
    r"restore save|restore game|delete account|link account|google account|facebook|apple id)\b|[$€£]\s*\d", re.IGNORECASE
)
NO_WINDOW = getattr(subprocess, "CREATE_NO_WINDOW", 0)


class SmokeError(RuntimeError):
    pass


def normalized(text):
    return " ".join(text.casefold().split())


def blocked_screen(rows):
    return any(SENSITIVE.search(normalized(row["text"])) for row in rows)


def matching(rows, label):
    key = normalized(label)
    return [row for row in rows if normalized(row["text"]) == key]


def center(row, size):
    x, y = round(row["x"]), round(row["y"])
    if not (0 <= x < size[0] and 0 <= y < size[1]):
        raise SmokeError("OCR location is outside the screenshot")
    return x, y


def status_report(rows, size, allow):
    blocked = blocked_screen(rows)
    labels = []
    if not blocked:
        for label in dict.fromkeys(allow):
            for row in matching(rows, label):
                x, y = center(row, size)
                labels.append({"text": label, "x": x, "y": y})
    return {
        "status": "BLOCKED_SCREEN" if blocked else "KNOWN_LABELS" if labels else "UNKNOWN_SCREEN",
        "size": list(size),
        "labels": labels,
    }


def is_label(value):
    return (
        isinstance(value, str)
        and 0 < len(value) <= 160
        and value.isprintable()
        and bool(normalized(value))
        and not SENSITIVE.search(normalized(value))
    )


def integer_pair(value):
    return isinstance(value, list) and len(value) == 2 and all(type(n) is int for n in value)


def validate_route(steps):
    if not isinstance(steps, list) or not 1 <= len(steps) <= 100:
        raise SmokeError("Route must be a JSON array of 1 to 100 steps")
    for index, step in enumerate(steps, start=1):
        if not isinstance(step, dict) or set(step) - {"expect", "tap", "point", "size"}:
            raise SmokeError(f"Step {index} has unsupported fields")
        expect = step.get("expect")
        if not isinstance(expect, list) or not 1 <= len(expect) <= 12 or not all(map(is_label, expect)):
            raise SmokeError(f"Step {index} requires 1 to 12 safe literal OCR labels")
        if len(set(map(normalized, expect))) != len(expect):
            raise SmokeError(f"Step {index} repeats an OCR label")
        if "tap" in step and (not is_label(step["tap"]) or "point" in step or "size" in step):
            raise SmokeError(f"Step {index} requires one safe text target")
        if "point" in step or "size" in step:
            point, size = step.get("point"), step.get("size")
            if not integer_pair(point) or not integer_pair(size) or not all(0 <= n < limit for n, limit in zip(point, size)):
                raise SmokeError(f"Step {index} requires an in-bounds point and exact screenshot size")


def resolve_step(step, rows, size):
    if not all(len(matching(rows, label)) == 1 for label in step["expect"]):
        return None
    if "tap" in step:
        matches = matching(rows, step["tap"])
        return center(matches[0], size) if len(matches) == 1 else None
    if "point" in step:
        return tuple(step["point"]) if tuple(step["size"]) == size else None
    return ()


def replay(device, steps, attempts, interval, frame_limit, first_step=1):
    frames = 0
    for index in range(first_step, len(steps) + 1):
        step = steps[index - 1]
        for attempt in range(attempts):
            if frames >= frame_limit:
                raise SmokeError(f"Step {index} exhausted the OCR frame budget")
            rows, size = device.observe()
            frames += 1
            if blocked_screen(rows):
                raise SmokeError(f"Step {index} stopped on an account or purchase screen")
            point = resolve_step(step, rows, size)
            if point is not None:
                if point:
                    device.tap(*point)
                print(f"Step {index} {'tapped' if point else 'confirmed'}", flush=True)
                break
            if attempt + 1 < attempts:
                time.sleep(interval)
        else:
            raise SmokeError(f"Step {index} expected screen or target was not uniquely recognized")
        if point and index < len(steps):
            time.sleep(interval)
    return frames


class OcrWorker:
    def __enter__(self):
        self.process = subprocess.Popen(
            ["powershell.exe", "-NoProfile", "-NonInteractive", "-File", str(WORKER)],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            text=True,
            encoding="utf-8",
            creationflags=NO_WINDOW,
        )
        self.requests = queue.Queue()
        self.replies = queue.Queue()
        threading.Thread(target=self.exchange, daemon=True).start()
        return self

    def exchange(self):
        try:
            while (request := self.requests.get()) is not None:
                self.process.stdin.write(request + "\n")
                self.process.stdin.flush()
                reply = self.process.stdout.readline()
                self.replies.put(reply)
                if not reply:
                    return
        except (OSError, UnicodeError, ValueError):
            self.replies.put("")

    def recognize(self, png):
        self.requests.put(json.dumps({"png": base64.b64encode(png).decode("ascii")}))
        try:
            reply = self.replies.get(timeout=20)
        except queue.Empty:
            raise SmokeError("Windows OCR timed out") from None
        if not reply:
            raise SmokeError("Windows OCR worker stopped")
        result = json.loads(reply)
        if "rows" not in result:
            raise SmokeError("Windows OCR could not process the frame or load a language pack")
        return result["rows"]

    def __exit__(self, *_):
        self.requests.put(None)
        self.process.terminate()
        try:
            self.process.wait(timeout=3)
        except subprocess.TimeoutExpired:
            self.process.kill()
            self.process.wait()
        self.process.stdin.close()
        self.process.stdout.close()


def red_channel(png):
    try:
        from PIL import Image, ImageOps
    except ImportError:
        raise SmokeError("--red-channel requires Pillow") from None
    with Image.open(io.BytesIO(png)) as image:
        output = io.BytesIO()
        ImageOps.autocontrast(image.getchannel("R")).convert("RGB").save(output, format="PNG")
        return output.getvalue()


class Device:
    def __init__(self, args, ocr):
        self.exe = args.adb or shutil.which("adb") or str(ADB_FALLBACK)
        self.serial = args.serial
        self.avd = args.avd
        self.ocr = ocr
        self.red_channel = args.red_channel

    def adb(self, *args):
        return subprocess.run(
            [self.exe, "-s", self.serial, *args],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=True,
            timeout=10,
            creationflags=NO_WINDOW,
        ).stdout

    def confirm_device(self):
        if not re.fullmatch(r"emulator-\d+", self.serial):
            raise SmokeError("Use the ADB serial of the isolated Hogwarts emulator")
        name = self.adb("shell", "getprop", "ro.boot.qemu.avd_name").decode().strip()
        if not name or name != self.avd:
            raise SmokeError("ADB serial did not identify the specified Hogwarts AVD")
        package = self.adb("shell", "dumpsys", "package", PACKAGE).decode(errors="replace")
        version_name = re.search(r"^\s*versionName=7\.3\.4\s*$", package, re.MULTILINE)
        version_code = re.search(r"^\s*versionCode=7030400(?:\s|$)", package, re.MULTILINE)
        if not version_name or not version_code:
            raise SmokeError("The specified emulator must have Hogwarts Mystery 7.3.4 (7030400) installed")

    def foreground(self):
        windows = self.adb("shell", "dumpsys", "window").decode(errors="replace")
        if not any(
            "mCurrentFocus=Window{" in line and f" {PACKAGE}/" in line
            for line in windows.splitlines()
        ):
            raise SmokeError("Hogwarts Mystery is not the focused window")

    def observe(self):
        self.foreground()
        png = self.adb("exec-out", "screencap", "-p")
        if len(png) < 24 or not png.startswith(b"\x89PNG\r\n\x1a\n") or png[12:16] != b"IHDR":
            raise SmokeError("ADB did not return a PNG frame")
        size = struct.unpack_from(">II", png, 16)
        rows = self.ocr.recognize(red_channel(png) if self.red_channel else png)
        return rows, size

    def tap(self, x, y):
        self.foreground()
        self.adb("shell", "input", "tap", str(x), str(y))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--serial", required=True)
    parser.add_argument("--avd", default=DEFAULT_AVD)
    parser.add_argument("--adb")
    parser.add_argument("--red-channel", action="store_true", help="Use Pillow to recover OCR contrast on red-tinted emulators")
    commands = parser.add_subparsers(dest="command", required=True)
    status = commands.add_parser("status", help="Print coordinates of recognized allowlisted lines")
    status.add_argument("--allow", action="append", default=[], help="Additional exact label; repeat as needed")
    play = commands.add_parser("replay", help="Run a trusted, calibrated JSON route")
    play.add_argument("route", type=Path)
    play.add_argument("--from-step", type=int, default=1, help="Resume from a numbered step and check its screen before tapping")
    play.add_argument("--attempts", type=int, default=3)
    play.add_argument("--interval", type=float, default=1.2)
    play.add_argument("--max-frames", type=int, default=60)
    args = parser.parse_args()

    try:
        if args.command == "replay":
            steps = json.loads(args.route.read_text(encoding="utf-8-sig"))
            validate_route(steps)
            if not 1 <= args.from_step <= len(steps):
                raise SmokeError("Resume step is outside the route")
            if not 1 <= args.attempts <= 10 or not 1 <= args.max_frames <= 300 or not math.isfinite(args.interval) or not 0 <= args.interval <= 10:
                raise SmokeError("Use 1 to 10 attempts, 1 to 300 frames and an interval of 0 to 10 seconds")
        elif not all(map(is_label, args.allow)):
            raise SmokeError("Use literal gameplay labels without account or purchase text")

        with OcrWorker() as ocr:
            device = Device(args, ocr)
            device.confirm_device()
            if args.command == "status":
                rows, size = device.observe()
                report = status_report(rows, size, [*LABELS, *args.allow])
                print(json.dumps(report, ensure_ascii=True))
                return 0 if report["labels"] else 1
            frames = replay(device, steps, args.attempts, args.interval, args.max_frames, args.from_step)
            print(f"PASS ({len(steps) - args.from_step + 1} steps, {frames} OCR frames)")
            return 0
    except SmokeError as exc:
        print(f"STOP: {exc}")
    except (OSError, ValueError, subprocess.SubprocessError) as exc:
        # Avoid stdout/stderr, OCR fragments and account details from exceptions.
        print(f"STOP: {type(exc).__name__}")
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
