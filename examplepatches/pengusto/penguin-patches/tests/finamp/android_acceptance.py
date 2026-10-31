#!/usr/bin/env python3
"""Real Finamp UI acceptance on ONLY emulator-5580 / penguin / API 35.

No implicit uninstall, data clearing, signing, host settings changes, or external
services. Explicit --clean is guarded by the saved synthetic baseline archive.
All UI actions resolve fresh text/content-desc nodes and check visible bounds.
"""

import argparse
import contextlib
from datetime import datetime, timezone
import hashlib
import io
import json
import os
from pathlib import Path
import re
import shlex
import shutil
import subprocess
import sys
import tarfile
import time
import urllib.error
import urllib.request
import xml.etree.ElementTree as ET
import zipfile

ROOT = Path(__file__).resolve().parent
REPO_ROOT = Path(__file__).resolve().parents[2]
OUT_ROOT = REPO_ROOT / ".scratch/finamp/android"
ADB = None
AAPT2 = None
SERIAL = "emulator-5580"
AVD = "penguin"
PACKAGE = "com.unicornsonlsd.finamp"
ORIGINAL_SHA = "0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581"
PORT = 18961
BASE_URL = "http://127.0.0.1:18961"
TITLE = "PenguinSyntheticTitle"


def adb_candidates(explicit=None, environ=None):
    if explicit:
        return [Path(explicit).expanduser()]
    environ = os.environ if environ is None else environ
    executable = "adb.exe" if os.name == "nt" else "adb"
    return [Path(environ[key]).expanduser() / "platform-tools" / executable
            for key in ("ANDROID_SDK_ROOT", "ANDROID_HOME") if environ.get(key)]


def resolve_adb(explicit=None):
    for candidate in adb_candidates(explicit):
        if candidate.is_file():
            return candidate.resolve()
    if not explicit:
        candidate = shutil.which("adb")
        if candidate:
            return Path(candidate).resolve()
    raise RuntimeError("ADB unavailable: pass --adb or set ANDROID_SDK_ROOT / ANDROID_HOME")


def resolve_aapt2(adb_path):
    if AAPT2:
        candidate = Path(AAPT2).expanduser()
        if candidate.is_file():
            return candidate.resolve()
        raise RuntimeError("Explicit --aapt2 does not exist")
    roots = [Path(os.environ[key]).expanduser() for key in ("ANDROID_SDK_ROOT", "ANDROID_HOME") if os.environ.get(key)]
    roots.append(adb_path.parents[1])
    for root in roots:
        candidates = sorted(root.glob("build-tools/*/aapt2")) + sorted(root.glob("build-tools/*/aapt2.exe"))
        if candidates:
            return candidates[-1]
    candidate = shutil.which("aapt2")
    if candidate:
        return Path(candidate)
    raise RuntimeError("Need existing SDK aapt2 or --aapt2 to verify APK package before installation")


def safe_output_path(path):
    path = Path(path).expanduser().resolve()
    if not path.is_relative_to(OUT_ROOT.resolve()):
        raise ValueError("Evidence must stay under the configured repo .scratch output root")
    return path


def utc():
    return datetime.now(timezone.utc).isoformat()


def write_json(path, value):
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


