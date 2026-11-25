#!/usr/bin/env bash
# Comment on and label tickets referenced with `Refs #n` in the commits of a release.
# (@semantic-release/github only understands Closes/Fixes keywords, so `Refs` is handled here.)
# Usage: comment_tickets.sh <new_tag>   (env: GH_TOKEN, GITHUB_REPOSITORY, DRY_RUN=1 to only print)
set -uo pipefail

TAG="$1"
REPO="${GITHUB_REPOSITORY:?}"

if [[ "$TAG" == *-* ]]; then
  PRERELEASE=1; LABEL="in-prerelease"
else
  PRERELEASE=0; LABEL="released"
fi

# Previous tag in the same lineage: any tag for a pre-release, stable-only for a stable release.
PREV=$(git tag --merged "$TAG" --list 'v*' --sort=-v:refname | grep -vx "$TAG" \
  | { if [ "$PRERELEASE" = 1 ]; then cat; else grep -v -- '-'; fi; } | head -1)
RANGE="${PREV:+$PREV..}$TAG"
echo "Release $TAG, scanning commits in $RANGE"

TICKETS=$(git log "$RANGE" --format=%B | grep -i -o -E '^(refs|references|related to|closes|fixes|resolves)[: ]+#[0-9]+' | grep -o -E '[0-9]+$' | sort -un)
[ -z "$TICKETS" ] && { echo "No ticket references found."; exit 0; }

URL="https://github.com/$REPO/releases/tag/$TAG"
if [ "$PRERELEASE" = 1 ]; then
  BODY="🧪 Included in pre-release [$TAG]($URL). This ticket stays open until the stable release."
else
  BODY="🚀 Released in [$TAG]($URL). Closing this ticket."
fi

for n in $TICKETS; do
  if [ "${DRY_RUN:-0}" = 1 ]; then echo "[dry-run] #$n <- $BODY (+label $LABEL)"; continue; fi
  # Skip pull requests and missing numbers; never fail the release over a ticket.
  if ! gh api "repos/$REPO/issues/$n" --jq 'select(.pull_request|not)|.number' >/dev/null 2>&1; then
    echo "::warning::#$n is not an issue, skipped"; continue
  fi
  # Don't comment twice if semantic-release already did (Closes/Fixes keyword).
  if gh api "repos/$REPO/issues/$n/comments" --paginate --jq '.[].body' 2>/dev/null | grep -qF "[$TAG]("; then
    echo "#$n already commented for $TAG"
  else
    gh issue comment "$n" --repo "$REPO" --body "$BODY" || echo "::warning::comment on #$n failed"
  fi
  gh issue edit "$n" --repo "$REPO" --add-label "$LABEL" || echo "::warning::label on #$n failed"
  [ "$PRERELEASE" = 0 ] && gh issue edit "$n" --repo "$REPO" --remove-label in-prerelease >/dev/null 2>&1
done
exit 0
