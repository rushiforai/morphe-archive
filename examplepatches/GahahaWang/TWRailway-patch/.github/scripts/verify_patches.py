"""Checks that the patches were applied to a patched 火車時刻表 APK.

- Hide ads: the google_mobile_ads Flutter plugin's onMethodCall handler starts with the
  injected no-fill failure and early return for every `load*` method channel call.
- Hide review prompt: the arm64 libapp.so's AppController.canShowReview always returns false
  (`b` in place of `cbnz x2`), and the shared_preferences getBool implementations start with
  the injected overrides for the review dialog keys.
- Fix recent apps title: the Flutter embedding's setApplicationSwitcherDescription starts
  with the injected check that replaces an untranslated key label with the app's label.
- Expand search history: the arm64 libapp.so computes the visible search history limit as
  20 whatever the subscription state (`mov x0, #0x22` in place of `csetm x0, eq`), and the
  Flutter loader passes the engine a copy of libapp.so with the number set in the patch settings.
- Hide upgrade button: the arm64 libapp.so never branches to the subscribe button of the
  台鐵 and 高鐵 search pages (`nop` in place of `tbnz w0, #4`).
- Fix search history count: the arm64 libapp.so clamps the count next to 搜尋歷史 to 20, the search
  page passes 20 as its limit, and the badge text no longer loads "search.upgradeBadge".
- Hide promotions: the firebase_remote_config plugin calls the extension on the parameters
  it sends to Dart, just before every return, so the promotion popups stay turned off.
- Patch settings: the extension is merged, the Flutter loader and DartMessenger call it, every
  hook above first checks its setting, and the drawer's 廣告設定 label is renamed to 修補設定.
"""
import struct
import sys
import zipfile

from androguard.core.dex import DEX
from loguru import logger

logger.remove()  # androguard logs every parsed DEX section at DEBUG level.


def load_dex_files(apk_path):
    with zipfile.ZipFile(apk_path) as apk:
        names = sorted(n for n in apk.namelist() if n.startswith("classes") and n.endswith(".dex"))
        return [DEX(apk.read(name)) for name in names]


def find_handler(dex_files):
    for dex in dex_files:
        for class_def in dex.get_classes():
            for method in class_def.get_methods():
                if method.get_name() != "onMethodCall" or not method.get_code():
                    continue
                instructions = list(method.get_code().get_bc().get_instructions())
                outputs = [i.get_output() for i in instructions]
                if any('"loadBannerAd"' in o for o in outputs) and any('"MobileAds#initialize"' in o for o in outputs):
                    return class_def.get_name(), instructions
    return None, None


def find_review_hooks(dex_files):
    hooks = []
    for dex in dex_files:
        for class_def in dex.get_classes():
            for method in class_def.get_methods():
                if not method.get_code() or method.get_descriptor().split(")")[1] != "Ljava/lang/Boolean;":
                    continue
                head = [i.get_output() for i in list(method.get_code().get_bc().get_instructions())[:12]]
                if any('"shouldShowReviewKey"' in o for o in head) and any("->hideReviewPrompt()Z" in o for o in head) and any('"rateMyApp_doNotOpenAgain"' in o for o in head):
                    hooks.append(f"{class_def.get_name()}->{method.get_name()}{method.get_descriptor()}")
    return hooks


# mov x0, #5; sdiv x3, x1, x0; msub x2, x3, x0, x1; cmp x2, xzr; b.lt; cbnz x2 / b (return false);
# ldur x1, [fp, #-8].
REVIEW_CHECK_HEAD = bytes.fromhex("a00080d2230cc09a6284009b5f001feb cb050054".replace(" ", ""))
REVIEW_CHECK_TAIL = bytes.fromhex("a1835ff8")
REVIEW_CBNZ = bytes.fromhex("e20400b5")
REVIEW_B = bytes.fromhex("27000014")


