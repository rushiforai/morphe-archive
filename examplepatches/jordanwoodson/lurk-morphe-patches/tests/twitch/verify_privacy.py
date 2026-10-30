#!/usr/bin/env python3
"""Check actual stock/patched Twitch privacy boundaries and their disabled paths.

Usage: python tests/twitch/verify_privacy.py stock-apktool patched-apktool
This checks emitted DEX, including callback completion and synthetic-branch isolation. Obfuscated names
come from the patched output's locators (assets/lurk/locators.json); the ones written here are Twitch
31.7.0's, used while the output has none.
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from locators import Locators  # noqa: E402

SETTINGS = "Lio/github/jordanwoodson/extension/shared/settings/Settings;"
PRIVACY = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchPrivacy;"


def method(root, cls, signature):
    paths = list(root.glob(f"smali*/{cls}.smali"))
    assert len(paths) == 1, (cls, paths)
    blocks = re.findall(r"(?ms)^\.method\b.*?^\.end method", paths[0].read_text())
    block, = [b for b in blocks if b.splitlines()[0].endswith(" " + signature)]
    code, labels = [], {}
    in_annotation = False
    in_switch = False
    for line in block.splitlines()[1:]:
        line = line.strip()
        if line.startswith(".annotation"):
            in_annotation = True
        if in_annotation:
            if line == ".end annotation":
                in_annotation = False
            continue
        if line.startswith((".packed-switch", ".sparse-switch")):
            in_switch = True
            code.append("switch-payload " + line)
            continue
        if line in (".end packed-switch", ".end sparse-switch"):
            in_switch = False
            continue
        if in_switch:
            code.append("switch-entry " + line)
            continue
        if line.startswith(":"):
            labels[line] = len(code)
        elif line and line != "nop" and not line.startswith((".", "#")):
            code.append(re.sub(r"\{\s*|\s*\}", lambda m: "{" if "{" in m[0] else "}", line))
    return code, labels


def abstract_method(root, cls, descriptor):
    """The name of the one abstract method of `cls` with `descriptor`, such as the Spade callback's success."""
    paths = list(root.glob(f"smali*/{cls}.smali"))
    assert len(paths) == 1, (cls, paths)
    names = re.findall(rf"(?m)^\.method public abstract (\w+){re.escape(descriptor)}$", paths[0].read_text())
    assert len(names) == 1, (cls, descriptor, names)
    return names[0]


def normalized(code, labels, shift=0):
    return [re.sub(r"(?<!\w):\w+", lambda m: "@" + str(labels[m[0]] - shift), i) for i in code]


def guarded(original, patched, key, body):
    before, before_labels = original
    code, labels = patched
    assert code[:3] == [f'const-string v0, "{key}"',
                        f"invoke-static/range {{v0 .. v0}}, {SETTINGS}->isEnabled(Ljava/lang/String;)Z",
                        "move-result v0"]
    branch = re.fullmatch(r"if-eqz v0, (:\w+)", code[3])
    assert branch
    end = labels[branch[1]]
    assert code[4:end] == body, code[4:end]
    assert normalized(code[end:], labels, end) == normalized(before, before_labels)


def after_prefix(parsed, prefix):
    code, labels = parsed
    assert code[:len(prefix)] == prefix
    return code[len(prefix):], {label: pos - len(prefix) for label, pos in labels.items()}


