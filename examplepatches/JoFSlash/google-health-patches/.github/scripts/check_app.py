"""Checks a Google Health version against this bundle in one go.

It applies every patch to the APKM with the Morphe CLI, lists the patches that no longer apply
and why, and says whether the version is already listed as supported. With --install it also installs
the patched app on a phone or emulator over adb, starts it and looks for a crash at start.

Usage:
    python .github/scripts/check_app.py <google-health.apkm> --cli <morphe-cli.jar> [--mpp <bundle.mpp>]
        [--install [--expect-welcome]] [--clone] [--dexdump <dexdump>] [--adb <adb>]

With --install, Clone app is left out (it would install under another package name), unless --clone
is given: then the clone is installed and started under its package name. With --dexdump, the patched
code is checked for the change each applied patch makes (verify_patched.py). The emulator test in
.github/workflows/emulator.yml runs this with --install --expect-welcome, with and without --clone.

Build the bundle first (./gradlew buildAndroid); by default the newest .mpp in patches/build/libs is used.
"""
import argparse
import json
import pathlib
import re
import subprocess
import sys
import tempfile
import time

ROOT = pathlib.Path(__file__).resolve().parents[2]
CONSTANTS = ROOT / "patches/src/main/kotlin/app/jofslash/patches/googlehealth/shared/Constants.kt"
PACKAGE = "com.fitbit.FitbitMobile"
# The clone's default package name (Clone app's packageName option).
CLONE_PACKAGE = PACKAGE + ".clone"
# The package that is installed and started: PACKAGE, or CLONE_PACKAGE with --clone.
TARGET = PACKAGE


def newest_mpp():
    files = [f for f in (ROOT / "patches/build/libs").glob("*.mpp")
             if "javadoc" not in f.name and "sources" not in f.name]
    if not files:
        sys.exit("No .mpp in patches/build/libs. Run ./gradlew buildAndroid first, or pass --mpp.")
    return max(files, key=lambda f: f.stat().st_mtime)


def patch_names(cli=None, mpp=None):
    """The patches in the bundle itself; patches-list.json is only updated by a release."""
    if cli and mpp:
        run = subprocess.run(["java", "-jar", cli, "list-patches", f"--patches={mpp}"],
                             capture_output=True, text=True, encoding="utf8", errors="replace")
        names = re.findall(r"^Name: (.+)$", run.stdout, re.M)
        if names:
            return [n.strip() for n in names]
    return [p["name"] for p in json.loads((ROOT / "patches-list.json").read_text(encoding="utf8"))["patches"]]


def listed_versions():
    return re.findall(r'AppTarget\(version = "([^"]+)"', CONSTANTS.read_text(encoding="utf8"))


