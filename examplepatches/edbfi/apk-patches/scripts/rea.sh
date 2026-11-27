#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-or-later
# Runs rea from the main checkout's .rea/install (just setup-rea), shared by every worktree, with this repo's tool
# paths. With no arguments it starts the MCP server (as .mcp.json, .codex/config.toml and
# opencode.json do); otherwise it runs a rea CLI command, e.g. `scripts/rea.sh doctor`.
set -eu
root=$(cd "$(git rev-parse --path-format=absolute --git-common-dir)/.." && pwd)
rea=$root/.rea/install
if [ ! -x "$rea/node_modules/node/bin/node" ]; then
    echo "rea is not installed: run 'just setup-rea' in $root" >&2
    exit 1
fi

# MCP clients may start this without a login shell, so find Homebrew by path.
for prefix in /home/linuxbrew/.linuxbrew /opt/homebrew /usr/local; do
    if [ -x "$prefix/bin/brew" ]; then
        PATH=$prefix/bin:$PATH
        # Homebrew's JDK 25 wins over any other JAVA_HOME: Ghidra and JADX need a full JDK.
        # The JDK home is libexec on Linux and libexec/openjdk.jdk/Contents/Home on macOS.
        for jdk in "$prefix/opt/openjdk@25/libexec/openjdk.jdk/Contents/Home" "$prefix/opt/openjdk@25/libexec"; do
            if [ -x "$jdk/bin/javac" ]; then
                JAVA_HOME=$jdk
                break
            fi
        done
        break
    fi
done

# Prefer a Homebrew Ghidra release, which follows the supported 12.x line.
if [ -z "${GHIDRA_INSTALL_DIR-}" ]; then
    for prefix in /home/linuxbrew/.linuxbrew /opt/homebrew /usr/local; do
        for dir in "$prefix"/opt/ghidra/*/libexec; do
            if [ -f "$dir/Ghidra/application.properties" ]; then
                GHIDRA_INSTALL_DIR=$dir
                break
            fi
        done
        [ -n "${GHIDRA_INSTALL_DIR-}" ] && break
    done
fi

REA_JADX_MCP_JAR=$rea/jadx-headless-mcp-0.7.1-all.jar
export PATH JAVA_HOME GHIDRA_INSTALL_DIR REA_JADX_MCP_JAR
[ $# -gt 0 ] || set -- mcp
exec "$rea/node_modules/node/bin/node" "$rea/node_modules/rea-agents/scripts/rea.mjs" "$@"