def check_hide_review_prompt(apk_path, dex_files):
    hooks = find_review_hooks(dex_files)
    for hook in hooks:
        print(f"[OK] review prompt hook in {hook}")
    if not hooks:
        print("[MISSING] review prompt hook")
        return False

    with zipfile.ZipFile(apk_path) as apk:
        names = [n for n in apk.namelist() if n.startswith("lib/arm64-v8a/") and n.endswith("/libapp.so")]
        data = apk.read(names[0]) if names else b""
    patched = original = 0
    for start in find_aligned(data, REVIEW_CHECK_HEAD):
        if data[start + 24:start + 28] == REVIEW_CHECK_TAIL:
            branch = data[start + 20:start + 24]
            patched += branch == REVIEW_B
            original += branch == REVIEW_CBNZ
    print(f"[{'OK' if patched == 1 and original == 0 else 'MISSING'}] canShowReview returns false x{patched}, original x{original}")
    if patched != 1 or original != 0:
        return False
    print("Hide review prompt patch is applied")
    return True


def find_title_hooks(dex_files):
    hooks = []
    for dex in dex_files:
        for class_def in dex.get_classes():
            if not class_def.get_name().startswith("Lio/flutter/plugin/platform/"):
                continue
            for method in class_def.get_methods():
                if not method.get_code():
                    continue
                outputs = [i.get_output() for i in method.get_code().get_bc().get_instructions()]
                if not any("Landroid/app/Activity;->setTaskDescription" in o for o in outputs):
                    continue
                head = outputs[:20]
                if (any("Ljava/lang/String;->matches" in o for o in head) and any("loadLabel" in o for o in head)
                        and any("->fixRecentAppsTitle()Z" in o for o in head)):
                    hooks.append(f"{class_def.get_name()}->{method.get_name()}{method.get_descriptor()}")
    return hooks


def check_fix_recent_apps_title(dex_files):
    hooks = find_title_hooks(dex_files)
    for hook in hooks:
        print(f"[OK] recent apps title hook in {hook}")
    if not hooks:
        print("[MISSING] recent apps title hook")
        return False
    print("Fix recent apps title patch is applied")
    return True


# csetm x0, eq / mov x0, #0x22, followed by mov x16, #0x22; and x0, x0, x16; add x0, x0, #6.
HISTORY_LIMIT_TAIL = bytes.fromhex("500480d20000108a00180091")
HISTORY_LIMIT_ORIGINAL = bytes.fromhex("e0139fda") + HISTORY_LIMIT_TAIL
HISTORY_LIMIT_PATCHED = bytes.fromhex("400480d2") + HISTORY_LIMIT_TAIL


def check_expand_search_history(apk_path):
    with zipfile.ZipFile(apk_path) as apk:
        names = [n for n in apk.namelist() if n.startswith("lib/arm64-v8a/") and n.endswith("/libapp.so")]
        if not names:
            print("[MISSING] lib/arm64-v8a/libapp.so")
            return False
        data = apk.read(names[0])
    patched = data.count(HISTORY_LIMIT_PATCHED)
    original = data.count(HISTORY_LIMIT_ORIGINAL)
    print(f"{names[0]}: patched limit x{patched}, original limit x{original}")
    if patched != 1 or original != 0:
        print("[MISSING] search history limit patch")
        return False
    print("Expand search history patch is applied")
    return True


# ldur w1, [x0, #0x17]; add x1, x1, x28, lsl #32; ldur w0, [x1, #0x1b]; add x0, x0, x28, lsl #32;
# mov x1, x0; bl <value>; tbnz w0, #4, +0x14 / nop; ldr x0, [x27, #0x7740]; mov sp, fp; ldp fp, lr; ret.
UPGRADE_BUTTON_HEAD = bytes.fromhex("017041b821801c8b20b041b800801c8be10300aa")
UPGRADE_BUTTON_TAIL = bytes.fromhex("60a37bf9ef031daafd79c1a8c0035fd6")
TBNZ_BUTTON = bytes.fromhex("a0002037")
NOP = bytes.fromhex("1f2003d5")


def check_hide_upgrade_button(apk_path):
    with zipfile.ZipFile(apk_path) as apk:
        names = [n for n in apk.namelist() if n.startswith("lib/arm64-v8a/") and n.endswith("/libapp.so")]
        if not names:
            print("[MISSING] lib/arm64-v8a/libapp.so")
            return False
        data = apk.read(names[0])
    patched = original = 0
    start = data.find(UPGRADE_BUTTON_HEAD)
    while start != -1:
        if start % 4 == 0 and data[start + 28:start + 44] == UPGRADE_BUTTON_TAIL:
            branch = data[start + 24:start + 28]
            patched += branch == NOP
            original += branch == TBNZ_BUTTON
        start = data.find(UPGRADE_BUTTON_HEAD, start + 1)
    print(f"{names[0]}: hidden upgrade button x{patched}, original x{original}")
    if patched == 0 or original != 0:
        print("[MISSING] upgrade button patch")
        return False
    print("Hide upgrade button patch is applied")
    return True


