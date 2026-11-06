#!/usr/bin/env python3
"""Builds the word lists in wordlists/ from the open sources in wordlists/sources.json.

For every language:
  1. download the pinned source (cached in --cache) and check its SHA-256;
  2. normalise: strip BOM and whitespace, upper-case, apply the language's "replace" map (e.g. ß -> SS),
     keep letters of the alphabet, fold other letters to their base letter (é -> E) when that base letter is in
     the alphabet, and drop words that still contain a letter outside the alphabet;
  3. remove the words in wordlists/<code>/remove.txt and add the words in wordlists/<code>/add.txt
     (one word per line, '#' starts a comment; normalised the same way);
  4. write wordlists/<code>/words.txt.gz: sorted, one word per line, gzip with a fixed timestamp so the same input
     always gives the same bytes;
  5. update wordlists/manifest.json (per ruleset: file, SHA-256, size, word count, version). The version goes up by
     one whenever a list's SHA-256 changes, so installed patches download the new list.

Usage: python3 tools/wordlists/build.py [--check] [--only nl,de] [--cache DIR]
  --check  build in memory and fail (exit 1) when a written file would change; writes nothing.

Only the Python standard library is used.
"""
import argparse
import gzip
import hashlib
import io
import json
import os
import sys
import unicodedata
import urllib.request
import zipfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import hunspell  # noqa: E402  (same directory)

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
WORDLISTS = os.path.join(ROOT, "wordlists")
SOURCES = os.path.join(WORDLISTS, "sources.json")
MANIFEST = os.path.join(WORDLISTS, "manifest.json")
MAX_WORD = 15  # the board is 15 squares wide: at most 15 tiles


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def fetch(url, expected, cache):
    os.makedirs(cache, exist_ok=True)
    path = os.path.join(cache, expected)
    if os.path.exists(path):
        with open(path, "rb") as f:
            data = f.read()
        if sha256(data) == expected:
            return data
    req = urllib.request.Request(url, headers={"User-Agent": "wordfeud-word-finder-wordlist-build"})
    with urllib.request.urlopen(req, timeout=120) as r:
        data = r.read()
    got = sha256(data)
    if got != expected:
        raise SystemExit("SHA-256 mismatch for %s: expected %s, got %s" % (url, expected, got))
    with open(path, "wb") as f:
        f.write(data)
    return data


def tile_length(word, digraphs):
    """Number of tiles a word takes: a digraph tile (Spanish CH, LL, RR) counts once."""
    for d in digraphs:
        word = word.replace(d, "#")
    return len(word)


def normaliser(lang):
    alphabet = set(lang["alphabet"])
    replace = lang.get("replace", {})
    digraphs = lang.get("digraphs", [])

    def norm(line):
        w = line.strip().lstrip("﻿").upper()
        if not w or len(w) > MAX_WORD * 3:
            return None
        for a, b in replace.items():
            w = w.replace(a.upper(), b)
        out = []
        for ch in w:
            if ch in alphabet:
                out.append(ch)
                continue
            base = "".join(c for c in unicodedata.normalize("NFD", ch) if not unicodedata.combining(c))
            if len(base) == 1 and base in alphabet:
                out.append(base)
            else:
                return None
        w = "".join(out)
        return w if 2 <= tile_length(w, digraphs) <= MAX_WORD else None

    return norm


def read_word_file(path, norm):
    words = []
    if not os.path.exists(path):
        return words
    with open(path, encoding="utf-8") as f:
        for line in f:
            line = line.split("#", 1)[0]
            w = norm(line)
            if w:
                words.append(w)
    return words


def skipped(src, cols):
    """Table rows to leave out: "skip_if" is a list of {"column": n, "token": t, "max_len": m (optional)}; a row is
    skipped when that column holds the token (space separated) and, with max_len, the entry is at most that long.
    A word skipped in one row is still taken from another row that is not skipped."""
    for rule in src.get("skip_if", []):
        c = rule["column"]
        if c < len(cols) and rule["token"] in cols[c].split():
            if "max_len" not in rule or len(cols[src["column"]].strip()) <= rule["max_len"]:
                return True
    return False


