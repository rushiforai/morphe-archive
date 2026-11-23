"""Checks that each applied patch really changed the code of a patched Google Health APK.

A patch can apply without errors and still change nothing that matters, for example when a new
app version moves the code it looks for and it finds something else. This reads the patched APK's
code with dexdump and looks, for each patch, for the change it makes: the call to its extension,
the instructions it puts first in a method, or the code it takes out.

Usage:
    python .github/scripts/verify_google_health.py <patched.apk> --dexdump <dexdump> [--patch NAME ...]

Without --patch, every patch below is checked. Exits 0 when every check passed, 1 when one failed.
Also used by check_google_health.py.
"""
import argparse
import pathlib
import re
import subprocess
import sys
import tempfile
import zipfile

EXTENSION = "Lapp/jofslash/extension/googlehealth/"
SHOP_URL = "https://store.google.com/category/watches_trackers"
INSTRUCTION = re.compile(r"^[0-9a-f]+: [0-9a-f ]+\|[0-9a-f]+: (.*)$")
# dexdump ends an instruction with a comment such as "// string@1643" or "// method@b40d".
COMMENT = re.compile(r" // (?:string|method|field|type|call_site|proto|#)\S*$")


class Method:
    def __init__(self, cls, name, type_):
        self.cls, self.name, self.type, self.code = cls, name, type_, []

    def strings(self):
        return [m.group(1) for line in self.code for m in [re.match(r'const-string(?:/jumbo)? \w+, "(.*)"$', line)] if m]

    def __repr__(self):
        return f"{self.cls}->{self.name}{self.type}"


def methods(dumps):
    """Every method with code in the dexdump outputs."""
    for dump in dumps:
        cls = method = None
        with open(dump, encoding="utf8", errors="replace") as lines:
            for line in lines:
                line = line.rstrip("\n")
                if line.startswith("  Class descriptor  : '"):
                    cls = line.split("'")[1]
                elif line.startswith("      name          : '"):
                    if method and method.code:
                        yield method
                    method = Method(cls, line.split("'")[1], None)
                elif line.startswith("      type          : '") and method and method.type is None:
                    method.type = line.split("'")[1]
                else:
                    match = INSTRUCTION.match(line)
                    if match and method:
                        method.code.append(COMMENT.sub("", match.group(1)).strip())
            if method and method.code:
                yield method


def dump_dex(apk, dexdump, work):
    """Runs dexdump on every dex file of the APK; returns the output files."""
    outputs = []
    with zipfile.ZipFile(apk) as archive:
        names = sorted(n for n in archive.namelist() if re.fullmatch(r"classes\d*\.dex", n))
        for name in names:
            dex = pathlib.Path(work) / name
            dex.write_bytes(archive.read(name))
            out = dex.with_suffix(".txt")
            with open(out, "w", encoding="utf8") as handle:
                subprocess.run([dexdump, "-d", str(dex)], stdout=handle, stderr=subprocess.DEVNULL, check=True)
            dex.unlink()
            outputs.append(out)
    return outputs


def enum_fields(clinit, names):
    """name -> static field, for the enum constants in a class initializer."""
    fields = {}
    for i, line in enumerate(clinit.code):
        match = re.match(r'const-string(?:/jumbo)? \w+, "(.*)"$', line)
        if not match or match.group(1) not in names:
            continue
        for later in clinit.code[i + 1:]:
            put = re.match(rf"sput-object \w+, {re.escape(clinit.cls)}\.(\w+):", later)
            if put:
                fields[match.group(1)] = put.group(1)
                break
    return fields


def starts_with(method, *patterns):
    return len(method.code) >= len(patterns) and all(
        re.match(p, line) for p, line in zip(patterns, method.code))


def calls(method, target):
    return any(line.startswith("invoke-") and target in line for line in method.code)


