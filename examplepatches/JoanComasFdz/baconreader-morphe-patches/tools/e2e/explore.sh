#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# Explores BaconReader on the phone before writing a Gherkin (tests/BaconReader.E2E/README.md, "Exploring the app before
# writing a Gherkin"): the explorer (tests/BaconReader.E2E/Exploring/Explorer.cs) sets the app up as a LoggedIn scenario
# does, with the Reddit data of a commands file, then runs the commands this script sends it.
#   tools/e2e/explore.sh start <commands file>   # runs the explorer until "quit"; run it in the background
#   tools/e2e/explore.sh <command> [<command> ...] # sends commands, one an argument, and prints the answers
# Both in a shell that sourced tools/e2e/connect.sh, with the bundles built (record.sh builds them). The explorer and this
# script talk through build/e2e/explore/: "commands" in, "answer" out, "ready" once the app is logged in, and the page
# sources (source-<n>.xml) and screenshots (screenshot-<n>.png) the commands ask for. After "source", this script also
# prints the views of that page source that show a text or a description, or can be tapped.
# Exit codes: 0 answered, 1 the explorer isn't running or didn't answer within 5 minutes, 2 a bad argument.
set -euo pipefail

root=$(git -C "$(dirname "$0")" rev-parse --show-toplevel)
folder="$root/build/e2e/explore"

if [ $# -eq 0 ]; then
  sed -n '4,13p' "$0" | sed 's/^# \{0,1\}//' >&2
  exit 2
fi

if [ "$1" = start ]; then
  [ $# -eq 2 ] && [ -f "$2" ] || { echo "Usage: tools/e2e/explore.sh start <commands file>" >&2; exit 2; }
  commands=$(cd "$(dirname "$2")" && pwd)/$(basename "$2")
  cd "$root"
  E2E_EXPLORE="$commands" exec dotnet test tests/BaconReader.E2E --nologo --filter "FullyQualifiedName~BaconReader.E2E.Exploring."
fi

# The explorer writes "ready" once the app is logged in, which takes a minute or two (longer with a new APK to send).
for _ in $(seq 1 600); do [ -f "$folder/ready" ] && break; sleep 0.5; done
[ -f "$folder/ready" ] || { echo "The explorer isn't running: start it with tools/e2e/explore.sh start <commands file>." >&2; exit 1; }

rm -f "$folder/answer"
printf '%s\n' "$@" > "$folder/commands.writing"
mv "$folder/commands.writing" "$folder/commands"
for _ in $(seq 1 600); do [ -f "$folder/answer" ] && break; sleep 0.5; done
[ -f "$folder/answer" ] || { echo "The explorer didn't answer within 5 minutes." >&2; exit 1; }
cat "$folder/answer"

# The views of the newest page source a person looks for: those with a text or a description, or that can be tapped.
source=$(grep -o '^source .*' "$folder/answer" | tail -n 1 | cut -d' ' -f2- || true)
if [ -n "$source" ] && command -v python3 > /dev/null; then
  python3 - "$source" << 'PY'
import sys, xml.etree.ElementTree as ElementTree
for view in ElementTree.parse(sys.argv[1]).iter():
    a = view.attrib
    text, description, view_id = a.get("text", ""), a.get("content-desc", ""), a.get("resource-id", "").split("/")[-1]
    if text or description or (view_id and a.get("clickable") == "true"):
        flags = ("enabled " if a.get("enabled") == "true" else "disabled ") + ("clickable" if a.get("clickable") == "true" else "")
        print(f"{view.tag.split('.')[-1]:14} id={view_id:22} {flags:18} {a.get('bounds', '')} text={text!r} description={description!r}")
PY
fi
