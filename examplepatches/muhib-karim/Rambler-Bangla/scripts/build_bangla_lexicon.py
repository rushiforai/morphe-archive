#!/usr/bin/env python3
"""Generate GboardRamblerBanglaLexiconData.java from OpenBangla + LibreOffice bn_BD + FrequencyWords.

Sources (all GPL-3.0 compatible; see ATTRIBUTION.md and THIRD-PARTY-NOTICES.md):
- OpenBangla/OpenBangla-Keyboard dictionary.json (GPL-3.0, ~159k Bengali words)
- LibreOffice/dictionaries bn_BD.dic (GPL-2.0+/LGPL/MPL, ~79k Bangladesh Bangla Academy roots)
- HermitDave/FrequencyWords bn_full.txt (MIT / CC-BY-SA OpenSubtitles spoken frequency ranks)
"""
import base64
import gzip
import json
import os
import re
import sys
import unicodedata

BUILD_DIR = "/tmp/bn_lexicon_build"
OUT_JAVA = (
    "/root/workspace/rambler-work/Rambler-Bangla/"
    "extensions/rambler-enhancements/src/main/java/com/akshaykadam/pixelboard/extension/rambler/"
    "GboardRamblerBanglaLexiconData.java"
)
BN_RE = re.compile(r"^[\u0980-\u09ff\u200c\u200d]+$")
CHUNK_SIZE = 48000  # Safely under Java's 65,535-byte constant-pool UTF-8 limit

# Words explicitly excluded from the valid set because they are common ASR/LLM typos
# or deprecated spellings that should always normalize to modern Bangla Academy forms.
EXCLUDED_TYPOS = {
    "শবকিছু", "শবকিছুই", "বুযে", "বুজে", "ভালে", "শুন্দর", "শময়", "শমস্যা",
    "পোষাক", "খুশী", "খাছি", "পাছি", "কিসু", "কিচু", "বাঙ্গলা", "বাংগ্লা",
    "ইংগলিশ", "ইংলীশ", "ওয়টেভার", "ওয়াটেভার", "ফনেটিকস", "ফনেটিক",
}

# High-frequency modern colloquial & loanword forms that are always valid in spoken Bangla
EXTRA_VALID_SPOKEN = [
    "সবকিছুই", "বুঝে", "বুঝি", "বুঝতে", "বুঝলাম", "বুঝবে", "বুঝছে", "বুঝছি",
    "বুঝতেছে", "বুঝতেছি", "বুঝেছে", "বুঝেছি", "ভালো", "ভালোই", "ভালোভাবে",
    "ভালোবাসা", "ভালোবাসি", "সুন্দরভাবে", "সঠিকভাবে", "সহজভাবে", "সম্পূর্ণভাবে",
    "স্বাভাবিকভাবে", "সাধারণভাবে", "ইংলিশ", "ইংলিশে", "বাংলা", "বাংলাতে",
    "হোয়াটেভার", "ফোনেটিকস", "ফোনেটিক", "ক্লিয়ারলি", "আন্ডারস্ট্যান্ড",
    "আন্ডারস্ট্যান্ডস", "আন্ডারস্ট্যান্ডিং", "কোম্পানি", "অফিস", "মিটিং",
    "ক্লিপবোর্ড", "সেটিংস", "ফিচার", "আপডেট", "রিলিজ", "ডিক্টেশন", "স্পেলিং",
    "পুরা", "পুরাটা", "আসতেছে", "আসতেছি", "করতেছে", "করতেছি", "বলতেছে",
    "বলতেছি", "লিখতেছে", "লিখতেছি", "দেখতেছে", "দেখতেছি", "খুশি", "পোশাক",
    "রাইট", "নাও", "সেয়িং", "রিটেন", "শুড", "অ্যাজ", "ওয়েল", "সাপোজড",
]


