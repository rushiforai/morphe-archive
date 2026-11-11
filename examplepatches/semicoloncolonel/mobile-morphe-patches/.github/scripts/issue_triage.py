"""Checks new issues for missing details, and bug reports against the app versions the patches support.

Runs from .github/workflows/issue_triage.yml when someone outside the project
opens or edits an issue made with the Bug report form. It reads the App, App
version, App version code, and Phone or Android TV build fields, and compares
them with the targets in the patches on main and dev. When the version, the
version code, or the build is not one the patches support, it labels the issue
"untargeted version" and comments with the supported versions. When an edit
fixes that, it removes the label. Reports for apps it does not know, such as
"Other", are left alone.

A report for a dev pre-release, by the Patches release field or a "-dev"
patches version, is labeled "dev pre-release". When the app has an open
issue labeled "testing on dev", the report gets a comment that asks for the
problem there instead, unless it is critical.

Every issue made with a form is checked for the fields its form marks
required, read from .github/ISSUE_TEMPLATE, and a bug report also for an
attached screenshot or video or a crash log with a stack trace. An issue that
lacks any of them is labeled "incomplete" with a comment that lists them, and
the label is removed when an edit fills them in. Labeled issues close after 7
days, like "untargeted version". The version checks run for bug reports and the
version or build form only.

Run from the repository root with GITHUB_EVENT_PATH set. DRY_RUN=true prints
what it would do instead of doing it.
"""

import json
import os
import re
import subprocess
import sys

LABEL = "untargeted version"
REFS = ["origin/main", "origin/dev"]
SOURCE = "patches/src/main/kotlin"
DEV_TARGET_HELPER = "shared/misc/DevTarget.kt"
NO_RESPONSE = "_No response_"
DEV_LABEL = "dev pre-release"
TESTING_LABEL = "testing on dev"
APP_UPDATE_PREFIX = "App update: "
INCOMPLETE_LABEL = "incomplete"
FORMS_DIR = ".github/ISSUE_TEMPLATE"
# A heading that only one form has, which tells the forms apart.
FORM_MARKERS = {"Morphe Manager's message": "0-version-or-build.yml", "What happened": "1-bug-report.yml", "What could be better": "2-enhancement.yml",
                "What the patch should do": "3-new-app-or-patch.yml", "Topic": "4-something-else.yml"}
ATTACHMENT = re.compile(r"https://github\.com/(?:user-attachments/assets|user-attachments/files|[^/\s]+/[^/\s]+/assets)/|"
                        r"https://user-images\.githubusercontent\.com/|https://private-user-images\.githubusercontent\.com/")
CRASH = re.compile(r"FATAL EXCEPTION|^\s*at [\w$.<>]+\(|\b(?:[a-z][\w$]*\.)+[A-Z][\w$]*(?:Exception|Error)\b", re.M)


# ── The form ────────────────────────────────────────────────────────────────

def parse_form(body):
    """{field label: value} from an issue form body, with None for empty fields."""
    fields = {}
    for match in re.finditer(r"^### (.+?)\s*\n(.*?)(?=^### |\Z)", body or "", re.M | re.S):
        value = match.group(2).strip()
        fields[match.group(1).strip()] = None if value in ("", NO_RESPONSE) else value
    return fields


# ── The targets ─────────────────────────────────────────────────────────────

def git(*args):
    return subprocess.run(["git", *args], capture_output=True, text=True, check=True).stdout


def call_text(text, start):
    """The text of the call whose opening parenthesis is at start, without the parentheses."""
    depth = 0
    for i in range(start, len(text)):
        if text[i] == "(":
            depth += 1
        elif text[i] == ")":
            depth -= 1
            if depth == 0:
                return text[start + 1:i]
    return text[start + 1:]


def split_args(args):
    """Top-level comma-separated arguments."""
    parts, depth, current = [], 0, ""
    for char in args:
        if char in "([":
            depth += 1
        elif char in ")]":
            depth -= 1
        if char == "," and depth == 0:
            parts.append(current.strip())
            current = ""
        else:
            current += char
    if current.strip():
        parts.append(current.strip())
    return parts


def resolve(value, consts):
    value = value.strip()
    string = re.fullmatch(r'"([^"]*)"', value)
    if string:
        return string.group(1)
    return consts.get(value, value)


