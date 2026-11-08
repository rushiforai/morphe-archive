"""Scene kit for the README cards: one uniform frame, one accent per feature.

Every card is an HTML page, 880 x 440 CSS px, rendered frame by frame in Edge by render.py
and encoded to looping animated WebP (1x and 2x) plus a first-frame PNG.
"""
import html
import math
import random

W, H = 880, 440
FONT = "'Inter',sans-serif"
MONO = "'JetBrains Mono',monospace"
# Pages are written to src/pages/; the bundled OFL fonts live in src/fonts/, so rendering is identical on any machine.
FONT_FACES = ("@font-face{font-family:'Inter';src:url('../fonts/Inter.ttf') format('truetype');font-weight:100 900}"
              "@font-face{font-family:'JetBrains Mono';src:url('../fonts/JetBrainsMono.ttf') format('truetype');font-weight:100 800}")
EASE = "cubic-bezier(.65,0,.35,1)"
OUT = "cubic-bezier(.22,1,.36,1)"

ACCENTS = {
    "teal": "#2ec4b6", "amber": "#f5a524", "blue": "#4c8dff", "coral": "#ff6b5a", "green": "#3fb950",
    "cyan": "#22b8e0", "gold": "#e3b341", "red": "#e5534b", "slate": "#8b9cff", "rose": "#ef6f9a",
}

NOISE = ("url(\"data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='160' height='160'>"
         "<filter id='n'><feTurbulence type='fractalNoise' baseFrequency='.9' numOctaves='2' stitchTiles='stitch'/>"
         "<feColorMatrix values='0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 .55 0'/></filter><rect width='100%' height='100%' filter='url(%23n)'/></svg>\")")

