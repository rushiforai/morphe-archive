#!/usr/bin/env python3
"""Verify the TomTom Morphe fingerprints against TomTom+GO+Expert_+Truck+GPS_3.6.326_APKPure.apk.

Checks that every class/method the patches target still exists, still has the
expected shape, and still contains the string markers the fingerprints rely
on. Run this before retargeting a new TomTom version.

Usage:
  pip install androguard
  python3 verify.py --apk "/home/george/builds/songsterrpatch/TomTom+GO+Expert_+Truck+GPS_3.6.326_APKPure.apk"
"""
import argparse
import logging
import pathlib
import re
import zipfile

logging.disable(logging.CRITICAL)


def load_apk(path: pathlib.Path):
    from androguard.misc import AnalyzeAPK
    return AnalyzeAPK(str(path))


def esc(cls: str) -> str:
    # androguard treats the class argument as a regex; $ in Kotlin names must
    # be escaped so Lqb/a$b; is not interpreted as an end anchor.
    return "^" + re.escape(cls).replace("\\$", "\\$") + "$"


def find_methods(dx, classname, methodname):
    return list(dx.find_methods(classname=esc(classname), methodname="^" + re.escape(methodname) + "$"))


def method_text(dx, classname, methodname):
    for m in find_methods(dx, classname, methodname):
        vm = m.get_method()
        try:
            code = vm.get_code()
            if code is None:
                continue
            return " ".join(ins.get_output() for ins in code.get_bc().get_instructions())
        except Exception:
            continue
    return ""


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument(
        "--apk",
        default="/home/george/builds/songsterrpatch/TomTom+GO+Expert_+Truck+GPS_3.6.326_APKPure.apk",
    )
    args = ap.parse_args()
    apk_path = pathlib.Path(args.apk)
    print(f"analyzing {apk_path} ... (androguard, ~1-2 min first run)")
    a, d, dx = load_apk(apk_path)
    print(f"package={a.get_package()} version={a.get_androidversion_name()} code={a.get_androidversion_code()}")

    failures = []

    def check(label, ok, detail=""):
        print(f"[{'PASS' if ok else 'FAIL'}] {label} {detail}")
        if not ok:
            failures.append(label)

    # --- package identity -------------------------------------------------
    check("package is com.tomtom.gplay.navapp", a.get_package() == "com.tomtom.gplay.navapp")
    check("version is 3.6.326", a.get_androidversion_name() == "3.6.326")
    check("versionCode is 1678737", str(a.get_androidversion_code()) == "1678737")

    with zipfile.ZipFile(apk_path) as z:
        natives = [n for n in z.namelist() if n.startswith("lib/") and n.endswith(".so")]
    check("no native libraries (patch is pure bytecode)", not natives, f"(found {len(natives)})")

    # --- subscription stack ----------------------------------------------
    check("qb/a$b.invoke exists", len(find_methods(dx, "Lqb/a$b;", "invoke")) >= 1)
    txt = method_text(dx, "Lqb/a$b;", "invoke")
    check("qb/a$b.invoke has 'activeSubscriptionsExistenceList' marker",
          "activeSubscriptionsExistenceList" in txt)
    check("qb/a$b.invoke is the boolean combiner", "isEmpty" in txt and "Boolean" in txt)

    check("N9/c.invoke exists", len(find_methods(dx, "LN9/c;", "invoke")) >= 1)
    txt = method_text(dx, "LN9/c;", "invoke")
    check("N9/c.invoke maps subscription list", "subscriptions" in txt and "Ltb/d;->" in txt)

    check("tb/d.f exists (isTrial)", len(find_methods(dx, "Ltb/d;", "f")) >= 1)
    txt = method_text(dx, "Ltb/d;", "f")
    check("tb/d.f compares against TRIAL type", "Ltb/a$b;->c" in txt)

    check("H9/G0.e exists (SubscriptionHook)", len(find_methods(dx, "LH9/G0;", "e")) >= 1)
    txt = method_text(dx, "LH9/G0;", "e")
    check("H9/G0.e has onboarding marker",
          "com.tomtom.navui.setting.MOBILE_ONBOARDING_FLOW_COMPLETED" in txt)
    check("H9/G0.e can finish without a screen", "Lv9/n;->c()V" in txt and "LQ8/c;->a" in txt)

    check("x9/x0.a exists (truck settings observer)", len(find_methods(dx, "Lx9/x0;", "a")) >= 1)
    txt = method_text(dx, "Lx9/x0;", "a")
    check("x9/x0.a writes show_full_vehicle_profile",
          "com.tomtom.navui.setting.show_full_vehicle_profile" in txt)
    check("x9/x0.a writes TRUCK_SUBSCRIPTION_PURCHASED",
          "com.tomtom.mobile.TRUCK_SUBSCRIPTION_PURCHASED" in txt)

    check("x9/r0.a exists (profile revert observer)", len(find_methods(dx, "Lx9/r0;", "a")) >= 1)
    txt = method_text(dx, "Lx9/r0;", "a")
    check("x9/r0.a checks show_full_vehicle_profile",
          "com.tomtom.navui.setting.show_full_vehicle_profile" in txt)

    check("e9/K2.<init> exists (vehicle profile model)",
          len(find_methods(dx, "Le9/K2;", "<init>")) >= 1)
    txt = method_text(dx, "Le9/K2;", "<init>")
    check("e9/K2.<init> reads show_full_vehicle_profile",
          "com.tomtom.navui.setting.show_full_vehicle_profile" in txt)
    check("e9/K2.<init> stores it in field y2", "Le9/K2;->y2" in txt)

    check("e9/v2.J1 exists (trial card lookup)", len(find_methods(dx, "Le9/v2;", "J1")) >= 1)

    # --- My POIs patch targets -------------------------------------------
    check("hc/G.u exists (LaunchExternal menu action)", len(find_methods(dx, "Lhc/G;", "u")) >= 1)
    check("gc/B1$c.onLocationsRetrieved exists (My Places list)",
          len(find_methods(dx, "Lgc/B1$c;", "onLocationsRetrieved")) >= 1)
    check("gc/b1.f1 exists (location preview directives)",
          len(find_methods(dx, "Lgc/b1;", "f1")) >= 1)
    check("gc/P0.f1 exists (home screen directives)",
          len(find_methods(dx, "Lgc/P0;", "f1")) >= 1)

    with zipfile.ZipFile(apk_path) as z:
        names = set(z.namelist())
        for menu_file in ("res/xml/main_menu.xml", "res/xml/default_main_menu.xml"):
            check(f"{menu_file} exists (My POIs menu anchor)", menu_file in names)
        check("resources.arsc exists (My POIs label target)",
              "resources.arsc" in names)

    # --- SDKs -------------------------------------------------------------
    check("Purchasely present", len(find_methods(dx, "Lio/purchasely/ext/Purchasely;", "userSubscriptions")) >= 1)
    check("Purchasely GoogleStore present", len(dx.find_classes("Lio/purchasely/google/GoogleStore;")) >= 1)

    print()
    if failures:
        print(f"{len(failures)} FAILURE(S):")
        for f in failures:
            print(" -", f)
        return 1
    print("All checks passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