def describe(failure):
    if isinstance(failure, str):
        return failure, ""
    name = failure.get("name") or failure.get("patch") or "?"
    error = failure.get("error") or failure.get("message") or json.dumps(failure)
    return name, str(error).strip().splitlines()[0][:300]


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("apk", help="Google Health APKM to check")
    parser.add_argument("--cli", required=True, help="Morphe CLI or Morphe Desktop jar")
    parser.add_argument("--mpp", help="Bundle to check (default: newest in patches/build/libs)")
    parser.add_argument("--install", action="store_true", help="Install on a phone and look for a crash at start")
    parser.add_argument("--adb", default="adb", help="Path to adb")
    parser.add_argument("--expect-welcome", action="store_true",
                        help="With --install: also require the welcome screen with its sign-in button (a fresh install)")
    parser.add_argument("--compare-original", action="store_true",
                        help="With --install: when the check fails, try the original app the same way")
    parser.add_argument("--exclude", action="append", default=[], metavar="PATCH",
                        help="Leave this patch out (can be given more than once)")
    parser.add_argument("--clone", action="store_true",
                        help="Also apply Clone app, and with --install start the clone")
    parser.add_argument("--dexdump", help="dexdump, to check that each applied patch changed the code")
    args = parser.parse_args()
    global TARGET
    if args.clone:
        TARGET = CLONE_PACKAGE

    mpp = pathlib.Path(args.mpp) if args.mpp else newest_mpp()
    work = pathlib.Path(tempfile.mkdtemp(prefix="google-health-check-"))
    result_file, out_apk = work / "result.json", work / "patched.apk"

    names = patch_names(args.cli, mpp)
    if args.install and not args.clone:
        # Clone app would install under another package name than the one started below.
        names = [n for n in names if n != "Clone app"]
    unknown = [n for n in args.exclude if n not in names]
    if unknown:
        sys.exit("Not in the bundle: " + ", ".join(unknown))
    names = [n for n in names if n not in args.exclude]
    command = ["java", "-jar", args.cli, "patch", f"-p={mpp}"]
    command += [f"-e={name}" for name in names]
    # A patch that is on by default is applied unless it is turned off by name.
    command += [f"-d={name}" for name in args.exclude]
    # -f: also try versions that are not listed yet; keep going so every failure shows up.
    command += ["-f", "--continue-on-error"]
    # Only an installed APK needs a signature.
    if not args.install:
        command.append("--unsigned")
    command += [f"-r={result_file}", f"-o={out_apk}", f"-t={work / 'tmp'}", args.apk]
    print(f"Patching {pathlib.Path(args.apk).name} with {mpp.name} ...")
    run = subprocess.run(command, capture_output=True, text=True, encoding="utf8", errors="replace")
    (work / "patch.log").write_text(run.stdout + run.stderr, encoding="utf8")

    if not result_file.exists():
        print(run.stdout[-3000:] + run.stderr[-3000:])
        sys.exit(f"Patching did not finish. Full log: {work / 'patch.log'}")

    result = json.loads(result_file.read_text(encoding="utf8"))
    if result.get("packageName") not in (PACKAGE, TARGET):
        sys.exit(f"\nThis is {result.get('packageName')}, not Google Health ({PACKAGE}).")
    version = result.get("packageVersion", "?")
    applied = result.get("appliedPatches", [])
    failed = [describe(f) for f in result.get("failedPatches", [])]
    # Patches that neither applied nor failed, for example because they were skipped.
    skipped = [n for n in names if n not in applied and n not in [f[0] for f in failed]]
    failed += [(n, "not applied") for n in skipped]
    listed = listed_versions()

    print(f"\nGoogle Health {version}: {len(applied)} of {len(names)} patches applied.")
    for name, error in failed:
        print(f"  FAILED  {name}: {error}")
    for step in result.get("stepResults", []):
        if not step.get("success", True):
            print(f"  Step {step.get('step')} failed: {step.get('error', '')}")
    if version in listed:
        print(f"{version} is already listed as supported in Constants.kt.")
    elif not failed:
        print(f"Every patch applies. Add AppTarget(version = \"{version}\") to Constants.kt, "
              "then try the patches in the app on a phone.")
    print(f"Log and patched APK: {work}")

    if args.dexdump and out_apk.exists():
        sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
        import verify_patched
        print("\nChecking that each applied patch changed the code ...")
        if not verify_patched.verify(str(out_apk), args.dexdump, applied):
            failed.append(("patched code", "an applied patch changed nothing (see above)"))

    if args.install and out_apk.exists():
        print("\nInstalling on the phone ...")
        ok = start_and_check(args.adb, [str(out_apk)], args.expect_welcome, patched=True)
        if not ok:
            # A slow emulator now and then misses the welcome screen or the start: one more try
            # (a real crash or patch error shows up again).
            print("\nTrying the patched app once more ...")
            ok = start_and_check(args.adb, [str(out_apk)], args.expect_welcome, patched=True)
        if not ok and args.compare_original:
            # Whether the app itself works here tells a broken patch from an Android version
            # the app doesn't support.
            print("\nTrying the original app, without the patches ...")
            TARGET = PACKAGE  # The original app has no clone package name.
            original =start_and_check(args.adb, apk_splits(args.apk, work), args.expect_welcome, patched=False)
            print("The original app works here, so the patches break it." if original else
                  "The original app fails here too, so it's not the patches.")
        if not ok:
            sys.exit(1)

    sys.exit(1 if failed else 0)


def apk_splits(apk, work):
    """The APK files to install the original app: the APK itself, or every split in an APKM."""
    if not apk.lower().endswith((".apkm", ".apks", ".xapk")):
        return [apk]
    import zipfile
    out = work / "original"
    out.mkdir(exist_ok=True)
    with zipfile.ZipFile(apk) as z:
        names = [n for n in z.namelist() if n.endswith(".apk") and "/" not in n]
        for n in names:
            z.extract(n, out)
    return [str(out / n) for n in names]


