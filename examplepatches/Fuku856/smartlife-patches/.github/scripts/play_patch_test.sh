#!/usr/bin/env bash
#
# Google Play の最新版 APK に対してパッチが当たるかをテストするスクリプト。
# .github/workflows/play_patch_test.yml から呼ばれる。
#
#   play_patch_test.sh probe <package> <workdir>
#       base APK だけを取得して versionName / versionCode を読み、$GITHUB_OUTPUT に
#       version_name / version_code を書き出す (split を落とさない分、軽い)。
#
#   play_patch_test.sh download <package> <workdir> <expected-version-name>
#       全スプリット (base + config 群) を取得し、Morphe がマージできる .apks にまとめて
#       $GITHUB_OUTPUT に input を書き出す。probe とバージョンが違えば警告する。
#
#   play_patch_test.sh patch <package> <workdir> <patches.mpp> <morphe-desktop.jar> <patches-list.json>
#       Morphe CLI でパッチを当て、結果をジョブサマリーに書き出す。
#       パッチが 1 つでも失敗したら終了コード 1 を返す。
#
# probe / download で必要な環境変数:
#   APKEEP, GOOGLE_EMAIL, GOOGLE_AAS_TOKEN
#   任意: APKEEP_LOCALE (既定 ja_JP), APKEEP_DEVICE (省略時は apkeep の既定)

set -euo pipefail

group() { echo "::group::$*"; }
endgroup() { echo "::endgroup::"; }