def parse_target(args, consts):
    target = {"version": None, "codes": set(), "description": None, "experimental": False}
    positional = 0
    for arg in split_args(args):
        named = re.match(r"(\w+)\s*=\s*(.+)", arg, re.S)
        name, value = (named.group(1), named.group(2)) if named else (None, arg)
        if name is None:
            name = ["version", "versionCode"][positional] if positional < 2 else None
            positional += 1
        if name == "version":
            target["version"] = resolve(value, consts)
        elif name == "versionCode":
            target["codes"].update(int(n) for n in re.findall(r"\d+", resolve(value, consts)))
        elif name == "versionCodes":
            target["codes"].update(int(n) for n in re.findall(r"\bto\s+(\d+)", value))
        elif name == "description":
            target["description"] = resolve(value, consts)
        elif name == "isExperimental":
            target["experimental"] = value.strip() == "true"
    return target


def parse_source(text):
    """[(app name, [target, ...]), ...] for each Compatibility in a Kotlin file."""
    consts = {m.group(1): m.group(2) for m in re.finditer(r'\bva[lr]\s+(\w+)\s*(?::\s*\w+)?\s*=\s*"([^"]*)"', text)}
    consts.update({m.group(1): m.group(2) for m in re.finditer(r"\bva[lr]\s+(\w+)\s*(?::\s*\w+)?\s*=\s*(\d+)\b", text)})
    apps = []
    for match in re.finditer(r"\bCompatibility\(", text):
        block = call_text(text, match.end() - 1)
        name = re.search(r'\bname\s*=\s*"([^"]+)"', block)
        if not name:
            continue
        targets = []
        for call in re.finditer(r"\b(AppTarget|devTarget)\(", block):
            target = parse_target(call_text(block, call.end() - 1), consts)
            if call.group(1) == "devTarget":
                target["dev"] = True
            if target["version"]:
                targets.append(target)
        apps.append((name.group(1), targets))
    return apps


def excluded_globs(ref):
    text = git("show", f"{ref}:patches/build.gradle.kts")
    block = re.search(r"kotlin\.exclude\((.*?)\)", text, re.S)
    return re.findall(r'"\*\*/([^"*]+)/?\*\*"', block.group(1)) if block else []


def load_targets(refs=REFS):
    """{app name: {version: {"codes", "descriptions", "experimental", "refs"}}} across refs."""
    apps = {}
    for ref in refs:
        excluded = [part.strip("/") for part in excluded_globs(ref)]
        for path in git("ls-tree", "-r", "--name-only", ref, SOURCE).split():
            if not path.endswith(".kt") or path.endswith(DEV_TARGET_HELPER):
                continue
            if any(f"/{part}/" in f"/{path}" or path.endswith(f"/{part}") for part in excluded):
                continue
            text = git("show", f"{ref}:{path}")
            if "Compatibility(" not in text:
                continue
            for name, targets in parse_source(text):
                versions = apps.setdefault(name, {})
                for target in targets:
                    entry = versions.setdefault(target["version"], {
                        "codes": set(), "descriptions": set(), "experimental": True, "refs": set()})
                    entry["codes"] |= target["codes"]
                    if target["description"]:
                        entry["descriptions"].add(target["description"])
                    # Stable when any branch lists it as a plain, non-experimental target.
                    stable = ref.endswith("main") and not target["experimental"]
                    entry["experimental"] = entry["experimental"] and not stable
                    entry["refs"].add(ref.rsplit("/", 1)[-1])
    return apps


# ── The decision ────────────────────────────────────────────────────────────

def is_tv(description):
    return bool(description) and "tv" in description.lower()


def evaluate(fields, apps):
    """None when the report matches a supported target or cannot be checked, else what is wrong."""
    app, version = fields.get("App"), fields.get("App version")
    if not app or not version or app not in apps:
        return None
    versions = apps[app]
    match = next((v for v in versions if v.lower() == version.strip().lower()), None)
    if match is None:
        return {"kind": "version", "app": app, "version": version.strip(), "versions": versions}
    entry = versions[match]
    code = (fields.get("App version code") or "").strip()
    if code.isdigit() and entry["codes"] and int(code) not in entry["codes"]:
        return {"kind": "build", "app": app, "version": match, "versions": versions,
                "reason": f"its version code is `{code}`"}
    build = fields.get("Phone or Android TV build") or ""
    descriptions = entry["descriptions"]
    if descriptions and build.startswith("Android TV") and not any(is_tv(d) for d in descriptions):
        return {"kind": "build", "app": app, "version": match, "versions": versions,
                "reason": "it is the Android TV build"}
    if descriptions and build.startswith("Phone") and all(is_tv(d) for d in descriptions):
        return {"kind": "build", "app": app, "version": match, "versions": versions,
                "reason": "it is the phone build"}
    return None