BASE_CSS = """
*{box-sizing:border-box;margin:0;padding:0}
html,body{background:transparent;width:%(W)dpx;height:%(H)dpx;overflow:hidden}
body{font-family:%(FONT)s;color:#e8eaed;-webkit-font-smoothing:antialiased;font-feature-settings:'cv11','ss01','tnum'}
.card{position:absolute;inset:0;border-radius:4px;overflow:hidden;
  background:radial-gradient(120%% 90%% at 85%% -10%%,rgba(255,255,255,.06),transparent 55%%),linear-gradient(180deg,#16181c,#0f1013);}
.card::before{content:"";position:absolute;inset:0;pointer-events:none;
  background-image:linear-gradient(rgba(255,255,255,.028) 1px,transparent 1px),linear-gradient(90deg,rgba(255,255,255,.028) 1px,transparent 1px);
  background-size:24px 24px;background-position:8px 8px;
  -webkit-mask-image:radial-gradient(90%% 80%% at 50%% 40%%,#000 30%%,transparent 100%%)}
.card::after{content:"";position:absolute;inset:0;border-radius:4px;box-shadow:inset 0 0 0 1px rgba(255,255,255,.07);pointer-events:none}
.hdr{position:absolute;left:32px;top:24px;height:16px;display:flex;align-items:center;gap:10px;z-index:20}
.hdr .idx{font:500 11px/1 %(MONO)s;color:#6b7079;letter-spacing:.06em}
.hdr .bar{width:18px;height:2px;background:var(--acc)}
.hdr .name{font-size:13px;font-weight:600;letter-spacing:.01em;color:#f1f3f5}
.caps{position:absolute;right:32px;top:24px;height:16px;width:520px;z-index:20}
.caps span{position:absolute;right:0;top:0;font:500 11px/16px %(MONO)s;color:#8b9099;white-space:nowrap;opacity:0;letter-spacing:.02em}
.caps span b{color:var(--acc);font-weight:600}
.stage{position:absolute;left:32px;right:32px;top:60px;bottom:28px}
.mono{font-family:%(MONO)s}
.still{position:absolute;overflow:hidden;border-radius:2px}
.still .grain{position:absolute;inset:0;background-image:%(NOISE)s;opacity:.07;mix-blend-mode:overlay}
.still .vig{position:absolute;inset:0;background:radial-gradient(120%% 100%% at 50%% 45%%,transparent 55%%,rgba(0,0,0,.55))}
.win{position:absolute;border-radius:4px;background:#1b1d22;box-shadow:0 18px 40px rgba(0,0,0,.45),0 2px 6px rgba(0,0,0,.35),inset 0 0 0 1px rgba(255,255,255,.06);overflow:hidden}
.player{position:absolute;border-radius:4px;overflow:hidden;background:#000;
  box-shadow:0 24px 60px rgba(0,0,0,.55),0 2px 8px rgba(0,0,0,.4),inset 0 0 0 1px rgba(255,255,255,.06)}
.player .scrim{position:absolute;left:0;right:0;bottom:0;height:46%%;background:linear-gradient(180deg,transparent,rgba(0,0,0,.78))}
.player .ttl{position:absolute;left:18px;top:14px;font-size:12px;font-weight:600;color:#fff;text-shadow:0 1px 6px rgba(0,0,0,.6)}
.player .ttl small{display:block;font-weight:400;color:rgba(255,255,255,.7);font-size:11px;margin-top:2px}
.pbar{position:absolute;left:18px;right:18px;height:3px;background:rgba(255,255,255,.22);border-radius:2px}
.pbar .seg{position:absolute;top:0;height:3px}
.pbar .played{position:absolute;left:0;top:0;height:3px;width:100%%;background:#fff;transform-origin:0 50%%;border-radius:2px}
.pbar .knob{position:absolute;top:-4.5px;left:-6px;width:12px;height:12px;border-radius:50%%;background:#fff;box-shadow:0 0 0 4px rgba(255,255,255,.15),0 2px 6px rgba(0,0,0,.5)}
.tc{position:absolute;font:500 11px/1 %(MONO)s;color:rgba(255,255,255,.85)}
.skipbtn{position:absolute;padding:0 18px;height:34px;display:flex;align-items:center;gap:8px;border-radius:3px;
  background:rgba(18,19,22,.72);backdrop-filter:blur(8px);box-shadow:inset 0 0 0 1px rgba(255,255,255,.55),0 6px 18px rgba(0,0,0,.4);
  font-size:13px;font-weight:600;color:#fff;overflow:hidden;white-space:nowrap}
.skipbtn .fill{position:absolute;left:0;bottom:0;height:2px;width:100%%;background:var(--acc);transform-origin:0 50%%}
.lbl{font:600 10px/1 %(MONO)s;letter-spacing:.12em;color:#7d838d;text-transform:uppercase}
.acc{color:var(--acc)}
"""


def base_css():
    return FONT_FACES + BASE_CSS % dict(W=W, H=H, FONT=FONT, MONO=MONO, NOISE=NOISE)


def mix(c1, c2, f):
    a = [int(c1[i:i + 2], 16) for i in (1, 3, 5)]
    b = [int(c2[i:i + 2], 16) for i in (1, 3, 5)]
    return "#%02x%02x%02x" % tuple(round(a[i] + (b[i] - a[i]) * f) for i in range(3))


def esc(s):
    return html.escape(str(s))


