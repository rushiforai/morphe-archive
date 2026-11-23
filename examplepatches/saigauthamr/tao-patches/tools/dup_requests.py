"""Count in-flight duplicate API requests in an FFNTao debug logcat.

A request is an in-flight duplicate when the same URL starts again while an earlier
identical request is still waiting for its response or failure.
"""
import re
import sys
from collections import defaultdict

START = re.compile(r"^(\S+ \S+)\s+(\d+).*FFNTao\s*: request #\d+ (\S+)")
END = re.compile(r"^(\S+ \S+)\s+(\d+).*FFNTao\s*: request (?:responded|FAILED) after \S+ (\S+)")

inflight = defaultdict(int)
total = dups = 0
by_url = defaultdict(int)
for line in open(sys.argv[1], errors="replace"):
    if m := START.match(line):
        _, pid, url = m.groups()
        key = (pid, url)
        total += 1
        if inflight[key] > 0:
            dups += 1
            by_url[re.sub(r"\d+", "N", url.split("?")[0])] += 1
        inflight[key] += 1
    elif m := END.match(line):
        _, pid, url = m.groups()
        key = (pid, url)
        if inflight[key] > 0:
            inflight[key] -= 1

print(f"requests: {total}, in-flight duplicates: {dups} ({dups / max(total, 1):.0%})")
for url, n in sorted(by_url.items(), key=lambda x: -x[1]):
    print(f"{n:5}  {url}")
