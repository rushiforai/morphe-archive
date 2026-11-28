#!/usr/bin/env python3
"""
Builds Rambler Bangla's offline, high-accuracy:
  1. 25,000+ English -> Natural Bangladeshi Bengali Loanword Table
     (GboardRamblerLoanTableData.java, gzip+base64, ~240 KB)
  2. 25,000+ Shift-Free Colloquial Banglish -> Bangla Academy Bengali Dictionary
     (GboardRamblerBanglishData.java, gzip+base64, ~200 KB)

Data sources (all open-source, credited in ATTRIBUTION.md & THIRD-PARTY-NOTICES.md):
  - AI4Bharat Aksharantar Bengali (ben.zip, CC-BY-4.0, 1.25M human-verified pairs)
  - HermitDave FrequencyWords en_50k & bn_50k (MIT / CC-BY-SA)
  - OpenBangla Keyboard (GPL-3.0) + LibreOffice bn_BD (GPL-2.0+/LGPL/MPL) valid lexicon
  - Existing Rambler Bangla curated overrides, Avro Tier-1 (2,265), & cleaned CMUdict fallback
"""
import base64
import collections
import gzip
import json
import os
import pathlib
import re
import unicodedata
import urllib.request
import zipfile

REPO = pathlib.Path(__file__).resolve().parent.parent
JAVA_DIR = REPO / "extensions/rambler-enhancements/src/main/java/com/akshaykadam/pixelboard/extension/rambler"
WORK = pathlib.Path("/tmp/xlit_work")
WORK.mkdir(parents=True, exist_ok=True)


def fetch(url: str, dest: pathlib.Path) -> pathlib.Path:
    if dest.exists() and dest.stat().st_size > 1000:
        return dest
    req = urllib.request.Request(url, headers={"User-Agent": "RamblerBangla/32.2.0"})
    with urllib.request.urlopen(req, timeout=120) as r, open(dest, "wb") as f:
        while True:
            chunk = r.read(262144)
            if not chunk:
                break
            f.write(chunk)
    return dest


def decode_lexicon_valid() -> set[str]:
    src = (JAVA_DIR / "GboardRamblerBanglaLexiconData.java").read_text(encoding="utf-8")
    idx = src.index("validDeltaGzipBase64Chunks()")
    end = src.index("};", idx)
    b64 = "".join(re.findall(r'"([^"]+)"', src[idx:end]))
    raw = gzip.decompress(base64.b64decode(b64)).decode("utf-8")
    valid = set()
    prev = ""
    for line in raw.splitlines():
        if not line:
            continue
        c = ord(line[0]) - 33
        w = prev[:c] + line[1:]
        valid.add(w)
        prev = w
    return valid


def is_clean_bn(w: str) -> bool:
    if not w or len(w) < 2:
        return False
    # Reject illegal jofola (্য়), hasanta before independent vowel, trailing hasanta, double nukta
    if any(bad in w for bad in ("\u09cd\u09df", "\u09cd\u0985", "\u09cd\u0986", "\u09cd\u0987",
                                "\u09cd\u0989", "\u09cd\u098f", "\u09cd\u0993", "\u09bc\u09bc")):
        return False
    if w.endswith("\u09cd"):
        return False
    for k, ch in enumerate(w):
        if ("\u09be" <= ch <= "\u09cc") or ch == "\u09d7":
            if k == 0 or not (("\u0995" <= w[k - 1] <= "\u09b9")
                              or ("\u09dc" <= w[k - 1] <= "\u09df")
                              or w[k - 1] == "\u09bc"):
                return False
        if not (("\u0980" <= ch <= "\u09ff") or ch in "\u200c\u200d-"):
            return False
    return True