class Scene:
    def __init__(self, idx, name, accent, dur=7.0):
        self.idx, self.name, self.dur = idx, name, dur
        self.acc = ACCENTS.get(accent, accent)
        self.css, self.body, self.n = [], [], 0
        self.caps = []
        self.still = None  # a settled moment for the PNG fallback, in seconds

    def k(self, frames, ease=EASE, extra=""):
        """frames: list of (seconds, css). Returns a class name for a looping animation."""
        self.n += 1
        name = "k%d" % self.n
        steps = "".join("%.3f%%{%s}" % (100.0 * t / self.dur, css) for t, css in frames)
        self.css.append(".%s{animation:%s %.3fs %s infinite both;%s}@keyframes %s{%s}" % (name, name, self.dur, ease, extra, name, steps))
        return name

    def fade(self, a, z, d=0.45, lo=0, move=None):
        """Visible from a to z, eased fade; optional move=(dx,dy) for the entrance and exit."""
        mv = lambda on: "" if not move else ";transform:translate(%spx,%spx)" % ((0, 0) if on else move)
        return self.k([(0, "opacity:%s%s" % (lo, mv(False))), (max(a, 0.001), "opacity:%s%s" % (lo, mv(False))),
                       (a + d, "opacity:1%s" % mv(True)), (z, "opacity:1%s" % mv(True)),
                       (min(z + d, self.dur), "opacity:%s%s" % (lo, mv(False))), (self.dur, "opacity:%s%s" % (lo, mv(False)))])

    def cap(self, text, a, z):
        self.caps.append((text, a, z))

    def html(self):
        caps = "".join('<span class="%s">%s</span>' % (self.fade(a, z, 0.35, move=(0, 4)), t) for t, a, z in self.caps)
        hdr = ('<div class="hdr"><span class="idx">%02d</span><span class="bar"></span><span class="name">%s</span></div>'
               % (self.idx, esc(self.name))) if self.idx else ""
        return ("<!doctype html><html><head><meta charset='utf-8'><meta name='still' content='%.3f'><style>%s:root{--acc:%s}%s</style></head>"
                "<body><div class='card'>%s<div class='caps'>%s</div><div class='stage'>%s</div></div></body></html>"
                % (self.still if self.still is not None else 0.62 * self.dur, base_css(), self.acc, "".join(self.css), hdr, caps, "".join(self.body)))


# ------------------------------------------------------------------ film stills
PALETTES = [
    # (sky top, sky bottom, light, ground, light position)
    ("#0e2233", "#d08a52", "#ffd9a8", "#1a1410", (0.72, 0.62)),   # dusk, warm sun low
    ("#06101c", "#1d3b5c", "#9cc7ff", "#05080d", (0.3, 0.35)),    # night, cool moon
    ("#2a1a12", "#7a4a2a", "#ffc27a", "#140c08", (0.25, 0.4)),    # amber interior
    ("#0b1714", "#2f5a4a", "#cfe8c6", "#08100c", (0.6, 0.3)),     # forest morning
    ("#1a2430", "#8aa0b4", "#f4f8ff", "#2a323a", (0.5, 0.25)),    # overcast snow
    ("#120a14", "#3a2440", "#ff9a6a", "#0a060c", (0.8, 0.55)),    # neon street
    ("#0a1a24", "#1f6a7a", "#9ff0e8", "#061014", (0.45, 0.5)),    # sea, teal
    ("#1c140c", "#5a3a1c", "#ffe0a0", "#0e0a06", (0.5, 0.65)),    # desert road
]
TITLE_PAL = ("#040404", "#1a0606", "#ff7a3a", "#000000", (0.5, 0.5))


def ridge(r, w, h, base, rough, n=14):
    pts = []
    for i in range(n + 1):
        x = w * i / n
        y = h * (base + rough * (r.random() - 0.5))
        pts.append((x, y))
    d = "M0 %.1f" % h + "".join(" L%.1f %.1f" % p for p in pts) + " L%.1f %.1f Z" % (w, h)
    return d


