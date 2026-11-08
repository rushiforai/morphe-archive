#!/usr/bin/env bash
# use --fix to fix
set -euo pipefail
# shellcheck source=common.sh
source "$(dirname "$(realpath "$0")")/common.sh"
cd "$root"
fix=false
[[ "${1:-}" == --fix ]] && fix=true

case "$(uname -s)-$(uname -m)" in
Linux-x86_64)
	sh=(76e77641faa025814b77f153b29796b8e6fa2fca03e0c76a691608b86c7ea7bf linux_amd64)
	sc=(b7af85e41cc99489dcc21d66c6d5f3685138f06d34651e6d34b42ec6d54fe6f6 linux.x86_64)
	al=(8aca8db96f1b94770f1b0d72b6dddcb1ebb8123cb3712530b08cc387b349a3d8 linux_amd64)
	;;
Darwin-arm64)
	sh=(b7c872db63553ccffc7253aba3ed7d4885a27d83f1ba567b1138c6315a5847e5 darwin_arm64)
	sc=(339b930feb1ea764467013cc1f72d09cd6b869ebf1013296ba9055ab2ffbd26f darwin.aarch64)
	al=(aba9ced2dee8d27fecca3dc7feb1a7f9a52caefa1eb46f3271ea66b6e0e6953f darwin_arm64)
	;;
*) echo "Unsupported platform: $(uname -sm)" >&2 && exit 1 ;;
esac
download google-java-format.jar c78feb48c549fa7114b7ea11db3b456808f7b371ffe84e6643a44dd2f9588639 \
	https://github.com/google/google-java-format/releases/download/v2.0.0/google-java-format-2.0.0-all-deps.jar
download ktlint a3fd620207d5c40da6ca789b95e7f823c54e854b7fade7f613e91096a3706d75 \
	https://github.com/pinterest/ktlint/releases/download/1.8.0/ktlint
download shfmt "${sh[0]}" "https://github.com/mvdan/sh/releases/download/v3.14.1/shfmt_v3.14.1_${sh[1]}"
download shellcheck.tar.gz "${sc[0]}" \
	"https://github.com/koalaman/shellcheck/releases/download/v0.11.0/shellcheck-v0.11.0.${sc[1]}.tar.gz"
download actionlint.tar.gz "${al[0]}" \
	"https://github.com/rhysd/actionlint/releases/download/v1.7.12/actionlint_1.7.12_${al[1]}.tar.gz"
tar -xzf "$tools/shellcheck.tar.gz" -C "$tools" --strip-components 1 shellcheck-v0.11.0/shellcheck
tar -xzf "$tools/actionlint.tar.gz" -C "$tools" actionlint
chmod +x "$tools/ktlint" "$tools/shfmt"
export PATH="$tools:$PATH" # actionlint runs shellcheck on workflow scripts

java_files=(extension/*.java scripts/*.java)
shell_files=(*.sh)
status=0
run() { "$@" || status=1; }
if $fix; then
	# Twice: reflowing a long string in the first pass leaves indentation for the second.
	for _ in 1 2; do run java -jar "$tools/google-java-format.jar" --replace "${java_files[@]}"; done
	run ktlint --format 'patches/*.kt' 'scripts/*.kt'
	run shfmt -w "${shell_files[@]}"
else
	run java -jar "$tools/google-java-format.jar" --dry-run --set-exit-if-changed "${java_files[@]}"
	run ktlint 'patches/*.kt' 'scripts/*.kt'
	run shfmt -d "${shell_files[@]}"
fi
run shellcheck -x "${shell_files[@]}"
run actionlint
exit $status