# ── The comment ─────────────────────────────────────────────────────────────

def version_line(version, entry):
    details = []
    if entry["descriptions"]:
        details.append(", ".join(sorted(entry["descriptions"])))
    if entry["codes"]:
        codes = ", ".join(f"`{c}`" for c in sorted(entry["codes"]))
        details.append(f"version code {codes}")
    if entry["refs"] == {"dev"}:
        details.append("experimental, in the dev pre-releases only")
    elif entry["experimental"]:
        details.append("experimental")
    return f"- `{version}`" + (f": {'; '.join(details)}" if details else "")


def comment(problem):
    supported = "\n".join(version_line(v, e) for v, e in sorted(problem["versions"].items()))
    if problem["kind"] == "version":
        opening = (f"The patches do not support {problem['app']} `{problem['version']}`, so this report "
                   f"cannot be looked into yet. They support these versions of {problem['app']}:")
    else:
        opening = (f"The patches support {problem['app']} `{problem['version']}`, but not the file you "
                   f"patched, because {problem['reason']}. They support these versions and builds of "
                   f"{problem['app']}:")
    return (f"{opening}\n\n{supported}\n\n"
            f"Please patch one of these and check whether the problem still happens. If it does, edit this "
            f"issue so it lists the version and build you used, and the `{LABEL}` label will be removed. "
            f"An issue with this label closes after 7 days without an update.")


def is_dev_report(fields):
    release = fields.get("Patches release") or ""
    version = fields.get("Patches version") or ""
    return release == "Dev pre-release" or "-dev" in version.lower()


def dev_comment(app, testing):
    links = "\n".join(f"- [{i['title']}]({i['url']})" for i in testing)
    return (f"This report is for a dev pre-release. Dev pre-releases are for testing, and each new "
            f"{app} version in testing has an open issue that collects reports:\n\n{links}\n\n"
            f"Please post this problem as a comment there, along with your device and Android version, "
            f"and close this issue. Keep this issue open only for a critical problem, such as a patched app "
            f"that will not install or open. Please report a security problem privately, as the "
            f"[security policy](https://github.com/{os.environ.get('GH_REPO', '')}/blob/main/SECURITY.md) describes.")


def testing_issues(app):
    out = subprocess.run(["gh", "issue", "list", "--label", TESTING_LABEL, "--state", "open", "--limit", "100",
                          "--json", "number,title,url"], capture_output=True, text=True).stdout
    prefix = f"{APP_UPDATE_PREFIX}{app} "
    return [i for i in json.loads(out or "[]") if i["title"].startswith(prefix)]


# ── Acting on the issue ─────────────────────────────────────────────────────

def has_evidence(body, fields):
    """Whether a bug report includes a screenshot or video, or a crash log with a stack trace."""
    if ATTACHMENT.search(body or ""):
        return True
    log = fields.get("Crash log") or ""
    return bool(CRASH.search(log))


def form_of(fields):
    """The form file an issue was made with, from the headings in its body, or None."""
    return next((form for heading, form in FORM_MARKERS.items() if heading in fields), None)


def required_fields(form, forms_dir=FORMS_DIR):
    """(label, type) of the fields the form marks required, in form order. Checkbox groups are left
    out: GitHub enforces those, and their answers do not appear as fields."""
    text = open(os.path.join(forms_dir, form)).read()
    labels = []
    for item in re.split(r"(?m)^  - type: ", text.split("\nbody:\n", 1)[1])[1:]:
        kind = item.split("\n", 1)[0].strip()
        label = re.search(r"^      label: (.+)$", item, re.M)
        if kind in ("markdown", "checkboxes") or not label:
            continue
        if re.search(r"^    validations:\n(?:      .*\n)*?      required: true", item, re.M):
            labels.append((label.group(1).strip().strip('"'), kind))
    return labels


