#!/bin/bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# Plays e2e scenarios on the phone from the NAS's runner (README.md here), in the job of .github/workflows/e2e-phone.yml.
# Same file in both BaconReader repos.
#   tools/e2e/nas/run.sh <record.sh arguments>   -> waits for the phone's lease, takes it, keeps it while record.sh
#                                                   --no-bundle <arguments> plays, then releases it
# The workflow puts the bundles where record.sh looks for them and names the patcher (E2E_RESEAM or E2E_MORPHE_DESKTOP).
# The runner's container gives E2E_PHONE_LAN, E2E_ADB_KEY_FILE and E2E_ARTIFACTS_DIR (compose.yaml).
# E2E_LEASE_WAIT_MINUTES (default 45): how long to wait while another session holds the lease, then fail.
# Exits with record.sh's code, or 1 when the phone can't be reached or stayed leased.
set -o pipefail

repo="$(cd "$(dirname "$0")/../../.." && pwd)"
cd "$repo"
[ -r "${E2E_ADB_KEY_FILE:-}" ] || { echo "E2E_ADB_KEY_FILE isn't a readable file: ${E2E_ADB_KEY_FILE:-not set}" >&2; exit 1; }
E2E_ADB_KEY="$(tr -d '\n' < "$E2E_ADB_KEY_FILE")"
export E2E_ADB_KEY
export E2E_LEASE_ID="${E2E_LEASE_ID:-nas-$(basename "${GITHUB_REPOSITORY:-$repo}")-${GITHUB_RUN_ID:-$$}}"
wait_minutes="${E2E_LEASE_WAIT_MINUTES:-45}"

# A function, so connect.sh sees no arguments (sourced, it would see this script's).
connect() { source "$repo/tools/e2e/connect.sh"; }
waited=0
while true; do
  connect
  status=$?
  [ $status -eq 0 ] && break
  if [ $status -ne 3 ] || [ $waited -ge "$wait_minutes" ]; then
    [ $status -eq 3 ] && echo "The phone stayed leased for $wait_minutes minutes: giving up." >&2
    tools/e2e/connect.sh --down
    exit 1
  fi
  echo "Waiting for the lease ($waited of $wait_minutes minutes)…"
  sleep 60
  waited=$((waited + 1))
done

tools/e2e/lease.sh keep "$E2E_ADB_SERIAL" "$E2E_LEASE_ID" &
keeper=$!
# The C# compiler's server (VBCSCompiler) would outlive the job by about 10 minutes, holding ~300 MB.
trap 'kill $keeper 2> /dev/null; wait $keeper 2> /dev/null; tools/e2e/connect.sh --down; dotnet build-server shutdown > /dev/null 2>&1' EXIT
tools/e2e/record.sh --no-bundle "$@"
