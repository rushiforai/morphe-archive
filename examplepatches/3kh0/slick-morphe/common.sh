# shellcheck shell=bash
root="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
tools="$root/work"
: "${JAVA_HOME:?Set JAVA_HOME to a JDK 21 or newer installation}"
export PATH="$JAVA_HOME/bin:$PATH"
mkdir -p "$tools"

download() {
	local sum="$2  $tools/$1"
	sha256sum -c - <<<"$sum" &>/dev/null || curl -fsSL --retry 3 "$3" -o "$tools/$1"
	sha256sum -c - <<<"$sum"
}