def missing(body, fields, form, forms_dir=FORMS_DIR):
    """What the report still needs: empty required fields, and for a bug report, evidence."""
    # GitHub writes "None" for a dropdown left empty.
    gaps = [label for label, kind in required_fields(form, forms_dir)
            if not fields.get(label) or (kind == "dropdown" and fields[label] == "None")]
    if form == "1-bug-report.yml" and not has_evidence(body, fields):
        gaps.append("a screenshot, video, or crash log")
    if form == "0-version-or-build.yml" and not ATTACHMENT.search(body or ""):
        gaps.append("a screenshot of Morphe Manager's message")
    return gaps


def incomplete_comment(gaps):
    items = "\n".join(f"- {gap}" for gap in gaps)
    return ("This issue is missing details that are needed to look into it:\n\n" + items + "\n\n"
            "Please edit this issue and fill them in. A screenshot or video can be attached by dragging it "
            "into the issue, and a crash log can be pasted in the Crash log field. The `incomplete` label is "
            "removed when nothing is missing. An issue with this label closes after 7 days without an update.\n")


def ensure_label(name):
    """Creates the label if it is missing. Its color and description come from
    .github/labels.json, so an existing label is left as it is."""
    if os.environ.get("DRY_RUN") == "true":
        print(f"would make sure the label exists: {name}")
        return
    subprocess.run(["gh", "label", "create", name], capture_output=True, text=True)


def gh(*args):
    if os.environ.get("DRY_RUN") == "true":
        print("would run: gh " + " ".join(args))
        return
    subprocess.run(["gh", *args], check=True)


def main():
    event = json.load(open(os.environ["GITHUB_EVENT_PATH"]))
    issue = event["issue"]
    number = str(issue["number"])
    labels = {label["name"] for label in issue.get("labels", [])}
    fields = parse_form(issue.get("body"))
    form = form_of(fields)
    gaps = missing(issue.get("body"), fields, form) if form else []
    if gaps and INCOMPLETE_LABEL not in labels:
        print(f"#{number}: incomplete, missing {', '.join(gaps)}")
        ensure_label(INCOMPLETE_LABEL)
        gh("issue", "edit", number, "--add-label", INCOMPLETE_LABEL)
        if os.environ.get("DRY_RUN") == "true":
            print("would comment:\n" + incomplete_comment(gaps))
        else:
            subprocess.run(["gh", "issue", "comment", number, "--body-file", "-"], input=incomplete_comment(gaps),
                           text=True, check=True)
    elif not gaps and INCOMPLETE_LABEL in labels:
        print(f"#{number}: no longer incomplete")
        gh("issue", "edit", number, "--remove-label", INCOMPLETE_LABEL)
    if form not in ("0-version-or-build.yml", "1-bug-report.yml"):
        return
    if form == "1-bug-report.yml" and is_dev_report(fields) and DEV_LABEL not in labels:
        app = fields.get("App")
        testing = testing_issues(app) if app else []
        print(f"#{number}: dev pre-release report for {app}, {len(testing)} testing issue(s)")
        ensure_label(DEV_LABEL)
        gh("issue", "edit", number, "--add-label", DEV_LABEL)
        if testing:
            if os.environ.get("DRY_RUN") == "true":
                print("would comment:\n" + dev_comment(app, testing))
            else:
                subprocess.run(["gh", "issue", "comment", number, "--body-file", "-"],
                               input=dev_comment(app, testing), text=True, check=True)
    problem = evaluate(fields, load_targets())
    if problem:
        print(f"#{number}: {problem['kind']} problem for {problem['app']} {problem['version']}")
        if LABEL in labels:
            return
        ensure_label(LABEL)
        gh("issue", "edit", number, "--add-label", LABEL)
        if os.environ.get("DRY_RUN") == "true":
            print("would comment:\n" + comment(problem))
        else:
            subprocess.run(["gh", "issue", "comment", number, "--body-file", "-"], input=comment(problem),
                           text=True, check=True)
    elif LABEL in labels:
        print(f"#{number}: the report now matches a supported target")
        gh("issue", "edit", number, "--remove-label", LABEL)
    else:
        print(f"#{number}: nothing to do")


if __name__ == "__main__":
    sys.exit(main())
