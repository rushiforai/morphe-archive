#!/usr/bin/env python3
"""Release-candidate source/behavior audit. Run in CI before building the MPP.

This augments (not replaces) Android manifest, APK/DEX verification, unit tests,
API continuity checks, GitHub workflow lockfile verification and device tests.
"""
from __future__ import annotations
import pathlib
import re

ROOT=pathlib.Path(__file__).resolve().parents[3]
REV=pathlib.Path(__file__).resolve().parent
HELPERS=REV/"java/e/e/a"
VERSION="1.10.6-dev.7"
checks=0

def verify(ok:bool,reason:str)->None:
    global checks
    checks+=1
    if not ok:
        raise AssertionError(reason)

sources={f.stem:f.read_text(encoding="utf-8") for f in HELPERS.glob("*.java")}
verify(len(sources)>=30,f"Expected all 30 current helper sources, got {len(sources)}")
must_have=("Dev111","Dev112","Dev113","Dev114","Dev115","Dev116",
           "Dev118","Dev119","Dev120","Dev121","Dev122","Dev128","Dev130",
           "Dev131","Dev132","Dev134","PostingPolicy122","PopupTouch125",
           "PopupTouchPolicy125","RankingTabIdentity133","GestureTurnPolicy128")
for name in must_have:verify(name in sources,f"Missing {name}")

# Ensure newly generated helper source cannot launch shell programs, load
# arbitrary dex, or silently accept untrusted WebView origins.
dangerous=(
    r"\bRuntime\s*\.\s*getRuntime\(\)\s*\.\s*exec\s*\(",
    r"\bProcessBuilder\s*\(",
    r"\bDexClassLoader\b",
    r"\bPathClassLoader\b",
    r"\bSystem\s*\.\s*loadLibrary\s*\(",
    r"\bsetAllowFileAccess\s*\(\s*true\s*\)",
    r"\bsetJavaScriptEnabled\s*\(\s*true\s*\)",
)
for name,body in sources.items():
    for pattern in dangerous:
        verify(re.search(pattern,body) is None,f"Suspicious execution capability in {name}: {pattern}")

# All literal HTTPS domains introduced by current helper Java classes should
# be niconico delivery / official API endpoints. Existing native APK traffic
# is assessed separately; no assumption is made about user-provided URLs.
allowed={
    "sp.nicovideo.jp","www.nicovideo.jp","ext.nicovideo.jp",
    "nvapi.nicovideo.jp","nicovideo.cdn.nimg.jp",
    "public.nvcomment.nicovideo.jp",
}
hosts=set()
for name,body in sources.items():
    if "http://" in body:
        # Dev116 accepts legacy thumbnail URL text only to convert it to
        # HTTPS before handing it to the image loader. This is not a
        # cleartext network call; fail any other unapproved http literal.
        verify(name in ("Dev115","Dev116"),f"Unexpected cleartext HTTP constant in {name}")
        if name=="Dev115":
            verify('if(image.startsWith("http://"))image="https://"+image.substring(7);' in body,
                   "Legacy playlist thumbnail URL must be upgraded to HTTPS")
        else:
            verify('url.replaceFirst("^http://","https://")' in body,
                   "Legacy thumbnail URLs must be upgraded to HTTPS")
            verify("loadImage(safeImage(original), image)" in body,
                   "Thumbnail HTTP upgrade must precede image load")
    for host in re.findall(r'https://([a-zA-Z0-9._-]+)',body):
        host=host.lower()
        if host:
            hosts.add(host)
            verify(host in allowed,f"Unexpected helper URL domain: {name}: {host}")
verify(bool(hosts),"Missing recognizable production HTTP endpoints")
print("PASS: helper security checks, no cleartext HTTP, official outbound domains",
      ",".join(sorted(hosts)))

# Main-thread and resource protections in critical recently modified features.
audio=sources["Dev131"]
verify('getBoolean(KEY, false)' in audio,"Audio focus default not OFF")
verify("ownedByService(context)" in audio,"Service double audio-focus request not guarded")
post=sources["PostingPolicy122"]
verify('throw new IOException("Unsupported' in post,
       "Comment post endpoint allowlist missing")
verify("POST_SERVER" in post,"Comment posting endpoint policy missing")
popup=sources["PopupTouch125"]
verify("if (view instanceof ViewGroup) return false;" in popup,
       "Popup video/container stealing child controls")
verify("interactiveHit(root, (View) player" in popup,
       "Popup control hit detection missing")
verify("state.routing()" in popup and "state.cancel()" in popup,
       "Popup cancellation routing missing")
gesture=sources["GestureTurnPolicy128"]
verify("verticalOnly(pattern)" in gesture and "return enabled ||" in gesture,
       "Pure vertical gesture opt-out changed")

# Tab list / modal / default-on combined button preference.
tabs=sources["Dev132"]
summary=tabs.split("private static String buttonsSummary(",1)[1].split(
    "public static void installSettings(",1)[0]
verify('"現在："' not in summary and '"Current: "' not in summary and
       '"目前："' not in summary and '"\\n"' not in summary,
       "Tab button help reverted to multiline current-value display")
verify("左端の一覧ボタンでタブの切替・管理" in summary,
       "Japanese tab-bar control explanation missing")
verify("右端の＋ボタンでタブを追加" in summary,
       "Japanese + button explanation missing")
for item in ("MultiSelectListPreference","BUTTONS_KEY",
             "new HashSet<>(Arrays.asList(LIST_VALUE,ADD_VALUE))",
             "startDragAndDrop","ACTION_DROP","rememberClosed",
             "直前に閉じたタブを復元"):
    verify(item in tabs,f"Tab-list regression: {item}")
verify('if(wasEmpty)call(host,"select"' in tabs,
       "Restore must keep the dialog open without replacing active tab")
verify("Set<String> shown=buttons(activity)" in tabs,
       "Tab button visibility selection not reflected in bar")

# Ranking data update must retain Activity/Fragment and eliminate tab churn.
ranking=sources["Dev134"]
for item in ('applyPeriod(Activity activity,Intent next)',
             'set(tab,"url",updated)', 'set(fragment,"d0",updated)',
             'set(loader,"b",change.url)', 'Refresh192',
             'PENDING.get(a)!=change', 'activity.setIntent(next)',
             'MAX_RETRIES=100', 'new WeakReference<>(activity)'):
    verify(item in ranking,f"Ranking in-place lifecycle guard missing: {item}")
for item in ("activity.startActivity(", "activity.finish(",
             "activity.recreate(", "new Intent(activity,"):
    verify(item not in ranking,f"Ranking period unexpectedly recreates UI: {item}")
verify("same(" in sources["RankingTabIdentity133"] and
       'endsWith(".nicovideo.jp")' in sources["RankingTabIdentity133"],
       "Ranking identity origin or dedup guard missing")

# Confirm official release is a separate manual action.
workflow=(ROOT/".github/workflows/private-build.yml").read_text(encoding="utf-8")
verify("Check ranking in-place sort and tab-bar button descriptions" in workflow,
       "Regression tests missing from workflow")
verify("Verify GitHub official workflow lockfile" in workflow,
       "Official workflow lockfile check missing")
verify("Verify final distributed MPP" in workflow,
       "Distributed MPP validation absent")

# Static assertions complement compilation and runtime policy tests, not an
# emulator or a formal proof that a crash/network call can never occur.
print(f"PASS: {checks} release source/security/behavior invariants; "
      f"{len(sources)} Java helper sources checked; version {VERSION}")
