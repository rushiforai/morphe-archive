#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# Plays the e2e scenarios and records each as a GIF and an MP4, for the PR (docs/hosting.md, "E2E videos on pull
# requests"). Two projects hold scenarios, each under its Scenarios/: tests/BaconReader.E2E (the app, on the phone)
# and tests/BaconReader.VsCodeExtension.E2E (the VS Code extension, tools/vscode-extension, in VS Code for the web).
#   tools/e2e/record.sh [all | <domain folder> | <TestClass> ...] [--changed-since <git ref>] [--action-gap <seconds>]
#                       [--out <dir>] [--no-bundle] [--no-video]
# A domain folder is a folder under a project's Scenarios/ (Startup, LoggedIn/Comments); a class is a scenario class
# (SpoofClientTests). Nothing named, and no --changed-since: all of them.
# --changed-since <ref>: the scenario classes added or changed since the branch left <ref> (working tree included):
# "this PR's scenarios" with origin/dev. A change to the extension (tools/vscode-extension) or to the files its
# scenarios open (the extension's project's Workspace/) picks every extension scenario, "selected": "fixtures".
# --action-gap <seconds>: the least time between two steps of a recorded scenario (default 0.4).
# The app's scenarios need the phone's connection in its environment (E2E_APPIUM_URL, E2E_ADB_SERIAL,
# E2E_ARTIFACTS_DIR: run it in the shell that sourced the connection script, tests/BaconReader.E2E/README.md, "The
# phone"). For them it builds the bundles
# first (./gradlew buildAndroid, which builds the test-only one in e2e-patches/ too; --no-bundle reuses the last ones)
# and runs the chosen scenarios with E2E_VIDEO_DIR set: each one patches, installs and records itself (BaseE2E). Each
# run's video becomes <out>/<domain folder>/<gif name>.gif (15 fps, 360 px wide) and .mp4 (H.264 at the recording's
# size, 576 px wide), both holding their last frame 3 s, and <out>/scenarios.json lists them (the e2e tool's write-scenarios).
# For the extension's scenarios it serves VS Code for the web (@vscode/test-web, pinned with the VS Code build in
# tests/BaconReader.VsCodeExtension.E2E/vscode-web/package.json; the build is cached in
# ${E2E_VSCODE_CACHE:-~/.cache/baconreader/vscode-web}) with tools/vscode-extension, opened on that project's Workspace/,
# and runs them with E2E_VSCODE_URL. Each run's browser video is trimmed from when VS Code's workbench showed (the e2e
# tool's find-home) and becomes a GIF (20 fps, 800 px wide) and an MP4 (H.264 at its 1280×800).
# Exits non-zero when a scenario failed (its GIF is still written).
# --no-video: the same scenarios, unrecorded and unpaced: the fast run while developing. It prints each run's result and
# time and leaves the last recording in <out> as it is.
# Right before a push that adds or changes scenarios (never between pushes): tools/e2e/record.sh --changed-since
# origin/dev, then tools/e2e/push-gifs.sh right after the push.
set -euo pipefail

repo="$(cd "$(dirname "$0")/../.." && pwd)"
out="$repo/out"
changed_since=""
action_gap=0.4
bundle=1
video=1
chosen=()

while [ $# -gt 0 ]; do
  case "$1" in
    --changed-since) changed_since="$2"; shift 2 ;;
    --action-gap) action_gap="$2"; shift 2 ;;
    --out) out="$2"; shift 2 ;;
    --no-bundle) bundle=0; shift ;;
    --no-video) video=0; shift ;;
    -h|--help) sed -n '4,31p' "$0"; exit 0 ;;
    *) chosen+=("$1"); shift ;;
  esac
done
mkdir -p "$out"
out="$(cd "$out" && pwd)"
cd "$repo"

mapfile -t projects < <(find tests -mindepth 2 -maxdepth 2 -name '*.E2E.csproj' | sort)
app_project=tests/BaconReader.E2E/BaconReader.E2E.csproj
vscode_project=tests/BaconReader.VsCodeExtension.E2E/BaconReader.VsCodeExtension.E2E.csproj
# The project file whose Scenarios/ holds a scenario class, or nothing.
find_class_project() {
  local project
  for project in "${projects[@]}"; do
    if [ -n "$(find "$(dirname "$project")/Scenarios" -name "$1.cs" -print -quit 2> /dev/null)" ]; then echo "$project"; fi
  done
}

