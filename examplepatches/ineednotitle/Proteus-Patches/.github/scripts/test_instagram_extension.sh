#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../.."
test_dir=$(mktemp -d)
trap 'rm -rf "$test_dir"' EXIT
javac -d "$test_dir" \
  extensions/extension/src/main/java/app/template/extension/extension/InstagramBlockUrlRequestPatch.java \
  extensions/extension/src/main/java/app/template/extension/extension/InstagramFilterStoriesListPatch.java \
  extensions/extension/src/main/java/app/template/extension/extension/InstagramGhostMode.java \
  extensions/extension/src/main/java/app/template/extension/extension/InstagramGhostRequestFilter.java \
  extensions/extension/src/main/java/app/template/extension/extension/InstagramHideNavigationButtonsPatch.java \
  extensions/extension/src/main/java/app/template/extension/extension/InstagramLikeAnimation.java \
  extensions/extension/src/main/java/app/template/extension/extension/InstagramLikeAnimations.java \
  extensions/extension/src/main/java/app/template/extension/extension/InstagramLimitFeedToFollowedProfiles.java \
  extensions/extension/src/main/java/app/template/extension/extension/InstagramOverrideMobileConfigBooleanFlagPatch.java \
  extensions/extension/src/main/java/app/template/extension/extension/InstagramRuntimeFlags.java \
  extensions/extension/src/main/java/app/template/extension/extension/InstagramWebBrowserUrls.java \
  .github/scripts/InstagramExtensionTest.java
java -cp "$test_dir" app.template.extension.extension.InstagramExtensionTest