def source_entries(src, raw, raw_aff=None):
    """The candidate words of a source, before normalisation.

    Source options (all optional): "zip_member" (read that file from a zip archive), "column" (0-based column of
    a tab-separated table; lines with fewer columns are skipped), "numeric_id" (only table lines whose first
    column is a number), "filter_column" + "filter_values" (only lines with one of those values there),
    "skip_capitalised" (drop entries starting with a capital letter: proper nouns), "strip_quotes" (entries
    written as "word"), "format": "hunspell" (the url
    is a .dic and "aff_url" + "aff_sha256" its .aff; all word forms are generated, see hunspell.py).
    """
    if src.get("format") == "hunspell":
        aff = raw_aff.decode(src.get("charset", "utf-8"), errors="replace")
        dic = raw.decode(src.get("charset", "utf-8"), errors="replace")
        for form in hunspell.expand(dic, aff):
            if src.get("skip_capitalised") and form[:1].isupper():
                continue
            yield form
        return
    if src.get("zip_member"):
        with zipfile.ZipFile(io.BytesIO(raw)) as z:
            raw = z.read(src["zip_member"])
    text = raw.decode(src.get("charset", "utf-8"), errors="replace")
    col = src.get("column")
    fcol = src.get("filter_column")
    fvals = set(src.get("filter_values", []))
    for line in text.splitlines():
        if line.startswith("#"):
            continue
        if col is not None:
            cols = line.split("\t")
            if len(cols) <= col:
                continue
            if src.get("numeric_id") and not cols[0].strip().isdigit():
                continue
            if fcol is not None and (len(cols) <= fcol or cols[fcol].strip() not in fvals):
                continue
            if skipped(src, cols):
                continue
            entry = cols[col]
        else:
            entry = line
        entry = entry.strip().lstrip("\ufeff")
        if src.get("strip_quotes"):
            entry = entry.strip('"')
        if src.get("skip_capitalised") and entry[:1].isupper():
            continue
        yield entry


def build_language(code, lang, cache):
    # "source" (one) or "sources" (several, merged: the union of their words)
    sources = lang.get("sources") or [lang["source"]]
    norm = normaliser(lang)
    words = set()
    for src in sources:
        raw = fetch(src["url"], src["sha256"], cache)
        raw_aff = fetch(src["aff_url"], src["aff_sha256"], cache) if src.get("aff_url") else None
        for entry in source_entries(src, raw, raw_aff):
            w = norm(entry)
            if w:
                words.add(w)
    source_count = len(words)
    folder = os.path.join(WORDLISTS, code)
    removed = set(read_word_file(os.path.join(folder, "remove.txt"), norm))
    added = set(read_word_file(os.path.join(folder, "add.txt"), norm))
    words -= removed
    words |= added
    body = "".join(w + "\n" for w in sorted(words)).encode("utf-8")
    buf = io.BytesIO()
    with gzip.GzipFile(filename="", mode="wb", fileobj=buf, compresslevel=9, mtime=0) as gz:
        gz.write(body)
    stats = {"source_words": source_count, "removed": len(removed), "added": len(added), "words": len(words)}
    return buf.getvalue(), stats


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--only", default="")
    ap.add_argument("--cache", default=os.path.join(ROOT, "build", "wordlist-cache"))
    args = ap.parse_args()

    with open(SOURCES, encoding="utf-8") as f:
        languages = json.load(f)["languages"]
    try:
        with open(MANIFEST, encoding="utf-8") as f:
            old = json.load(f)
    except FileNotFoundError:
        old = {"languages": {}, "rulesets": {}}

    only = set(c for c in args.only.split(",") if c)
    manifest = {"_comment": "Generated by tools/wordlists/build.py; do not edit.", "languages": {}, "rulesets": {}}
    changed = []
    for code, lang in sorted(languages.items()):
        prev = old.get("languages", {}).get(code)
        if only and code not in only and prev:
            manifest["languages"][code] = prev
        else:
            data, stats = build_language(code, lang, args.cache)
            digest = sha256(data)
            version = prev["version"] if prev and prev["sha256"] == digest else (prev["version"] + 1 if prev else 1)
            # "min_version" in sources.json: a language that replaces an older list (en -> en-us/en-intl) starts
            # above the version installed patches already have, so they download the new list.
            version = max(version, lang.get("min_version", 1))
            rel = "wordlists/%s/words.txt.gz" % code
            path = os.path.join(ROOT, rel)
            current = open(path, "rb").read() if os.path.exists(path) else None
            if current != data:
                changed.append(rel)
                if not args.check:
                    os.makedirs(os.path.dirname(path), exist_ok=True)
                    with open(path, "wb") as f:
                        f.write(data)
            manifest["languages"][code] = {
                "file": rel, "sha256": digest, "size": len(data), "version": version,
                "license": lang["license"], "attribution": lang["attribution"], **stats,
            }
            print("%s: %d words (source %d, -%d, +%d), %d bytes, version %d" % (
                code, stats["words"], stats["source_words"], stats["removed"], stats["added"], len(data), version))
        for rs in lang["rulesets"]:
            manifest["rulesets"][str(rs)] = code
    text = json.dumps(manifest, indent=2, ensure_ascii=False, sort_keys=True) + "\n"
    current = open(MANIFEST, encoding="utf-8").read() if os.path.exists(MANIFEST) else None
    if current != text:
        changed.append("wordlists/manifest.json")
        if not args.check:
            with open(MANIFEST, "w", encoding="utf-8") as f:
                f.write(text)
    if args.check and changed:
        print("Out of date: " + ", ".join(changed), file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