def start_and_check(adb, apks, expect_welcome, patched):
    """Installs, starts and checks the app; prints what went wrong. Returns whether it passed."""
    # The patched and the original app are signed differently, so one can't replace the other.
    subprocess.run([adb, "uninstall", TARGET], capture_output=True)
    command = [adb, "install-multiple", "-r", *apks] if len(apks) > 1 else [adb, "install", "-r", apks[0]]
    install = subprocess.run(command, capture_output=True, text=True)
    output = (install.stdout + install.stderr).strip()
    if "Success" not in output:
        # For example an older version over a newer one, or a different signature.
        print("Install failed: " + (output.splitlines()[-1] if output else "no output"))
        return False
    subprocess.run([adb, "logcat", "-c"])
    launch = [adb, "shell", "monkey", "-p", TARGET, "-c", "android.intent.category.LAUNCHER", "1"]
    subprocess.run(launch, capture_output=True)
    # A busy emulator can take a while, or miss the first launch: wait, and launch once more.
    pid = ""
    for second in range(45):
        time.sleep(1)
        pid = subprocess.run([adb, "shell", "pidof", TARGET], capture_output=True, text=True).stdout.strip()
        if pid and second >= 14:
            break
        if not pid and second == 15:
            subprocess.run(launch, capture_output=True)
    log = subprocess.run([adb, "logcat", "-d"], capture_output=True, text=True, errors="replace").stdout
    crashes = [line for line in log.splitlines()
               if re.search(r"FATAL EXCEPTION|VerifyError|Verifier rejected", line)]
    if crashes or not pid:
        print("The app crashed at start:" if crashes else "The app is not running after 45 seconds.")
        for line in crashes[:10]:
            print("  " + line)
        return False
    print("The app started and is running.")
    if expect_welcome:
        if not welcome_shown(adb):
            print("The welcome screen didn't show within a minute.")
            describe_screen(adb)
            return False
        print("The welcome screen with the sign-in button is on screen.")
    if patched:
        problems = patch_errors(adb, pid)
        if problems:
            print("Errors from the patches in the log:")
            for line in problems[:20]:
                print("  " + line)
            return False
        print("No errors from the patches in the log.")
    return True


def describe_screen(adb):
    """What is on the screen and the app's warnings, to see why it failed."""
    subprocess.run([adb, "shell", "uiautomator", "dump", "/sdcard/window.xml"], capture_output=True)
    screen = subprocess.run([adb, "shell", "cat", "/sdcard/window.xml"],
                            capture_output=True, text=True, errors="replace").stdout
    texts = [t for t in re.findall(r'(?:text|content-desc)="([^"]+)"', screen) if t.strip()]
    print("  On screen: " + (" | ".join(texts[:25]) if texts else "no text"))
    pid = subprocess.run([adb, "shell", "pidof", TARGET], capture_output=True, text=True).stdout.split()
    log = subprocess.run([adb, "logcat", "-d", "-v", "brief"], capture_output=True, text=True,
                         errors="replace").stdout
    mine = [l for l in log.splitlines() if pid and re.match(r"^[EW]/[^(]*\(\s*(%s)\)" % "|".join(pid), l)]
    for line in mine[-15:]:
        print("  " + line[:220])


def patch_errors(adb, pid):
    """Error lines our extension logged, and missing classes or methods in the app's process.

    The extension catches its own exceptions and logs them as E/JoFSlashPatches, so a patch that
    stops working on some Android version shows up here and not as a crash. A class or method that
    an older Android doesn't have shows up as NoSuchMethodError or NoClassDefFoundError.
    """
    log = subprocess.run([adb, "logcat", "-d", "-v", "brief"], capture_output=True, text=True,
                         errors="replace").stdout
    pids = set(pid.split())
    lines = log.splitlines()
    problems = []
    for i, line in enumerate(lines):
        if line.startswith("E/JoFSlashPatches"):
            problems.append(line)
            continue
        m = re.match(r"^[A-Z]/[^(]*\(\s*(\d+)\)", line)
        if not m or m.group(1) not in pids:
            continue
        if not re.search(r"NoSuchMethodError|NoClassDefFoundError|NoSuchFieldError|AbstractMethodError", line):
            continue
        # Only when the stack trace that follows goes through our code.
        if any("app.jofslash" in later for later in lines[i:i + 25]):
            problems.append(line)
    return problems


def welcome_shown(adb, timeout=60):
    """Whether the app's welcome screen is on screen: a fresh install starts there.

    The emulator's language is English, so the sign-in button's text is enough.
    """
    end = time.time() + timeout
    while time.time() < end:
        subprocess.run([adb, "shell", "uiautomator", "dump", "/sdcard/window.xml"], capture_output=True)
        screen = subprocess.run([adb, "shell", "cat", "/sdcard/window.xml"],
                                capture_output=True, text=True, errors="replace").stdout
        if re.search(r'text="Sign in with Google"', screen):
            return True
        dismiss_not_responding(adb, screen)
        time.sleep(5)
    return False


def dismiss_not_responding(adb, screen):
    """Taps Wait when a slow emulator shows "<some app> isn't responding" over the app."""
    if "isn&apos;t responding" not in screen and "isn't responding" not in screen:
        return
    button = re.search(r'text="Wait"[^>]*bounds="\[(\d+),(\d+)\]\[(\d+),(\d+)\]"', screen)
    if button:
        x1, y1, x2, y2 = map(int, button.groups())
        subprocess.run([adb, "shell", "input", "tap", str((x1 + x2) // 2), str((y1 + y2) // 2)],
                       capture_output=True)


if __name__ == "__main__":
    main()
