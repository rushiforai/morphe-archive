#!/usr/bin/env python3
"""Bot replies to issue comments.

Open issue + "any updates?" ping -> "no ETA yet".
Closed issue + a new problem report -> point to the issue forms.

Exit codes: 0 = reply on stdout, 3 = no reply needed.
Usage: issue_comment.py <event.json>
"""

import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from replies import closed_issue_reply, status_ping_reply

NO_REPLY = 3
COLLABORATORS = {"OWNER", "MEMBER", "COLLABORATOR"}

PING = re.compile(
    r"\bany\s+(updates?|news|progress)\b"
    r"|\beta\b"
    r"|\bwhen\s+will\b"
    r"|\bstill\s+(planned|alive)\b"
    r"|\b(has|is)\s+(this|it)\s+(been\s+)?(added|done|ready)\s+yet\b",
    re.I,
)

PROBLEM = re.compile(
    r"\b(not|doesn'?t|does\s+not|didn'?t|stopped|no\s+longer)\s+work"
    r"|\bbroken\b|\bcrash(es|ed|ing)?\b|\bfail(s|ed|ing)?\b"
    r"|(?<!\bno\s)(?<!without\s)\berrors?\b",
    re.I,
)

RESOLVED = re.compile(
    r"\bworks?\s+(now|fine|great|perfectly)\b"
    r"|\bnow\s+(it\s+)?works\b"
    r"|\bfixed\s+now\b|\bsolved\b"
    r"|\b(doesn'?t|does\s+not|no\s+longer)\s+crash\b",
    re.I,
)

QUOTED = re.compile(r"^[ \t]*>.*$", re.M)
CODE = re.compile(r"```.*?(?:```|\Z)|`[^`]*`|<!--.*?(?:-->|\Z)", re.S)


def clean(text):
    return CODE.sub("", QUOTED.sub("", text or ""))


def reply_for(issue, comment):
    if comment.get("user", {}).get("type") == "Bot":
        return None
    if comment.get("author_association") in COLLABORATORS:
        return None
    body = clean(comment.get("body"))
    if issue.get("state") == "open":
        return status_ping_reply() if PING.search(body) else None
    if issue.get("state") == "closed":
        if PROBLEM.search(body) and not RESOLVED.search(body):
            return closed_issue_reply()
    return None


def main():
    event = json.loads(Path(sys.argv[1]).read_text())
    reply = reply_for(event.get("issue", {}), event.get("comment", {}))
    if reply is None:
        sys.exit(NO_REPLY)
    print(reply, end="")


if __name__ == "__main__":
    main()