find_aapt2() {
  local sdk="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}" f
  for f in $(printf '%s\n' "$sdk"/build-tools/*/aapt2 | sort -V -r); do
    [ -x "$f" ] && { echo "$f"; return; }
  done
  command -v aapt2 || { echo "::error::aapt2 が見つかりません" >&2; exit 1; }
}

# apkeep で <pkg> を <dir> に取得し、入れ子で落ちた .apk も <dir> 直下へ集約する
apkeep_fetch() {
  local pkg="$1" dir="$2" opts="${3:-}"
  rm -rf "$dir"
  mkdir -p "$dir"
  local args=(-a "$pkg" -d google-play -e "$GOOGLE_EMAIL" -t "$GOOGLE_AAS_TOKEN" --accept-tos)
  [ -n "${APKEEP_DEVICE:-}" ] && opts="${opts:+$opts,}device=$APKEEP_DEVICE"
  [ -n "$opts" ] && args+=(-o "$opts")
  # apkeep はダウンロードに失敗しても終了コード 0 を返すことがあるため、後で .apk の有無を確認する
  "$APKEEP" "${args[@]}" "$dir/"
  find "$dir" -mindepth 2 -name '*.apk' -exec mv -t "$dir/" {} + 2>/dev/null || true
  echo "--- downloaded ---"
  ls -la "$dir/"
}

# dex を含む .apk を base とみなす (split はファイル名に頼らず判別する)
find_base() {
  local dir="$1" f
  for f in "$dir"/*.apk; do
    [ -f "$f" ] || continue
    if unzip -l "$f" | grep -qE 'classes[0-9]*\.dex'; then
      echo "$f"
      return
    fi
  done
}

badging_field() {
  sed -n "s/.*$2='\([^']*\)'.*/\1/p" <<<"$1"
}

cmd_probe() {
  local pkg="$1" workdir="$2" dir="$2/probe"
  group "apkeep: $pkg の base APK を取得 (バージョン確認用)"
  # split_apk / locale を付けないと base だけが落ちてくる
  apkeep_fetch "$pkg" "$dir"
  endgroup

  local base badging vn vc
  base=$(find_base "$dir")
  if [ -z "$base" ]; then
    echo "::error::$pkg の base APK (dex 入り) を取得できませんでした。apkeep の出力と Secrets を確認してください"
    exit 1
  fi
  badging=$("$(find_aapt2)" dump badging "$base" 2>/dev/null | head -1)
  vn=$(badging_field "$badging" versionName)
  vc=$(badging_field "$badging" versionCode)
  if [ -z "$vc" ]; then
    echo "::error::$base のバージョンを読み取れませんでした: $badging"
    exit 1
  fi
  echo "Play の最新版: $pkg $vn ($vc)"
  {
    echo "version_name=$vn"
    echo "version_code=$vc"
  } >>"$GITHUB_OUTPUT"
}

cmd_download() {
  local pkg="$1" workdir="$2" expected="$3" dir="$2/download"
  group "apkeep: $pkg の全スプリットを取得"
  apkeep_fetch "$pkg" "$dir" "split_apk=1,locale=${APKEEP_LOCALE:-ja_JP}"
  endgroup

  local base
  base=$(find_base "$dir")
  if [ -z "$base" ]; then
    echo "::error::$pkg のスプリット取得に失敗しました (base APK が見つかりません)"
    exit 1
  fi

  # probe と splits で取得バージョンが一致するか確認 (段階的ロールアウトの競合を検知)
  local vn
  vn=$(badging_field "$("$(find_aapt2)" dump badging "$base" 2>/dev/null | head -1)" versionName)
  if [ "$vn" != "$expected" ]; then
    echo "::warning::Play バージョン不一致: probe=$expected, splits=$vn — テスト結果のバージョン表記が実際と食い違う可能性があります"
  fi

  local input splits=()
  local f
  for f in "$dir"/*.apk; do
    [ "$f" = "$base" ] || splits+=("$f")
  done

  if [ ${#splits[@]} -eq 0 ]; then
    input="$workdir/$pkg.apk"
    cp "$base" "$input"
  else
    # Morphe がマージできるよう、標準的な .apks (base.apk + split_*.apk の zip) にまとめる
    local stage="$workdir/apks" name
    rm -rf "$stage"
    mkdir -p "$stage"
    cp "$base" "$stage/base.apk"
    for f in "${splits[@]}"; do
      name="${f##*/}"
      name="${name#"$pkg".}"
      cp "$f" "$stage/split_$name"
    done
    input="$workdir/$pkg.apks"
    rm -f "$input"
    (cd "$stage" && zip -q -0 "$input" ./*.apk)
    echo "Split APK:" "${stage}"/*.apk
  fi

  echo "input=$input" >>"$GITHUB_OUTPUT"
}

cmd_patch() {
  local pkg="$1" workdir="$2" mpp="$3" jar="$4" list="$5"
  local input="${INPUT_APK:?INPUT_APK が未設定です}"
  local version_name="${VERSION_NAME:-?}" version_code="${VERSION_CODE:-?}"
  local result="$workdir/result.json" plog="$workdir/patch.log"
  local summary="${GITHUB_STEP_SUMMARY:-/dev/stdout}"

  # shellcheck disable=SC2016 # $p は jq の変数
  local targets='[.patches[].compatiblePackages // [] | .[] | select(.packageName == $p) | .targets[]?.version] | unique'
  local app_name supported is_supported="いいえ (未対応の新しいバージョン)"
  app_name=$(jq -r --arg p "$pkg" \
    'first(.patches[].compatiblePackages // [] | .[] | select(.packageName == $p) | .name) // $p' "$list")
  # version が null の target は「バージョン指定なし (どの版も実験的に対応)」を表す
  supported=$(jq -r --arg p "$pkg" "$targets | map(select(. != null)) | join(\", \")" "$list")
  if jq -e --arg p "$pkg" --arg v "$version_name" "$targets | index(\$v)" "$list" >/dev/null; then
    is_supported="はい"
  elif jq -e --arg p "$pkg" "$targets | index(null)" "$list" >/dev/null; then
    is_supported="実験的 (バージョン指定なしの target で対応)"
  fi

  group "Morphe: $app_name $version_name にパッチを適用"
  rm -f "$result"
  local rc=0
  # --force: 未対応バージョンでもパッチを当てる (新バージョンの検証が目的のため)
  # --continue-on-error: 失敗したパッチを全部洗い出すため最後まで続ける
  #   (このとき CLI は成功扱いで終わるので、成否は result.json の failedPatches で判定する)
  # --unsigned: 署名は不要 (パッチ済み APK は保存しない)
  java -jar "$jar" patch \
    -p "$mpp" \
    --force \
    --continue-on-error \
    --unsigned \
    -t "$workdir/tmp" \
    -o "$workdir/patched.apk" \
    -r "$result" \
    "$input" 2>&1 | tee "$plog" || rc=$?
  endgroup
  rm -f "$workdir/patched.apk"
  # 結果 JSON が出ていればパッチ処理自体は最後まで動いた (テスト済みとして記録してよい)
  if [ -s "$result" ] && [ -n "${GITHUB_OUTPUT:-}" ]; then
    echo "completed=true" >>"$GITHUB_OUTPUT"
  fi

  {
    echo "## $app_name \`$version_name\` ($version_code)"
    echo
    echo "| 項目 | 値 |"
    echo "|---|---|"
    echo "| パッケージ | \`$pkg\` |"
    echo "| Play の最新版 | \`$version_name\` ($version_code) |"
    echo "| パッチの対応バージョンに含まれる | $is_supported |"
    echo "| 対応バージョン | $supported |"
    echo "| パッチ | \`${PATCHES_TAG:-?}\` |"
    echo "| Morphe Desktop | \`${DESKTOP_TAG:-?}\` |"
  } >>"$summary"

  if [ ! -s "$result" ]; then
    {
      echo
      echo "### ❌ パッチ処理が完了しませんでした (終了コード $rc)"
      echo
      echo '```'
      tail -n 40 "$plog"
      echo '```'
    } >>"$summary"
    echo "::error::$app_name $version_name: パッチ処理が完了しませんでした"
    exit 1
  fi

  local applied failed step_failed
  applied=$(jq '.appliedPatches | length' "$result")
  failed=$(jq '.failedPatches | length' "$result")
  step_failed=$(jq '[.stepResults[] | select(.success | not)] | length' "$result")

  {
    echo "| 成功したパッチ | $applied |"
    echo "| 失敗したパッチ | $failed |"
    echo
  } >>"$summary"

  if [ "$failed" -gt 0 ] || [ "$step_failed" -gt 0 ] || [ "$rc" -ne 0 ]; then
    {
      echo "### ❌ 失敗"
      echo
      jq -r '.failedPatches[] | "<details><summary><b>\(.name)</b>: \(.error | split("\n")[0] | .[0:200])</summary>\n\n```\n\(.error | split("\n")[0:30] | join("\n"))\n```\n</details>\n"' "$result"
      jq -r '.stepResults[] | select(.success | not) | "- ステップ `\(.step)` が失敗: \(.error // "")"' "$result"
    } >>"$summary"
    # ワークフローコマンドの値は % / 改行 (プロパティは : と , も) をエスケープする必要がある
    jq -r '
      def esc: gsub("%"; "%25") | gsub("\r"; "%0D") | gsub("\n"; "%0A");
      def prop: esc | gsub(":"; "%3A") | gsub(","; "%2C");
      .failedPatches[] | "::error title=\(.name | prop)::\(.error | split("\n")[0] | esc)"' "$result"
    exit 1
  fi

  echo "### ✅ すべてのパッチが適用できました" >>"$summary"
}

case "${1:-}" in
  probe) shift; cmd_probe "$@" ;;
  download) shift; cmd_download "$@" ;;
  patch) shift; cmd_patch "$@" ;;
  *) echo "usage: $0 {probe|download|patch} ..." >&2; exit 2 ;;
esac
