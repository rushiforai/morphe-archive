#!/usr/bin/env bash
# GraphQL helpers for GitHub Discussions.
# Usage: discussion.sh <command> [args...]
set -euo pipefail

REPO="${GITHUB_REPOSITORY:-totsiaw/proxma-patches}"
OWNER="${REPO%%/*}"
NAME="${REPO##*/}"

cmd_list() {
    local cat_slug="${1:?category slug, e.g. app-requests}"
    # Fetch the category ID first, then list discussions in it.
    local cat_id
    cat_id=$(gh api graphql -f query='
    query($owner: String!, $name: String!) {
      repository(owner: $owner, name: $name) {
        discussionCategories(first: 25) {
          nodes { id slug }
        }
      }
    }' -f owner="$OWNER" -f name="$NAME" \
    --jq ".data.repository.discussionCategories.nodes[] | select(.slug == \"$cat_slug\") | .id")

    [ -n "$cat_id" ] || { echo "[]"; return; }

    gh api graphql --paginate -f query='
    query($owner: String!, $name: String!, $catId: ID!, $endCursor: String) {
      repository(owner: $owner, name: $name) {
        discussions(categoryId: $catId, first: 50, after: $endCursor,
                    orderBy: {field: UPDATED_AT, direction: DESC}) {
          pageInfo { hasNextPage endCursor }
          nodes {
            number title body state updatedAt
            author { login }
            labels(first: 10) { nodes { name } }
            comments(first: 50) {
              nodes { author { login } body createdAt url }
            }
          }
        }
      }
    }' -f owner="$OWNER" -f name="$NAME" -f catId="$cat_id" \
    --jq '[.data.repository.discussions.nodes[]]' \
    | jq -s 'add // []'
}

cmd_comment() {
    local number="${1:?discussion number}"
    local body_file="${2:?body file}"
    local disc_id
    disc_id=$(gh api graphql -f query='
    query($owner: String!, $name: String!, $number: Int!) {
      repository(owner: $owner, name: $name) {
        discussion(number: $number) { id }
      }
    }' -f owner="$OWNER" -f name="$NAME" -F number="$number" \
    --jq '.data.repository.discussion.id')

    gh api graphql -f query='
    mutation($id: ID!, $body: String!) {
      addDiscussionComment(input: {discussionId: $id, body: $body}) {
        comment { url }
      }
    }' -f id="$disc_id" -f body="$(cat "$body_file")" \
    --jq '.data.addDiscussionComment.comment.url'
}

cmd_close() {
    local number="${1:?discussion number}"
    local reason="${2:-RESOLVED}"
    local disc_id
    disc_id=$(gh api graphql -f query='
    query($owner: String!, $name: String!, $number: Int!) {
      repository(owner: $owner, name: $name) {
        discussion(number: $number) { id }
      }
    }' -f owner="$OWNER" -f name="$NAME" -F number="$number" \
    --jq '.data.repository.discussion.id')

    gh api graphql -f query='
    mutation($id: ID!, $reason: DiscussionCloseReason!) {
      closeDiscussion(input: {discussionId: $id, reason: $reason}) {
        discussion { number }
      }
    }' -f id="$disc_id" -f reason="$reason" --silent
}

case "${1:?command: list|comment|close}" in
    list)    cmd_list "${2:-app-requests}" ;;
    comment) cmd_comment "$2" "$3" ;;
    close)   cmd_close "$2" "${3:-RESOLVED}" ;;
    *)       echo "Unknown: $1" >&2; exit 1 ;;
esac