def clean_cmu(lo: str, bn: str) -> str:
    s = unicodedata.normalize("NFC", bn)
    if (lo.startswith("under") or (lo.startswith("un") and len(lo) >= 4)) and s.startswith("অ") and not s.startswith("অ্যা"):
        s = "আ" + s[1:]
    if lo.startswith("up") and len(lo) >= 4 and s.startswith("অপ"):
        s = "আপ" + s[2:]
    if lo.startswith("multi") and s.startswith("মল্টি"):
        s = "মাল্টি" + s[5:]
    if lo.startswith("exp") and s.startswith("ইক্স্প"):
        s = "এক্সপ" + s[6:]
    s = s.replace("ির্লি", "িয়ারলি").replace("াইঅন্ট", "ায়েন্ট").replace("ন্চওয়", "নচুয়া")
    if lo.endswith("body") and s.endswith("বোডি"):
        s = s[:-4] + "বডি"
    if lo.endswith("one") and s.endswith("ওয়ন"):
        s = s[:-4] + "ওয়ান"
    if lo.endswith("ted") and s.endswith("টিড"):
        s = s[:-3] + "টেড"
    elif lo.endswith("ded") and s.endswith("ডিড"):
        s = s[:-3] + "ডেড"
    if lo.endswith(("nce", "nse")) and s.endswith("নস"):
        s = s[:-2] + "ন্স"
    if lo.endswith(("ear", "eer")) and s.endswith("ির"):
        s = s[:-2] + "িয়ার"
    if lo.endswith("board") and s.endswith("বর্ড"):
        s = s[:-4] + "বোর্ড"
    if "oi" in lo or "oy" in lo:
        s = s.replace("য়স", "য়েস").replace("য়ন্ট", "য়েন্ট")
    s = s.replace("ক্স্চ", "ক্সচ").replace("ক্স্ট", "ক্সট").replace("ম্প্লি", "ম্পলি").replace("ন্জ", "ঞ্জ")
    if s.endswith("জজ"):
        s = s[:-2] + "জেস"
    elif s.endswith("সজ") and lo.endswith("ses"):
        s = s[:-2] + "সেস"
    if (lo.endswith("s") and not lo.endswith(("ss", "se", "ze", "ge", "ays", "eys", "oys"))
            and s.endswith("জ") and len(s) >= 2 and s[-2] in "ডংনমলবগরভদটকপ"):
        s = s[:-1] + "স"
    return s


def emit_chunked_java(out_path: pathlib.Path, cls_name: str, doc: str, payload: str, count: int) -> tuple[int, int]:
    gz = gzip.compress(payload.encode("utf-8"), compresslevel=9)
    b64 = base64.b64encode(gz).decode("ascii")
    chunk_size = 48000
    chunks = [b64[i:i + chunk_size] for i in range(0, len(b64), chunk_size)]
    lines = [
        "package com.akshaykadam.pixelboard.extension.rambler;",
        "",
        "/**",
        f" * {doc}",
        f" * Entries: {count} ({len(gz)} bytes gzip, {len(chunks)} chunks).",
        " * Generated by scripts/build_bangla_loan_and_phonetic.py.",
        " */",
        f"final class {cls_name} {{",
        f"    private {cls_name}() {{}}",
        "",
        f"    static final int ENTRY_COUNT = {count};",
        "",
        "    static String[] gzipBase64Chunks() {",
        "        return new String[] {",
    ]
    for i, c in enumerate(chunks):
        comma = "," if i + 1 < len(chunks) else ""
        lines.append(f'            "{c}"{comma}')
    lines += ["        };", "    }", "}", ""]
    out_path.write_text("\n".join(lines), encoding="utf-8")
    return len(gz), len(chunks)


