"""Second opinion on the passages eppy would mark "Not in the audiobook".

    uv run audit_skips.py <book folder> <skip-audit.json> <report.html>

<skip-audit.json> comes from ui-tests' SkipAuditTest (eppy's own matching run on the book folder's
.transcript.json and .epub). Each marked stretch of audio is transcribed again on its own; if most of the
passage's words are there, the mark is false. The report shows only each passage's first and last words and
its time, not the book's text.
"""
import collections
import html
import json
import re
import subprocess
import sys
from pathlib import Path

import transcribe


def norm(s):
    return re.sub(r"[^a-z0-9 ]", " ", s.lower().replace("’", "").replace("'", "")).split()


def found_share(heard, words):
    pool = collections.Counter(norm(heard))
    found = 0
    for w in words:
        if pool[w] > 0:
            found += 1
            pool[w] -= 1
    return found / max(1, len(words))


def verdict(share):
    return "false mark" if share >= 0.8 else "probably skipped" if share <= 0.5 else "unclear"


def hms(seconds):
    s = int(seconds)
    return f"{s // 3600}:{s // 60 % 60:02d}:{s % 60:02d}"


def span(p):
    """Where the passage would be: between the matched words before it and after it (plus a little)."""
    a, b = hms(p["at"]), hms(p["until"] + 5)
    return a if a == b else f"{a} – {b}"


def ends(text, n=8):
    """First and last few words only."""
    w = text.split()
    return " ".join(w) if len(w) <= 2 * n else " ".join(w[:n]) + " … " + " ".join(w[-n:])


def sparse_segments(transcript):
    """Long segments with far fewer words than narration (about 2.6 words/s): where Whisper may have left words out."""
    return [s for s in transcript["segs"] if s[1] - s[0] >= 10_000 and len(s[3]) / ((s[1] - s[0]) / 1000) < 1.0]


def recheck(model, audio, p):
    import numpy as np
    pcm = subprocess.run(["ffmpeg", "-v", "error", "-ss", str(max(0.0, p["at"] - 30)), "-t", str(p["until"] - p["at"] + 60),
                          "-i", str(audio), "-ac", "1", "-ar", str(transcribe.SR), "-f", "s16le", "-"],
                         capture_output=True, check=True).stdout
    a = np.frombuffer(pcm, np.int16).astype(np.float32) / 32768
    segs, _ = model.transcribe(a, language="en", word_timestamps=True, vad_filter=True, batch_size=16)
    return " ".join(s.text.strip() for s in segs)


PAGE = """<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"><title>Skipped-passage check</title><style>
:root{--bg:#fbfaf7;--fg:#1d1b18;--muted:#6b665e;--card:#fff;--line:#e6e1d8;--false:#1f7a4d;--skip:#b3261e;--unc:#8a6d00}
@media (prefers-color-scheme:dark){:root{--bg:#161513;--fg:#ece8e1;--muted:#a39d93;--card:#201f1c;--line:#34312c;--false:#5fd39a;--skip:#ff8a80;--unc:#e6c34a}}
body{margin:0;background:var(--bg);color:var(--fg);font:16px/1.5 system-ui,sans-serif}
main{max-width:760px;margin:0 auto;padding:16px}
h1{font-size:1.4rem;margin:.2em 0}.muted{color:var(--muted)}
.tabs{display:flex;gap:8px;flex-wrap:wrap;margin:16px 0}
.tabs button{border:1px solid var(--line);background:var(--card);color:var(--fg);border-radius:999px;padding:8px 14px;font:inherit;cursor:pointer}
.tabs button[aria-pressed=true]{border-color:var(--fg);font-weight:600}
.card{background:var(--card);border:1px solid var(--line);border-radius:12px;padding:12px 14px;margin:10px 0}
.top{display:flex;justify-content:space-between;gap:8px;align-items:baseline;flex-wrap:wrap}
.time{font-variant-numeric:tabular-nums;font-weight:600;font-size:1.1rem}
.v{font-weight:600}.v-false{color:var(--false)}.v-skip{color:var(--skip)}.v-unc{color:var(--unc)}
.quote{margin:6px 0 0;color:var(--muted)}
</style></head><body><main>
<h1>Skipped-passage check</h1>
<p class="muted">__BOOK__ · __SUMMARY__</p>
<p>eppy would mark these passages "Not in the audiobook" (matching run on the PC transcript). Each stretch of audio was
transcribed again on its own: <b class="v-false">false mark</b> means most of the passage's words are in the audio after
all; <b class="v-skip">probably skipped</b> means half or fewer are. Times are in the audiobook file, from the last matched words before the passage to the first after it; a passage
that is narrated starts a little after the first time.</p>
<div class="tabs" role="group">__TABS__</div>
<div id="list">__CARDS__</div>
<script>
document.querySelectorAll('.tabs button').forEach(b=>b.onclick=()=>{
 document.querySelectorAll('.tabs button').forEach(x=>x.setAttribute('aria-pressed',x===b));
 document.querySelectorAll('.card').forEach(c=>c.hidden=b.dataset.v!=='all'&&c.dataset.v!==b.dataset.v);});
</script></main></body></html>"""


def report(audit, passages, sparse_count):
    cls = {"false mark": "v-false", "probably skipped": "v-skip", "unclear": "v-unc"}
    counts = collections.Counter(p["verdict"] for p in passages)
    tabs = [f'<button data-v="all" aria-pressed="true">All {len(passages)}</button>'] + [
        f'<button data-v="{v}" aria-pressed="false">{v.capitalize()} {counts[v]}</button>' for v in cls]
    cards = []
    for p in passages:
        cards.append(
            f'<div class="card" data-v="{p["verdict"]}"><div class="top"><span class="time">{span(p)}</span>'
            f'<span class="v {cls[p["verdict"]]}">{p["verdict"]}</span></div>'
            f'<div class="muted">{p["words"]} words · {100 * p["freshFound"]:.0f}% found on the second run'
            f'{" · next to a sparse transcript segment" if p["sparseNearby"] else ""}</div>'
            f'<p class="quote">{html.escape(ends(p["text"]))}</p></div>')
    summary = (f'{len(passages)} passages ({sum(p["words"] for p in passages):,} words) · {counts["false mark"]} false · '
               f'{counts["probably skipped"]} probably skipped · {counts["unclear"]} unclear · '
               f'{sparse_count} sparse segments in the transcript')
    return (PAGE.replace("__BOOK__", html.escape(audit["audio"])).replace("__SUMMARY__", summary)
            .replace("__TABS__", "".join(tabs)).replace("__CARDS__", "".join(cards)))


def main(argv):
    if len(argv) != 4:
        print(__doc__)
        return 2
    folder, audit_path, out = Path(argv[1]), Path(argv[2]), Path(argv[3])
    audit = json.loads(audit_path.read_text(encoding="utf-8"))
    audio = folder / audit["audio"]
    transcript = json.loads(transcribe.transcript_path(audio).read_text(encoding="utf-8"))
    sparse = sparse_segments(transcript)
    model = transcribe.load_model()
    passages = audit["passages"]
    for i, p in enumerate(passages, 1):
        p["freshFound"] = found_share(recheck(model, audio, p), norm(p["text"]))
        p["verdict"] = verdict(p["freshFound"])
        p["sparseNearby"] = any(s[0] / 1000 < p["until"] + 5 and s[1] / 1000 > p["at"] - 5 for s in sparse)
        print(f"\r{i}/{len(passages)} checked", end="", flush=True)
    print()
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(report(audit, passages, len(sparse)), encoding="utf-8")
    print(dict(collections.Counter(p["verdict"] for p in passages)), f"-> {out}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