def verify(stock, patched):
    loc = Locators(patched)
    print(loc.describe())
    # Each one is a method a privacy hook patches; the fallbacks are Twitch 31.7.0's R8 names.
    core = loc.method("twitch.match.spade_event", "jn0", "d(Ljava/lang/String;Ljava/util/LinkedHashMap;Lkx50;Z)V")
    callback_type = re.search(r"L(\w+);Z\)V$", core[1])[1]
    success = abstract_method(stock, callback_type, "(Ljava/lang/Object;)V")
    before, _ = method(stock, *core)
    assert any('"branch_campaign"' in i for i in before)
    assert any('"x_untrusted_minute-watched_spade"' in i for i in before)
    code, labels = method(patched, *core)
    # Enabled path calls the same abstract success callback used by Retrofit; null callbacks skip it.
    assert code[:4] == ['const-string v0, "disable_analytics"',
                        f"invoke-static/range {{v0 .. v0}}, {SETTINGS}->isEnabled(Ljava/lang/String;)Z",
                        "move-result v0", code[3]]
    off = re.fullmatch(r"if-eqz v0, (:\w+)", code[3])
    assert off
    end = labels[off[1]]
    assert code[4:end] == ["move-object/from16 v1, p3", code[5], "const/4 v0, 0x0",
                           f"invoke-virtual {{v1, v0}}, L{callback_type};->{success}(Ljava/lang/Object;)V", "return-void"]
    nullable = re.fullmatch(r"if-eqz v1, (:\w+)", code[5])
    assert nullable and labels[nullable[1]] == end - 1
    assert normalized(code[end:], labels, end) == normalized(before, method(stock, *core)[1])
    # A coroutine's Spade callback (Twitch 31.8.0's dn0) resumes with TRUE on success.
    callback, _ = method(stock, "dn0", f"{success}(Ljava/lang/Object;)V")
    assert any("Ljava/lang/Boolean;->TRUE" in i for i in callback)
    assert any("->resumeWith(Ljava/lang/Object;)V" in i for i in callback)
    for cls, signature in (loc.method("twitch.match.spade_batch", "dn00", "a(Ljava/util/ArrayList;)V"),
                           loc.method("twitch.match.branch_event", "jn0", "c(Ljava/lang/String;)V")):
        guarded(method(stock, cls, signature), method(patched, cls, signature),
                "disable_analytics", ["return-void"])
    branch = loc.method("twitch.match.branch_initialization", "pc3", "<init>(Landroid/content/Context;)V")
    branch_setter = loc.method("twitch.match.branch_tracking_setter", "u2e", "b(Landroid/content/Context;Z)V")
    original, old_labels = method(stock, *branch)
    code, labels = method(patched, *branch)
    injection, = [i for i, line in enumerate(code) if "->disableBranchTracking(Z)Z" in line]
    assert code[injection:injection + 2] == [f"invoke-static/range {{v1 .. v1}}, {PRIVACY}->disableBranchTracking(Z)Z", "move-result v1"]
    assert code[injection - 1] == "move-result v1" and code[injection + 2].startswith(f"iput-boolean v1, v0, L{branch_setter[0]};")
    kept = code[:injection] + code[injection + 2:]
    shifted = {label: pos if pos < injection else pos - 2 for label, pos in labels.items()}
    assert normalized(kept, shifted) == normalized(original, old_labels)
    code, labels = after_prefix(method(patched, *branch_setter), [
        f"invoke-static/range {{p2 .. p2}}, {PRIVACY}->disableBranchTracking(Z)Z", "move-result p2"])
    original, old_labels = method(stock, *branch_setter)
    assert normalized(code, labels) == normalized(original, old_labels)
    user_consent = loc.type("twitch.match.user_data_consent", "wy60")
    guarded(method(stock, user_consent, "a()Z"), method(patched, user_consent, "a()Z"),
            "disable_analytics", ["const/4 v0, 0x0", "return v0"])
    vendor = loc.method("twitch.match.vendor_consent", "pf50", "o(Lwy60;Lw050;)Loy60;")
    decision = re.search(r"\)L(\w+);$", vendor[1])[1]
    guarded(method(stock, *vendor), method(patched, *vendor), "disable_analytics",
            [f"sget-object v0, L{decision};->Denied:L{decision};", "return-object v0"])
    sentry = ("io/sentry/android/core/SentryAndroid", "init(Landroid/content/Context;Lio/sentry/ILogger;Lio/sentry/Sentry$OptionsConfiguration;)V")
    gated = after_prefix(method(patched, *sentry), [
        f"invoke-static/range {{p0 .. p0}}, {PRIVACY}->initSettingsOnce(Landroid/content/Context;)V"])
    guarded(method(stock, *sentry), gated, "disable_analytics", ["return-void"])
    for provider in ("io/sentry/android/core/SentryInitProvider", "io/sentry/android/core/SentryPerformanceProvider",
                     "io/sentry/ndk/SentryNdkPreloadProvider"):
        gated = after_prefix(method(patched, provider, "onCreate()Z"), [
            "invoke-virtual/range {p0 .. p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;",
            "move-result-object v0", f"invoke-static {{v0}}, {PRIVACY}->initSettingsOnce(Landroid/content/Context;)V"])
        guarded(method(stock, provider, "onCreate()Z"), gated, "disable_analytics", ["const/4 v0, 0x1", "return v0"])
    # The app's manifest provider inherits onCreate from R8's Firebase provider base.
    firebase = loc.type("twitch.match.firebase_initialization_provider", "lph")
    code, labels = after_prefix(method(patched, firebase, "onCreate()Z"), [
        "invoke-virtual/range {p0 .. p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;",
        "move-result-object v0", f"invoke-static {{v0}}, {PRIVACY}->initSettingsOnce(Landroid/content/Context;)V"])
    original, old_labels = method(stock, firebase, "onCreate()Z")
    assert normalized(code, labels) == normalized(original, old_labels), "Firebase/Messaging initialization changed"
    permission = loc.method("twitch.disable_analytics.crashlytics_permission", "apc", "b()Z")
    guarded(method(stock, *permission), method(patched, *permission),
            "disable_analytics", ["const/4 v0, 0x0", "return v0"])
    crashlytics = "com/google/firebase/crashlytics/FirebaseCrashlytics"
    for signature, prefix in (
        ("setCrashlyticsCollectionEnabled(Z)V", [f"invoke-static/range {{p1 .. p1}}, {PRIVACY}->allowAnalyticsCollection(Z)Z", "move-result p1"]),
        ("setCrashlyticsCollectionEnabled(Ljava/lang/Boolean;)V", [f"invoke-static/range {{p1 .. p1}}, {PRIVACY}->allowAnalyticsCollectionBoxed(Ljava/lang/Boolean;)Ljava/lang/Boolean;", "move-result-object p1"]),
    ):
        code, labels = after_prefix(method(patched, crashlytics, signature), prefix)
        original, old_labels = method(stock, crashlytics, signature)
        assert normalized(code, labels) == normalized(original, old_labels)
    for signature in ("sendUnsentReports()V", "log(Ljava/lang/String;)V", "recordException(Ljava/lang/Throwable;)V", "setUserId(Ljava/lang/String;)V"):
        guarded(method(stock, crashlytics, signature), method(patched, crashlytics, signature), "disable_analytics", ["return-void"])
    # The setCustomKey overloads have no spare register: they stay as they are, and the method they
    # all hand the key to is guarded instead.
    key_code, _ = method(stock, crashlytics, "setCustomKey(Ljava/lang/String;Ljava/lang/String;)V")
    store, = [match for line in key_code if (match := re.fullmatch(
        r"invoke-virtual \{p0, p1, p2\}, L(\w+);->(\w+)\(Ljava/lang/String;Ljava/lang/String;\)V", line))]
    for overload in ("Ljava/lang/String;", "Z", "I", "J", "F", "D"):
        signature = f"setCustomKey(Ljava/lang/String;{overload})V"
        before, after = method(stock, crashlytics, signature), method(patched, crashlytics, signature)
        assert normalized(*after) == normalized(*before), signature
        assert f"L{store[1]};->{store[2]}(Ljava/lang/String;Ljava/lang/String;)V" in " ".join(before[0]), signature
    signature = f"{store[2]}(Ljava/lang/String;Ljava/lang/String;)V"
    guarded(method(stock, store[1], signature), method(patched, store[1], signature), "disable_analytics", ["return-void"])

    eligibility = loc.method("twitch.match.client_ad_eligibility", "ms", "h(Lio/reactivex/internal/operators/single/c;)V")
    request = loc.type("twitch.block_client_ads.request", "os")
    original, original_labels = method(stock, *eligibility)
    code, labels = method(patched, *eligibility)
    start, = [i for i, line in enumerate(code) if re.fullmatch(r'const-string (v\d+), "block_client_ads"', line)]
    flag = code[start].split()[1].rstrip(",")
    # The guard belongs to only the ad eligibility case, after its check-casts; auth/image cases survive.
    assert code[start - 2].startswith("check-cast p0, L" + request + ";") and code[start - 1].startswith("check-cast ")
    assert code[start + 1:start + 3] == [f"invoke-static/range {{{flag} .. {flag}}}, {SETTINGS}->isEnabled(Ljava/lang/String;)Z",
                                         f"move-result {flag}"]
    end = labels[re.fullmatch(rf"if-eqz {flag}, (:\w+)", code[start + 3])[1]]
    decline = code[start + 4:end]
    value = re.fullmatch(r"new-instance (v\d+), Ltv/twitch/android/util/Optional;", decline[1])[1]
    emitter = re.fullmatch(r"move-object/from16 (v\d+), p1", decline[3])[1]
    assert decline == [f"sget-object {flag}, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;",
        f"new-instance {value}, Ltv/twitch/android/util/Optional;",
        f"invoke-direct {{{value}, {flag}}}, Ltv/twitch/android/util/Optional;-><init>(Ljava/lang/Object;)V",
        f"move-object/from16 {emitter}, p1",
        f"invoke-virtual {{{emitter}, {value}}}, Lio/reactivex/internal/operators/single/c;->b(Ljava/lang/Object;)V",
        "return-void"], decline
    kept = code[:start] + code[end:]
    adjusted = {label: pos if pos < start else pos - (end - start) for label, pos in labels.items()
                if pos < start or pos >= end}
    assert normalized(kept, adjusted) == normalized(original, original_labels)

    consent = loc.method("twitch.block_cookie_notice.options_constructor", "u7a", "<init>(ZLi5v;ZZZZ)V")
    original, orig_labels = method(stock, *consent)
    code, labels = method(patched, *consent)
    assert code[:2] == ["invoke-static/range {p3 .. p3}, Lio/github/jordanwoodson/extension/shared/twitch/TwitchPrivacy;->showCookieNotice(Z)Z",
                        "move-result p3"]
    assert normalized(code[2:], labels, 2) == normalized(original, orig_labels)
    # Keep manual settings, age restrictions, DMA and vendor consent fields exactly as shipped.
    assert any("iput-boolean p4" in i for i in code)
    print("PASS: Spade completion/off path, SDK decisions, early Sentry startup, isolated client-ad decline, consent presentation")


if __name__ == "__main__":
    assert len(sys.argv) == 3, __doc__
    verify(*(Path(p) for p in sys.argv[1:]))