def still(x, y, w, h, seed, title=False, extra_style="", cls="", inner=""):
    """An abstract film still: sky, light source, layered ridges with haze, depth-blurred foreground, bokeh."""
    r = random.Random(seed * 13 + 1)
    top, bot, light, ground, (lx, ly) = TITLE_PAL if title else PALETTES[seed % len(PALETTES)]
    lx = min(0.85, max(0.15, lx + (r.random() - 0.5) * 0.2))
    uid = "s%d%s%d" % (seed, "t" if title else "", int(w))
    W_, H_ = 320, 180
    defs = ('<linearGradient id="%s_sky" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="%s"/><stop offset="1" stop-color="%s"/></linearGradient>'
            '<radialGradient id="%s_sun" cx="%.3f" cy="%.3f" r="0.5"><stop offset="0" stop-color="%s" stop-opacity="1"/>'
            '<stop offset="0.12" stop-color="%s" stop-opacity=".75"/><stop offset="1" stop-color="%s" stop-opacity="0"/></radialGradient>'
            '<filter id="%s_b1" x="-20%%" y="-20%%" width="140%%" height="140%%"><feGaussianBlur stdDeviation="1.2"/></filter>'
            '<filter id="%s_b2" x="-150%%" y="-150%%" width="400%%" height="400%%"><feGaussianBlur stdDeviation="3.5"/></filter>'
            '<filter id="%s_b3" x="-100%%" y="-100%%" width="300%%" height="300%%"><feGaussianBlur stdDeviation="9"/></filter>'
            % (uid, top, bot, uid, lx, ly, light, light, light, uid, uid, uid))
    if title:
        body = ('<rect width="320" height="180" fill="#060505"/>'
                '<circle cx="160" cy="88" r="70" fill="%s" opacity=".10" filter="url(#%s_b3)"/>'
                '<rect x="112" y="80" width="96" height="9" fill="#f4ede4" opacity=".92"/>'
                '<rect x="132" y="96" width="56" height="4" fill="#f4ede4" opacity=".45"/>'
                '<rect x="40" y="84" width="240" height="1.5" fill="%s" opacity=".55" filter="url(#%s_b1)"/>' % (light, uid, light, uid))
    else:
        hz = 0.55 + 0.12 * r.random()
        far = mix(bot, top, 0.35)
        mid = mix(ground, bot, 0.35)
        body = '<rect width="320" height="180" fill="url(#%s_sky)"/>' % uid
        body += '<rect width="320" height="180" fill="url(#%s_sun)"/>' % uid
        body += '<path d="%s" fill="%s" opacity=".85" filter="url(#%s_b1)"/>' % (ridge(r, W_, H_, hz - 0.08, 0.12, 9), far, uid)
        body += '<rect y="%.1f" width="320" height="30" fill="%s" opacity=".25" filter="url(#%s_b2)"/>' % (H_ * (hz - 0.06), light, uid)
        body += '<path d="%s" fill="%s" filter="url(#%s_b1)"/>' % (ridge(r, W_, H_, hz + 0.02, 0.08, 18), mid, uid)
        body += '<path d="%s" fill="%s"/>' % (ridge(r, W_, H_, hz + 0.14, 0.05, 6), ground)
        # subject and foreground, depth-blurred
        sx = 40 + 240 * r.random()
        body += '<rect x="%.1f" y="%.1f" width="%.1f" height="%.1f" rx="3" fill="%s" filter="url(#%s_b2)" opacity=".92"/>' % (
            sx, H_ * (hz - 0.18), 14 + 10 * r.random(), H_ * 0.5, mix(ground, "#000000", 0.3), uid)
        body += '<ellipse cx="%.1f" cy="%.1f" rx="%.1f" ry="%.1f" fill="#000" opacity=".7" filter="url(#%s_b3)"/>' % (
            320 * (0.05 if r.random() < 0.5 else 0.95), 175, 70 + 40 * r.random(), 60, uid)
        for k in range(5):
            body += '<circle cx="%.1f" cy="%.1f" r="%.1f" fill="%s" opacity="%.2f" filter="url(#%s_b2)"/>' % (
                320 * r.random(), H_ * (0.15 + 0.5 * r.random()), 3 + 6 * r.random(), light, 0.15 + 0.3 * r.random(), uid)
    svgtxt = ('<svg viewBox="0 0 320 180" preserveAspectRatio="xMidYMid slice" width="100%%" height="100%%" style="position:absolute;inset:0">'
              '<defs>%s</defs>%s</svg>' % (defs, body))
    return ('<div class="still %s" style="left:%.1fpx;top:%.1fpx;width:%.1fpx;height:%.1fpx;background:%s;%s">%s<div class="vig"></div><div class="grain"></div>%s</div>'
            % (cls, x, y, w, h, top, extra_style, svgtxt, inner))


