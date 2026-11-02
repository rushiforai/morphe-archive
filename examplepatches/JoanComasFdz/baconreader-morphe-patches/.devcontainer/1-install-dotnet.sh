#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# .NET 10: dotnet-sdk-10.0 from Ubuntu's own archive (global.json's rollForward takes its feature band), then the e2e
# solution's packages.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v dotnet >/dev/null 2>&1; then
  sudo apt-get update -qq
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends dotnet-sdk-10.0
fi
dotnet restore "$REPO/BaconReader.E2E.slnx"
