"""Print the centre of the first node in a uiautomator dump whose text equals, or content-desc starts with, a string.

python3 ui.py <dump.xml> text|desc <string>
"""
import re
import sys

path, kind, wanted = sys.argv[1:4]
x = open(path, encoding="utf-8", errors="replace").read()
for node in re.findall(r"<node [^>]*>", x):
    if kind == "text":
        m = re.search(r' text="([^"]*)"', node)
        hit = m and m.group(1) == wanted
    else:
        m = re.search(r' content-desc="([^"]*)"', node)
        hit = m and m.group(1).startswith(wanted)
    if hit:
        b = list(map(int, re.search(r'bounds="\[(\d+),(\d+)\]\[(\d+),(\d+)\]"', node).groups()))
        print((b[0] + b[2]) // 2, (b[1] + b[3]) // 2)
        break
