#!/bin/bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# tmux, its configuration (~/.tmux.conf) and its aliases in ~/.zshrc. Runs after 4-install-zsh-config.sh, which writes
# ~/.zshrc. The configuration and aliases are the owner's script, as given.
set -e  # Exit on any error - fail fast for reproducible devcontainer

if ! command -v tmux >/dev/null 2>&1; then
    sudo apt-get update -qq
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends tmux
fi

echo "Setting up tmux configuration..."

# Write ~/.tmux.conf only if it does not already exist
# (preserves user customisations on re-runs)
if [ ! -f ~/.tmux.conf ]; then
    cat > ~/.tmux.conf << 'TMUXEOF'
# ─── Prefix ────────────────────────────────────────────────────────────────
# Change prefix from Ctrl+b to Ctrl+a (screen-style, easier to reach)
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# ─── General ───────────────────────────────────────────────────────────────
set -g mouse on                      # Enable mouse: click panes, scroll, resize
set -g history-limit 50000           # Large scrollback buffer
set -sg escape-time 10               # Faster key sequences (important for vim/nvim)
set -g focus-events on               # Forward focus events to editors
set -g base-index 1                  # Windows start at 1 (not 0)
setw -g pane-base-index 1            # Panes start at 1

# ─── Display ───────────────────────────────────────────────────────────────
set -g default-terminal "screen-256color"
set -ga terminal-overrides ",*256col*:Tc"  # True colour support

# Status bar
set -g status-position bottom
set -g status-style "bg=#1e1e2e,fg=#cdd6f4"
set -g status-left "#[fg=#89b4fa,bold] #S  "
set -g status-left-length 30
set -g status-right "#[fg=#a6e3a1] %H:%M  #[fg=#89b4fa]%d %b "
set -g status-right-length 40

# Window titles
setw -g window-status-format         " #I:#W "
setw -g window-status-current-format "#[fg=#89b4fa,bold] #I:#W "

# Pane borders
set -g pane-border-style        "fg=#45475a"
set -g pane-active-border-style "fg=#89b4fa"

# ─── Key bindings ──────────────────────────────────────────────────────────
# Reload config
bind r source-file ~/.tmux.conf \; display "tmux config reloaded"

# Intuitive pane splitting (stay in current directory)
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
unbind '"'
unbind %

# New window in current directory
bind c new-window -c "#{pane_current_path}"

# Vim-style pane navigation
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Resize panes with shift+arrows (no prefix needed)
bind -n S-Left  resize-pane -L 5
bind -n S-Right resize-pane -R 5
bind -n S-Up    resize-pane -U 5
bind -n S-Down  resize-pane -D 5

# Copy mode with vi keys
setw -g mode-keys vi
bind Enter copy-mode
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-selection-and-cancel
TMUXEOF
    echo "✅ tmux configuration written to ~/.tmux.conf"
else
    echo "✅ ~/.tmux.conf already exists — skipping (preserving user customisations)"
fi

# Add tmux aliases/functions to .zshrc (idempotent — guarded by marker comment)
if [ -f ~/.zshrc ] && ! grep -q "# tmux aliases" ~/.zshrc; then
    cat >> ~/.zshrc << 'ZSHEOF'

# tmux aliases
alias t='tmux'
alias tl='tmux list-sessions 2>/dev/null' # tl         → list all sessions
alias tk='tmux kill-session -t'           # tk <name>  → kill session

# tn <name> → new named session (with duplicate/nested detection)
tn() {
  if [ -z "$1" ]; then
    echo "Usage: tn <session-name>"
    return 1
  fi
  if tmux has-session -t "$1" 2>/dev/null; then
    if [ -n "$TMUX" ] && [ "$(tmux display-message -p '#S')" = "$1" ]; then
      echo "You are already running inside '$1', look at the bottom bar."
    else
      local info
      info=$(tmux list-sessions -F '#{session_name}: #{session_windows} window(s), created #{t:session_created}' 2>/dev/null | grep "^$1:")
      echo "Session '$1' already exists: $info"
      echo "Use 'ta $1' to attach to it."
    fi
    return 1
  fi
  tmux new-session -s "$1"
}

# ta <name> → attach to session (with nested detection)
ta() {
  if [ -z "$1" ]; then
    echo "Usage: ta <session-name>"
    return 1
  fi
  if [ -n "$TMUX" ] && [ "$(tmux display-message -p '#S')" = "$1" ]; then
    echo "You are already running inside '$1', look at the bottom bar."
    return 1
  fi
  tmux attach-session -t "$1"
}
ZSHEOF
    echo "✅ tmux aliases added to ~/.zshrc"
else
    echo "✅ tmux aliases skipped (not found: ~/.zshrc or marker already present)"
fi

echo "✅ tmux setup complete!"