class Android:
    def __init__(self, out=None, adb=None):
        self.adb_path = resolve_adb(adb or ADB)
        self.out = safe_output_path(out or OUT_ROOT)
        self.out.mkdir(parents=True, exist_ok=True)
        self.counter = max([int(p.name.split("-", 1)[0]) for p in self.out.glob("[0-9][0-9][0-9]-*.xml")] or [0])
        self.identity = self.verify()
        self.size = tuple(map(int, re.findall(r"(\d+)x(\d+)", self.adb("shell", "wm", "size"))[-1]))
        self.viewport = [0, 0, self.size[0], self.size[1]]
        insets = self.adb("shell", "dumpsys", "window", "displays")
        for kind, left, top, right, bottom in re.findall(
                r"type=(statusBars|navigationBars) frame=\[(\d+),(\d+)\]\[(\d+),(\d+)\] visible=true", insets):
            left, top, right, bottom = map(int, (left, top, right, bottom))
            if left == 0 and right == self.size[0]:
                if top == 0:
                    self.viewport[1] = max(self.viewport[1], bottom)
                if bottom == self.size[1]:
                    self.viewport[3] = min(self.viewport[3], top)
        write_json(self.out / "viewport.json", {"physical": self.size, "safeForTaps": self.viewport})

    def adb(self, *args, binary=False, check=True, timeout=30):
        result = subprocess.run([str(self.adb_path), "-s", SERIAL, *map(str, args)], capture_output=True, timeout=timeout)
        if check and result.returncode:
            raise RuntimeError("ADB failed: " + shlex.join(map(str, args)) + "\n" + result.stderr.decode(errors="replace"))
        return result.stdout if binary else result.stdout.decode(errors="replace")

    def verify(self):
        deadline = time.monotonic() + 120
        while time.monotonic() < deadline:
            try:
                avd = self.adb("emu", "avd", "name", timeout=5).splitlines()[0].strip()
                if avd != AVD:
                    raise AssertionError("Wrong AVD: " + avd)
                props = {key: self.adb("shell", "getprop", key, timeout=5).strip() for key in
                         ("ro.kernel.qemu", "ro.hardware", "ro.build.version.sdk", "sys.boot_completed")}
                if props["sys.boot_completed"] == "1":
                    assert props["ro.kernel.qemu"] == "1", "Physical devices are forbidden"
                    assert props["ro.hardware"] in ("ranchu", "goldfish"), props
                    assert props["ro.build.version.sdk"] == "35", props
                    result = {"serial": SERIAL, "avd": avd, "properties": props, "verifiedAt": utc()}
                    write_json(self.out / "device.json", result)
                    return result
            except (RuntimeError, subprocess.TimeoutExpired):
                pass
            time.sleep(1)
        raise RuntimeError("penguin AVD did not reach API35 boot-completed state")

    def installed(self):
        packages = self.adb("shell", "pm", "list", "packages", PACKAGE).splitlines()
        if "package:" + PACKAGE not in packages:
            return None
        output = self.adb("shell", "pm", "path", PACKAGE)
        paths = [line.removeprefix("package:").strip() for line in output.splitlines() if line.startswith("package:")]
        if not paths:
            return None
        if len(paths) != 1:
            raise RuntimeError("Unexpected split installation; inspect before updating")
        apk = self.adb("exec-out", "cat", paths[0], binary=True)
        return {"package": PACKAGE, "path": paths[0], "sha256": hashlib.sha256(apk).hexdigest()}

    def install(self, apk, expected_sha=None, clean=False, baseline_data=None):
        apk = Path(apk).resolve()
        digest = hashlib.sha256(apk.read_bytes()).hexdigest()
        if expected_sha and digest != expected_sha:
            raise RuntimeError("Requested APK SHA mismatch")
        badging = subprocess.run([str(resolve_aapt2(self.adb_path)), "dump", "badging", str(apk)], check=True, capture_output=True, timeout=30).stdout.decode()
        package = re.search(r"^package: name='([^']+)'", badging)
        if not package or package.group(1) != PACKAGE:
            raise RuntimeError("Refusing APK with a different package")
        before = self.installed()
        write_json(self.out / "installation-before.json", before)
        if clean:
            if not baseline_data:
                raise RuntimeError("Clean install requires --baseline-data from a verified synthetic app-data snapshot")
            proof = Path(baseline_data).resolve()
            if not proof.is_relative_to(OUT_ROOT.resolve()):
                raise RuntimeError("Baseline data evidence is outside the allowed evidence directory")
            preserved = json.loads(proof.read_text())
            archive = proof.with_name("synthetic-app-data.tar")
            assert preserved.get("syntheticTitleInSettings") and preserved.get("syntheticServerInUserDatabase"), "No synthetic login/title proof"
            assert hashlib.sha256(archive.read_bytes()).hexdigest() == preserved["archiveSha256"], "Baseline archive changed"
            assert before and before["sha256"] == preserved["installedSha256"], "Installed APK changed since baseline snapshot"
            # Explicit human authorization was given for this package only, after
            # saving its synthetic baseline. Never infer clean install on failure.
            output = self.adb("uninstall", PACKAGE)
            (self.out / "explicit-clean-uninstall.txt").write_text(output)
            assert "Success" in output, "Uninstall did not succeed"
        if clean or not before or before["sha256"] != digest:
            # -r preserves data. Signature/version failures are blockers, never uninstalls.
            output = self.adb("install", "-r", apk, timeout=60)
            (self.out / "install.txt").write_text(output)
            if "Success" not in output:
                raise RuntimeError("Install failed; existing package retained: " + output)
        after = self.installed()
        assert after and after["sha256"] == digest, "Installed APK differs from requested bytes"
        write_json(self.out / "installation.json", {"before": before, "after": after, "apk": str(apk), "time": utc()})
        return after

    def launch(self, restart=False):
        # Activity-manager defaults can target user0 after a profile switch.
        # Resolve, stop and start against the same observed foreground profile.
        user = self.adb("shell", "am", "get-current-user").strip()
        if not user.isdigit():
            raise RuntimeError("Cannot establish the active Android profile")
        if restart:
            self.adb("shell", "am", "force-stop", "--user", user, PACKAGE)
        component = self.adb("shell", "cmd", "package", "resolve-activity", "--user", user, "--brief", PACKAGE).strip().splitlines()[-1]
        if not component.startswith(PACKAGE + "/"):
            raise RuntimeError("Unexpected launch component: " + component)
        self.adb("shell", "am", "start", "--user", user, "-W", "-n", component)
        time.sleep(1)
        return self.capture("launched")

    @staticmethod
    def labels(root):
        return [{key: node.get(key, "") for key in ("text", "content-desc", "class", "bounds", "clickable", "enabled", "focused", "checkable", "checked")}
                for node in root.iter("node") if node.get("text") or node.get("content-desc") or node.get("class") == "android.widget.EditText"]

    def dump(self):
        # Writing in the browsed storage root makes DocumentsUI reload its list
        # during every dump. Keep temporary hierarchies outside document providers.
        remote = "/data/local/tmp/penguin-acceptance-ui.xml"
        for _ in range(4):
            self.adb("shell", "rm", "-f", remote)
            result = self.adb("shell", "uiautomator", "dump", remote, timeout=25)
            if "dumped to:" in result:
                text = self.adb("shell", "cat", remote)
                root = ET.fromstring(text)
                if any(n.get("package") == PACKAGE for n in root.iter("node")):
                    (self.out / "latest.xml").write_text(text)
                    return root, text
            time.sleep(0.3)
        raise RuntimeError("No fresh Finamp hierarchy; refusing blind UI actions")

    def capture(self, label):
        if not re.fullmatch(r"[A-Za-z0-9_-]+", label):
            raise ValueError("Invalid capture label")
        self.counter += 1
        name = "%03d-%s" % (self.counter, label)
        root, text = self.dump()
        (self.out / (name + ".xml")).write_text(text)
        png = self.adb("exec-out", "screencap", "-p", binary=True)
        assert png.startswith(b"\x89PNG\r\n\x1a\n"), "Invalid device screenshot"
        (self.out / (name + ".png")).write_bytes(png)
        write_json(self.out / (name + ".json"), {"capturedAt": utc(), "serial": SERIAL, "package": PACKAGE,
                                                   "labels": self.labels(root), "pngSha256": hashlib.sha256(png).hexdigest()})
        print(json.dumps({"capture": name, "labelCount": len(self.labels(root)), "evidence": str(self.out / name)}), flush=True)
        return root

    def bounds(self, node, allow_disabled=False):
        values = list(map(int, re.findall(r"-?\d+", node.get("bounds", ""))))
        if len(values) != 4:
            raise ValueError("Node has no usable bounds")
        x, y, right, bottom = values
        if not (0 <= x < right <= self.size[0] and 0 <= y < bottom <= self.size[1]):
            raise ValueError("Node is clipped/offscreen: " + str(values))
        if right - x < 25 or bottom - y < 25:
            raise ValueError("Node is too clipped to act on")
        if node.get("visible-to-user", "true") != "true" or (not allow_disabled and node.get("enabled", "true") != "true"):
            raise ValueError("Node is invisible or disabled")
        return values

    def tap_bounds(self, node):
        return self.clip_tap_bounds(self.bounds(node), self.viewport)

    @staticmethod
    def clip_tap_bounds(bounds, viewport):
        x, y, right, bottom = bounds
        x, y, right, bottom = max(x, viewport[0]), max(y, viewport[1]), min(right, viewport[2]), min(bottom, viewport[3])
        if right - x < 25 or bottom - y < 25:
            raise ValueError("Target is obscured by system bars; scroll it into view")
        return x, y, right, bottom

    def find(self, root, label=None, *, contains=False, class_name=None, index=None, allow_disabled=False):
        nodes = []
        for node in root.iter("node"):
            if node.get("package") != PACKAGE or (class_name and node.get("class") != class_name):
                continue
            fields = (node.get("text", ""), node.get("content-desc", ""))
            if label is not None and not (any(label in s for s in fields) if contains else label in fields):
                continue
            try:
                self.clip_tap_bounds(self.bounds(node, allow_disabled=allow_disabled), self.viewport)
            except ValueError:
                continue
            nodes.append(node)
        if index is not None:
            if not 0 <= index < len(nodes):
                raise RuntimeError("Selector index absent: " + str((label, class_name, index, len(nodes))))
            return nodes[index]
        if len(nodes) != 1:
            raise RuntimeError("Selector missing/ambiguous: " + str((label, class_name, len(nodes))) + "\n" + json.dumps(self.labels(root)))
        return nodes[0]

    def tap(self, label=None, *, contains=False, class_name=None, index=None, hold=False):
        if class_name != "android.widget.EditText":
            self.hide_ime()
        root, _ = self.dump()  # Always fresh immediately before resolving the selector.
        node = self.find(root, label, contains=contains, class_name=class_name, index=index)
        x, y, right, bottom = self.tap_bounds(node)
        x, y = (x + right) // 2, (y + bottom) // 2
        with (self.out / "actions.jsonl").open("a") as log:
            log.write(json.dumps({"time": utc(), "action": "long-press" if hold else "tap", "selector": label,
                                  "class": class_name, "index": index, "actualText": node.get("text"),
                                  "actualDesc": node.get("content-desc"), "bounds": node.get("bounds")}) + "\n")
        if hold:
            self.adb("shell", "input", "swipe", x, y, x, y, 1100)
        else:
            self.adb("shell", "input", "tap", x, y)
        time.sleep(0.3)

    def type_text(self, value, label=None, *, index=None, replace=False):
        # adb input text supports these synthetic ASCII values without clipboard/IME installs.
        if not re.fullmatch(r"[A-Za-z0-9 :/._-]*", value):
            raise ValueError("Only synthetic ASCII text supported")
        self.tap(label, class_name="android.widget.EditText", index=index)
        def focused_text():
            root, _ = self.dump()
            nodes = [n for n in root.iter("node") if n.get("package") == PACKAGE
                     and n.get("class") == "android.widget.EditText" and n.get("focused") == "true"]
            if len(nodes) != 1:
                raise RuntimeError("Expected exactly one focused Finamp text field")
            return nodes[0].get("text", "")
        if replace:
            previous = focused_text()
            self.adb("shell", "input", "keyevent", "KEYCODE_MOVE_END")
            # Flutter did not honor ADB Ctrl+A in the original APK. Delete the
            # observed value and prove it cleared before emitting replacement text.
            self.adb("shell", "input", "keyevent", *(["KEYCODE_DEL"] * (len(previous) + 2)))
            if focused_text() != "":
                raise RuntimeError("Text replacement did not clear the actual Flutter field")
        else:
            previous = focused_text()
        if value:
            self.adb("shell", "input", "text", value.replace(" ", "%s"))
        time.sleep(0.2)
        actual = focused_text()
        if actual != (value if replace else previous + value):
            raise RuntimeError("Actual field differs from requested synthetic text: " + repr(actual))

    def hide_ime(self):
        state = self.adb("shell", "dumpsys", "input_method")
        # IME-service mIsInputViewShown can stay true after its window disappears.
        # Only the current manager state is authoritative; stale flags closed the
        # activity with Back during the first original-APK suite attempt.
        if self.ime_visible(state):
            self.dump()  # Confirm the target app is still present before Back.
            self.adb("shell", "input", "keyevent", "KEYCODE_BACK")
            time.sleep(0.3)

    @staticmethod
    def ime_visible(state):
        shown = re.search(r"^\s*mInputShown=(true|false)\b", state, re.MULTILINE)
        if not shown:
            raise RuntimeError("Current Android input-manager visibility unavailable")
        return shown.group(1) == "true"

    def back(self):
        self.adb("shell", "input", "keyevent", "KEYCODE_BACK")
        time.sleep(0.3)

    def scroll(self, direction="up"):
        root, _ = self.dump()
        scrolls = [n for n in root.iter("node") if n.get("package") == PACKAGE and n.get("scrollable") == "true"]
        usable = []
        for node in scrolls:
            try:
                bounds = self.bounds(node)
                if bounds[3] - bounds[1] > 200:
                    usable.append(bounds)
            except ValueError:
                pass
        if not usable:
            raise RuntimeError("No fresh visible scrollable node")
        x, y, right, bottom = max(usable, key=lambda b: (b[2] - b[0]) * (b[3] - b[1]))
        center = (x + right) // 2
        low, high = y + (bottom - y) * 3 // 4, y + (bottom - y) // 4
        self.adb("shell", "input", "swipe", center, low if direction == "up" else high,
                 center, high if direction == "up" else low, 350)
        time.sleep(0.3)

    def scroll_to(self, label=None, *, contains=False, class_name=None, attempts=12, allow_disabled=False):
        for _ in range(attempts):
            root, _ = self.dump()
            try:
                return self.find(root, label, contains=contains, class_name=class_name, allow_disabled=allow_disabled)
            except RuntimeError:
                self.scroll()
        raise RuntimeError("Could not scroll to actual UI selector: " + repr((label, class_name)))

    def tap_descendant(self, row_label, child_label):
        self.hide_ime()
        root, _ = self.dump()
        row = self.find(root, row_label)
        child = self.find(row, child_label)
        x, y, right, bottom = self.tap_bounds(child)
        self.adb("shell", "input", "tap", (x + right) // 2, (y + bottom) // 2)
        time.sleep(0.3)

    def open_drawer(self):
        # The real APK's drawer ImageView has no accessibility description.
        # Anchor its fresh XML geometry to the named Fixture Music toolbar;
        # never invent a label or reuse fixed screen coordinates.
        self.hide_ime()
        root, _ = self.dump()
        anchor = self.find(root, "Fixture Music")
        ax, ay, ar, ab = self.bounds(anchor)
        icons = []
        for node in root.iter("node"):
            if node.get("package") != PACKAGE or node.get("class") != "android.widget.ImageView" or node.get("clickable") != "true":
                continue
            try:
                x, y, right, bottom = self.tap_bounds(node)
                if right <= ax and ay <= (y + bottom) // 2 <= ab:
                    icons.append((node, (x, y, right, bottom)))
            except ValueError:
                pass
        assert len(icons) == 1, "Unlabelled drawer icon is not uniquely anchored to the actual toolbar"
        node, (x, y, right, bottom) = icons[0]
        with (self.out / "actions.jsonl").open("a") as log:
            log.write(json.dumps({"time": utc(), "action": "tap", "anchor": "Fixture Music",
                                  "selectorGap": "unlabelled drawer ImageView", "bounds": node.get("bounds")}) + "\n")
        self.adb("shell", "input", "tap", (x + right) // 2, (y + bottom) // 2)
        time.sleep(0.3)

    def snapshot_data(self, title_marker=TITLE):
        """Read only this synthetic package, with a consistent stopped-process view."""
        if not title_marker or len(title_marker) > 128:
            raise ValueError("A nonempty synthetic title marker of at most 128 characters is required")
        installed = self.installed()
        self.adb("shell", "am", "force-stop", PACKAGE)
        archive = self.adb("exec-out", "su", "0", "tar", "-C", "/data/user/0/" + PACKAGE,
                           "-cf", "-", "app_flutter", "files", "shared_prefs", binary=True)
        (self.out / "synthetic-app-data.tar").write_bytes(archive)
        files = []
        settings = b""
        users = b""
        with tarfile.open(fileobj=io.BytesIO(archive)) as tar:
            for item in tar.getmembers():
                if item.isfile():
                    data = tar.extractfile(item).read()
                    files.append({"name": item.name, "size": len(data), "sha256": hashlib.sha256(data).hexdigest()})
                    if item.name == "app_flutter/finampsettings.hive":
                        settings = data
                    if item.name == "app_flutter/finamp_db.isar.isar":
                        users = data
        result = {"package": PACKAGE, "time": utc(), "archiveSha256": hashlib.sha256(archive).hexdigest(),
                  "installedSha256": installed["sha256"],
                  "files": files, "syntheticTitleInSettings": title_marker.encode() in settings,
                  "titleMarker": title_marker,
                  "syntheticServerInUserDatabase": BASE_URL.encode() in users,
                  "stateStores": {"title": "app_flutter/finampsettings.hive", "login": "app_flutter/finamp_db.isar.isar"}}
        write_json(self.out / "synthetic-app-data.json", result)
        assert result["syntheticTitleInSettings"] and result["syntheticServerInUserDatabase"], "Synthetic settings/login markers missing"
        return result


class FixtureControl:
    def __init__(self):
        self.directory = OUT_ROOT / "fixture-live"
        self.manifest = None

    def call(self, path, method="GET", body=None):
        if not path.startswith("/_fixture"):
            raise ValueError("Only fixture control paths allowed")
        data = json.dumps(body).encode() if body is not None else None
        headers = {"X-Fixture-Control": self.manifest["controlToken"], "Content-Type": "application/json"}
        request = urllib.request.Request(BASE_URL + path, data=data, method=method, headers=headers)
        with urllib.request.urlopen(request, timeout=5) as response:
            raw = response.read()
            return json.loads(raw) if raw else None

    def start(self, android, profile=None):
        self.directory.mkdir(exist_ok=True)
        try:
            with urllib.request.urlopen(BASE_URL + "/System/Info/Public", timeout=1) as response:
                if response.headers.get("X-Synthetic-Fixture") != "finamp-morphe-v1":
                    raise RuntimeError(f"Port {PORT} is occupied by an unknown server")
            self.manifest = json.loads((self.directory / "manifest.json").read_text())
            if self.manifest["baseUrl"] != BASE_URL:
                raise RuntimeError("Unexpected fixture manifest address")
            self.call("/_fixture")
            if profile is not None and self.manifest.get("profile", "credits") != profile:
                raise RuntimeError("Fixture profile differs; stop the owned fixture explicitly before switching")
        except (urllib.error.URLError, ConnectionError):
            command = [sys.executable, "-B", str(ROOT / "mock_jellyfin.py"), "--port", str(PORT), "--data-dir", str(self.directory)]
            if profile is not None:
                command += ["--profile", profile]
            with (self.directory / "server.log").open("ab") as log:
                process = subprocess.Popen(command, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
            write_json(self.directory / "process.json", {"pid": process.pid, "command": command, "startedAt": utc(),
                                                         "baseUrl": BASE_URL, "keptRunning": True})
            deadline = time.monotonic() + 10
            while time.monotonic() < deadline:
                if process.poll() is not None:
                    raise RuntimeError("Fixture startup failed; inspect fixture-live/server.log")
                try:
                    self.manifest = json.loads((self.directory / "manifest.json").read_text())
                    self.call("/_fixture")
                    break
                except (FileNotFoundError, json.JSONDecodeError, urllib.error.URLError):
                    time.sleep(0.1)
            else:
                raise RuntimeError("Fixture did not start")
        android.adb("reverse", f"tcp:{PORT}", f"tcp:{PORT}")
        write_json(android.out / "fixture-connection.json", {"baseUrl": BASE_URL, "reverse": f"tcp:{PORT} tcp:{PORT}",
                                                           "process": json.loads((self.directory / "process.json").read_text())})
        return self.manifest


class Acceptance:
    def __init__(self, android, features=0):
        self.ui, self.features = android, features
        self.fixture = FixtureControl()
        self.fixture.start(android)
        self.results = {}

    @staticmethod
    def has(root, text, contains=False):
        return any(any(text in v if contains else text == v for v in (n.get("text", ""), n.get("content-desc", "")))
                   for n in root.iter("node"))

    @staticmethod
    def exact(root, text):
        nodes = [n for n in root.iter("node") if text in (n.get("text"), n.get("content-desc"))]
        assert len(nodes) == 1, ("Missing/ambiguous evidence node", text, len(nodes))
        return nodes[0]

    def login(self, require_preserved=False):
        self.fixture.call("/_fixture/release", method="POST")
        root = self.ui.launch(restart=True)
        already_logged_in = self.has(root, "Fixture Music") and self.has(root, "Home\nTab", True)
        if require_preserved:
            assert already_logged_in, "Update did not preserve the synthetic login; refusing to silently log in again"
        if not already_logged_in:
            if self.has(root, "Get Started!"):
                self.ui.tap("Get Started!")
            root, _ = self.ui.dump()
            assert self.has(root, "Connect to Jellyfin"), "Unexpected onboarding/account state; no reset will be performed"
            self.ui.type_text(BASE_URL, index=0, replace=True)
            self.ui.hide_ime()
            self.ui.tap("Finamp Synthetic Fixture", contains=True)
            self.ui.tap("fixture")
            root, _ = self.ui.dump()
            assert self.has(root, "fixture"), "Synthetic username missing"
            self.ui.tap("Log In")
            time.sleep(0.5)
            root = self.ui.capture("suite-login")
            assert self.has(root, "Fixture Music"), "No populated synthetic library after login"
        self.results["login"] = {"syntheticLibraryVisible": True, "previousLoginPreserved": already_logged_in,
                                 "requiredPreservation": require_preserved, "fixtureUrl": BASE_URL}

    def home(self):
        self.ui.hide_ime()
        for _ in range(7):
            root, _ = self.ui.dump()
            if self.has(root, "Home\nTab", True):
                self.ui.tap("Home\nTab", contains=True)
                return
            self.ui.back()
        raise RuntimeError("Cannot reach actual Home tab without resetting app")

    def album(self):
        self.home()
        self.ui.tap("Albums\nTab", contains=True)
        self.ui.tap("Fixture Credits\nZ Lead")
        root, _ = self.ui.dump()
        assert self.has(root, "8 Tracks (00:32)"), "Album did not contain the eight fixture tracks"
        return root

    def custom_settings(self):
        self.home()
        self.ui.scroll_to("Customize home screen")
        self.ui.tap("Customize home screen")
        self.ui.scroll_to("Add New Section")

    def preserved_title(self):
        self.custom_settings()
        root = self.ui.capture("suite-preserved-title")
        assert self.has(root, TITLE), "Saved synthetic home section missing after restart/update"
        return {"title": TITLE, "visibleInSettings": True}

    def titles(self, saved_title=TITLE):
        self.custom_settings()
        root, _ = self.ui.dump()
        if self.has(root, TITLE):
            self.ui.tap_descendant(TITLE, "Edit section")
        else:
            self.ui.tap("Add New Section")
            self.ui.scroll_to("Custom Section\nConfigure your own section")
            self.ui.tap("Custom Section\nConfigure your own section")
        self.ui.scroll_to(None, class_name="android.widget.EditText")
        self.ui.scroll_to("Save", allow_disabled=True)
        observed = {}
        self.results["title"] = observed  # Preserve partial observations on a failed assertion.
        # Approved #1798 keeps isEmpty/isNotEmpty semantics. It refreshes Save
        # live; it does not introduce trimming or whitespace-only invalidity.
        cases = (("empty", ""), ("playlists", "Playlists"), ("cleared", ""),
                 ("whitespace-boundary", "   "), ("saved", saved_title))
        for label, value in cases:
            self.ui.type_text(value, index=0, replace=True)
            root = self.ui.capture("suite-title-live-" + label)
            field = self.ui.find(root, class_name="android.widget.EditText")
            assert field.get("text", "") == value, "Actual title text differs from probe"
            save = self.exact(root, "Save")
            observed[label] = {"value": value, "saveEnabled": save.get("enabled") == "true",
                               "saveClickable": save.get("clickable") == "true",
                               "requiredError": self.has(root, "Please give the custom section a title"),
                               "observedBeforeHidingIme": True}
            if self.features & 1:
                assert observed[label]["saveEnabled"] == bool(value), ("Save did not refresh live under the approved nonempty rule", observed)
            else:
                # Baseline validity after a layout refresh is unchanged. Record
                # live state too; do not invent an unobserved original transition.
                self.ui.hide_ime()
                settled, _ = self.ui.dump()
                observed[label]["saveEnabledAfterImeHide"] = self.exact(settled, "Save").get("enabled") == "true"
                assert observed[label]["saveEnabledAfterImeHide"] == bool(value), ("Existing title validity changed", observed)
        self.ui.hide_ime()
        self.ui.tap("Save")
        root = self.ui.capture("suite-title-saved")
        assert self.has(root, saved_title), "Ordinary title did not save into actual section settings"
        observed["savedTitle"] = saved_title
        observed["whitespaceProbeNotSaved"] = True
        observed["validityRule"] = "empty invalid; any nonempty value valid; no trim rule"
        self.results["title"] = observed

    def set_artist_mode(self, mode):
        """For a future APK with bit 2; source-derived selectors, fail closed if absent."""
        self.settings()
        self.ui.scroll_to("Layout & Theme")
        self.ui.tap("Layout & Theme")
        self.ui.scroll_to("Song artist order", contains=True)
        # Bring the selected dropdown below its title fully into view.
        options = ("Album artists first", "Metadata order", "First credited artist first", "Alphabetical")
        for _ in range(3):
            root, _ = self.ui.dump()
            selected = [n for n in root.iter("node") if n.get("class") == "android.widget.Button" and n.get("text") in options]
            if len(selected) == 1:
                try:
                    self.ui.tap_bounds(selected[0])
                    break
                except ValueError:
                    pass
            self.ui.scroll()
        else:
            raise RuntimeError("No visible song-artist-order dropdown in actual UI")
        self.ui.tap(selected[0].get("text"), class_name="android.widget.Button")
        root, _ = self.ui.dump()
        choices = [n for n in root.iter("node") if mode in (n.get("text"), n.get("content-desc")) and n.get("clickable") == "true"]
        assert len(choices) == 1, ("Artist order menu choice absent/ambiguous", mode)
        x, y, right, bottom = self.ui.tap_bounds(choices[0])
        self.ui.adb("shell", "input", "tap", (x + right) // 2, (y + bottom) // 2)
        time.sleep(0.3)
        self.ui.capture("suite-mode-" + mode.lower().replace(" ", "-"))

    def settings(self):
        self.home()
        root, _ = self.ui.dump()
        if self.has(root, "Check out some commonly changed settings!"):
            self.ui.tap("Check out some commonly changed settings!")
            self.ui.tap("All Settings")
        else:
            self.ui.open_drawer()
            self.ui.tap("Settings")

    def credits(self):
        modes = {"Alphabetical": ["A Guest", "B Guest", "Z Lead"]}
        if self.features & 2:
            modes = {"Album artists first": ["Z Lead", "A Guest", "B Guest"],
                     "Metadata order": ["B Guest", "Z Lead", "A Guest"],
                     "First credited artist first": ["B Guest", "A Guest", "Z Lead"],
                     "Alphabetical": ["A Guest", "B Guest", "Z Lead"]}
        observed = {}
        for mode, expected in modes.items():
            if self.features & 2:
                self.set_artist_mode(mode)
            root = self.album()
            rows = [n for n in root.iter("node") if "01 - Credit Order" in n.get("content-desc", "")
                    and not n.get("content-desc", "").startswith("Open Player Screen")]
            assert len(rows) == 1, "Missing/ambiguous first track row"
            parts = rows[0].get("content-desc").splitlines()
            assert ", ".join(expected) in parts, ("Incorrect artist-credit order", mode, parts, expected)
            self.ui.capture("suite-credits-" + mode.lower().replace(" ", "-"))
            observed[mode] = {"expected": expected, "actualRow": rows[0].get("content-desc")}
        if self.features & 2:
            self.set_artist_mode("Album artists first")  # Deterministic persisted mode for another update.
        self.results["credits"] = observed
        self.results["creditsSettingBranchesExecuted"] = bool(self.features & 2)

    def performance(self):
        self.fixture.call("/_fixture/release", method="POST")
        self.ui.launch(restart=True)  # Drop cached Riverpod providers before measuring.
        self.album()
        since = self.fixture.call("/_fixture/requests")["lastId"]
        self.fixture.call("/_fixture/control", method="POST", body={"mode": "hold", "scope": "artist", "holdTimeoutSeconds": 120})
        try:
            start = time.monotonic()
            self.ui.tap("Z Lead (Artist)\nZ Lead")
            time.sleep(1)
            root = self.ui.capture("suite-artist-held")
            logs = self.fixture.call("/_fixture/requests?since=" + str(since))
            write_json(self.ui.out / "suite-artist-held-requests.json", logs)
            queries = [r for r in logs["requests"] if r.get("artistTrackQuery")]
            unbounded = [r for r in queries if r.get("unboundedTrackQuery")]
            bounded = [r for r in queries if not r.get("unboundedTrackQuery") and r.get("status") == 200]
            assert any(r["query"].get("limit") == ["5"] for r in bounded), "No real bounded top-track request completed"
            result = {"unbounded": unbounded, "bounded": bounded, "pending": logs["pending"],
                      "tracksVisibleWhileHeld": self.has(root, "8 Tracks"),
                      "topTracksVisibleWhileHeld": self.has(root, "Top Tracks"),
                      "captureAfterMs": round((time.monotonic() - start) * 1000, 1)}
            if self.features & 4:
                assert not unbounded and logs["pending"] == 0, "Artist page still issues unbounded track requests"
                assert result["tracksVisibleWhileHeld"] and result["topTracksVisibleWhileHeld"], "Bounded page did not populate"
                assert any(r["query"].get("limit") == ["1"] for r in bounded), "Missing bounded count request"
            else:
                assert unbounded and logs["pending"] > 0, "Expected original unbounded artist-page request not observed"
                assert not result["topTracksVisibleWhileHeld"], "Original Top Tracks unexpectedly resolved through held request"
            self.results["performance"] = result
        finally:
            self.fixture.call("/_fixture/release", method="POST")
        time.sleep(0.5)
        root = self.ui.capture("suite-artist-released")
        assert self.has(root, "8 Tracks") and self.has(root, "Top Tracks"), "Artist page did not populate after release"
        write_json(self.ui.out / "suite-artist-released-requests.json", self.fixture.call("/_fixture/requests?since=" + str(since)))

    def run(self, require_preserved=False, require_preserved_login=False):
        report = {"startedAt": utc(), "device": self.ui.identity, "expectedFeatures": self.features,
                  "bits": {"title": 1, "artistCredits": 2, "performance": 4}, "installed": self.ui.installed(),
                  "fixture": BASE_URL, "claim": "actual installed APK UI and observed HTTP requests"}
        try:
            self.login(require_preserved=require_preserved or require_preserved_login)
            if require_preserved:
                self.results["preservedBeforeChanges"] = self.preserved_title()
            self.credits()
            self.performance()
            self.titles()
            self.ui.launch(restart=True)
            self.results["preservedAfterRestart"] = self.preserved_title()
            self.results["appData"] = self.ui.snapshot_data()
            self.ui.launch()
            report["outcome"] = "PASS"
        except Exception as error:
            report["outcome"] = "FAIL"
            report["error"] = repr(error)
            try:
                self.ui.capture("suite-failure")
            except Exception as capture_error:
                report["captureError"] = repr(capture_error)
            raise
        finally:
            self.fixture.call("/_fixture/release", method="POST")
            report.update(finishedAt=utc(), results=self.results)
            write_json(self.ui.out / "acceptance-report.json", report)
        print(json.dumps({"outcome": report["outcome"], "report": str(self.ui.out / "acceptance-report.json")}), flush=True)
        return report

    def proof(self, resume=False):
        """Current native injection smoke/functional proof; no persistence matrix."""
        assert self.features == 7, "Proof command expects the three-feature snapshot"
        report = {"startedAt": utc(), "device": self.ui.identity, "installed": self.ui.installed(),
                  "expectedFeatures": 7, "scope": "native snapshot startup and immediate UI/HTTP behavior",
                  "upgradeDowngradeOrArtistSettingPersistenceTested": False}
        try:
            if resume:
                prior = json.loads((self.ui.out / "proof-report.json").read_text())
                assert prior["installed"]["sha256"] == report["installed"]["sha256"], "Proof APK changed before resume"
                assert "defaultArtistCredits" in prior["results"] and "performance" in prior["results"], "Startup/HTTP stages were not completed"
                prior_number = len(list(self.ui.out.glob("proof-prior-failure-*.json"))) + 1
                write_json(self.ui.out / ("proof-prior-failure-%03d.json" % prior_number), prior)
                self.results = prior["results"]
                report["resumedAfterEarlierAttempt"] = prior.get("error")
                self.ui.launch()
            else:
                self.login()
                root = self.album()
                expected = "Z Lead, A Guest, B Guest"
                row = next(n for n in root.iter("node") if "01 - Credit Order" in n.get("content-desc", "")
                           and not n.get("content-desc", "").startswith("Open Player Screen"))
                assert expected in row.get("content-desc"), "Native snapshot did not change default artist order"
                self.ui.capture("proof-album-artist-order")
                self.results["defaultArtistCredits"] = {"expected": expected, "actual": row.get("content-desc")}
                self.performance()
            self.titles(saved_title="Playlists")
            self.home()
            root, _ = self.ui.dump()
            if self.has(root, "Check out some commonly changed settings!"):
                self.ui.tap("Check out some commonly changed settings!")
                self.ui.tap("All Settings")
                self.ui.scroll_to("Layout & Theme")
                self.ui.tap("Layout & Theme")
                self.ui.scroll_to("Song artist order", contains=True)
                root = self.ui.capture("proof-song-artist-setting")
                self.results["artistSettingVisible"] = self.has(root, "Song artist order", True)
            else:
                self.results["artistSettingVisible"] = "not checked: onboarding settings shortcut absent"
            self.home()
            self.ui.capture("proof-final-home")
            pid = self.ui.adb("shell", "pidof", PACKAGE).strip().split()[0]
            log = self.ui.adb("logcat", "-d", "--pid=" + pid, "-v", "threadtime")
            (self.ui.out / "proof-logcat.txt").write_text(log)
            assert "FATAL EXCEPTION" not in log, "Fatal exception in proof APK process"
            report["outcome"] = "PASS"
        except Exception as error:
            report.update(outcome="FAIL", error=repr(error))
            try:
                self.ui.capture("proof-failure")
            except Exception as capture_error:
                report["captureError"] = repr(capture_error)
            raise
        finally:
            self.fixture.call("/_fixture/release", method="POST")
            report.update(results=self.results, finishedAt=utc())
            write_json(self.ui.out / "proof-report.json", report)
        print(json.dumps({"outcome": report["outcome"], "report": str(self.ui.out / "proof-report.json")}), flush=True)
        return report


class FinalMatrix:
    """Actual same-certificate update chain, after an explicitly fresh mask 0."""
    def __init__(self, out, signed_matrix, original_apk):
        self.out = safe_output_path(out)
        self.out.mkdir(parents=True, exist_ok=True)
        self.inputs = json.loads(Path(signed_matrix).read_text())
        certs = {entry["certificate_sha256"] for entry in self.inputs.values()}
        assert len(certs) == 1, "Provided signed matrix does not use one test certificate"
        self.native = {}
        for mask in (0, 1, 7):
            entry = self.inputs[str(mask)]
            apk = Path(entry["apk"])
            assert hashlib.sha256(apk.read_bytes()).hexdigest() == entry["sha256"], "Signed matrix APK hash differs"
            with zipfile.ZipFile(apk) as package:
                self.native[mask] = hashlib.sha256(package.read("lib/arm64-v8a/libapp.so")).hexdigest()
        assert self.native[7] == "9af3249be1360cdf3b7662137e2ca2daec90d004a59c978e9526edd42062c85e", "Not the final mask-7 native payload"
        original_apk = Path(original_apk).expanduser().resolve()
        assert hashlib.sha256(original_apk.read_bytes()).hexdigest() == ORIGINAL_SHA, "Official APK SHA mismatch"
        with zipfile.ZipFile(original_apk) as original:
            assert self.native[0] == hashlib.sha256(original.read("lib/arm64-v8a/libapp.so")).hexdigest(), "Mask 0 is not original native code"
        write_json(self.out / "matrix-inputs.json", {"provided": self.inputs, "independentlyHashedNative": self.native,
                                                    "certificateVerification": "provided metadata; Android install -r enforces actual signer compatibility"})

    @staticmethod
    def layout(scenario):
        scenario.settings()
        scenario.ui.scroll_to("Layout & Theme")
        scenario.ui.tap("Layout & Theme")

    def theme(self, scenario, set_dark=False):
        self.layout(scenario)
        ui = scenario.ui
        ui.scroll_to("Theme")
        root, _ = ui.dump()
        row = ui.find(root, "Theme")
        buttons = [n for n in row.iter("node") if n.get("class") == "android.widget.Button"
                   and n.get("text") in ("Follow system", "Light", "Dark")]
        assert len(buttons) == 1, "Actual theme dropdown missing"
        selected = buttons[0].get("text")
        if set_dark and selected != "Dark":
            ui.tap_descendant("Theme", selected)
            ui.tap("Dark")
            root, _ = ui.dump()
            selected = ui.find(ui.find(root, "Theme"), class_name="android.widget.Button").get("text")
        ui.capture("matrix-theme")
        assert selected == "Dark", "Synthetic Dark theme was lost"
        return selected

    def artist_mode(self, scenario):
        self.layout(scenario)
        ui = scenario.ui
        ui.scroll_to("Song artist order", contains=True)
        options = ("Album artists first", "Metadata order", "First credited artist first", "Alphabetical")
        for _ in range(4):
            root, _ = ui.dump()
            nodes = [n for n in root.iter("node") if n.get("class") == "android.widget.Button" and n.get("text") in options]
            for node in nodes:
                try:
                    ui.tap_bounds(node)
                    ui.capture("matrix-artist-mode")
                    return node.get("text")
                except ValueError:
                    pass
            ui.scroll()
        raise RuntimeError("No actual visible artist-mode selection")

    @staticmethod
    def credits(scenario, expected, label):
        root = scenario.album()
        rows = [n for n in root.iter("node") if "01 - Credit Order" in n.get("content-desc", "")
                and not n.get("content-desc", "").startswith("Open Player Screen")]
        assert len(rows) == 1 and expected in rows[0].get("content-desc").splitlines(), ("Incorrect credits", expected)
        scenario.ui.capture(label)
        return rows[0].get("content-desc")

    @staticmethod
    def aux_file(ui):
        path = "/data/user/0/" + PACKAGE + "/app_flutter/penguintrackartistordersettings.hive"
        # exec-out can carry a remote cat diagnostic as stdout. Prove a real
        # file size first, then require the binary read to have that exact size.
        size = ui.adb("shell", "su", "0", "stat", "-c", "%s", path, check=False).strip()
        if not size.isdecimal():
            return {"present": False, "bytes": 0, "sha256": None, "verifiedSizeFromStat": False}
        raw = ui.adb("exec-out", "su", "0", "cat", path, binary=True)
        assert len(raw) == int(size), "Auxiliary file read differs from actual stat size"
        return {"present": True, "bytes": len(raw), "sha256": hashlib.sha256(raw).hexdigest(), "verifiedSizeFromStat": True}

    def run(self):
        report = {"startedAt": utc(), "sequence": [0, 7, 1, 7, 0, 7], "stages": [],
                  "sameSignerMetadata": self.inputs["0"]["certificate_sha256"],
                  "onlyInstallRInsideChain": True, "initialOldProofCleanupOutsideChain": True,
                  "sourceAndCliAllSevenNotClaimedByThisScript": True}
        try:
            for index, mask in enumerate(report["sequence"]):
                ui = Android(self.out / ("%02d-mask%d" % (index, mask)))
                installed = ui.installed()
                if index == 0:
                    assert installed and installed["sha256"] == self.inputs["0"]["sha256"], "Start from explicitly fresh re-signed original mask 0"
                else:
                    ui.adb("shell", "am", "force-stop", PACKAGE)
                    installed = ui.install(self.inputs[str(mask)]["apk"], self.inputs[str(mask)]["sha256"])
                scenario = Acceptance(ui, mask)
                scenario.login(require_preserved=index > 0)
                stage = {"index": index, "mask": mask, "installed": installed, "nativeSha256": self.native[mask],
                         "login": scenario.results["login"], "theme": self.theme(scenario, set_dark=index == 0)}
                report["stages"].append(stage)
                write_json(self.out / "update-chain-report.json", report)
                if index == 1:
                    stage["defaultCredits"] = self.credits(scenario, "Z Lead, A Guest, B Guest", "matrix-default-credits")
                    scenario.performance()
                    scenario.titles()
                    stage["core7"] = scenario.results
                    scenario.set_artist_mode("Metadata order")
                    stage["selectedMetadataCredits"] = self.credits(scenario, "B Guest, Z Lead, A Guest", "matrix-selected-metadata")
                    scenario.login(require_preserved=True)  # Cold process restart, no reauthentication.
                    stage["themeAfterColdRestart"] = self.theme(scenario)
                    stage["artistModeAfterColdRestart"] = self.artist_mode(scenario)
                    assert stage["artistModeAfterColdRestart"] == "Metadata order", "Final auxiliary preference did not survive cold restart"
                elif mask & 2:
                    stage["restoredArtistMode"] = self.artist_mode(scenario)
                    assert stage["restoredArtistMode"] == "Metadata order", "Artist mode lost across feature-off/original version"
                    stage["restoredCredits"] = self.credits(scenario, "B Guest, Z Lead, A Guest", "matrix-restored-metadata")
                else:
                    stage["featureOffCredits"] = self.credits(scenario, "A Guest, B Guest, Z Lead", "matrix-original-credits")
                stage["auxiliaryBox"] = self.aux_file(ui)
                if index >= 1:
                    assert stage["auxiliaryBox"]["present"], "Auxiliary preference file disappeared during update chain"
                stage["finishedAt"] = utc()
                write_json(self.out / "update-chain-report.json", report)
                print(json.dumps({"stagePassed": index, "mask": mask, "theme": stage["theme"]}), flush=True)
            scenario.home()
            ui.capture("matrix-final-home")
            report["outcome"] = "PASS"
        except Exception as error:
            report.update(outcome="FAIL", error=repr(error))
            try:
                ui.capture("matrix-failure")
            except Exception as capture_error:
                report["captureError"] = repr(capture_error)
            raise
        finally:
            report["finishedAt"] = utc()
            write_json(self.out / "update-chain-report.json", report)
        return report

    def original_title_roundtrip(self):
        """Short original-code #1798 probe, restoring final 7 without data cleanup."""
        ui = Android(self.out / "original-title-probe")
        assert ui.installed()["sha256"] == self.inputs["7"]["sha256"], "Complete the final chain first"
        report = {"startedAt": utc(), "extraSequence": [7, 0, 7], "onlyInstallR": True,
                  "purpose": "Original Playlists live-state regression before IME hide, not a new validity rule"}
        try:
            ui.adb("shell", "am", "force-stop", PACKAGE)
            report["originalInstalled"] = ui.install(self.inputs["0"]["apk"], self.inputs["0"]["sha256"])
            scenario = Acceptance(ui, 0)
            scenario.login(require_preserved=True)
            report["originalTheme"] = self.theme(scenario)
            scenario.custom_settings()
            root, _ = ui.dump()
            assert scenario.has(root, TITLE), "Seeded title disappeared on original code"
            ui.tap_descendant(TITLE, "Edit section")
            ui.scroll_to(None, class_name="android.widget.EditText")
            ui.scroll_to("Save", allow_disabled=True)
            ui.type_text("", index=0, replace=True)
            root = ui.capture("original-live-cleared")
            report["clearedBeforeImeHide"] = {"text": ui.find(root, class_name="android.widget.EditText").get("text", ""),
                                               "saveEnabled": scenario.exact(root, "Save").get("enabled") == "true"}
            ui.hide_ime()  # Settle empty state once, then test ordinary nonempty typing live.
            ui.type_text("Playlists", index=0, replace=True)
            root = ui.capture("original-live-playlists")
            report["playlistsBeforeImeHide"] = {"text": ui.find(root, class_name="android.widget.EditText").get("text"),
                                                 "saveEnabled": scenario.exact(root, "Save").get("enabled") == "true"}
            report["originalStaleSaveReproduced"] = (report["clearedBeforeImeHide"]["saveEnabled"]
                                                      and not report["playlistsBeforeImeHide"]["saveEnabled"])
            report["noProbeTitleWasSaved"] = True
        finally:
            ui.adb("shell", "am", "force-stop", PACKAGE)
            report["restoredInstalled"] = ui.install(self.inputs["7"]["apk"], self.inputs["7"]["sha256"])
            restored = Acceptance(ui, 7)
            restored.login(require_preserved=True)
            report["restoredTheme"] = self.theme(restored)
            report["restoredArtistMode"] = self.artist_mode(restored)
            assert report["restoredArtistMode"] == "Metadata order", "Auxiliary mode lost in the title-baseline roundtrip"
            ui.tap("Metadata order", class_name="android.widget.Button")
            root = ui.capture("final-artist-mode-options")
            report["artistMenuOptionsVisible"] = [name for name in ("Album artists first", "Metadata order", "First credited artist first", "Alphabetical")
                                                   if restored.has(root, name)]
            ui.back()
            restored.home()
            ui.capture("final-handoff-home")
            report["auxiliaryBox"] = self.aux_file(ui)
            report["finishedAt"] = utc()
            write_json(self.out / "original-title-roundtrip.json", report)
        assert report["originalStaleSaveReproduced"], "Original live Save bug was not reproduced; examine actual captures"
        report["outcome"] = "PASS"
        write_json(self.out / "original-title-roundtrip.json", report)
        return report


def make_parser():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--adb", type=Path, help="ADB binary; otherwise ANDROID_SDK_ROOT, ANDROID_HOME, then PATH")
    parser.add_argument("--aapt2", type=Path, help="Existing aapt2 binary if not under the configured SDK")
    parser.add_argument("--out-root", type=Path, default=OUT_ROOT, help="Safety root, restricted to this repo's .scratch")
    parser.add_argument("--out", type=Path, help="Evidence directory under --out-root (default: the safety root)")
    parser.add_argument("--expected-features", type=int, choices=range(8), default=0,
                        help="bitmask: title=1, artist credits=2, bounded artist page=4")
    sub = parser.add_subparsers(dest="command", required=True)
    for command in ("verify", "launch", "restart", "back", "hide-ime", "self-check"):
        sub.add_parser(command)
    fixture_parser = sub.add_parser("start-fixture")
    fixture_parser.add_argument("--profile", choices=("credits", "navigation", "player"), default="credits")
    inspect = sub.add_parser("inspect")
    inspect.add_argument("--limit", type=int, choices=range(1, 51), default=12)
    inspect.add_argument("--contains", default="")
    install = sub.add_parser("install")
    install.add_argument("--apk", type=Path, required=True)
    install.add_argument("--sha256")
    install.add_argument("--clean", action="store_true", help="Explicitly authorized clean replacement of ONLY this synthetic package")
    install.add_argument("--baseline-data", type=Path, help="synthetic-app-data.json required before explicit --clean")
    capture = sub.add_parser("capture")
    capture.add_argument("label")
    tap = sub.add_parser("tap")
    tap.add_argument("label", nargs="?")
    tap.add_argument("--contains", action="store_true")
    tap.add_argument("--class-name")
    tap.add_argument("--index", type=int)
    tap.add_argument("--hold", action="store_true")
    text = sub.add_parser("type")
    text.add_argument("value")
    text.add_argument("--label")
    text.add_argument("--index", type=int)
    text.add_argument("--replace", action="store_true")
    scroll = sub.add_parser("scroll")
    scroll.add_argument("direction", choices=("up", "down"), default="up", nargs="?")
    suite = sub.add_parser("suite", help="Run actual APK checks according to --expected-features")
    suite.add_argument("--require-preserved", action="store_true", help="Fail if login/title from a prior install was lost")
    suite.add_argument("--require-preserved-login", action="store_true", help="Require existing login without requiring the seeded custom title")
    proof = sub.add_parser("proof", help="Three-feature native snapshot UI smoke; deliberately excludes update/persistence matrix")
    proof.add_argument("--resume", action="store_true", help="Resume title/settings after completed startup/HTTP stages; preserve earlier attempt")
    chain = sub.add_parser("matrix-chain", help="Same-cert final 0->7->1->7->0->7 with login/theme and auxiliary mode preservation")
    chain.add_argument("--signed-matrix", type=Path, required=True)
    chain.add_argument("--apk", type=Path, required=True, help="Official original APK, checked against the pinned SHA-256")
    title_probe = sub.add_parser("original-title-roundtrip", help="Capture original live Playlists bug, restore final 7 with login/theme/mode")
    title_probe.add_argument("--signed-matrix", type=Path, required=True)
    title_probe.add_argument("--apk", type=Path, required=True, help="Official original APK")
    snapshot = sub.add_parser("snapshot-data", help="Read-only archive of this synthetic package after UI title/login seeding")
    snapshot.add_argument("--title-marker", default=TITLE)
    return parser


def pure_self_check():
    assert not Android.ime_visible("  mInputShown=false\n  mIsInputViewShown=true mStatusIcon=0")
    assert Android.ime_visible("  mInputShown=true\n  mIsInputViewShown=false")
    assert Android.clip_tap_bounds([260,1746,820,1872], [0,63,1080,1794]) == (260,1746,820,1794)
    for action in (lambda: Android.ime_visible("mIsInputViewShown=true"),
                   lambda: Android.clip_tap_bounds([0,1800,100,1900], [0,63,1080,1794]),
                   lambda: safe_output_path(REPO_ROOT / "outside-scratch")):
        try:
            action()
        except (RuntimeError, ValueError):
            pass
        else:
            raise AssertionError("Safety guard did not fail closed")
    assert safe_output_path(OUT_ROOT / "run") == (OUT_ROOT / "run").resolve()
    assert adb_candidates("sdk-adb", {}) == [Path("sdk-adb")]
    assert adb_candidates(environ={"ANDROID_HOME": "sdk"})[0].parent.name == "platform-tools"
    parser = make_parser()
    for invalid in (["install"], ["matrix-chain", "--apk", "original.apk"],
                    ["matrix-chain", "--signed-matrix", "matrix.json"],
                    ["--expected-features", "8", "suite"], ["--serial", "physical", "verify"]):
        with contextlib.redirect_stderr(io.StringIO()):
            try:
                parser.parse_args(invalid)
            except SystemExit as error:
                assert error.code == 2
            else:
                raise AssertionError("Parser accepted invalid/incomplete invocation: " + repr(invalid))
    args = parser.parse_args(["--adb", "sdk-adb", "--expected-features", "7", "suite", "--require-preserved-login"])
    assert args.adb == Path("sdk-adb") and args.expected_features == 7 and args.require_preserved_login
    args = parser.parse_args(["matrix-chain", "--apk", "original.apk", "--signed-matrix", "matrix.json"])
    assert args.apk == Path("original.apk") and args.signed_matrix == Path("matrix.json")
    assert (SERIAL, AVD, PORT) == ("emulator-5580", "penguin", 18961)
    print("PASS: pure parser, SDK discovery, output-root, IME and visible-tap guards (no ADB/UI)")


def main(argv=None):
    global ADB, AAPT2, OUT_ROOT
    parser = make_parser()
    args = parser.parse_args(argv)
    scratch = (REPO_ROOT / ".scratch").resolve()
    OUT_ROOT = args.out_root.expanduser().resolve()
    if not OUT_ROOT.is_relative_to(scratch):
        parser.error("--out-root must be inside this repository's .scratch directory")
    args.out = safe_output_path(args.out or OUT_ROOT)
    ADB, AAPT2 = args.adb, args.aapt2
    if args.command == "self-check":
        pure_self_check()
        return
    if args.command == "matrix-chain":
        FinalMatrix(args.out, args.signed_matrix, args.apk).run()
        return
    if args.command == "original-title-roundtrip":
        FinalMatrix(args.out, args.signed_matrix, args.apk).original_title_roundtrip()
        return
    android = Android(args.out)
    if args.command == "verify":
        print(json.dumps(android.identity))
    elif args.command == "start-fixture":
        fixture = FixtureControl()
        manifest = fixture.start(android, profile=args.profile)
        print(json.dumps({"baseUrl": manifest["baseUrl"], "process": str(fixture.directory / "process.json")}))
    elif args.command == "install":
        print(json.dumps(android.install(args.apk, args.sha256, args.clean, args.baseline_data)))
    elif args.command in ("launch", "restart"):
        android.launch(restart=args.command == "restart")
    elif args.command == "capture":
        android.capture(args.label)
    elif args.command == "inspect":
        labels = [n for n in android.labels(android.dump()[0]) if args.contains in n["text"] or args.contains in n["content-desc"]]
        print(json.dumps({"totalMatches": len(labels), "labels": labels[:args.limit]}, ensure_ascii=False))
    elif args.command == "tap":
        android.tap(args.label, contains=args.contains, class_name=args.class_name, index=args.index, hold=args.hold)
    elif args.command == "type":
        android.type_text(args.value, args.label, index=args.index, replace=args.replace)
    elif args.command == "scroll":
        android.scroll(args.direction)
    elif args.command == "hide-ime":
        android.hide_ime()
    elif args.command == "back":
        android.back()
    elif args.command == "suite":
        Acceptance(android, args.expected_features).run(require_preserved=args.require_preserved,
                                                       require_preserved_login=args.require_preserved_login)
    elif args.command == "proof":
        Acceptance(android, args.expected_features).proof(resume=args.resume)
    elif args.command == "snapshot-data":
        metadata = android.snapshot_data(title_marker=args.title_marker)
        print(json.dumps({"metadata": str(android.out / "synthetic-app-data.json"), "installedSha256": metadata["installedSha256"]}))


if __name__ == "__main__":
    main()