def words(*values):
    return b"".join(struct.pack("<I", v) for v in values)


# HistoryUpgradeBadge.build: clamp of the count (cmp/mov x0, #limit) and, 0x1ac later, the text
# loading ") " / ")" and "search.upgradeBadge" / "". _buildSearchHistorySection: mov x0, #limit.
COUNT_CLAMP = (words(0xf840b020, 0xb6f80060, 0xd2800000, 0x14000004), 0x5400004d, 0xf81f83a0)
COUNT_LIMIT = (words(0xaa0003e3, 0xf85c83a0, 0xf81e83a3, 0xf800b060), 0xf8013060)
COUNT_TEXT_ORIGINAL = words(0x91407370, 0xf9466e10, 0xb801f050, 0x91407361, 0xf9467021)
COUNT_TEXT_FROM_CLAMP = 0x1AC
# ldr ")" (pp+0x10b8) in place of ") ", and the key "" (pp+0x788) in place of "search.upgradeBadge".
COUNT_TEXT_PATCHED = words(0x91400770, 0xf9405e10, 0xb801f050, 0x91400361, 0xf943c421)


def find_aligned(data, needle):
    start = data.find(needle)
    while start != -1:
        if start % 4 == 0:
            yield start
        start = data.find(needle, start + 1)


def check_fix_search_history_count(apk_path):
    with zipfile.ZipFile(apk_path) as apk:
        names = [n for n in apk.namelist() if n.startswith("lib/arm64-v8a/") and n.endswith("/libapp.so")]
        if not names:
            print("[MISSING] lib/arm64-v8a/libapp.so")
            return False
        data = apk.read(names[0])

    def word(offset):
        return struct.unpack_from("<I", data, offset)[0]

    clamps = [o for o in find_aligned(data, COUNT_CLAMP[0])
              if word(o + 20) == COUNT_CLAMP[1] and word(o + 28) == COUNT_CLAMP[2]]
    limits = [o for o in find_aligned(data, COUNT_LIMIT[0]) if word(o + 20) == COUNT_LIMIT[1]]
    if len(clamps) != 1 or len(limits) != 1:
        print(f"[MISSING] search history count code (clamp x{len(clamps)}, limit x{len(limits)})")
        return False
    clamp, limit = clamps[0], limits[0]
    text = data[clamp + COUNT_TEXT_FROM_CLAMP:clamp + COUNT_TEXT_FROM_CLAMP + 20]
    checks = {
        "count clamp cmp x0, #20": word(clamp + 16) == 0xf100501f,
        "count clamp mov x0, #20": word(clamp + 24) == 0xd2800280,
        "search page limit mov x0, #20": word(limit + 16) == 0xd2800280,
        "badge text without upgradeBadge": text == COUNT_TEXT_PATCHED,
    }
    for label, ok in checks.items():
        print(f"[{'OK' if ok else 'MISSING'}] {label}")
    if not all(checks.values()):
        return False
    print("Fix search history count patch is applied")
    return True


def check_hide_ads(dex_files):
    class_name, instructions = find_handler(dex_files)
    if class_name is None:
        print("[MISSING] google_mobile_ads onMethodCall handler")
        return False

    head = [f"{i.get_name()} {i.get_output()}" for i in instructions[:40]]
    print(f"Handler: {class_name}->onMethodCall")
    print("\n".join("    " + line for line in head))

    text = "\n".join(head)
    checks = {
        "hideAds setting": "->hideAds()Z" in text,
        'const-string "load"': 'const-string' in text and '"load"' in text,
        "String.startsWith": "Ljava/lang/String;->startsWith" in text,
        "onAdFailedToLoad (no fill)": '"No fill."' in text,
        "Result.success(null)": "invoke-interface" in text,
        "return-void": "return-void" in text,
    }
    for label, ok in checks.items():
        print(f"[{'OK' if ok else 'MISSING'}] {label}")
    if not all(checks.values()):
        return False
    print("Hide ads patch is applied")
    return True


