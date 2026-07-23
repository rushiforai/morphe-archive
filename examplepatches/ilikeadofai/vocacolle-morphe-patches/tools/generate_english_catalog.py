#!/usr/bin/env python3
"""Generate the reviewed English Android UI catalog with GPT-5.6 Luna low."""

from __future__ import annotations

import argparse
import csv
import json
import os
import re
import tempfile
import time
import urllib.error
import urllib.request
from pathlib import Path
from typing import Any


PRINTF_TOKEN = re.compile(
    r"%(?:\d+\$)?(?:[-#+ 0,(]*)(?:\d+)?(?:\.\d+)?(?:[a-zA-Z]|%)"
)
MARKUP_TOKEN = re.compile(r"</?[A-Za-z][^>]*>|&(?:[A-Za-z]+|#\d+|#x[0-9A-Fa-f]+);")
OUTPUT_FIELDS = [
    "resource_id",
    "resource_type",
    "key",
    "item_qualifier",
    "source",
    "source_language",
    "format_tokens",
    "formatted",
    "markup",
    "en_markup",
    "screen_hint",
    "source_kind",
    "en",
    "en_status",
    "reviewer",
    "notes",
]


def extract_printf_tokens(text: str) -> list[str]:
    return PRINTF_TOKEN.findall(text)


def extract_markup_tokens(text: str) -> list[str]:
    return MARKUP_TOKEN.findall(text)


def english_text_for_source_row(row: dict[str, str]) -> str | None:
    if row.get("source_language") == "en":
        return row.get("source", "")
    return None


def validate_translation(source: str, translated: str, identity: str) -> None:
    if not translated.strip():
        raise ValueError(f"{identity}: blank translation")
    if extract_printf_tokens(source) != extract_printf_tokens(translated):
        raise ValueError(f"{identity}: format tokens changed")
    if source.count("\\n") != translated.count("\\n"):
        raise ValueError(f"{identity}: escaped newlines changed")
    if extract_markup_tokens(source) != extract_markup_tokens(translated):
        raise ValueError(f"{identity}: markup tokens changed")


def index_translations(payload: dict[str, Any], expected_ids: set[str]) -> dict[str, dict[str, str]]:
    entries = payload.get("translations")
    if not isinstance(entries, list):
        raise ValueError("response has no translations array")
    indexed: dict[str, dict[str, str]] = {}
    for entry in entries:
        if not isinstance(entry, dict):
            raise ValueError("translation entry is not an object")
        identity = str(entry.get("id", ""))
        text = entry.get("text")
        markup_text = entry.get("markup_text", "")
        if identity in indexed:
            raise ValueError(f"duplicate translation ID: {identity}")
        if not isinstance(text, str):
            raise ValueError(f"translation {identity} has no string text")
        if not isinstance(markup_text, str):
            raise ValueError(f"translation {identity} has invalid markup_text")
        indexed[identity] = {"text": text, "markup_text": markup_text}
    if set(indexed) != expected_ids:
        missing = sorted(expected_ids - set(indexed))
        extra = sorted(set(indexed) - expected_ids)
        raise ValueError(f"translation IDs differ; missing={missing}, extra={extra}")
    return indexed


def row_identity(index: int, row: dict[str, str]) -> str:
    return f"{index}:{row['resource_type']}:{row['key']}:{row.get('item_qualifier', '')}"


def validate_markup_translation(
    row: dict[str, str],
    english: str,
    markup_text: str,
    identity: str,
) -> None:
    if not row.get("markup"):
        if markup_text:
            raise ValueError(f"{identity}: unexpected markup_text")
        return
    if markup_text.count("<b>") != 1 or markup_text.count("</b>") != 1:
        raise ValueError(f"{identity}: expected exactly one bold markup span")
    if markup_text.replace("<b>", "").replace("</b>", "") != english:
        raise ValueError(f"{identity}: markup_text differs from plain translation")


def output_row(
    row: dict[str, str],
    english: str,
    english_markup: str,
    generated: bool,
) -> dict[str, str]:
    validate_translation(row["source"], english, row["key"])
    validate_markup_translation(row, english, english_markup, row["key"])
    return {
        "resource_id": row["resource_id"],
        "resource_type": row["resource_type"],
        "key": row["key"],
        "item_qualifier": row["item_qualifier"],
        "source": row["source"],
        "source_language": row["source_language"],
        "format_tokens": row["format_tokens"],
        "formatted": row.get("formatted", ""),
        "markup": row["markup"],
        "en_markup": english_markup,
        "screen_hint": row["screen_hint"],
        "source_kind": row["source_kind"],
        "en": english,
        "en_status": "machine_verified" if generated else "source_verified",
        "reviewer": (
            "GPT-5.6 Luna low + deterministic QA"
            if generated
            else "source passthrough + deterministic QA"
        ),
        "notes": row["notes"],
    }


def resume_output_row(source_row: dict[str, str], previous: dict[str, str]) -> dict[str, str]:
    return output_row(
        source_row,
        previous["en"],
        previous.get("en_markup", ""),
        generated=previous.get("en_status") == "machine_verified",
    )