# The scenario classes added or changed since a ref, "<class>\tchanged" each, and every extension scenario class when the
# extension or its Workspace/ changed, "<class>\tfixtures\t<the changed file>" (write-scenarios' selection.tsv).
list_changed_classes() {
  local base project scenarios file class
  base="$(git merge-base "$1" HEAD)"
  for project in "${projects[@]}"; do
    scenarios="$(dirname "$project")/Scenarios"
    [ -d "$scenarios" ] || continue
    { git diff --name-only --diff-filter=AMR "$base" -- "$scenarios"; git ls-files --others --exclude-standard -- "$scenarios"; } |
      sort -u | { grep 'Tests\.cs$' || true; } | xargs -r -n1 basename | sed 's/\.cs$/\tchanged/'
  done
  local workspace extension
  workspace="$(dirname "$vscode_project")/Workspace"
  extension=tools/vscode-extension
  for file in $( { git diff --name-only "$base" -- "$workspace" "$extension"; git ls-files --others --exclude-standard -- "$workspace" "$extension"; } | sort -u); do
    for class in $(find "$(dirname "$vscode_project")/Scenarios" -name '*Tests.cs' -exec basename {} .cs \;); do
      printf '%s\tfixtures\t%s\n' "$class" "$file"
    done
  done
}

