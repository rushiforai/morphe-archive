#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# Zsh as in https://github.com/JoanComasFdz/my-claude-code-setup/tree/main/.devcontainer (2-install-zsh-config.sh):
#   - Oh My Zsh + the Spaceship prompt
#   - plugins: git, zsh-autosuggestions, zsh-syntax-highlighting, sudo, zoxide, extract, history, docker, npm
#   - zoxide (a smarter `cd`: `z`) and eza (a modern `ls`: the `l` alias)
#   - zsh as the login shell, and its .zshrc
# Adapted to this image: it runs as the container's user (`vscode`, with sudo), whose home already has Oh My Zsh, and
# keeps the history in ~/.zsh_history (no history volume). Spaceship's and eza's icons need a Nerd Font in the terminal
# (devcontainer.json, terminal.integrated.fontFamily), installed on the computer VS Code draws on.
set -euo pipefail

ZSH_DIR="$HOME/.oh-my-zsh"

# --- System tools: zoxide (apt) + eza (pinned GitHub binary) ---------------
sudo apt-get update -qq
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends zsh zoxide

EZA_VERSION=0.23.4
ARCH="$(dpkg --print-architecture)"
case "$ARCH" in
  amd64) EZA_TARGET=x86_64-unknown-linux-gnu ;;
  arm64) EZA_TARGET=aarch64-unknown-linux-gnu ;;
  *) echo "Unsupported architecture for eza: $ARCH" >&2; exit 1 ;;
esac
curl -fsSL "https://github.com/eza-community/eza/releases/download/v${EZA_VERSION}/eza_${EZA_TARGET}.tar.gz" \
  -o /tmp/eza.tar.gz
sudo tar -xzf /tmp/eza.tar.gz -C /usr/local/bin
sudo chmod +x /usr/local/bin/eza
rm /tmp/eza.tar.gz

# --- Oh My Zsh + Spaceship + custom plugins --------------------------------
clone() {
  if [ ! -d "$2" ]; then
    git clone --depth=1 "$1" "$2"
  fi
}
clone https://github.com/ohmyzsh/ohmyzsh.git "$ZSH_DIR"
clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_DIR/custom/themes/spaceship-prompt"
ln -sf "$ZSH_DIR/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_DIR/custom/themes/spaceship.zsh-theme"
clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_DIR/custom/plugins/zsh-autosuggestions"
clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_DIR/custom/plugins/zsh-syntax-highlighting"

# Make zsh the login shell.
sudo chsh -s "$(command -v zsh)" "$(id -un)"

# --- .zshrc ----------------------------------------------------------------
cat > "$HOME/.zshrc" <<'ZSHRC'
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

# Theme
ZSH_THEME="spaceship"

# Disable auto-setting terminal title
DISABLE_AUTO_TITLE="true"

# Shell history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt SHARE_HISTORY

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  sudo
  zoxide
  extract
  history
  docker
  npm
)

# Spaceship configuration (BEFORE sourcing oh-my-zsh)
SPACESHIP_USER_SHOW=always
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXEC_TIME_ELAPSED=1
SPACESHIP_EXEC_TIME_PRECISION=2
SPACESHIP_EXEC_TIME_PREFIX="⏱ "
SPACESHIP_EXEC_TIME_SUFFIX=" "
SPACESHIP_EXEC_TIME_COLOR="yellow"

SPACESHIP_PROMPT_ORDER=(
  user
  dir
  host
  git
  exec_time
  line_sep
  jobs
  exit_code
  char
)

# Source Oh My Zsh (THIS MUST BE AFTER SPACESHIP CONFIG)
source $ZSH/oh-my-zsh.sh

# zoxide (smarter cd)
eval "$(zoxide init zsh)"

# eza alias (modern ls)
alias l='eza --long --all --header --icons --group-directories-first --no-permissions --no-user'

# Editor
export EDITOR="code --wait"

# Tips on startup
echo "Tip: use 'z' instead of 'cd' to change directories!"
echo "Tip: use 'l' instead of 'ls' to explore directories!"
ZSHRC