def request_batch(
    *,
    base_url: str,
    api_key: str,
    model: str,
    batch: list[dict[str, str]],
    timeout: int,
) -> dict[str, dict[str, str]]:
    system = (
        "Translate Japanese Android app UI strings into concise, natural English. "
        "Use standard Android/Material terminology and title/sentence case appropriate to context. "
        "Preserve every printf token, newline escape, markup tag/entity, URL, product name, and number exactly. "
        "Each input has markup_hint. When it is non-empty, also return markup_text containing the same "
        "English sentence with exactly one <b>...</b> span around the corresponding emphasized phrase; "
        "otherwise return markup_text as an empty string. The plain text field must contain no markup. "
        "Do not add explanations. Return JSON only as "
        '{"translations":[{"id":"...","text":"...","markup_text":""}]}.'
    )
    payload = {
        "model": model,
        "reasoning_effort": "low",
        "messages": [
            {"role": "system", "content": system},
            {"role": "user", "content": json.dumps(batch, ensure_ascii=False)},
        ],
        "response_format": {"type": "json_object"},
    }
    endpoint = base_url.rstrip("/") + "/chat/completions"
    request = urllib.request.Request(
        endpoint,
        data=json.dumps(payload).encode("utf-8"),
        headers={
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json",
        },
    )
    with urllib.request.urlopen(request, timeout=timeout) as response:
        result = json.load(response)
    content = result["choices"][0]["message"]["content"]
    decoded = json.loads(content)
    return index_translations(decoded, {item["id"] for item in batch})


def write_catalog(path: Path, rows: list[dict[str, str]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(
        prefix=path.name + ".",
        suffix=".tmp",
        dir=path.parent,
        text=True,
    )
    try:
        with os.fdopen(descriptor, "w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=OUTPUT_FIELDS, lineterminator="\n")
            writer.writeheader()
            writer.writerows(rows)
        os.replace(temporary_name, path)
    except BaseException:
        try:
            os.unlink(temporary_name)
        except FileNotFoundError:
            pass
        raise


def load_existing(path: Path) -> dict[tuple[str, str, str], dict[str, str]]:
    if not path.exists():
        return {}
    with path.open(encoding="utf-8", newline="") as handle:
        rows = list(csv.DictReader(handle))
    return {
        (row["resource_type"], row["key"], row["item_qualifier"]): row
        for row in rows
    }


def generate(args: argparse.Namespace) -> None:
    api_key = os.environ.get("OPENAI_API_KEY")
    if not api_key:
        raise SystemExit("OPENAI_API_KEY is required")
    with args.input.open(encoding="utf-8", newline="") as handle:
        source_rows = list(csv.DictReader(handle))

    existing = load_existing(args.output)
    completed: list[dict[str, str] | None] = [None] * len(source_rows)
    pending: list[tuple[int, dict[str, str]]] = []

    for index, row in enumerate(source_rows):
        key = (row["resource_type"], row["key"], row["item_qualifier"])
        previous = existing.get(key)
        if previous is not None:
            validate_translation(row["source"], previous["en"], row_identity(index, row))
            validate_markup_translation(
                row,
                previous["en"],
                previous["en_markup"],
                row_identity(index, row),
            )
            completed[index] = resume_output_row(row, previous)
            continue
        passthrough = english_text_for_source_row(row)
        if passthrough is not None:
            completed[index] = output_row(row, passthrough, "", generated=False)
        else:
            pending.append((index, row))

    for start in range(0, len(pending), args.batch_size):
        chunk = pending[start : start + args.batch_size]
        request_rows = [
            {
                "id": row_identity(index, row),
                "key": row["key"],
                "qualifier": row["item_qualifier"],
                "screen": row["screen_hint"],
                "markup_hint": row["markup"],
                "text": row["source"],
            }
            for index, row in chunk
        ]
        last_error: BaseException | None = None
        translations: dict[str, dict[str, str]] | None = None
        for attempt in range(1, args.retries + 1):
            try:
                batch_translations = request_batch(
                    base_url=args.base_url,
                    api_key=api_key,
                    model=args.model,
                    batch=request_rows,
                    timeout=args.timeout,
                )
                translations = batch_translations
                for index, row in chunk:
                    identity = row_identity(index, row)
                    translation = batch_translations[identity]
                    validate_translation(row["source"], translation["text"], identity)
                    validate_markup_translation(
                        row,
                        translation["text"],
                        translation["markup_text"],
                        identity,
                    )
                break
            except (urllib.error.URLError, TimeoutError, ValueError, KeyError, json.JSONDecodeError) as error:
                last_error = error
                if attempt < args.retries:
                    time.sleep(2**attempt)
        if translations is None:
            raise RuntimeError(f"translation batch failed: {last_error}")
        completed_translations = translations
        for index, row in chunk:
            completed[index] = output_row(
                row,
                completed_translations[row_identity(index, row)]["text"],
                completed_translations[row_identity(index, row)]["markup_text"],
                generated=True,
            )
        write_catalog(args.output, [row for row in completed if row is not None])
        print(f"translated {min(start + len(chunk), len(pending))}/{len(pending)}", flush=True)

    if any(row is None for row in completed):
        raise RuntimeError("catalog generation finished with missing rows")
    final_rows = [row for row in completed if row is not None]
    write_catalog(args.output, final_rows)
    print(f"wrote {len(final_rows)} rows to {args.output}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, default=Path("translations/ui/ko.csv"))
    parser.add_argument("--output", type=Path, default=Path("translations/ui/en.csv"))
    parser.add_argument("--base-url", default=os.environ.get("OPENAI_BASE_URL", "http://127.0.0.1:8317/v1"))
    parser.add_argument("--model", default="gpt-5.6-luna")
    parser.add_argument("--batch-size", type=int, default=32)
    parser.add_argument("--timeout", type=int, default=180)
    parser.add_argument("--retries", type=int, default=3)
    return parser.parse_args()


if __name__ == "__main__":
    generate(parse_args())