def main():
    ak_zip = fetch("https://huggingface.co/datasets/ai4bharat/Aksharantar/resolve/main/ben.zip", WORK / "ben.zip")
    en_freq_path = fetch("https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2018/en/en_50k.txt", WORK / "en_50k.txt")
    bn_freq_path = fetch("https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2018/bn/bn_50k.txt", WORK / "bn_50k.txt")

    valid_bn = decode_lexicon_valid()
    print(f"Loaded authoritative valid_bn: {len(valid_bn)}", flush=True)

    bn_rank = {}
    with open(bn_freq_path, encoding="utf-8") as f:
        for idx, line in enumerate(f, 1):
            parts = line.strip().split()
            if parts:
                w = unicodedata.normalize("NFC", parts[0])
                if w not in bn_rank:
                    bn_rank[w] = idx

    en_rank = {}
    with open(en_freq_path, encoding="utf-8") as f:
        for idx, line in enumerate(f, 1):
            parts = line.strip().split()
            if parts and parts[0].isalpha() and parts[0].isascii():
                w = parts[0].lower()
                if w not in en_rank:
                    en_rank[w] = idx

    en_java = (JAVA_DIR / "GboardRamblerEnglishWords.java").read_text(encoding="utf-8")
    en_dict = {w.lower() for s in re.findall(r'"([^"]+)"', en_java) for w in s.split() if w.isalpha() and w.isascii()}

    cmu_tsv = REPO / "data/loanspell/loan-table.tsv"
    cmu_table = {}
    for line in cmu_tsv.read_text(encoding="utf-8").splitlines():
        parts = line.split("\t")
        if len(parts) == 2 and parts[0].isascii() and parts[0].isalpha():
            cmu_table[parts[0].lower()] = unicodedata.normalize("NFC", parts[1].strip())

    t1_java = (JAVA_DIR / "GboardRamblerTier1.java").read_text(encoding="utf-8")
    tier1 = {m.group(1): unicodedata.normalize("NFC", m.group(2))
             for m in re.finditer(r'(?:\\n|")([a-z]+)\\t([^\\n"]+)', t1_java)}

    # Load all Aksharantar ben pairs
    ak_raw = collections.defaultdict(collections.Counter)
    with zipfile.ZipFile(ak_zip) as z:
        for name in z.namelist():
            if not name.endswith(".json"):
                continue
            with z.open(name) as f:
                for line in f:
                    row = json.loads(line)
                    rom = row.get("english word", "").strip().lower()
                    nat = unicodedata.normalize("NFC", row.get("native word", "").strip())
                    src = row.get("source", "")
                    if not rom or not rom.isascii() or not rom.isalpha() or len(rom) < 2:
                        continue
                    if not is_clean_bn(nat) or "-" in nat:
                        continue
                    wt = 5 if src in ("Dakshina", "Aksharantar", "Human") else (3 if "Wiki" in src else 1)
                    ak_raw[rom][nat] += wt

    def bn_init_group(s: str) -> str:
        if not s:
            return ""
        c = s[0]
        if c in "কখগঘ":
            return "K"
        if c in "চছজঝয":
            return "C"
        if c in "টঠডঢতথদধ":
            return "T"
        if c in "পফবভ":
            return "P"
        if c in "নণ":
            return "N"
        if c in "ম":
            return "M"
        if c in "রড়ঢ়":
            return "R"
        if c in "ল":
            return "L"
        if c in "শষস":
            return "S"
        if c in "হ":
            return "H"
        if c in "অআইঈউঊএঐওঔয়":
            return "V"
        return c

    def score_en(en: str, nat: str, raw_wt: int, cmu_cand: str | None) -> int:
        s = raw_wt * 10
        # Small tie-breaker only (large bonuses caused Bengali homographs like ঠেসে/বলল/বেশী/একই to hijack English words!)
        if nat in valid_bn:
            s += 5
        # Strict phonetic sanity against English spelling & CMUdict pronunciation
        if en.startswith("th") and nat[0] in ("ট", "ঠ", "ড", "ঢ"):
            if en not in ("thakur", "thames", "thom", "thomson", "thomas", "thailand", "thai"):
                s -= 140
        if en.startswith("sh") and nat[0] not in ("শ", "স", "ষ"):
            s -= 120
        if en.startswith(("ph", "f")) and nat[0] not in ("ফ", "প", "ভ", "এ"):
            s -= 120
        if en.startswith("v") and nat[0] not in ("ভ", "ব"):
            s -= 120
        if en.startswith("wh") and nat[0] not in ("হ", "ও", "উ"):
            s -= 120
        if en.startswith("z") and nat[0] not in ("জ", "য", "ঝ"):
            s -= 120
        # Reject Bengali chandrabindu (ঁ) in English loanwords (e.g. সূঁচ, হাঁফ, তাঁর)
        if "\u0981" in nat:
            s -= 100
        # Cross-check initial consonant group against CMUdict when available (kills translations like will->বলল, each->একই, who->ভিওএ)
        if cmu_cand:
            g_nat = bn_init_group(nat)
            g_cmu = bn_init_group(cmu_cand)
            if g_nat != g_cmu:
                # Allow H<->V for wh-/h- words (what->হোয়াট/ওয়াট) and C<->S for soft c/s
                allowed = ({g_nat, g_cmu} in ({"H", "V"}, {"C", "S"}))
                if not allowed:
                    s -= 130
        # Morphological integrity: reject dropped/extra suffixes
        if not en.endswith("s") and (nat.endswith("স") or nat.endswith("সেস") or nat.endswith("গুলো")):
            if not en.endswith(("ce", "se", "ss", "x", "sh", "ch", "us", "is", "as", "os")):
                s -= 45
        if not en.endswith(("e", "a", "y", "i")) and nat.endswith("ে"):
            s -= 25
        if en.endswith("ed") and not nat.endswith(("ড", "ট", "দ", "ত")):
            s -= 60
        if en.endswith("ing") and not nat.endswith(("ং", "ঙ")):
            s -= 60
        if en.endswith("ly") and not nat.endswith(("লি", "লী")):
            s -= 60
        if en.endswith("s") and not en.endswith(("ss", "us", "is")) and not nat.endswith(("স", "জ", "শ", "ক্স")):
            s -= 40
        # Bangla Academy preferences for English loanwords
        if en.endswith("y") and nat.endswith("ি"):
            s += 12
        if en.endswith(("nce", "nse")) and nat.endswith("ন্স"):
            s += 15
        if "st" in en and "স্ট" in nat:
            s += 8
        if "nt" in en and "ন্ট" in nat:
            s += 6
        if en.startswith(("ac", "an", "ap", "ad")) and nat.startswith("অ্যা"):
            s += 10
        # Reject suspiciously short/long mappings (length ratio sanity)
        if len(nat) < max(2, len(en) // 3) or len(nat) > len(en) * 2 + 3:
            s -= 80
        return s

    # 1. Build 25,000+ English -> Natural Bengali Loanword Table
    # Priority for each English word:
    #   (a) High-confidence Aksharantar human-verified pair passing CMU phonetic sanity (score >= 15)
    #   (b) Systematically cleaned CMUdict (17,841 words)
    all_en_targets = set(cmu_table.keys())
    top_en_25k = [w for w, _ in sorted(en_rank.items(), key=lambda kv: kv[1]) if len(w) >= 2][:25000]
    all_en_targets.update(top_en_25k)

    # Known short/ambiguous Bangla words we never want to overwrite as English loanwords
    bn_block = {"ami", "tumi", "apni", "kintu", "ekhon", "tokhon", "amar", "tomar", "taka", "bhalo",
                "valo", "kotha", "kaj", "din", "rat", "bar", "ek", "dui", "tin", "char", "pach",
                "na", "ha", "ki", "ke", "se", "je", "ta", "te", "to", "ar", "ba", "o", "e", "i",
                "ma", "baba", "dada", "mama", "chacha", "kaka", "bhai", "bon", "desh", "gram",
                "bangla", "dhaka", "kolkata", "shob", "sob", "mon", "gan", "dan", "jan", "man",
                "kan", "pan", "tan", "van", "ban", "ran", "san", "kal", "bal", "gal", "jal",
                "mal", "pal", "sal", "tal", "hal", "lal", "chal", "dal", "bhat", "hat", "sat",
                "mat", "pat", "bat", "kat", "gat", "nat", "tat", "rat", "kom", "dom", "jom",
                "nom", "rom", "som", "tom", "bor", "cor", "dor", "gor", "hor", "jor", "kor",
                "mor", "nor", "por", "sor", "tor", "age", "ore", "are", "ore", "hobe", "ache",
                "chilo", "koro", "bolo", "cholo", "dekho", "shono", "khao", "jao", "dao", "nao"}

    loan_final = {}
    ak_used = 0
    cmu_used = 0
    for w in sorted(all_en_targets):
        if w in bn_block or len(w) < 2:
            continue
        cmu_cand = None
        if w in cmu_table:
            cand = clean_cmu(w, cmu_table[w])
            if is_clean_bn(cand):
                cmu_cand = cand
        chosen = None
        if w in ak_raw:
            best_nat, best_sc = max(
                ((n, score_en(w, n, wt, cmu_cand)) for n, wt in ak_raw[w].items()),
                key=lambda kv: kv[1],
            )
            if best_sc >= 15:
                chosen = best_nat
                ak_used += 1
        if chosen is None and cmu_cand is not None:
            chosen = cmu_cand
            cmu_used += 1
        if chosen is not None:
            loan_final[w] = chosen

    print(f"Loanword table built: total={len(loan_final)} (Aksharantar={ak_used}, CleanedCMU={cmu_used})", flush=True)

    # 2. Build 25,000+ Shift-Free Colloquial Banglish -> Bangla Academy Bengali Dictionary
    # Strictly targets valid_bn words, excludes all top-15k English words and GboardRamblerEnglishWords!
    banglish_scored = []
    for rom, cnt in ak_raw.items():
        if len(rom) < 2 or rom in en_dict or (rom in en_rank and en_rank[rom] <= 18000):
            continue
        valid_cands = []
        for n, wt in cnt.items():
            if n not in valid_bn:
                continue
            r = bn_rank.get(n, 999999)
            sc = wt * 20 + (max(1, 50 - r // 1000) if r < 50000 else 0)
            # Prefer colloquial/modern verb forms and avoid rare Sanskrit collisions when rank is similar
            valid_cands.append((n, sc, r))
        if not valid_cands:
            continue
        best_nat, best_sc, best_r = max(valid_cands, key=lambda t: t[1])
        # Keep top spoken/verified Banglish pairs (either human-verified wt>=5 or target in top 35k spoken Bengali)
        if best_sc >= 25 or best_r <= 35000:
            banglish_scored.append((best_r, -best_sc, rom, best_nat))

    banglish_scored.sort()
    # Cap at top 25,000 most useful spoken Shift-free Banglish words so APK stays tiny & load is <20ms!
    banglish_final = {rom: nat for _, _, rom, nat in banglish_scored[:25000]}
    print(f"Banglish table built: total={len(banglish_final)} (from {len(banglish_scored)} valid candidates)", flush=True)

    # Emit compact Java data files
    loan_payload = "\n".join(f"{k}\t{v}" for k, v in sorted(loan_final.items()))
    lgz, lch = emit_chunked_java(
        JAVA_DIR / "GboardRamblerLoanTableData.java",
        "GboardRamblerLoanTableData",
        "AI4Bharat Aksharantar (CC-BY-4.0) + cleaned CMUdict English->Bengali loanword table.",
        loan_payload,
        len(loan_final),
    )
    bn_payload = "\n".join(f"{k}\t{v}" for k, v in sorted(banglish_final.items()))
    bgz, bch = emit_chunked_java(
        JAVA_DIR / "GboardRamblerBanglishData.java",
        "GboardRamblerBanglishData",
        "AI4Bharat Aksharantar (CC-BY-4.0) Shift-free Banglish->Bengali dictionary filtered against OpenBangla+bn_BD.",
        bn_payload,
        len(banglish_final),
    )
    print(f"WRITTEN GboardRamblerLoanTableData.java: {len(loan_final)} entries, {lgz}B gz ({lch} chunks)", flush=True)
    print(f"WRITTEN GboardRamblerBanglishData.java:  {len(banglish_final)} entries, {bgz}B gz ({bch} chunks)", flush=True)

    # Audit against 50 hard English loanwords + 30 Banglish words
    print("\n=== FINAL LOANWORD AUDIT (LoanTableData only, before Curated/Override) ===")
    for w in ["client","clients","everything","everyone","everybody","everyday","anything","something","nothing",
              "actually","clearly","pretty","accurate","accuracy","fluent","updated","updating","installed",
              "downloaded","sentence","schedule","deadline","browser","mobile","samsung","perfect","normal",
              "natural","management","experience","difference","decision","discussion","popup","automatically",
              "basically","implement","feedback","delivery","presentation","notification","phonetics","understand",
              "multilingual","business","software","network","technology","environment","international"]:
        print(f"  {w:16s} -> {loan_final.get(w, '<CURATED/MISSING>')}")

    print("\n=== FINAL BANGLISH AUDIT (BanglishData) ===")
    for w in ["fatafati","thikmoto","byapar","kalke","ajke","soboi","ekdom","beshirbhag","valo","taratari",
              "motamuti","purota","purata","mishti","bolbo","temne","bhalobasha","bujhte","likhte","korte",
              "bolte","somoy","shomoy","somossa","shomoshya","amader","tomader","apnader","kemon","ekhon"]:
        print(f"  {w:14s} -> {banglish_final.get(w, '-')}")


if __name__ == "__main__":
    main()
