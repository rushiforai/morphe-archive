"""Checks an app version against this bundle in one go.

It applies every patch for the app to its APK or bundle (APKM, or .apks / .xapk: a zip with
base.apk and the splits) with the Morphe CLI, lists the patches that no longer apply and why, and
says whether the version is already listed as supported. With --install it also installs the
patched app on a phone or emulator over adb, starts it and looks for a crash at start.

Usage:
    python .github/scripts/check_app.py <app> <apk> --cli <morphe-cli.jar> [--mpp <bundle.mpp>]
        [--install [--expect-screen] [--compare-original]] [--exclude <patch> ...] [--adb <adb>]

<app> is the name of the app's settings in .github/apps/<app>.json (for example booking or quora).
The app's package name comes from its "package", its patches and Constants.kt from "patches", and
what is special about its check from "checks" (all optional):

- "error_tag": the start of the log lines that count as errors from the patches (default "E/JoF");
- "screen": with --expect-screen, a regular expression the screen dump must match, for example the
  welcome screen's sign-in button (default: any text of the app's own on screen);
- "screen_shown" and "screen_missing": what to print when that screen shows or doesn't;
- "grant": permissions to grant before the app starts, so their dialog doesn't hide its screen;
- "clone": the patch that installs the app under another package name ("patch"). It is left out
  with --install, since the app is started under its own package name. When "package" is given
  too, --clone applies it and starts the clone under that package name instead;
- "next_step" and "after_install": what to do by hand once every patch applies, and once the
  patched app passed on the phone.

An app that needs a check no other app has puts it in .github/scripts/apps/<app>.py. That module
can have add_arguments(parser), after_patch(check, out_apk, applied) (returns failures to add),
screen_shown(check) (replaces the "screen" match), after_screen(check) (more checks on the
patched app once its screen showed, returns whether they passed) and describe_screen(check)
(more to print when the check fails). The emulator tests run the commands in the app's "check".

Build the bundle first (./gradlew buildAndroid); by default the newest .mpp in patches/build/libs is used.
"""
import argparse
import importlib.util
import json
import pathlib
import re
import subprocess
import sys
import tempfile
import time

ROOT = pathlib.Path(__file__).resolve().parents[2]
APPS = ROOT / ".github" / "apps"
HOOKS = pathlib.Path(__file__).resolve().parent / "apps"