def check(dumps, patches):
    """Returns {patch: problem or None} for the patches asked for."""
    # Pass 1: what each check looks for.
    found = {
        "gms_check": False, "gms_available": None, "installer": False, "screenshots": False,
        "black": False, "review": None, "links": None, "update": None, "surveys": None,
        "splash": None, "trial": None,
    }
    tab_enum = connections = None
    shop_handlers = set()
    menu_enum, menu_fields = None, {}
    section_fields = set()

    for m in methods(dumps):
        own = m.cls.startswith(EXTENSION)
        strings = m.strings()
        if not own and calls(m, f"{EXTENSION}GmsCoreCheck;.check"):
            found["gms_check"] = True
        if not own and calls(m, f"{EXTENSION}SpoofInstallerPatch;"):
            found["installer"] = True
        if not own and calls(m, f"{EXTENSION}AllowScreenshotsPatch;"):
            found["screenshots"] = True
        if not own and calls(m, f"{EXTENSION}BlackThemePatch;.black"):
            found["black"] = True
        if m.type == "(Landroid/content/Context;I)I" and any(s.startswith("The Google Play services resources were not found") for s in strings):
            found["gms_available"] = m
        if m.cls == "Lcom/google/android/play/core/review/ReviewManagerImpl;" and m.type.startswith(
                "(Landroid/app/Activity;Lcom/google/android/play/core/review/ReviewInfo;)"):
            found["review"] = m
        if m.type == "(Landroid/os/IBinder;)V" and "android.support.customtabs.extra.SESSION" in strings:
            found["links"] = m
        if m.name == "<init>" and m.type == "(IILandroid/app/PendingIntent;Landroid/app/PendingIntent;)V":
            found["update"] = m
        if "Could not get channel for trigger." in strings:
            found["surveys"] = m
        if "premium_3m_offer_splash_eligible" in strings and "PremiumNccExpiredBottomSheetViewModel" in m.cls:
            found["splash"] = m
        if "variation_f" in strings and "PremiumNccExpiredBottomSheetViewModel" in m.cls:
            found["trial"] = m
        if SHOP_URL in strings:
            shop_handlers.add(m.cls)
        if m.name == "<clinit>":
            if strings == ["CONNECTIONS", "PARTNER_APPS"]:
                tab_enum = m.cls
                connections = enum_fields(m, {"CONNECTIONS"}).get("CONNECTIONS")
            if {"MEDICAL_RECORDS_SETTINGS", "MEDICAL_RECORDS_ONBOARDING", "PARTNER_APPS"} <= set(strings):
                menu_enum = m.cls
                menu_fields = enum_fields(m, {"MEDICAL_RECORDS_SETTINGS", "MEDICAL_RECORDS_ONBOARDING"})
            if {"CONNECTIONS_APPS_AND_SERVICES", "CONNECTIONS_DEVICES"} <= set(strings):
                field = enum_fields(m, {"CONNECTIONS_APPS_AND_SERVICES"}).get("CONNECTIONS_APPS_AND_SERVICES")
                if field:
                    section_fields.add(f"{m.cls}.{field}")

    # Pass 2: code that the Shop devices and Medical records patches take out.
    shop_left = shop_made = 0
    menu_left = []
    card = None
    for m in methods(dumps):
        for i, line in enumerate(m.code):
            if tab_enum and connections and line.startswith("sget-object") and f"{tab_enum}.{connections}:" in line:
                if any(l.startswith("new-instance") and l.split(", ")[-1] in shop_handlers for l in m.code[i + 1:i + 41]):
                    shop_left += 1
            if line.startswith("new-instance") and line.split(", ")[-1] in shop_handlers:
                shop_made += 1
            if menu_enum and line.startswith("sget-object") and any(f"{menu_enum}.{f}:" in line for f in menu_fields.values()):
                following = m.code[i + 1] if i + 1 < len(m.code) else ""
                if following.startswith("invoke-") and ".add:(Ljava/lang/Object;)Z" in following:
                    menu_left.append(repr(m))
        if any(line.startswith("sget-object") and any(f"{f}:" in line for f in section_fields) for line in m.code) \
                and any("Ljava/util/Collections;.singleton:" in line for line in m.code):
            card = m

    def first_problem(*conditions):
        for ok, problem in conditions:
            if not ok:
                return problem
        return None

    results = {
        "GmsCore support": first_problem(
            (found["gms_check"], "the app doesn't call GmsCoreCheck.check"),
            (found["gms_available"] is not None, "isGooglePlayServicesAvailable wasn't found"),
            (found["gms_available"] is None or starts_with(found["gms_available"], r"const(?:/4|/16)? \w+, #(?:int|float) 0$", r"return \w+"),
             "isGooglePlayServicesAvailable doesn't return 0 first"),
        ),
        "Spoof installer": first_problem((found["installer"], "the app doesn't call SpoofInstallerPatch")),
        "Allow screenshots": first_problem((found["screenshots"], "the app doesn't call AllowScreenshotsPatch")),
        "Black theme": first_problem((found["black"], "the color scheme doesn't call BlackThemePatch.black")),
        "Disable review prompts": first_problem(
            (found["review"] is not None, "ReviewManagerImpl's launch method wasn't found"),
            (found["review"] is None or starts_with(found["review"], r"const/4 \w+, #int 0", r"invoke-static", r"move-result-object", r"return-object"),
             "the review launch doesn't return at once"),
        ),
        "Open links in browser": first_problem(
            (found["links"] is not None, "the custom tabs session method wasn't found"),
            (found["links"] is None or starts_with(found["links"], r"return-void"), "the session method doesn't return at once"),
        ),
        "Disable update prompts": first_problem(
            (found["update"] is not None, "the AppUpdateInfo constructor wasn't found"),
            (found["update"] is None or starts_with(found["update"], r"const/4 \w+, #int 1"),
             "AppUpdateInfo doesn't start with UPDATE_NOT_AVAILABLE"),
        ),
        "Disable surveys": first_problem(
            (found["surveys"] is not None, "the survey trigger request wasn't found"),
            (found["surveys"] is None or starts_with(found["surveys"], r"const/4 \w+, #int 5", r"invoke-virtual", r"return-void"),
             "the survey trigger request still runs"),
        ),
        "Hide Premium offer sheets": first_problem(
            (found["splash"] is not None and found["trial"] is not None, "the Premium sheet methods weren't found"),
            (found["splash"] is None or starts_with(found["splash"], r"sget-object \w+, Ljava/lang/Boolean;\.FALSE", r"return-object"),
             "the 3 months offer check doesn't return false"),
            (found["trial"] is None or starts_with(found["trial"], r"const/4 \w+, #int 0", r"return-object"),
             "the trial ending check doesn't return null"),
        ),
        "Hide Shop devices": first_problem(
            (tab_enum is not None and connections is not None, "the Connections tabs weren't found"),
            (bool(shop_handlers) and shop_made > 0, "the Shop devices click handler wasn't found"),
            (shop_left == 0, f"the button is still drawn for the Connections tab ({shop_left} place)"),
        ),
        "Hide Medical records": first_problem(
            (menu_enum is not None and len(menu_fields) == 2, "the account menu entries weren't found"),
            (not menu_left, "Medical records is still added to the account menu in " + ", ".join(menu_left)),
            (card is not None, "the Medical records card wasn't found"),
            (card is None or any("Ljava/util/Collections;.emptySet:" in line for line in card.code),
             "the Medical records card is still made"),
        ),
    }
    return {name: results[name] for name in patches if name in results}


CHECKED = [
    "GmsCore support", "Spoof installer", "Allow screenshots", "Black theme", "Disable review prompts",
    "Open links in browser", "Disable update prompts", "Disable surveys", "Hide Premium offer sheets",
    "Hide Shop devices", "Hide Medical records",
]


def verify(apk, dexdump, patches):
    """Prints a line for each patch; returns whether every check passed."""
    with tempfile.TemporaryDirectory() as work:
        results = check(dump_dex(apk, dexdump, work), patches)
    for name in patches:
        if name not in results:
            continue
        problem = results[name]
        print(f"  {'ok     ' if problem is None else 'CHANGED NOTHING'}  {name}" + (f": {problem}" if problem else ""))
    return all(p is None for p in results.values())


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("apk")
    parser.add_argument("--dexdump", default="dexdump")
    parser.add_argument("--patch", action="append", help="Patch to check (default: every patch)")
    args = parser.parse_args()
    print("Checking the patched code ...")
    sys.exit(0 if verify(args.apk, args.dexdump, args.patch or CHECKED) else 1)


if __name__ == "__main__":
    main()
