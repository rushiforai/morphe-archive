#!/usr/bin/env python3
"""Verify Sygic Morphe fingerprints against Sygic+GPS+Truck+&+Caravan_26.1.9_APKPure.apk.

Usage:
  pip install androguard
  python3 verify.py --apk "/home/george/builds/songsterrpatch/Sygic+GPS+Truck+&+Caravan_26.1.9_APKPure.apk"
"""
import argparse
import logging
import pathlib
import sys

logging.disable(logging.CRITICAL)


def load_apk(path: pathlib.Path):
    from androguard.misc import AnalyzeAPK
    a, d, dx = AnalyzeAPK(str(path))
    return a, d, dx


def find_methods(dx, classname, methodname):
    return list(dx.find_methods(classname=classname, methodname=methodname))


def method_contains(dx, classname, methodname, needles):
    for m in dx.find_methods(classname=classname, methodname=methodname):
        vm = m.get_method()
        try:
            code = vm.get_code()
            if code is None:
                continue
            hay = " ".join(ins.get_output() for ins in code.get_bc().get_instructions())
            if all(n in hay for n in needles):
                return True, hay
        except Exception:
            continue
    return False, ""


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--apk", default="/home/george/builds/songsterrpatch/Sygic+GPS+Truck+&+Caravan_26.1.9_APKPure.apk")
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

    check("package is com.sygic.truck", a.get_package() == "com.sygic.truck")
    check("version is 26.1.9", a.get_androidversion_name() == "26.1.9")
    check("versionCode is 261119003", str(a.get_androidversion_code()) == "261119003")

    G = "Lcom/sygic/aura/helpers/GoogleInAppPurchaseHelper;"
    for name in ["isBillingSupported", "areSubscriptionsSupported", "buyDone",
                 "handlePurchases", "restorePurchase", "getProductDetails",
                 "handleAllPurchases", "handleAcknowledgePurchase"]:
        ms = find_methods(dx, G, f"^{name}$")
        check(f"GoogleHelper.{name} exists", len(ms) >= 1, f"(found {len(ms)})")

    ok, _ = method_contains(dx, G, "^isBillingSupported$", ["isBillingSupported() - "])
    check("isBillingSupported contains log marker", ok)
    ok, _ = method_contains(dx, G, "^buyDone$", ["buyDone: "])
    check("buyDone contains log marker", ok)
    ok, _ = method_contains(dx, G, "^handlePurchases$", ["handlePurchases: responseCode: ", "ProcessStoreResponse"])
    check("handlePurchases calls ProcessStoreResponse", ok)
    ok, _ = method_contains(dx, G, "^areSubscriptionsSupported$", ["areSubscriptionsSupported() responseCode: "])
    check("areSubscriptionsSupported marker", ok)

    B = "Lcom/sygic/aura/feature/store/LowStoreFeatureBase;"
    for name in ["isEnabled", "isSupported", "buyDone", "restorePurchases"]:
        ms = find_methods(dx, B, f"^{name}$")
        check(f"LowStoreBase.{name} exists", len(ms) >= 1, f"(found {len(ms)})")

    S = "Lcom/sygic/aura/SygicMain;"
    for name in ["StoreIsEnabled", "StoreIsSupported", "StoreBuyDone",
                 "StoreRestorePurchases", "ProcessStoreResponse", "GetProductRecordSet"]:
        ms = find_methods(dx, S, f"^{name}$")
        check(f"SygicMain.{name} exists", len(ms) >= 1, f"(found {len(ms)})")

    ok, _ = method_contains(dx, "Lcom/sygic/aura/sidebar/SidebarServiceImpl;",
                            "^checkLicense$", ["nCheckLicenseKey"])
    check("Sidebar checkLicense delegates to native", ok)

    print()
    if failures:
        print(f"{len(failures)} FAILURES: {failures}")
        return 1
    print("All fingerprints verified against this APK.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
