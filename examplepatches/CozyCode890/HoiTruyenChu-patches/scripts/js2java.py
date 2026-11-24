"""Keep the JS scripts of the extension as real .js files.

The scripts are Java string constants (`static final String SCRIPT = "" + "...\\n" ...;`) because
the extension is compiled into the app's dex and has no resources. The sources live in
extensions/itruyenchu/src/main/js/<name>.js next to a header line naming their Java file:

    // java: app/hoitruyenchu/extension/itruyenchu/patches/taptoseek/TapToSeekPatch.java

    python scripts/js2java.py            # .js -> Java (every file in src/main/js)
    python scripts/js2java.py extract <Java file> <name>.js   # Java SCRIPT -> new .js file
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
JS_DIR = os.path.join(ROOT, "extensions", "itruyenchu", "src", "main", "js")
JAVA_DIR = os.path.join(ROOT, "extensions", "itruyenchu", "src", "main", "java")
BLOCK = re.compile(r'(static final String SCRIPT = ""\n)((?:\s*\+ ".*"\n)*?)(\s*\+ ".*";\n)')
INDENT = " " * 12


def unescape(s):
    out, i = [], 0
    while i < len(s):
        c = s[i]
        if c == "\\":
            n = s[i + 1]
            out.append({"n": "\n", "t": "\t", "\\": "\\", '"': '"', "'": "'"}[n])
            i += 2
        else:
            out.append(c)
            i += 1
    return "".join(out)


def escape(line):
    return line.replace("\\", "\\\\").replace('"', '\\"').replace("\t", "\\t")


def extract(java_path, js_name):
    src = open(java_path, encoding="utf-8").read()
    m = BLOCK.search(src)
    if not m:
        sys.exit("no SCRIPT block in " + java_path)
    body = m.group(2) + m.group(3)
    parts = re.findall(r'\+ "(.*)"', body)
    js = "".join(unescape(p) for p in parts)
    rel = os.path.relpath(java_path, JAVA_DIR).replace(os.sep, "/")
    os.makedirs(JS_DIR, exist_ok=True)
    with open(os.path.join(JS_DIR, js_name), "w", encoding="utf-8", newline="\n") as f:
        f.write("// java: " + rel + "\n" + js)
    print("extracted", js_name)


def generate(js_path):
    text = open(js_path, encoding="utf-8").read()
    first, _, js = text.partition("\n")
    if not first.startswith("// java: "):
        sys.exit(js_path + ": first line must be '// java: <path>'")
    java_path = os.path.join(JAVA_DIR, first[len("// java: "):].strip())
    lines = js.split("\n")
    if lines and lines[-1] == "":
        lines.pop()
    out = ""
    for i, line in enumerate(lines):
        out += INDENT + '+ "' + escape(line) + '\\n"' + (";\n" if i == len(lines) - 1 else "\n")
    src = open(java_path, encoding="utf-8").read()
    m = BLOCK.search(src)
    if not m:
        sys.exit("no SCRIPT block in " + java_path)
    new = src[:m.start(2)] + out + src[m.end(3):]
    if new != src:
        with open(java_path, "w", encoding="utf-8", newline="\n") as f:
            f.write(new)
        print("updated", os.path.relpath(java_path, ROOT))


if __name__ == "__main__":
    if len(sys.argv) >= 2 and sys.argv[1] == "extract":
        extract(sys.argv[2], sys.argv[3])
    else:
        for name in sorted(os.listdir(JS_DIR)):
            if name.endswith(".js"):
                generate(os.path.join(JS_DIR, name))
