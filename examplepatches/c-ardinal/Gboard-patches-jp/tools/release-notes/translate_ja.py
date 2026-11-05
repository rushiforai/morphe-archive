"""Write Japanese-only GitHub release notes from the English part of patches-bundle.json's description.

The bundle description holds the release's CHANGELOG section: English headings first, then the same
items in Traditional Chinese. The release body is a Japanese translation of the English part only.
"""

import argparse
import json
import os
import re
import sys
from pathlib import Path

MODEL = "claude-opus-5-5"
# Upstream's Traditional Chinese block starts at the first of these headings.
ZH_HEADING = re.compile(r"(?m)^### \S+ (新功能|修復|效能|文件|重構|其他)\s*$")

SYSTEM_PROMPT = """You translate release notes for a Japanese fork of a Gboard patch bundle into Japanese.

Rules:
- Output only the translated Markdown, nothing before or after it.
- Keep the structure exactly: the same headings, bullets, order, and `**Gboard:**` prefixes.
- Translate the headings as: "### ✨ New Features" -> "### ✨ 新機能", "### 🐛 Bug Fixes" -> "### 🐛 バグ修正".
  Translate any other heading naturally and keep its emoji.
- Write each bullet as a natural, polite Japanese sentence ending in 「〜しました。」 or 「〜します。」.
- Keep code spans (`...`), version numbers, and Gboard version strings unchanged.
- Patch and feature names: use the Japanese name followed by the English name in parentheses on
  first mention, e.g. 「拡張辞書（Extended Dictionary）」. Keep product names such as Gboard, Rambler,
  Morphe, and Web Clipboard in English.
- "sync with upstream X" becomes 「アップストリーム X と同期し、…」.

Example of the expected style:
### ✨ 新機能

* **Gboard:** アップストリーム 4.0.0 と同期し、サポート対象の Gboard バージョンを `18.5.4.993608717-release-arm64-v8a` に更新しました。
* **Gboard:** 新しく追加された設定項目に日本語訳を追加しました。

### 🐛 バグ修正

* **Gboard:** アップストリーム 4.0.0 と同期し、カスタム不透明度を調整する際にキーボードの角に黒い枠が表示されてしまう問題を修正しました。"""


def english_part(description):
    """Return the description up to the first Traditional Chinese heading."""
    match = ZH_HEADING.search(description)
    return (description[: match.start()] if match else description).strip()


def translate(english):
    import anthropic

    client = anthropic.Anthropic()
    response = client.beta.messages.create(
        model=MODEL,
        max_tokens=16000,
        output_config={"effort": "medium"},
        betas=["server-side-fallback-2026-07-01"],
        fallbacks="default",
        system=SYSTEM_PROMPT,
        messages=[{"role": "user", "content": english}],
    )
    if response.stop_reason != "end_turn":
        raise RuntimeError(f"translation did not finish (stop_reason={response.stop_reason})")
    text = "".join(block.text for block in response.content if block.type == "text").strip()
    if not text:
        raise RuntimeError("translation returned no text")
    return text


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bundle", default="patches-bundle.json", type=Path)
    parser.add_argument("--out", required=True, type=Path)
    args = parser.parse_args(argv)

    description = str(json.loads(args.bundle.read_text("utf-8")).get("description") or "")
    english = english_part(description)
    if not english:
        args.out.write_text("", "utf-8")
        return 0
    if not os.environ.get("ANTHROPIC_API_KEY"):
        print("ANTHROPIC_API_KEY is not set; cannot write Japanese release notes.", file=sys.stderr)
        return 1
    args.out.write_text(translate(english) + "\n", "utf-8")
    return 0


if __name__ == "__main__":
    sys.exit(main())
