#!/usr/bin/env python3
"""Capture test-app UI evidence and optionally tap one exact accessible control."""
import argparse
import os
from pathlib import Path
import re
import subprocess
import xml.etree.ElementTree as ET

parser = argparse.ArgumentParser()
parser.add_argument("label")
parser.add_argument("--tap")
parser.add_argument("--screenshot", action="store_true")
parser.add_argument("--serial", default=os.environ.get("ANDROID_SERIAL"))
args = parser.parse_args()
workspace = Path(__file__).resolve().parents[2]
adb = [str(workspace / "tools/windows/platform-tools/adb.exe")]
if args.serial:
    adb += ["-s", args.serial]
output = workspace / "device-baseline"
subprocess.run(adb + ["shell", "uiautomator", "dump", "/sdcard/chrome-test-ui.xml"], check=True, stdout=subprocess.DEVNULL)
raw = subprocess.check_output(adb + ["exec-out", "cat", "/sdcard/chrome-test-ui.xml"])
(output / (args.label + ".xml")).write_bytes(raw)
nodes = list(ET.fromstring(raw).iter("node"))
test_nodes = [n for n in nodes if n.get("package") == "app.matthew.chrome.test"]
if not test_nodes:
    raise SystemExit("Test app is not visible; unlock and foreground Chrome Morphe.")
for node in test_nodes:
    text, desc = node.get("text", ""), node.get("content-desc", "")
    if text or desc:
        print(f"{text or desc} {node.get('bounds')}")
if args.screenshot:
    (output / (args.label + ".png")).write_bytes(subprocess.check_output(adb + ["exec-out", "screencap", "-p"]))
if args.tap:
    matches = [n for n in test_nodes if args.tap in (n.get("content-desc"), n.get("text"))]
    if len(matches) != 1:
        raise SystemExit(f"Expected one exact control: {args.tap}; found {len(matches)}")
    x1,y1,x2,y2 = map(int, re.findall(r"\d+", matches[0].get("bounds")))
    subprocess.run(adb + ["shell", "input", "tap", str((x1+x2)//2), str((y1+y2)//2)], check=True)
