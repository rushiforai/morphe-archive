<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# Dev container

A GitHub Codespace, or desktop VS Code's **Dev Containers: Reopen in Container**, on this repository: a box set up the
same way every time, with the **BaconReader Morphe e2e recordings** extension installed. How to open one and use the
extension in it: [tools/vscode-extension/README.md](../tools/vscode-extension/README.md), "Install".

It has no Android phone, no Android SDK and no patcher: building the bundle and playing the app's scenarios
(`tests/BaconReader.E2E`) need a cloud session ([patcher-specific-build.md](../patcher-specific-build.md)). The VS Code
extension's own scenarios (`tests/BaconReader.VsCodeExtension.E2E`) play here: `tools/e2e/record.sh Recordings`.

## What's inside

- **.NET 10**, restored: `dotnet build BaconReader.E2E.slnx`, `dotnet test BaconReader.E2E.slnx`.
- **Node 22** (the dev container's `node` feature): the extension's unit tests,
  `node --test tools/vscode-extension/test/*.test.js`.
- **ffmpeg** and **Playwright's Chromium**: `tools/e2e/record.sh` records the extension's scenarios.
- **Zsh**, as in [my-claude-code-setup](https://github.com/JoanComasFdz/my-claude-code-setup/tree/main/.devcontainer):
  Oh My Zsh + the Spaceship prompt, with `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `sudo`, `zoxide` (`z`
  to jump around), `extract`, `history`, `docker` and `npm`; `eza` (the `l` alias). It is the terminal's shell.
- **tmux**: prefix Ctrl+A, the mouse on, `|` and `-` split; `t`, `tl` (list), `tk <name>` (kill), `tn <name>` (new),
  `ta <name>` (attach).
- **The BaconReader Morphe e2e recordings extension**, installed from `tools/vscode-extension` each time VS Code attaches.
- **C# Dev Kit**, from the Marketplace.
- **Dark Modern**, VS Code's default dark theme (a Codespace otherwise opens in GitHub Dark Default), forced by
  `devcontainer.json`: a theme picked in the Codespace doesn't apply.
- **No chat pop-up**: VS Code's secondary side bar, where it opens its chat, starts hidden.

## One-time setup on your computer: a terminal font

The Spaceship prompt and `eza`'s icons use **Nerd Font** glyphs. VS Code draws the terminal on your computer (or in your
browser, for a Codespace), not in the container, so the font must be installed there; the container can't do it. Install
any Nerd Font and make sure its name is in `terminal.integrated.fontFamily` in `devcontainer.json`
(<https://www.nerdfonts.com/font-downloads>; on Windows, `scoop bucket add nerd-fonts && scoop install FiraCode-NF`).
Without one, the prompt still works, with boxes in place of its icons. A phone's browser shows the boxes.

## Files

- `devcontainer.json`: the image (`mcr.microsoft.com/devcontainers/base:noble`), Node, the machine size, the VS Code
  extensions and settings, and the two commands below.
- `postCreateCommand.sh`: runs once, when the container is created; runs each feature's script, in order, and stops at
  the first that fails.
- `1-install-dotnet.sh`: `dotnet-sdk-10.0` from Ubuntu's archive, then `dotnet restore`.
- `2-install-ffmpeg.sh`: ffmpeg.
- `3-install-playwright-chromium.sh`: the Chromium the pinned Playwright (`Directory.Packages.props`) expects, with its
  system libraries.
- `4-install-zsh-config.sh`: zsh, Oh My Zsh, Spaceship, the plugins, zoxide, eza and `~/.zshrc`.
- `5-install-tmux.sh`: tmux, `~/.tmux.conf` and the aliases in `~/.zshrc` (after step 4, which writes it).
- `6-install-e2e-recordings-extension.sh`: runs each time VS Code attaches (`postAttachCommand`): packs the extension's
  `.vsix` (the e2e tool's `pack-vsix`: [tools/e2e/README.md](../tools/e2e/README.md); the first attach builds the tool)
  and installs it in the VS Code attached.
