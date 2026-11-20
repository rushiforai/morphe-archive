#!/usr/bin/env python3
import re
import subprocess
import sys

if len(sys.argv) != 4 or sys.argv[3] not in ("29.9", "30.0"):
    raise SystemExit("Usage: check-meesho-apk.py /path/to/dexdump /path/to/patched.apk 29.9|30.0")

tab_method, profile_method, constructors_regex = (
    ("X0", "v7.k", r"L(?:b5a|q5a);\.<init>:") if sys.argv[3] == "29.9"
    else ("W0", "ti.a0.l", r"Lvi/(?:i|j);\.<init>:")
)

process = subprocess.Popen(
    [sys.argv[1], "-d", sys.argv[2]],
    stdout=subprocess.PIPE,
    text=True,
    encoding="utf-8",
    errors="replace",
)
methods = {}
current = None
for line in process.stdout:
    if f"] com.meesho.supply.main.HomeActivity.{tab_method}:()Z" in line:
        current = "tab"
        methods[current] = []
    elif f"] {profile_method}:" in line:
        current = "profile"
        methods[current] = []
    elif "] com.meesho.supply.catalog.search.RealSearchResultsFragment.onResume:()V" in line:
        current = "resume"
        methods[current] = []
    elif "] com.meesho.supply.catalog.search.RealSearchResultsFragment.onPause:()V" in line:
        current = "pause"
        methods[current] = []
    elif "] com.meesho.supply.main.SupplyApplication.onCreate:()V" in line:
        current = "initialize"
        methods[current] = []
    elif current and "catches       :" in line:
        current = None
    elif current and re.search(r"\|\w{4}:", line):
        methods[current].append(line)

if process.wait():
    raise SystemExit("dexdump failed")
tab = methods["tab"]
assert "Settings;.hideFinanceTab:" in tab[0] and "move-result v0" in tab[1], "runtime tab setting missing"
assert "if-eqz v0," in tab[2], "original tab gate not reachable"
assert "const/4 v0, #int 0" in tab[3] and "return v0" in tab[4], "enabled tab filter not applied"
target = re.search(r"if-eqz v0, ([0-9a-f]+)", tab[2]).group(1)
assert int(target, 16) == int(re.search(r"\|([0-9a-f]+):", tab[5]).group(1), 16), "off branch misses original gate"
profile = methods["profile"]
constructors = [
    i for i, line in enumerate(profile)
    if re.search(constructors_regex, line)
]
assert len(constructors) == 3, "unexpected profile constructors"
assert ["addPayLaterProfile:" in profile[constructors[0] + 1],
        "addLoanProfile:" in profile[constructors[1] + 1],
        "addPayLaterProfile:" in profile[constructors[2] + 1]] == [True] * 3, "profile runtime gates missing"
entry = [i for i, line in enumerate(profile) if "Settings;.addProfileEntry:" in line]
assert len(entry) == 1 and re.search(r"L(?:k39|i11/d);\.(?:g|i):", profile[entry[0] + 1]), "Morphe row not added before list finalization"
assert "Settings;.initialize:" in methods["initialize"][0], "settings not initialized before app startup"
resume = methods["resume"]
returns = [i for i, line in enumerate(resume) if "return-void" in line]
assert returns and all("LoadedSort;.show:" in resume[i - 1] for i in returns), "sort button not shown"
assert "LoadedSort;.hide:" in methods["pause"][0], "sort button not removed"
print("PASS: settings startup/profile entry, reversible finance gates and search sort lifecycle hooks")
