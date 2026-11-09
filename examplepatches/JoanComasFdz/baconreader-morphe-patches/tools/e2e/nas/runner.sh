#!/bin/bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# The runner container's entry point (README.md here). Same file in both BaconReader repos.
#   runner.sh register <owner>/<repo> <registration token>  -> registers a runner for that repo, once, in the state volume
#   runner.sh                                               -> runs every registered runner, each restarted when it stops,
#                                                              and signs them out of GitHub when the container stops
# Each repo's runner is a copy of /opt/actions-runner in ~/state/runners/<repo>, named nas-<repo>, with the label
# baconreader-phone. It is persistent: registered once, it keeps its registration across restarts and image rebuilds,
# and updates itself.
set -euo pipefail

state="$HOME/state/runners"
mkdir -p "$state" "$HOME/state/cache"

if [ "${1:-}" = register ]; then
  slug="${2:-}" token="${3:-}"
  [[ $slug =~ ^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$ ]] && [ -n "$token" ] ||
    { echo "Usage: runner.sh register <owner>/<repo> <registration token>" >&2; exit 2; }
  dir="$state/${slug#*/}"
  if [ -f "$dir/.runner" ]; then
    echo "${slug#*/} already has a runner in $dir: remove it there first (./config.sh remove --token <removal token>)." >&2
    exit 1
  fi
  rm -rf "$dir"
  cp -a /opt/actions-runner "$dir"
  cd "$dir"
  ./config.sh --unattended --url "https://github.com/$slug" --token "$token" \
    --name "nas-${slug#*/}" --labels baconreader-phone --work _work --replace
  exit 0
fi

shopt -s nullglob
runners=("$state"/*/.runner)
[ ${#runners[@]} -gt 0 ] || { echo "No runner registered: runner.sh register <owner>/<repo> <token> (README.md)." >&2; exit 1; }
# docker stop sends TERM (through compose's init): each loop passes it on to its runner, whose run.sh signs the runner out
# of GitHub. Killed without it, the next start waited ~2.5 min on "A session for this runner already exists" (2026-11-08).
loops=()
for runner in "${runners[@]}"; do
  dir="$(dirname "$runner")"
  (
    cd "$dir"
    child=""
    trap '[ -n "$child" ] && kill -TERM "$child" 2> /dev/null; wait; exit 0' TERM INT
    while true; do
      ./run.sh &
      child=$!
      wait "$child" || echo "$(basename "$dir")'s runner stopped ($?): starting it again in 30 s." >&2
      child=""
      sleep 30 &
      wait $!
    done
  ) &
  loops+=($!)
done
trap 'kill -TERM "${loops[@]}" 2> /dev/null; wait; exit 0' TERM INT
wait
