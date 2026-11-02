#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# The Chromium the VS Code extension's e2e scenarios drive, with its system libraries: the build the Playwright pinned in
# Directory.Packages.props expects. The cloud sessions' image ships it in /opt/pw-browsers; here it goes to Playwright's
# default folder (~/.cache/ms-playwright), where the .NET Playwright finds it too. Needs Node (devcontainer.json's node
# feature).
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

playwright="$(sed -n 's/.*"Microsoft.Playwright" Version="\([^"]*\)".*/\1/p' "$REPO/Directory.Packages.props")"
npx --yes "playwright@$playwright" install --with-deps chromium ffmpeg