def load_sources():
    ob_path = os.path.join(BUILD_DIR, "openbangla_dict.json")
    bd_path = os.path.join(BUILD_DIR, "bn_BD.dic")
    fq_path = os.path.join(BUILD_DIR, "bn_freq_full.txt")

    ob = json.load(open(ob_path, encoding="utf-8"))
    ob_words = set()
    for v in ob.values():
        if isinstance(v, list):
            for w in v:
                w = unicodedata.normalize("NFC", w.strip())
                if len(w) >= 2 and BN_RE.match(w):
                    ob_words.add(w)

    bd_words = set()
    deprecated = set()
    for line in open(bd_path, encoding="utf-8", errors="ignore").read().splitlines()[1:]:
        w = line.split("/", 1)[0].strip()
        if not w:
            continue
        if w.startswith("*"):
            deprecated.add(unicodedata.normalize("NFC", w[1:]))
            continue
        w = unicodedata.normalize("NFC", w)
        if len(w) >= 2 and BN_RE.match(w):
            bd_words.add(w)

    freq = {}
    for line in open(fq_path, encoding="utf-8").read().splitlines():
        parts = line.strip().split()
        if len(parts) == 2 and parts[1].isdigit():
            w = unicodedata.normalize("NFC", parts[0])
            if len(w) >= 2 and BN_RE.match(w):
                freq[w] = int(parts[1])

    excluded = {unicodedata.normalize("NFC", x) for x in EXCLUDED_TYPOS} | deprecated
    valid = (ob_words | bd_words) - excluded
    for w in EXTRA_VALID_SPOKEN:
        w = unicodedata.normalize("NFC", w)
        valid.add(w)
        if freq.get(w, 0) < 500:
            freq[w] = 500

    # Also protect genuine high-frequency spoken inflected Bengali words from OpenSubtitles
    # (e.g. "ভাবে", "লিখতে", "বলতেছে") ONLY if they do NOT collide on Level-1 homophone skeleton
    # with any higher-frequency authoritative word (so subtitle typos never enter valid).
    l1_trans = str.maketrans({
        "শ": "স", "ষ": "স", "ণ": "ন", "ী": "ি", "ঈ": "ই",
        "ূ": "ু", "ঊ": "উ", "য": "জ", "ৎ": "ত", "ঙ": "ং",
    })
    def skel1_py(word):
        s = word.replace("\u09a1\u09bc", "র").replace("\u09dc", "র").replace("\u09a2\u09bc", "র").replace("\u09dd", "র")
        s = s.replace("\u09af\u09bc", "\u09df")
        return s.translate(l1_trans).replace("\u0981", "")

    auth_l1_best = {}
    for w in valid:
        k = skel1_py(w)
        f = freq.get(w, 0)
        if k not in auth_l1_best or f > auth_l1_best[k]:
            auth_l1_best[k] = f
    for w, f in freq.items():
        if f >= 25 and w not in excluded and w not in valid:
            k = skel1_py(w)
            if k not in auth_l1_best:
                valid.add(w)

    # Ranked spoken words: authoritative valid words that appear in OpenSubtitles spoken corpus
    spoken_ranked = sorted(
        [w for w in valid if freq.get(w, 0) >= 1],
        key=lambda w: (-freq[w], len(w), w),
    )

    # Lean high-coverage valid set (~55,000 words: all spoken words + core bn_BD roots length <= 14)
    # Loads in <60ms on mobile devices and keeps APK overhead minimal (~180KB gzip).
    lean_valid = set(spoken_ranked)
    for w in bd_words:
        if w not in excluded and 2 <= len(w) <= 14:
            lean_valid.add(w)
    all_sorted = sorted(lean_valid)

    # Prefix-delta encode all_sorted
    prev = ""
    pdelta = []
    for w in all_sorted:
        lcp = 0
        m = min(len(prev), len(w), 60)
        while lcp < m and prev[lcp] == w[lcp]:
            lcp += 1
        pdelta.append(chr(33 + lcp) + w[lcp:])
        prev = w

    spoken_gz = gzip.compress("\n".join(spoken_ranked).encode("utf-8"), compresslevel=9, mtime=0)
    valid_gz = gzip.compress("\n".join(pdelta).encode("utf-8"), compresslevel=9, mtime=0)

    return spoken_ranked, all_sorted, spoken_gz, valid_gz


def split_b64(raw_bytes):
    b64 = base64.b64encode(raw_bytes).decode("ascii")
    return [b64[i : i + CHUNK_SIZE] for i in range(0, len(b64), CHUNK_SIZE)]


def main():
    spoken_ranked, all_sorted, spoken_gz, valid_gz = load_sources()
    spoken_chunks = split_b64(spoken_gz)
    valid_chunks = split_b64(valid_gz)

    lines = [
        "package com.akshaykadam.pixelboard.extension.rambler;",
        "",
        "/**",
        " * Generated compressed Bengali orthography lexicon data.",
        " *",
        f" * <p>Spoken frequency-ranked words: {len(spoken_ranked)} ({len(spoken_gz)} B gzip).</p>",
        f" * <p>All authoritative valid Bengali words: {len(all_sorted)} ({len(valid_gz)} B gzip, prefix-delta).</p>",
        " *",
        " * <p>Sources: OpenBangla Keyboard dictionary (GPL-3.0), LibreOffice bn_BD Hunspell dictionary",
        " * (GPL-2.0+/LGPL/MPL), and HermitDave FrequencyWords bn_full (MIT / CC-BY-SA). Generated by",
        " * {@code scripts/build_bangla_lexicon.py}.</p>",
        " */",
        "final class GboardRamblerBanglaLexiconData {",
        "    private GboardRamblerBanglaLexiconData() {}",
        "",
        f"    static final int SPOKEN_COUNT = {len(spoken_ranked)};",
        f"    static final int VALID_COUNT = {len(all_sorted)};",
        "",
        "    static String[] spokenGzipBase64Chunks() {",
        "        return new String[] {",
    ]
    for c in spoken_chunks:
        lines.append(f'            "{c}",')
    lines.append("        };")
    lines.append("    }")
    lines.append("")
    lines.append("    static String[] validDeltaGzipBase64Chunks() {")
    lines.append("        return new String[] {")
    for c in valid_chunks:
        lines.append(f'            "{c}",')
    lines.append("        };")
    lines.append("    }")
    lines.append("}")
    lines.append("")

    with open(OUT_JAVA, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(
        f"GENERATED {OUT_JAVA}: spoken={len(spoken_ranked)} ({len(spoken_gz)}B gz, {len(spoken_chunks)} chunks), "
        f"valid={len(all_sorted)} ({len(valid_gz)}B gz, {len(valid_chunks)} chunks), "
        f"java_size={os.path.getsize(OUT_JAVA)}B"
    )


if __name__ == "__main__":
    main()