class Check:
    """One app's settings and the phone it is checked on, for this script and the app's hooks."""

    def __init__(self, key):
        path = APPS / f"{key}.json"
        if not path.exists():
            known = ", ".join(sorted(p.stem for p in APPS.glob("*.json")))
            sys.exit(f"No app {key} in .github/apps (there are {known}).")
        self.key = key
        self.app = json.loads(path.read_text(encoding="utf8"))
        self.name = self.app["name"]
        self.package = self.app["package"]
        self.checks = self.app.get("checks", {})
        self.constants = ROOT / self.app["patches"] / "shared" / "Constants.kt"
        # The package that is installed and started: the app's own, or the clone's with --clone.
        self.target = self.package
        self.adb = "adb"
        self.hooks = None
        hooks = HOOKS / f"{key}.py"
        if hooks.exists():
            spec = importlib.util.spec_from_file_location(f"check_hooks_{key.replace('-', '_')}", hooks)
            self.hooks = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(self.hooks)

    def hook(self, name):
        return getattr(self.hooks, name, None) if self.hooks else None

    def shell(self, *command, **kwargs):
        kwargs.setdefault("timeout", 30)
        return run([self.adb, *command], text=True, errors="replace", **kwargs)

    def screen(self):
        """The screen's view hierarchy as uiautomator dumps it."""
        self.shell("shell", "uiautomator", "dump", "/sdcard/window.xml")
        return self.shell("shell", "cat", "/sdcard/window.xml").stdout

    def dismiss_not_responding(self, screen):
        """Taps Wait when a slow emulator shows "<some app> isn't responding" over the app."""
        if "isn&apos;t responding" not in screen and "isn't responding" not in screen:
            return
        button = re.search(r'text="Wait"[^>]*bounds="\[(\d+),(\d+)\]\[(\d+),(\d+)\]"', screen)
        if button:
            x1, y1, x2, y2 = map(int, button.groups())
            self.shell("shell", "input", "tap", str((x1 + x2) // 2), str((y1 + y2) // 2))


def run(command, timeout=60, **kwargs):
    """subprocess.run with a time limit: a command that hangs (an adb call on a stuck emulator, a
    uiautomator dump that never sees the screen idle) gives empty output instead of hanging the check."""
    kwargs.setdefault("capture_output", True)
    try:
        return subprocess.run(command, timeout=timeout, **kwargs)
    except subprocess.TimeoutExpired:
        print(f"  ({' '.join(map(str, command[1:4]))} ... gave no answer within {timeout} s)", flush=True)
        empty = "" if kwargs.get("text") or kwargs.get("errors") or kwargs.get("encoding") else b""
        return subprocess.CompletedProcess(command, 1, empty, empty)


def newest_mpp():
    files = [f for f in (ROOT / "patches/build/libs").glob("*.mpp")
             if "javadoc" not in f.name and "sources" not in f.name]
    if not files:
        sys.exit("No .mpp in patches/build/libs. Run ./gradlew buildAndroid first, or pass --mpp.")
    return max(files, key=lambda f: f.stat().st_mtime)


def patch_names(check, cli=None, mpp=None):
    """This app's patches in the bundle itself; patches-list.json is only updated by a release.
    The bundle also has the other apps' patches, which never apply to this one."""
    if cli and mpp:
        run = subprocess.run(["java", "-jar", cli, "list-patches", f"--patches={mpp}",
                              f"--filter-package-name={check.package}"],
                             capture_output=True, text=True, encoding="utf8", errors="replace")
        names = re.findall(r"^Name: (.+)$", run.stdout, re.M)
        if names:
            return [n.strip() for n in names]
    return [p["name"] for p in json.loads((ROOT / "patches-list.json").read_text(encoding="utf8"))["patches"]
            if any(c.get("packageName") == check.package for c in p.get("compatiblePackages") or [])]


def listed_versions(check):
    return re.findall(r'AppTarget\(version = "([^"]+)"', check.constants.read_text(encoding="utf8"))


def describe(failure):
    if isinstance(failure, str):
        return failure, ""
    name = failure.get("name") or failure.get("patch") or "?"
    error = failure.get("error") or failure.get("message") or json.dumps(failure)
    return name, str(error).strip().splitlines()[0][:300]


def main():
    # In CI the output is a pipe: print each line as it comes, so a slow step shows where it is.
    sys.stdout.reconfigure(line_buffering=True)
    key = sys.argv[1] if len(sys.argv) > 1 and not sys.argv[1].startswith("-") else None
    check = Check(key) if key else None
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("app", help="The app's settings in .github/apps/<app>.json, for example booking")
    parser.add_argument("apk", help=f"{check.name if check else 'The app'}'s APK or bundle (.apkm, .apks, .xapk) to check")
    parser.add_argument("--cli", required=True, help="Morphe CLI or Morphe Desktop jar")
    parser.add_argument("--mpp", help="Bundle to check (default: newest in patches/build/libs)")
    parser.add_argument("--install", action="store_true", help="Install on a phone and look for a crash at start")
    parser.add_argument("--adb", default="adb", help="Path to adb")
    # --expect-welcome (Google Health) and --expect-login (Quora) are the names these apps' own
    # check scripts had for it.
    parser.add_argument("--expect-screen", "--expect-welcome", "--expect-login", dest="expect_screen",
                        action="store_true",
                        help="With --install: also require the app's own screen (not a blank or a system dialog)")
    parser.add_argument("--compare-original", action="store_true",
                        help="With --install: when the check fails, try the original app the same way")
    parser.add_argument("--exclude", action="append", default=[], metavar="PATCH",
                        help="Leave this patch out (can be given more than once)")
    clone = check.checks.get("clone", {}) if check else {}
    if clone.get("package"):
        parser.add_argument("--clone", action="store_true",
                            help=f"Also apply {clone['patch']}, and with --install start the clone")
    if check and check.hook("add_arguments"):
        check.hook("add_arguments")(parser)
    args = parser.parse_args()
    if check is None:
        check = Check(args.app)
    check.adb = args.adb
    check.args = args
    if getattr(args, "clone", False):
        check.target = clone["package"]

    mpp = pathlib.Path(args.mpp) if args.mpp else newest_mpp()
    work = pathlib.Path(tempfile.mkdtemp(prefix=f"{check.key}-check-"))
    result_file, out_apk = work / "result.json", work / "patched.apk"

    names = patch_names(check, args.cli, mpp)
    if clone and args.install and not getattr(args, "clone", False):
        # The clone patch would install under another package name than the one started below.
        names = [n for n in names if n != clone["patch"]]
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
    if result.get("packageName") not in (check.package, check.target):
        sys.exit(f"\nThis is {result.get('packageName')}, not {check.name} ({check.package}).")
    version = result.get("packageVersion", "?")
    applied = result.get("appliedPatches", [])
    failed = [describe(f) for f in result.get("failedPatches", [])]
    # Patches that neither applied nor failed, for example because they were skipped.
    skipped = [n for n in names if n not in applied and n not in [f[0] for f in failed]]
    failed += [(n, "not applied") for n in skipped]
    listed = listed_versions(check)

    print(f"\n{check.name} {version}: {len(applied)} of {len(names)} patches applied.")
    for name, error in failed:
        print(f"  FAILED  {name}: {error}")
    for step in result.get("stepResults", []):
        if not step.get("success", True):
            print(f"  Step {step.get('step')} failed: {step.get('error', '')}")
    if version in listed:
        print(f"{version} is already listed as supported in Constants.kt.")
    elif not failed:
        print(f"Every patch applies. Add AppTarget(version = \"{version}\") to Constants.kt, "
              + check.checks.get("next_step", "then try the patches in the app on a phone."))
    print(f"Log and patched APK: {work}")

    if check.hook("after_patch") and out_apk.exists():
        failed += check.hook("after_patch")(check, out_apk, applied)

    if args.install and out_apk.exists():
        print("\nInstalling on the phone ...")
        ok = start_and_check(check, [str(out_apk)], args.expect_screen, patched=True)
        if not ok:
            # A slow emulator now and then misses the app's screen or the start: one more try
            # (a real crash or patch error shows up again).
            print("\nTrying the patched app once more ...")
            ok = start_and_check(check, [str(out_apk)], args.expect_screen, patched=True)
        if not ok and args.compare_original:
            # Whether the app itself works here tells a broken patch from an Android (or WebView)
            # version the app doesn't support.
            print("\nTrying the original app, without the patches ...")
            check.target = check.package  # The original app has no clone package name.
            original = start_and_check(check, apk_splits(args.apk, work), args.expect_screen, patched=False)
            print("The original app works here, so the patches break it." if original else
                  "The original app fails here too, so it's not the patches.")
        if not ok:
            sys.exit(1)
        if check.checks.get("after_install"):
            print(check.checks["after_install"])

    sys.exit(1 if failed else 0)


def apk_splits(apk, work):
    """The APK files to install the original app: the APK itself, or every split in a bundle."""
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


def start_and_check(check, apks, expect_screen, patched):
    """Installs, starts and checks the app; prints what went wrong. Returns whether it passed."""
    adb, target = check.adb, check.target
    # The patched and the original app are signed differently, so one can't replace the other.
    print("  Uninstalling the old copy ...")
    run([adb, "uninstall", target])
    print("  Installing ...")
    command = [adb, "install-multiple", "-r", *apks] if len(apks) > 1 else [adb, "install", "-r", apks[0]]
    install = run(command, timeout=300, text=True)
    output = (install.stdout + install.stderr).strip()
    if "Success" not in output:
        # For example an older version over a newer one, or a different signature.
        print("Install failed: " + (output.splitlines()[-1] if output else "no output"))
        return False
    # For example the notification permission on Android 13 and newer, whose dialog would hide the
    # screen the check looks for (an older Android has no such permission and ignores this).
    for permission in check.checks.get("grant", []):
        run([adb, "shell", "pm", "grant", target, permission])
    run([adb, "logcat", "-c"])
    print("  Starting the app ...")
    launch = [adb, "shell", "monkey", "-p", target, "-c", "android.intent.category.LAUNCHER", "1"]
    run(launch)
    # A busy emulator can take a while, or miss the first launch: wait, and launch once more.
    pid = ""
    for second in range(45):
        time.sleep(1)
        pid = run([adb, "shell", "pidof", target], text=True).stdout.strip()
        if pid and second >= 14:
            break
        if not pid and second == 15:
            run(launch)
    log = run([adb, "logcat", "-d"], text=True, errors="replace").stdout
    crashes = [line for line in log.splitlines()
               if re.search(r"FATAL EXCEPTION|VerifyError|Verifier rejected", line)]
    if crashes or not pid:
        print("The app crashed at start:" if crashes else "The app is not running after 45 seconds.")
        for line in crashes[:10]:
            print("  " + line)
        return False
    print("The app started and is running.")
    if expect_screen:
        if not app_screen_shown(check):
            print(check.checks.get("screen_missing", "The app's screen didn't show within a minute."))
            describe_screen(check)
            return False
        print(check.checks.get("screen_shown", "The app's own screen is showing."))
        if patched and check.hook("after_screen") and not check.hook("after_screen")(check):
            describe_screen(check)
            return False
    if patched:
        problems = patch_errors(check, pid)
        if problems:
            print("Errors from the patches in the log:")
            for line in problems[:20]:
                print("  " + line)
            return False
        print("No errors from the patches in the log.")
    return True


def describe_screen(check):
    """What is on the screen and the app's warnings, to see why it failed."""
    adb = check.adb
    screen = check.screen()
    texts = [t for t in re.findall(r'(?:text|content-desc)="([^"]+)"', screen) if t.strip()]
    print("  On screen: " + (" | ".join(texts[:25]) if texts else "no text"))
    if check.hook("describe_screen"):
        check.hook("describe_screen")(check)
    pid = run([adb, "shell", "pidof", check.target], text=True).stdout.split()
    log = run([adb, "logcat", "-d", "-v", "brief"], text=True,
                         errors="replace").stdout
    mine = [l for l in log.splitlines() if pid and re.match(r"^[EW]/[^(]*\(\s*(%s)\)" % "|".join(pid), l)]
    for line in mine[-15:]:
        print("  " + line[:220])


def patch_errors(check, pid):
    """Error lines our extension logged, and missing classes or methods in the app's process.

    The extensions catch their own exceptions and log them as E/JoF... (the app's "error_tag"), so a
    patch that stops working on some Android version shows up here and not as a crash. A class or
    method that an older Android doesn't have shows up as NoSuchMethodError or NoClassDefFoundError.
    """
    tag = check.checks.get("error_tag", "E/JoF")
    log = run([check.adb, "logcat", "-d", "-v", "brief"], text=True,
                         errors="replace").stdout
    pids = set(pid.split())
    lines = log.splitlines()
    problems = []
    for i, line in enumerate(lines):
        if line.startswith(tag):
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


def app_screen_shown(check, timeout=60):
    """Whether the app's own screen is showing: the app's "screen" pattern when it has one, else
    some text in a view of the app's own package (on a fresh install that is usually the
    onboarding, a sign-in or cookie screen, or the home screen)."""
    if check.hook("screen_shown"):
        return check.hook("screen_shown")(check)
    pattern = check.checks.get("screen")
    own = re.compile(r'<node [^>]*package="%s"[^>]*>' % re.escape(check.target))
    end = time.time() + timeout
    while time.time() < end:
        screen = check.screen()
        if pattern:
            if re.search(pattern, screen):
                return True
        elif any(re.search(r'(?:text|content-desc)="[^"]+"', node) for node in own.findall(screen)):
            return True
        check.dismiss_not_responding(screen)
        time.sleep(5)
    return False


if __name__ == "__main__":
    main()
