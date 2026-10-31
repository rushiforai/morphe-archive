#!/bin/bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# Installs Morphe Desktop, the patcher of Morphe bundles (`java -jar … patch`), from the newest unexpired
# `morphe-desktop` artifact of baconreader-morphe-patches' dev_build.yml: the session's proxy refuses GitHub release
# downloads, but that workflow uploads the latest release's jar on every dev build.
#   tools/morphe-desktop.sh   -> /opt/patch-tools/morphe-desktop.jar (a link to the jar), and prints its path
# Needs this repository attached to the session (add_repo): its artifacts are read through GitHub's API (gh).
# Skips the download when that artifact is already installed. If every artifact has expired (90 days), run
# dev_build.yml once (Actions → dev build → Run workflow) and retry.
set -euo pipefail

REPO=JoanComasFdz/baconreader-morphe-patches
DIR=/opt/patch-tools/morphe-desktop
LINK=/opt/patch-tools/morphe-desktop.jar
sudo=""
[ "$(id -u)" -ne 0 ] && sudo="sudo"

artifact=$(gh api "repos/$REPO/actions/artifacts?name=morphe-desktop&per_page=30" \
  --jq '[.artifacts[] | select(.expired | not)] | sort_by(.created_at) | last | "\(.id) \(.created_at)"') ||
  { echo "morphe-desktop: can't read $REPO's artifacts: attach the repository to the session first (add_repo)." >&2; exit 1; }
if [ -z "$artifact" ] || [ "$artifact" = "null null" ]; then
  echo "morphe-desktop: no unexpired artifact in $REPO: run dev_build.yml once (Actions → dev build → Run workflow)." >&2
  exit 1
fi
read -r id created <<< "$artifact"

if [ -e "$LINK" ] && [ -f "$DIR/$id/.complete" ]; then
  echo "$LINK"
  exit 0
fi

work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
gh api "repos/$REPO/actions/artifacts/$id/zip" > "$work/artifact.zip"
unzip -q "$work/artifact.zip" -d "$work/jar"
jar=$(find "$work/jar" -name 'morphe-desktop-*-all.jar' | head -1)
[ -n "$jar" ] || { echo "morphe-desktop: artifact $id holds no morphe-desktop-*-all.jar" >&2; exit 1; }
$sudo mkdir -p "$DIR/$id"
$sudo cp "$jar" "$DIR/$id/"
$sudo touch "$DIR/$id/.complete"
$sudo ln -sfn "$DIR/$id/$(basename "$jar")" "$LINK"
echo "morphe-desktop: $(basename "$jar") (artifact $id, $created)" >&2
echo "$LINK"
