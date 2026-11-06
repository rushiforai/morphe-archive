#!/usr/bin/env python3
"""Compose the Japanese release notes from build metadata + summary."""

import argparse
import json
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--metadata", required=True)
    parser.add_argument("--summary", required=True)
    parser.add_argument("--out", required=True)
    args = parser.parse_args()

    metadata = json.loads(Path(args.metadata).read_text(encoding="utf-8"))
    summary = json.loads(Path(args.summary).read_text(encoding="utf-8"))

    version = metadata["version"]
    x_versions = "、".join(metadata.get("x_supported_versions", []))
    lines = [
        f"X (NewX) パッチと Twitch パッチ、LINE パッチ、KakaoTalk パッチを1つの `.mpp` にまとめた"
        f"日本語化バンドル `patches-{version}.mpp` をリリースします。",
        "",
        "## 収録パッチ",
        "",
        "本家（crimera/piko の NewX、ryykitty/twitch-patched、"
        "andrewliang25/morphe-patches の LINE パッチ、"
        "AmpleReVanced/revanced-patches の KakaoTalk パッチ）のパッチを、"
        "翻訳済みソースのコピーからそのまま収録しています。"
        "Morphe のパッチ一覧では機能ごとに選択できます。",
        "",
        f"- X: NewX のパッチ {summary.get('newx_patch_count')} 件"
        f"（対応 X バージョン: {x_versions}）",
        f"- Twitch: パッチ {summary.get('twitch_patch_count')} 件"
        "（対応 Twitch バージョン: 31.8.0 安定版 / 31.9.0_BETA 実験的対応）",
        f"- LINE: パッチ {summary.get('line_patch_count')} 件"
        "（対応 LINE バージョン: 26.14.0 / 26.15.1 / 26.16.0）",
        f"- KakaoTalk: パッチ {summary.get('kakao_patch_count')} 件"
        "（対応 KakaoTalk バージョン: 26.9.0）",
        "",
    ]
    if version == "1.2.1":
        lines += [
            "## v1.2.1 の変更（パッチ名を本家の英語名に戻しました）",
            "",
            "- **両アプリのパッチ名（タイトル）を本家の英語名に戻しました。**"
            "X 全52件・Twitch 全13件とも、Morphe の一覧に表示される名前は"
            "本家と同一の英語名になります。パッチの説明と、アプリ内の設定 UI は"
            "日本語のままです。",
            "- **理由は実行順序です。** Morphe のパッチャーはパッチを名前の"
            "文字列順に実行するため、名前を日本語化すると実行順序が本家と"
            "入れ替わり、X 12.39.0-prod.01 で「メディアタブのデフォルト」"
            "（Set default media tab）が失敗していました。名前を本家に"
            "戻したことで実行順序が本家と完全一致し、この失敗は解消します"
            "（「正規URLを直接開く」/ Open canonical URLs も、英語名順では"
            "問題なく適用されます）。",
            "- **この方針は今後も維持します。** 本家が新しいパッチを追加した"
            "場合も、名前は本家の英語名のまま収録し、日本語化するのは"
            "説明とアプリ内 UI だけにします。",
            "",
        ]
    if version == "1.2.0":
        lines += [
            "## v1.2.0 の変更（構成の見直し）",
            "",
            "- **構成を「機能ごとのパッチ」に戻しました。** v1.1.x ではアプリ単位の"
            "統合パッチ（傘パッチ）として表示していましたが、その方式では、"
            "内包する機能パッチが1つでも失敗すると残り全部が適用されませんでした。"
            "v1.2.0 からは本家のパッチを個別に収録する方式に戻し、失敗しても"
            "そのパッチだけの問題で済み、Morphe で個別に外すこともできます。",
            "- **X 側のパッチ名と説明が日本語になりました。** これまでは Piko 設定 UI の"
            "文字列だけが日本語で、Morphe の一覧のパッチ名・説明は英語でした。"
            "X 側も Twitch 側と同じく、翻訳済みソースのコピーを保持する方式に"
            "統一したため、一覧の名前と説明（全52件）も日本語になっています。",
            "- **v1.1.x の統合パッチに含まれなかった4機能が、通常のパッチとして"
            "戻りました。** NewX の「クローン」「Twitterブランディングに戻す」"
            "「HLS音声レンディションのログ」と、Twitch の「再生の診断」です。"
            "いずれも本家の初期状態（任意選択・初期値オフ）のまま、個別に選べます。",
            "- **既知の問題: 「正規URLを直接開く」（本家 CanonicalUrls）は、"
            "X 12.39.0-prod.01 では本家側の都合で失敗します。** 本家が 12.39.0-prod.01 対応を"
            "宣言した変更は対応バージョンの追加のみで、この機能の照合は"
            "12.39.0-alpha.03 まででしか検証されていません。v1.2.0 の方式では"
            "このパッチだけが失敗するので、12.39.0-prod.01 では Morphe で"
            "このパッチを外して適用してください（他のパッチはそのまま使えます）。"
            "本家に修正が入れば、日次同期で取り込んで新しい版を出します。",
            "",
        ]
    lines += [
        "## 日本語化",
        "",
        f"- Piko 設定 UI の日本語訳 {summary.get('ja_overlay_strings')} 件"
        "（X 側ソースコピー内の日本語リソース）",
        "- パッチの説明（Morphe の一覧）は4アプリとも日本語。"
        "パッチ名は本家の英語名のままです（パッチャーが名前順に実行する"
        "ため、実行順序を本家と一致させる恒久ルール）。"
        "設定キーやブランド名、内部エラー・ログも英語のまま",
        "- Twitch 側はパッチの説明とパッチ設定 UI などをソース直接翻訳",
        "- LINE 側はパッチの説明と Andrew's Patch Setting の設定 UI を"
        "ソース直接翻訳",
        f"- KakaoTalk 側はパッチの説明と、設定 UI の文字列リソース"
        f"（addresources 全{summary.get('ja_kakao_strings')}件）を日本語化",
        "",
        "## ビルド情報",
        "",
        f"- Piko (crimera/piko x-lite) ベース: {metadata.get('piko_commit')}",
        f"- Twitch (ryykitty/twitch-patched) ベース: "
        f"v{metadata.get('twitch_base_version')}",
        f"- LINE (andrewliang25/morphe-patches) ベース: "
        f"v{metadata.get('line_base_version')}",
    ]
    if metadata.get('kakao_base_version'):
        lines.append(
            f"- KakaoTalk (AmpleReVanced/revanced-patches) ベース: "
            f"v{metadata.get('kakao_base_version')}"
        )
    lines += [
        f"- Patcher-Version: {summary.get('manifest', {}).get('Patcher-Version')}",
        "",
        "Morphe への追加: https://morphe.software/add-source?github=Ayufa/ayufa-patches-jp",
        "",
    ]
    Path(args.out).write_text("\n".join(lines), encoding="utf-8")
    print(f"release notes written: {args.out}")


if __name__ == "__main__":
    main()
