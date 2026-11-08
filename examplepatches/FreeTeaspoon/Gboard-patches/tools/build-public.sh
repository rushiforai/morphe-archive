#!/usr/bin/env bash
# Build Morphe dependencies from pinned public source, without package-registry credentials.
set -euo pipefail

project_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
build_cache="$project_root/.validation/public-build"
plugin_commit=5b7e4619931a8c78b7858e598e002222d37021b9 # Morphe Gradle plugin v2.1.0
patcher_commit=f3997dc1011b84a301c1ffe426fd9dfdd85095ba # Morphe patcher v2.1.0
mkdir -p "$build_cache/maven"

checkout_source() {
    local repository="$1" destination="$2" revision="$3"
    if [[ ! -d "$destination/.git" ]]; then
        git init -q "$destination"
        git -C "$destination" remote add origin "https://github.com/MorpheApp/$repository.git"
        git -C "$destination" fetch --depth 1 origin "$revision"
        git -C "$destination" checkout -q --detach FETCH_HEAD
    fi
    [[ "$(git -C "$destination" rev-parse HEAD)" == "$revision" ]] || {
        echo "Unexpected Morphe source revision at $destination" >&2
        exit 1
    }
    # Maven-local development artifacts do not need upstream release signing keys.
    python3 - "$destination/build.gradle.kts" <<'PY'
import re
import sys
from pathlib import Path
path = Path(sys.argv[1])
path.write_text(re.sub(r'\nsigning\s*\{.*?\n\}', '', path.read_text(), flags=re.S))
PY
}

export GITHUB_ACTOR="${GITHUB_ACTOR:-public-source-build}"
export GITHUB_TOKEN="${GITHUB_TOKEN:-unused-for-local-source-build}"
source_stamp="$plugin_commit $patcher_commit"
if [[ ! -f "$build_cache/ready" ]] || [[ "$(cat "$build_cache/ready")" != "$source_stamp" ]]; then
    checkout_source morphe-patches-gradle-plugin "$build_cache/plugin-$plugin_commit" "$plugin_commit"
    checkout_source morphe-patcher "$build_cache/patcher-$patcher_commit" "$patcher_commit"
    (
        cd "$build_cache/plugin-$plugin_commit"
        bash ./gradlew -Dmaven.repo.local="$build_cache/maven" publishToMavenLocal --console=plain
    )
    (
        cd "$build_cache/patcher-$patcher_commit"
        bash ./gradlew -Dmaven.repo.local="$build_cache/maven" publishToMavenLocal --console=plain
    )
    printf '%s\n' "$source_stamp" > "$build_cache/ready"
fi

cat > "$build_cache/local.init.gradle" <<'EOF'
beforeSettings { settings ->
    settings.pluginManagement.repositories.mavenLocal()
}
EOF
cd "$project_root"
if [[ $# -eq 0 ]]; then set -- :patches:buildAndroid generatePatchesList; fi
exec bash ./gradlew -Dmaven.repo.local="$build_cache/maven" \
    -I "$build_cache/local.init.gradle" "$@" --console=plain