EXTENSION = "Lapp/twrailway/extension/"


def find_methods_calling(dex_files, call):
    found = []
    for dex in dex_files:
        for class_def in dex.get_classes():
            if class_def.get_name().startswith(EXTENSION):
                continue
            for method in class_def.get_methods():
                if not method.get_code():
                    continue
                head = [i.get_output() for i in list(method.get_code().get_bc().get_instructions())[:6]]
                if any(call in o for o in head):
                    found.append(f"{class_def.get_name()}->{method.get_name()}{method.get_descriptor()}")
    return found


def check_hide_promotions(dex_files):
    call = f"{EXTENSION}PromotionOverrides;->overrideRemoteConfig(Ljava/util/Map;)V"
    hooks = []
    for dex in dex_files:
        for class_def in dex.get_classes():
            if class_def.get_name().startswith(EXTENSION):
                continue
            for method in class_def.get_methods():
                if not method.get_code():
                    continue
                instructions = list(method.get_code().get_bc().get_instructions())
                returns = [i for i, ins in enumerate(instructions) if ins.get_name() == "return-object"]
                hooked = [i for i in returns if i > 0 and call in instructions[i - 1].get_output()]
                if hooked:
                    hooks.append((f"{class_def.get_name()}->{method.get_name()}{method.get_descriptor()}", len(hooked), len(returns)))
    for hook, hooked, total in hooks:
        print(f"[{'OK' if hooked == total else 'MISSING'}] remote config hook in {hook}: {hooked}/{total} returns")
    if len(hooks) != 1 or hooks[0][1] != hooks[0][2]:
        print("[MISSING] remote config hook")
        return False
    print("Hide promotions patch is applied")
    return True


def check_patch_settings(apk_path, dex_files):
    ok = True
    classes = {c.get_name() for dex in dex_files for c in dex.get_classes()}
    for name in ("PatchSettings", "PatchSettingsEntry", "PatchSettingsDialog", "LibappCopy", "PromotionOverrides"):
        present = f"{EXTENSION}{name};" in classes
        print(f"[{'OK' if present else 'MISSING'}] extension class {name}")
        ok &= present

    hooks = {
        "Flutter loader -> PatchSettings.init": f"{EXTENSION}PatchSettings;->init(Landroid/content/Context;)V",
        "Flutter loader -> LibappCopy.flutterShellArgs": f"{EXTENSION}LibappCopy;->flutterShellArgs",
        "DartMessenger -> PatchSettingsEntry.onMessageFromDart": f"{EXTENSION}PatchSettingsEntry;->onMessageFromDart",
    }
    for label, call in hooks.items():
        found = find_methods_calling(dex_files, call)
        print(f"[{'OK' if len(found) == 1 else 'MISSING'}] {label} {found}")
        ok &= len(found) == 1

    with zipfile.ZipFile(apk_path) as apk:
        names = [n for n in apk.namelist() if n.startswith("lib/arm64-v8a/") and n.endswith("/libapp.so")]
        data = apk.read(names[0]) if names else b""
    # Snapshot strings: a length byte (0x80 | length << 1 | isTwoByte), then UTF-16LE.
    renamed = data.count(bytes([0x80 | 4 << 1 | 1]) + "修補設定".encode("utf-16-le"))
    original = data.count(bytes([0x80 | 4 << 1 | 1]) + "廣告設定".encode("utf-16-le"))
    print(f"[{'OK' if renamed == 1 and original == 0 else 'MISSING'}] drawer label 修補設定 x{renamed}, 廣告設定 x{original}")
    ok &= renamed == 1 and original == 0

    if ok:
        print("Patch settings patch is applied")
    return ok


def main():
    dex_files = load_dex_files(sys.argv[1])
    results = [
        check_hide_ads(dex_files),
        check_hide_review_prompt(sys.argv[1], dex_files),
        check_fix_recent_apps_title(dex_files),
        check_expand_search_history(sys.argv[1]),
        check_hide_upgrade_button(sys.argv[1]),
        check_fix_search_history_count(sys.argv[1]),
        check_hide_promotions(dex_files),
        check_patch_settings(sys.argv[1], dex_files),
    ]
    if not all(results):
        sys.exit("Some patches were NOT applied")


if __name__ == "__main__":
    main()