# ------------------------------------------------------------------ audio envelopes
def envelope(n, seed, music_from=None, music_len=0, music_seed=99):
    r = random.Random(seed)
    out, slow = [], 0.4
    for i in range(n):
        slow = 0.9 * slow + 0.1 * r.random()
        syll = abs(math.sin(i * 0.85 + r.random() * 0.9)) ** 1.6
        pause = 0.12 if r.random() < 0.07 else 1.0
        out.append((0.12 + 0.5 * slow) * (0.3 + 0.7 * syll) * pause * (0.7 + 0.3 * r.random()))
    if music_from is not None:
        mr = random.Random(music_seed)
        for k in range(music_len):
            i = music_from + k
            if 0 <= i < n:
                env = min(1, k / 5) * min(1, (music_len - k) / 4)
                beat = 0.8 + 0.2 * (1 if k % 4 == 0 else 0.35)
                out[i] = (0.5 + 0.34 * math.sin(k * 0.19) ** 2) * beat * env * (0.62 + 0.38 * mr.random()) + 0.04
    return out


def env_path(x0, yc, step, amps, amp):
    top = ["M%.1f %.1f" % (x0, yc)] + ["L%.1f %.1f" % (x0 + i * step, yc - a * amp) for i, a in enumerate(amps)]
    bot = ["L%.1f %.1f" % (x0 + i * step, yc + a * amp * 0.9) for i, a in reversed(list(enumerate(amps)))]
    return "".join(top) + "".join(bot) + "Z"


def svg(w, h, body, style="", cls=""):
    return '<svg class="%s" width="%d" height="%d" viewBox="0 0 %d %d" style="position:absolute;overflow:visible;%s">%s</svg>' % (cls, w, h, w, h, style, body)


def player(x, y, w, seed, title, sub, inner="", cls=""):
    h = w * 9 / 16
    return ('<div class="player %s" style="left:%.1fpx;top:%.1fpx;width:%.1fpx;height:%.1fpx">%s<div class="scrim"></div>'
            '<div class="ttl">%s<small>%s</small></div>%s</div>'
            % (cls, x, y, w, h, still(0, 0, w, h, seed), esc(title), esc(sub), inner))


def spectrogram_uri(cols, rows, seed, bands=(), tint=(255, 255, 255)):
    """A believable low-band spectrogram as a PNG data URI. bands: list of (from_col, length, pattern_seed) of identical music."""
    import base64
    import io
    from PIL import Image
    r = random.Random(seed)
    img = Image.new("RGB", (cols, rows))
    px = img.load()
    pats = {}
    for c0, ln, ps in bands:
        if ps not in pats:
            mr = random.Random(ps)
            harm = [int(rows * f) for f in (0.12, 0.24, 0.36, 0.5, 0.66)]
            pats[ps] = [[(0.55 + 0.4 * mr.random() if any(abs(j - h) < 1 for h in harm) else 0.12 + 0.2 * mr.random())
                         * (1 if k % 6 < 4 else 0.7) for j in range(rows)] for k in range(ln)]
    for c in range(cols):
        voiced = r.random() < 0.7
        f0 = 2 + int(3 * r.random())
        for j in range(rows):
            v = 0.02 + 0.07 * r.random() * (1 - j / rows)
            if voiced:
                for hh in (f0, f0 * 2, f0 * 3 + 1):
                    if abs(j - hh) < 1.3:
                        v += (0.18 * r.random() + 0.08) * (1 - 0.5 * j / rows)
            for c0, ln, ps in bands:
                if c0 <= c < c0 + ln:
                    v = pats[ps][c - c0][j]
            v = max(0.0, min(1.0, v)) ** 1.35
            px[c, rows - 1 - j] = tuple(int(10 + (tint[i] - 10) * v) for i in range(3))
    buf = io.BytesIO()
    img.save(buf, "PNG", optimize=True)
    return "data:image/png;base64," + base64.b64encode(buf.getvalue()).decode()