# Each project's dotnet test filter ('|' is "or"); a project with none doesn't run.
declare -A filters=()
add_filter() {
  filters[$1]="${filters[$1]:+${filters[$1]}|}$2"
}
selection="$out/.selection.tsv"
: > "$selection"
if [ -n "$changed_since" ]; then
  list_changed_classes "$changed_since" | sort -u > "$selection"
  while IFS=$'\t' read -r class _; do
    for project in $(find_class_project "$class"); do add_filter "$project" "FullyQualifiedName~.$class."; done
  done < <(cut -f1 "$selection" | sort -u)
  if [ ${#filters[@]} -eq 0 ] && [ ${#chosen[@]} -eq 0 ]; then
    echo "No scenario changed since $changed_since."
    if [ $video -eq 1 ]; then echo "[]" > "$out/scenarios.json"; fi
    exit 0
  fi
fi
everything=0
for choice in "${chosen[@]}"; do
  choice="${choice%/}"
  found=0
  if [ "$choice" = all ]; then
    everything=1
    found=1
  fi
  for project in "${projects[@]}"; do
    if [ "$choice" != all ] && [ -d "$(dirname "$project")/Scenarios/$choice" ]; then
      add_filter "$project" "FullyQualifiedName~$(basename "$project" .csproj).Scenarios.${choice//\//.}."
      found=1
    fi
  done
  for project in $(find_class_project "$choice"); do
    add_filter "$project" "FullyQualifiedName~.$choice."
    found=1
  done
  if [ $found -eq 0 ]; then
    echo "No domain folder or scenario class named '$choice' under tests/*/Scenarios" >&2
    exit 2
  fi
done
if [ $everything -eq 1 ] || { [ -z "$changed_since" ] && [ ${#chosen[@]} -eq 0 ]; }; then
  for project in "${projects[@]}"; do filters[$project]="FullyQualifiedName~$(basename "$project" .csproj).Scenarios."; done
fi

if [ -n "${filters[$app_project]:-}" ]; then
  if [ $bundle -eq 1 ]; then
    echo "Building the bundles (./gradlew buildAndroid: patches/ and e2e-patches/)…"
    ./gradlew buildAndroid --no-daemon -q || { echo "The bundle didn't build." >&2; exit 1; }
  fi

  if [ -z "${E2E_APPIUM_URL:-}" ] || [ -z "${E2E_ADB_SERIAL:-}" ]; then
    echo "No phone: E2E_APPIUM_URL and E2E_ADB_SERIAL aren't set. Source the phone's connection script in this shell" \
         "first (tests/BaconReader.E2E/README.md, \"The phone\")." >&2
    exit 1
  fi
fi

dotnet build tools/e2e/BaconReader.E2ETools -c Release --nologo -v q > /dev/null
e2e_tool() { dotnet "$repo/tools/e2e/BaconReader.E2ETools/bin/Release/net10.0/BaconReader.E2ETools.dll" "$@"; }

# VS Code for the web with the extension under development, opened on the extension's project's Workspace/, for its
# scenarios (E2E_VSCODE_URL).
vscode_url=""
servers=()
trap 'for pid in "${servers[@]}"; do kill "$pid" 2> /dev/null || true; done' EXIT
if [ -n "${filters[$vscode_project]:-}" ]; then
  runner="$(dirname "$vscode_project")/vscode-web"
  if [ ! -d "$runner/node_modules/@vscode/test-web" ] || [ "$runner/package-lock.json" -nt "$runner/node_modules" ]; then
    echo "Installing VS Code for the web's runner (npm ci)…"
    npm ci --prefix "$runner" --silent --no-audit --no-fund
    touch "$runner/node_modules"
  fi
  commit="$(e2e_tool vscode-commit "$runner/package.json")"
  cache="${E2E_VSCODE_CACHE:-$HOME/.cache/baconreader/vscode-web}"
  mkdir -p "$cache"
  port="$(e2e_tool free-port)"
  echo "Serving VS Code for the web (build ${commit:0:7}) with the extension…"
  "$runner/node_modules/.bin/vscode-test-web" --browser=none --quality stable --commit "$commit" --port "$port" \
    --testRunnerDataDir "$cache" --extensionDevelopmentPath="$repo/tools/vscode-extension" \
    "$(dirname "$vscode_project")/Workspace" > "$out/.vscode-web.log" 2>&1 &
  servers+=($!)
  for _ in $(seq 600); do
    curl -sf "http://localhost:$port/" > /dev/null && break
    sleep 0.5
  done
  curl -sf "http://localhost:$port/" > /dev/null || { echo "VS Code for the web didn't start: see $out/.vscode-web.log" >&2; exit 1; }
  vscode_url="http://localhost:$port/"
fi

raw="$out/.raw"
results="$out/.results"
rm -rf "$raw" "$results"
failed=0
for project in "${!filters[@]}"; do
  echo "Playing $(basename "$project" .csproj): ${filters[$project]}"
  if [ $video -eq 1 ]; then
    E2E_VSCODE_URL="$vscode_url" E2E_VIDEO_DIR="$raw" E2E_ACTION_GAP="$action_gap" dotnet test "$project" --filter "${filters[$project]}" \
      --logger "trx;LogFileName=$(basename "$project" .csproj).trx" --results-directory "$results" || failed=1
  else
    env -u E2E_VIDEO_DIR E2E_VSCODE_URL="$vscode_url" dotnet test "$project" --filter "${filters[$project]}" \
      --logger "trx;LogFileName=$(basename "$project" .csproj).trx" --results-directory "$results" || failed=1
  fi
done

if [ $video -eq 0 ]; then
  e2e_tool report-runs "$results"/*.trx || failed=1
  exit $failed
fi

# screenrecord writes a frame only when the screen changes: fps= gives the GIF and the MP4 a steady rate.
hold_end="tpad=stop_mode=clone:stop_duration=3"
palette="split[a][b];[a]palettegen=max_colors=128:stats_mode=diff[p];[b][p]paletteuse=dither=bayer:bayer_scale=4:diff_mode=rectangle"
gif_filter="fps=15,$hold_end,scale=360:-1:flags=lanczos,$palette"
# A browser run (the extension's scenarios): from when VS Code's workbench showed, 20 fps, 800 px wide.
browser_gif_filter="$hold_end,fps=20,scale=800:-1:flags=lanczos,$palette"
records=()
while IFS= read -r record; do
  domain="$(dirname "${record#"$raw"/}")"
  name="$(basename "$record" .json)"
  mkdir -p "$out/$domain"
  if [ -f "${record%.json}.mp4" ]; then
    ffmpeg -nostdin -loglevel error -y -i "${record%.json}.mp4" -vf "$gif_filter" "$out/$domain/$name.gif"
    ffmpeg -nostdin -loglevel error -y -i "${record%.json}.mp4" -vf "fps=30,$hold_end" -an \
      -c:v libx264 -preset veryfast -crf 20 -pix_fmt yuv420p -movflags +faststart "$out/$domain/$name.mp4"
  elif [ -f "${record%.json}.webm" ]; then
    read -r _ _ _ offset < <(e2e_tool find-home "$record") || offset=0
    ffmpeg -nostdin -loglevel error -y -ss "${offset:-0}" -i "${record%.json}.webm" -vf "$browser_gif_filter" "$out/$domain/$name.gif"
    ffmpeg -nostdin -loglevel error -y -ss "${offset:-0}" -i "${record%.json}.webm" -vf "$hold_end" -an \
      -c:v libx264 -preset veryfast -crf 18 -pix_fmt yuv420p -movflags +faststart "$out/$domain/$name.mp4"
  else
    echo "No video for $domain/$name: its post says \"No recording\"."
  fi
  records+=("$record")
done < <(find "$raw" -path "$raw/.raw" -prune -o -name '*.json' -print 2> /dev/null | sort)

e2e_tool write-scenarios "$out" "$selection" "${records[@]}"
if grep -q '"passed": false' "$out/scenarios.json"; then failed=1; fi
exit $failed
