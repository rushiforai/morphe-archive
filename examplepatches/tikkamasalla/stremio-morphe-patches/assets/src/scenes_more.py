"""More stremio-morphe-patches scenes: borrowed chapters, theme songs, early-outro guard, auto-pick,
track memory, external player hand-off, spoiler shield."""
from scenekit import (EASE, MONO, OUT, Scene, env_path, envelope, esc, player, spectrogram_uri, still, svg)
from scenes import jump_frames, progress


def winbar(title, right=""):
    return ('<div style="position:absolute;left:0;right:0;top:0;height:30px;border-bottom:1px solid rgba(255,255,255,.06);display:flex;align-items:center;padding:0 14px;gap:10px">'
            '<span class="mono" style="font-size:11px;color:#c9cdd2">%s</span><span class="mono" style="font-size:10.5px;color:#6b7079;margin-left:auto">%s</span></div>' % (title, right))


# ------------------------------------------------------------------ borrowed chapters
def borrowed():
    sc = Scene(3, "Borrowed chapters with audio-proof alignment", "blue", dur=8.0)
    sc.cap("<b>1</b>  release A has chapters, release B has none", 0.15, 2.0)
    sc.cap("<b>2</b>  audio check proves the files line up", 2.0, 4.4)
    sc.cap("<b>3</b>  marks copied at the proven offset", 4.4, 7.5)
    b = sc.body
    W_ = 816
    tl0, tlw = 150, W_ - 150 - 20
    marks = [("Intro", .10, .23), ("Credits", .80, .92)]
    off = .035

    def release(y, name, meta, seed, with_marks):
        out = ['<div class="win" style="left:0;top:%dpx;width:%dpx;height:96px">' % (y, W_), winbar(name, meta), still(14, 40, 96, 44, seed)]
        out.append('<div style="position:absolute;left:%dpx;top:62px;width:%dpx;height:2px;background:rgba(255,255,255,.14)"></div>' % (tl0, tlw))
        for k in range(11):
            out.append('<div style="position:absolute;left:%.1fpx;top:66px;width:1px;height:4px;background:rgba(255,255,255,.12)"></div>' % (tl0 + tlw * k / 10))
        out.append('<div class="mono" style="position:absolute;left:%dpx;top:74px;font-size:9.5px;color:#5d636c">00:00</div>' % tl0)
        out.append('<div class="mono" style="position:absolute;left:%dpx;top:74px;font-size:9.5px;color:#5d636c;transform:translateX(-100%%)">00:42:10</div>' % (tl0 + tlw))
        if with_marks:
            for lab, a, z in marks:
                out.append('<div style="position:absolute;left:%.1fpx;top:58px;width:%.1fpx;height:10px;background:linear-gradient(180deg,rgba(76,141,255,.35),rgba(76,141,255,.12));box-shadow:inset 2px 0 0 var(--acc),inset -2px 0 0 var(--acc)"></div>'
                           % (tl0 + tlw * a, tlw * (z - a)))
                out.append('<div class="mono" style="position:absolute;left:%.1fpx;top:42px;font-size:10px;color:var(--acc)">%s</div>' % (tl0 + tlw * a, lab))
        else:
            out.append('<div class="mono %s" style="position:absolute;left:%dpx;top:42px;font-size:10px;color:#6b7079">no chapters</div>' % (sc.k([(0, "opacity:1"), (4.4, "opacity:1"), (4.7, "opacity:0"), (7.6, "opacity:0"), (8, "opacity:1")]), tl0))
        out.append('</div>')
        return "".join(out)
    b.append(release(0, "Show.S01E05.1080p.WEB.mkv", "Matroska  ·  2 chapters", 3, True))
    b.append(release(228, "Show.S01E05.2160p.REMUX.mkv", "Matroska  ·  0 chapters", 1, False))
    # audio proof lane
    ly = 112
    b.append('<div class="lbl" style="position:absolute;left:0;top:%dpx">Audio check</div>' % (ly + 2))
    b.append('<div class="mono" style="position:absolute;left:0;top:%dpx;font-size:11px;color:#9aa0a8">release A</div>' % (ly + 21))
    b.append('<div class="mono" style="position:absolute;left:0;top:%dpx;font-size:11px;color:#9aa0a8">release B</div>' % (ly + 59))
    n = 260
    step = tlw / n
    pre = 40
    amps = envelope(n + 2 * pre, 21, 80 + pre, 60)
    d1 = env_path(-pre * step, 22, step, amps, 18)
    shift = off * tlw
    lane = '<clipPath id="bl"><rect x="0" y="0" width="%.1f" height="100"/></clipPath>' % tlw
    lane += '<g clip-path="url(#bl)"><path d="%s" fill="#7c8696"/>' % d1
    slide = sc.k([(0, "transform:translateX(%.1fpx)" % (shift + 46)), (2.0, "transform:translateX(%.1fpx)" % (shift + 46)), (3.6, "transform:translateX(%.1fpx)" % shift),
                  (7.6, "transform:translateX(%.1fpx)" % shift), (8, "transform:translateX(%.1fpx)" % (shift + 46))])
    lane += '<g class="%s"><g transform="translate(0 38)"><path d="%s" fill="#7c8696"/></g></g>' % (slide, d1)
    ok = sc.fade(3.6, 7.5, 0.3)
    lane += '<g class="%s"><path d="%s" fill="var(--acc)" opacity=".9" clip-path="url(#blm)"/></g>' % (ok, d1)
    lane += '<clipPath id="blm"><rect x="%.1f" y="0" width="%.1f" height="100"/></clipPath>' % ((80) * step, 60 * step)
    lane += '<g class="%s" transform="translate(%.1f 38)"><path d="%s" fill="var(--acc)" opacity=".9" clip-path="url(#blm2)"/></g>' % (ok, shift, d1)
    lane += '<clipPath id="blm2"><rect x="%.1f" y="0" width="%.1f" height="100"/></clipPath></g>' % (80 * step, 60 * step)
    b.append(svg(tlw, 100, lane, style="left:%dpx;top:%dpx" % (tl0, ly + 6)))
    b.append('<div class="mono %s" style="position:absolute;right:20px;top:%dpx;font-size:11px;color:var(--acc)">offset +1.48 s  ·  verified</div>' % (ok, ly + 8))
    # marks travel down
    for i, (lab, a, z) in enumerate(marks):
        t0 = 4.5 + 0.3 * i
        dy = 228
        mv = sc.k([(0, "opacity:0;transform:translate(0,0)"), (t0, "opacity:0;transform:translate(0,0)"), (t0 + 0.15, "opacity:1;transform:translate(0,0)"),
                   (t0 + 1.1, "opacity:1;transform:translate(%.1fpx,%dpx)" % (shift, dy)), (7.5, "opacity:1;transform:translate(%.1fpx,%dpx)" % (shift, dy)),
                   (7.9, "opacity:0;transform:translate(%.1fpx,%dpx)" % (shift, dy)), (8, "opacity:0;transform:translate(0,0)")])
        b.append('<div class="%s" style="position:absolute;left:%.1fpx;top:42px;width:%.1fpx;height:30px">'
                 '<div class="mono" style="font-size:10px;color:var(--acc)">%s</div>'
                 '<div style="position:absolute;left:0;right:0;top:16px;height:10px;background:linear-gradient(180deg,rgba(76,141,255,.45),rgba(76,141,255,.15));'
                 'box-shadow:inset 2px 0 0 var(--acc),inset -2px 0 0 var(--acc),0 0 16px rgba(76,141,255,.45)"></div></div>' % (mv, tl0 + tlw * a, tlw * (z - a), lab))
    return sc


# ------------------------------------------------------------------ theme songs
def themes():
    sc = Scene(4, "Anime theme-song matching", "coral", dur=8.0)
    sc.cap("<b>1</b>  official opening from AnimeThemes", 0.15, 1.6)
    sc.cap("<b>2</b>  slide along one episode, score each offset", 1.6, 4.3)
    sc.cap("<b>3</b>  locked  ·  OP 01:31 to 03:01", 4.3, 7.5)
    b = sc.body
    # song card
    b.append('<div class="win" style="left:0;top:0;width:250px;height:330px">' + still(16, 16, 218, 160, 6) +
             '<div class="lbl" style="position:absolute;left:16px;top:194px">Opening theme</div>'
             '<div style="position:absolute;left:16px;top:210px;font-size:15px;font-weight:600">OP 1</div>'
             '<div class="mono" style="position:absolute;left:16px;top:234px;font-size:10.5px;color:#7d838d">animethemes.moe  ·  1:30</div>'
             '<img src="%s" style="position:absolute;left:16px;top:262px;width:218px;height:52px;image-rendering:pixelated;border-radius:2px">'
             % spectrogram_uri(46, 20, 7, bands=[(0, 46, 501)], tint=(255, 120, 100)) + '</div>')
    # episode spectrogram
    ex, ew, ey, eh = 280, 536, 60, 150
    cols = 200
    b.append('<div class="lbl" style="position:absolute;left:%dpx;top:20px">S1 E7  ·  first 5 minutes  ·  80 Hz to 1.5 kHz</div>' % ex)
    uri = spectrogram_uri(cols, 26, 31, bands=[(60, 46, 501)], tint=(196, 202, 212))
    b.append('<div style="position:absolute;left:%dpx;top:%dpx;width:%dpx;height:%dpx;background:#0a0a0c;border-radius:2px;overflow:hidden;box-shadow:inset 0 0 0 1px rgba(255,255,255,.06)">'
             '<img src="%s" style="width:100%%;height:100%%;image-rendering:pixelated;opacity:.92"></div>' % (ex, ey, ew, eh, uri))
    cw = ew / cols
    band_x = ex + 60 * cw
    band_w = 46 * cw
    # sliding probe
    probe = sc.k([(0, "transform:translateX(%.1fpx);opacity:0" % (ex - band_x)), (1.4, "transform:translateX(%.1fpx);opacity:0" % (ex - band_x)),
                  (1.7, "transform:translateX(%.1fpx);opacity:1" % (ex - band_x)), (3.3, "transform:translateX(%.1fpx);opacity:1" % (ex + ew - band_w - band_x)),
                  (4.2, "transform:translateX(0px);opacity:1"), (7.5, "transform:translateX(0px);opacity:1"), (7.9, "transform:translateX(0px);opacity:0"),
                  (8, "transform:translateX(%.1fpx);opacity:0" % (ex - band_x))])
    b.append('<div class="%s" style="position:absolute;left:%.1fpx;top:%dpx;width:%.1fpx;height:%dpx;box-shadow:inset 0 0 0 1.5px var(--acc),0 0 24px rgba(255,107,90,.35);'
             'background:rgba(255,107,90,.08)"></div>' % (probe, band_x, ey - 6, band_w, eh + 12))
    lock = sc.fade(4.2, 7.5, 0.3)
    b.append('<div class="mono %s" style="position:absolute;left:%.1fpx;top:%dpx;font-size:10.5px;color:var(--acc)">OP  01:31 to 03:01</div>' % (lock, band_x, ey - 22))
    for k in range(6):
        b.append('<div class="mono" style="position:absolute;left:%.1fpx;top:%dpx;font-size:9.5px;color:#5d636c;transform:translateX(%s)">0%d:00</div>'
                 % (ex + ew * k / 5, ey + eh + 6, "-100%" if k == 5 else ("0" if k == 0 else "-50%"), k))
    # score trace
    sy, sh = 244, 70
    b.append('<div class="lbl" style="position:absolute;left:%dpx;top:%dpx">Match score by offset</div>' % (ex, sy))
    pts = []
    import math
    import random
    r = random.Random(3)
    peak = (60 + 23) / cols
    for i in range(161):
        u = i / 160
        v = 0.1 + 0.1 * r.random() + 0.75 * math.exp(-((u - peak) / 0.02) ** 2)
        pts.append("%.1f %.1f" % (u * ew, sh - 4 - v * (sh - 18)))
    trace = sc.k([(0, "stroke-dashoffset:1"), (1.7, "stroke-dashoffset:1"), (4.2, "stroke-dashoffset:0"), (7.5, "stroke-dashoffset:0;opacity:1"),
                  (7.9, "stroke-dashoffset:0;opacity:0"), (8, "stroke-dashoffset:1;opacity:0")], ease="linear")
    body = '<path d="M0 %.1fH%.1f" stroke="rgba(255,255,255,.08)"/>' % (sh - 4, ew)
    body += '<path d="M%s" fill="none" stroke="var(--acc)" stroke-width="1.5" pathLength="1" stroke-dasharray="1" class="%s"/>' % ("L".join(pts), trace)
    body += '<circle cx="%.1f" cy="%.1f" r="3.5" fill="var(--acc)" class="%s"/>' % (peak * ew, sh - 4 - 0.85 * (sh - 18) - 1, lock)
    b.append(svg(ew, sh, body, style="left:%dpx;top:%dpx" % (ex, sy + 14)))
    return sc


# ------------------------------------------------------------------ early-outro guard
def guard():
    sc = Scene(5, "Early-outro guard", "green", dur=7.0)
    sc.cap("an early credits entry with no intro arrives", 0.2, 2.6)
    sc.cap("<b>blocked</b>  never offered as Skip Intro", 2.6, 6.6)
    b = sc.body
    pw = 470
    ph = pw * 9 / 16
    bw = pw - 36
    played = [(0, "transform:scaleX(.026)"), (7, "transform:scaleX(.036)")]
    knob = [(0, "transform:translateX(%.1fpx)" % (bw * .026)), (7, "transform:translateX(%.1fpx)" % (bw * .036))]
    inner = progress(sc, 18, ph - 30, bw, [], played, knob)
    inner += '<div class="tc" style="left:18px;top:%.1fpx">00:00:41</div><div class="tc" style="right:18px;top:%.1fpx;opacity:.6">00:23:52</div>' % (ph - 20, ph - 20)
    ghost = sc.fade(3.0, 6.6, 0.4)
    inner += ('<div class="%s" style="position:absolute;right:18px;bottom:48px;height:34px;width:112px;border-radius:3px;border:1px dashed rgba(255,255,255,.35);'
              'display:flex;align-items:center;justify-content:center;font:500 10.5px %s;color:rgba(255,255,255,.6)">no Skip Intro</div>' % (ghost, MONO))
    b.append(player(0, 18, pw, 4, "North Line", "S1 · E2", inner))
    # guard barrier
    gx = 520
    gl = sc.k([(0, "box-shadow:0 0 0 rgba(63,185,80,0)"), (2.2, "box-shadow:0 0 0 rgba(63,185,80,0)"), (2.45, "box-shadow:0 0 28px rgba(63,185,80,.9)"),
               (3.4, "box-shadow:0 0 10px rgba(63,185,80,.35)"), (7, "box-shadow:0 0 0 rgba(63,185,80,0)")])
    b.append('<div class="%s" style="position:absolute;left:%dpx;top:18px;width:3px;height:%dpx;background:var(--acc)"></div>' % (gl, gx, ph))
    b.append('<div class="lbl" style="position:absolute;left:%dpx;top:%dpx;color:var(--acc);writing-mode:vertical-rl;transform:rotate(180deg)">Early-outro guard</div>' % (gx + 10, 30))
    # incoming entry card
    card = ('<div class="lbl">TheIntroDB</div>'
            '<div style="font-size:14px;font-weight:600;margin-top:8px">credits</div>'
            '<div class="mono" style="font-size:11px;color:#9aa0a8;margin-top:4px">00:00:38 to 00:01:20</div>'
            '<div class="mono" style="font-size:11px;color:#9aa0a8;margin-top:2px">intro: none</div>')
    mv = sc.k([(0, "opacity:0;transform:translateX(120px)"), (0.4, "opacity:0;transform:translateX(120px)"), (0.9, "opacity:1;transform:translateX(60px)"),
               (2.2, "opacity:1;transform:translateX(0px)"), (2.35, "opacity:1;transform:translateX(6px)"), (3.0, "opacity:.9;transform:translateX(18px) translateY(0px)"),
               (4.2, "opacity:0;transform:translateX(30px) translateY(40px)"), (7, "opacity:0;transform:translateX(120px)")], ease=EASE)
    strike = sc.fade(2.35, 3.9, 0.15)
    b.append('<div class="win %s" style="left:%dpx;top:80px;width:240px;height:110px;padding:16px">%s'
             '<div class="%s" style="position:absolute;left:0;right:0;top:0;bottom:0;background:rgba(229,83,75,.12);box-shadow:inset 0 0 0 1px rgba(229,83,75,.6)"></div></div>'
             % (mv, gx + 36, card, strike))
    b.append('<div class="mono %s" style="position:absolute;left:%dpx;top:214px;font-size:11px;color:var(--acc);width:250px;line-height:1.6">dropped: an outro near the start<br>is never offered as Skip Intro</div>'
             % (sc.fade(3.0, 6.6, 0.4), gx + 36))
    b.append('<div class="mono" style="position:absolute;left:%dpx;top:290px;font-size:10.5px;color:#6b7079;width:270px;line-height:1.6">exception: TheIntroDB openings<br>labelled as credits still count as intro</div>' % (gx + 36))
    return sc


# ------------------------------------------------------------------ auto-pick
def autopick():
    sc = Scene(6, "Auto-pick best stream", "cyan", dur=8.0)
    sc.cap("<b>1</b>  reject CAM, telesync, screener", 0.3, 2.2)
    sc.cap("<b>2</b>  rank: episode, cached, resolution", 2.2, 4.0)
    sc.cap("<b>3</b>  play the top pick, no list", 4.0, 7.5)
    b = sc.body
    b.append(still(0, 0, 816, 352, 7, extra_style="filter:blur(14px) brightness(.45);transform:scale(1.08);opacity:.9"))
    b.append('<div style="position:absolute;inset:0;background:linear-gradient(90deg,rgba(15,16,19,.2),rgba(15,16,19,.85) 45%)"></div>')
    b.append(still(24, 24, 150, 225, 2, extra_style="box-shadow:0 18px 40px rgba(0,0,0,.6)"))
    b.append('<div style="position:absolute;left:24px;top:262px;font-size:15px;font-weight:650">Low Tide</div>'
             '<div class="mono" style="position:absolute;left:24px;top:284px;font-size:11px;color:#9aa0a8">S1 · E5</div>')
    rows = [("1080p", "WEB-DL  x264  ·  2.1 GB", "uncached", 2),
            ("CAM", "CAM  x264  ·  1.4 GB", "", None),
            ("2160p", "Season pack  ·  48 GB", "cached", 3),
            ("2160p", "WEB-DL  HDR  DV  ·  7.9 GB", "cached", 0),
            ("720p", "TELESYNC  ·  0.9 GB", "", None),
            ("1080p", "BluRay  x265  ·  3.3 GB", "cached", 1)]
    lx, lw, ry, rh = 220, 572, 18, 46
    for i, (q, meta, tag, rank) in enumerate(rows):
        y = ry + i * rh
        row = ('<div class="mono" style="position:absolute;left:16px;top:15px;font-size:13px;font-weight:600;color:#f1f3f5;width:64px">%s</div>'
               '<div style="position:absolute;left:92px;top:14px;font-size:13px;color:#c9cdd2">%s</div>'
               '<div class="mono" style="position:absolute;right:16px;top:16px;font-size:11px;color:%s">%s</div>'
               % (q, meta, "#22b8e0" if tag == "cached" else "#7d838d", tag))
        if rank is None:
            row += '<div class="%s" style="position:absolute;left:12px;right:12px;top:22px;height:1px;background:#e5534b"></div>' % sc.fade(0.6, 2.2, 0.2)
            row += '<div class="mono %s" style="position:absolute;right:16px;top:16px;font-size:11px;color:#e5534b">rejected</div>' % sc.fade(0.6, 2.2, 0.2)
            cls = sc.k([(0, "opacity:0;transform:translateX(10px)"), (0.15 + 0.06 * i, "opacity:0;transform:translateX(10px)"), (0.55 + 0.06 * i, "opacity:1;transform:translateX(0)"),
                        (1.4, "opacity:1;transform:translateX(0)"), (2.2, "opacity:0;transform:translateX(-24px)"), (8, "opacity:0;transform:translateX(-24px)")])
        else:
            dy = rank * rh - i * rh
            fade = "1" if rank == 0 else "0"
            cls = sc.k([(0, "opacity:0;transform:translate(10px,0)"), (0.15 + 0.06 * i, "opacity:0;transform:translate(10px,0)"),
                        (0.55 + 0.06 * i, "opacity:1;transform:translate(0,0)"), (2.2, "opacity:1;transform:translate(0,0)"),
                        (3.3, "opacity:1;transform:translate(0,%dpx)" % dy), (4.0, "opacity:1;transform:translate(0,%dpx)" % dy),
                        (4.6, "opacity:%s;transform:translate(0,%dpx)" % (fade, dy)), (7.5, "opacity:%s;transform:translate(0,%dpx)" % (fade, dy)),
                        (7.9, "opacity:0;transform:translate(0,%dpx)" % dy), (8, "opacity:0;transform:translate(10px,0)")])
        hl = ""
        if rank == 0:
            hl = ('<div class="%s" style="position:absolute;inset:0;background:linear-gradient(90deg,rgba(34,184,224,.22),rgba(34,184,224,.04));box-shadow:inset 3px 0 0 var(--acc)"></div>'
                  % sc.fade(4.0, 7.5, 0.3))
            row += ('<div class="%s" style="position:absolute;left:0;bottom:0;height:2px;width:100%%;background:var(--acc);transform-origin:0 50%%"></div>'
                    % sc.k([(0, "transform:scaleX(0)"), (4.4, "transform:scaleX(0)"), (6.9, "transform:scaleX(1)"), (7.5, "transform:scaleX(1);opacity:1"), (7.9, "opacity:0"), (8, "transform:scaleX(0);opacity:0")], ease="linear"))
        b.append('<div class="%s" style="position:absolute;left:%dpx;top:%dpx;width:%dpx;height:%dpx;border-bottom:1px solid rgba(255,255,255,.07)">%s%s</div>' % (cls, lx, y, lw, rh, hl, row))
    b.append('<div class="mono %s" style="position:absolute;left:%dpx;top:%dpx;font-size:11px;color:var(--acc)">starting in 4 s  ·  stream list skipped</div>' % (sc.fade(4.4, 7.5, 0.3), lx + 16, ry + rh + 16))
    return sc


# ------------------------------------------------------------------ track memory
def tracks():
    sc = Scene(7, "Per-show track memory", "gold", dur=8.0)
    sc.cap("<b>1</b>  pick audio and subtitles once", 0.2, 2.8)
    sc.cap("<b>2</b>  every episode of the show starts with them", 2.8, 7.5)
    b = sc.body
    pw = 520
    ph = pw * 9 / 16
    played = [(0, "transform:scaleX(.31)"), (8, "transform:scaleX(.33)")]
    knob = [(0, "transform:translateX(%.1fpx)" % ((pw - 36) * .31)), (8, "transform:translateX(%.1fpx)" % ((pw - 36) * .33))]
    inner = progress(sc, 18, ph - 30, pw - 36, [], played, knob)
    # side panel
    panel = ['<div style="position:absolute;right:0;top:0;bottom:0;width:200px;background:rgba(12,13,16,.78);backdrop-filter:blur(14px);box-shadow:-1px 0 0 rgba(255,255,255,.07)">']
    groups = [("Audio", ["English", "Japanese", "German"], 1, 0.7), ("Subtitles", ["Off", "English", "English SDH"], 1, 1.4)]
    y = 18
    for title, items, pick, t_pick in groups:
        panel.append('<div class="lbl" style="position:absolute;left:18px;top:%dpx">%s</div>' % (y, title))
        y += 20
        for i, it in enumerate(items):
            panel.append('<div style="position:absolute;left:18px;top:%dpx;font-size:13px;color:#aeb4bc">%s</div>' % (y + 6, it))
            if i == pick:
                on = sc.fade(t_pick, 7.5, 0.3)
                panel.append('<div class="%s" style="position:absolute;left:8px;right:8px;top:%dpx;height:28px;background:rgba(227,179,65,.16);box-shadow:inset 2px 0 0 var(--acc)">'
                             '<span style="position:absolute;left:10px;top:6px;font-size:13px;color:#fff;font-weight:600">%s</span>'
                             '<span class="mono" style="position:absolute;right:10px;top:7px;font-size:10.5px;color:var(--acc)">saved</span></div>' % (on, y, it))
            elif i == 0:
                off = sc.k([(0, "opacity:1"), (t_pick, "opacity:1"), (t_pick + 0.3, "opacity:0"), (7.5, "opacity:0"), (7.9, "opacity:1"), (8, "opacity:1")])
                panel.append('<div class="%s" style="position:absolute;left:8px;right:8px;top:%dpx;height:28px;background:rgba(255,255,255,.07)"></div>' % (off, y))
            y += 30
        y += 14
    panel.append('</div>')
    inner += "".join(panel)
    b.append(player(0, 18, pw, 5, "Lanterns", "S1 · E1", inner))
    # episode rail
    rx = 548
    b.append('<div class="lbl" style="position:absolute;left:%dpx;top:18px">Same show, next episodes</div>' % rx)
    for k in range(4):
        y = 40 + k * 72
        b.append(still(rx, y, 104, 58, 10 + k))
        b.append('<div style="position:absolute;left:%dpx;top:%dpx;font-size:13px;font-weight:600">Episode %d</div>' % (rx + 118, y + 8, k + 2))
        t0 = 3.0 + 0.45 * k
        old = sc.k([(0, "opacity:1"), (t0, "opacity:1"), (t0 + 0.3, "opacity:0"), (7.5, "opacity:0"), (7.9, "opacity:1"), (8, "opacity:1")])
        b.append('<div class="mono %s" style="position:absolute;left:%dpx;top:%dpx;font-size:11px;color:#5d636c">default tracks</div>' % (old, rx + 118, y + 30))
        new = sc.k([(0, "opacity:0;transform:translateY(4px)"), (t0 + 0.1, "opacity:0;transform:translateY(4px)"), (t0 + 0.45, "opacity:1;transform:translateY(0)"),
                    (7.5, "opacity:1;transform:translateY(0)"), (7.9, "opacity:0;transform:translateY(0)"), (8, "opacity:0;transform:translateY(4px)")])
        b.append('<div class="mono %s" style="position:absolute;left:%dpx;top:%dpx;font-size:11px;color:var(--acc)">JA audio  ·  EN subs</div>' % (new, rx + 118, y + 30))
    return sc


# ------------------------------------------------------------------ external player
def external():
    sc = Scene(8, "External player hand-off", "red", dur=8.0)
    sc.cap("<b>1</b>  episode, position and subtitles go to the player", 0.2, 2.8)
    sc.cap("<b>2</b>  progress comes back every 10 s", 2.8, 5.0)
    sc.cap("<b>3</b>  real end  ·  next episode, same player", 5.0, 7.5)
    b = sc.body
    # stremio window
    b.append('<div class="win" style="left:0;top:28px;width:300px;height:290px">%s' % winbar("Stremio", "S1 · E5") +
             still(14, 44, 272, 120, 3) +
             '<div style="position:absolute;left:14px;top:176px;font-size:15px;font-weight:650">Low Tide</div>'
             '<div style="position:absolute;left:14px;top:198px;font-size:12px;color:#8b9099">Season 1 · Episode 5</div>'
             '<div class="%s" style="position:absolute;left:14px;top:230px;width:120px;height:34px;border-radius:3px;background:#f1f3f5;color:#111;font-size:13px;font-weight:650;display:flex;align-items:center;justify-content:center">Play</div>'
             '<div class="mono %s" style="position:absolute;left:146px;top:241px;font-size:11px;color:#3fb950">saved 00:12:54</div></div>'
             % (sc.k([(0, "transform:scale(1);box-shadow:none"), (0.4, "transform:scale(.96);box-shadow:0 0 0 4px rgba(229,83,75,.5)"), (0.7, "transform:scale(1);box-shadow:none"), (8, "transform:scale(1)")]),
                sc.fade(4.0, 7.5, 0.3)))
    # player window
    vx, vw = 360, 456
    vh = vw * 9 / 16 + 30
    pwin = sc.k([(0, "opacity:0;transform:scale(.96)"), (1.5, "opacity:0;transform:scale(.96)"), (2.1, "opacity:1;transform:scale(1)"), (7.5, "opacity:1;transform:scale(1)"),
                 (7.9, "opacity:0;transform:scale(.98)"), (8, "opacity:0;transform:scale(.96)")], ease=OUT)
    ph = vw * 9 / 16
    bw = vw - 36
    played = [(0, "transform:scaleX(.53)"), (2.1, "transform:scaleX(.53)"), (5.0, "transform:scaleX(.6)"), (5.6, "transform:scaleX(1)"), (5.62, "transform:scaleX(0)"), (8, "transform:scaleX(.02)")]
    knob = [(t, css.replace("scaleX(", "translateX(").replace(")", "")) for t, css in played]
    knob = [(t, "transform:translateX(%.1fpx)" % (bw * float(css.split("(")[1].rstrip(")")))) for t, css in played]
    inner = progress(sc, 18, ph - 30, bw, [], played, knob)
    inner += '<div class="tc %s" style="left:18px;top:%.1fpx">00:12:34</div>' % (sc.k([(0, "opacity:1"), (5.6, "opacity:1"), (5.62, "opacity:0"), (7.9, "opacity:0"), (8, "opacity:1")]), ph - 20)
    inner += '<div class="tc %s" style="left:18px;top:%.1fpx">00:00:00</div>' % (sc.k([(0, "opacity:0"), (5.6, "opacity:0"), (5.62, "opacity:1"), (7.9, "opacity:1"), (8, "opacity:0")]), ph - 20)
    inner += ('<div class="%s" style="position:absolute;left:0;right:0;top:%.1fpx;text-align:center;font-size:13px;color:#fff;text-shadow:0 1px 3px #000">We leave before the tide turns.</div>'
              % (sc.fade(2.3, 5.2, 0.3), ph - 70))
    nxt = sc.fade(5.62, 7.5, 0.2)
    cur = sc.k([(0, "opacity:1"), (5.6, "opacity:1"), (5.62, "opacity:0"), (7.9, "opacity:0"), (8, "opacity:1")])
    b.append('<div class="win %s" style="left:%dpx;top:28px;width:%dpx;height:%.1fpx;background:#0d0e10">%s'
             '<div style="position:absolute;left:0;top:30px;width:%dpx;height:%.1fpx;overflow:hidden">'
             '<div class="%s" style="position:absolute;inset:0">%s</div><div class="%s" style="position:absolute;inset:0">%s</div>'
             '<div class="scrim"></div>%s</div></div>'
             % (pwin, vx, vw, vh, winbar("Vimu", "external player"), vw, ph, cur, still(0, 0, vw, ph, 3), nxt, still(0, 0, vw, ph, 6), inner))
    b.append('<div class="mono %s" style="position:absolute;left:%dpx;top:%.1fpx;font-size:11px;color:var(--acc)">S1 E6 started in the same player</div>' % (nxt, vx, 28 + vh + 12))
    # packets
    def pkt(text, t0, t1, y, rev=False, col="var(--acc)"):
        x0, x1 = (312, vx - 12) if not rev else (vx - 12, 312)
        mv = sc.k([(0, "opacity:0;transform:translateX(0)"), (t0, "opacity:0;transform:translateX(0)"), (t0 + 0.15, "opacity:1;transform:translateX(0)"),
                   (t1, "opacity:1;transform:translateX(%dpx)" % (x1 - x0)), (t1 + 0.2, "opacity:0;transform:translateX(%dpx)" % (x1 - x0)), (8, "opacity:0;transform:translateX(%dpx)" % (x1 - x0))])
        anchor = "translateX(0)" if not rev else "translateX(-100%)"
        return ('<div class="%s" style="position:absolute;left:%dpx;top:%dpx"><div class="mono" style="transform:%s;white-space:nowrap;font-size:10.5px;color:%s;'
                'border-left:2px solid %s;padding:2px 6px;background:rgba(0,0,0,.35)">%s</div></div>' % (mv, x0, y, anchor, col, col, text))
    b.append(pkt("S1 E5", 0.6, 1.6, 120))
    b.append(pkt("start 00:12:34", 0.8, 1.8, 146))
    b.append(pkt("subtitles x6", 1.0, 2.0, 172))
    b.append(pkt("00:12:44", 3.0, 3.8, 200, True, "#3fb950"))
    b.append(pkt("00:12:54", 3.8, 4.6, 200, True, "#3fb950"))
    b.append(pkt("finished", 5.0, 5.5, 226, True, "#f1f3f5"))
    return sc


# ------------------------------------------------------------------ spoiler shield
def spoilers():
    sc = Scene(9, "Spoiler shield", "slate", dur=8.0)
    sc.cap("unwatched episodes stay hidden", 0.2, 2.2)
    sc.cap("watch it, and the shield lifts", 2.2, 7.5)
    b = sc.body
    eps = [("The Signal", "A distress call reaches the harbour on the night of the storm."),
           ("Cold Harbor", "The crew splits up to search the coast before morning."),
           ("The Crossing", "Mara learns who sent the signal and why it was sent."),
           ("Who Remains", "Only one boat comes back from the crossing.")]
    for i, (title, syn) in enumerate(eps):
        y = 4 + i * 80
        b.append('<div style="position:absolute;left:0;right:0;top:%dpx;height:80px;border-bottom:1px solid rgba(255,255,255,.06)"></div>' % y)
        b.append('<div class="mono" style="position:absolute;left:0;top:%dpx;font-size:12px;color:#6b7079">%d</div>' % (y + 28, i + 1))
        watched = i < 2
        blur_style = ""
        if i == 2:
            blur_cls = sc.k([(0, "filter:blur(14px) brightness(.7)"), (3.1, "filter:blur(14px) brightness(.7)"), (4.1, "filter:blur(0px) brightness(1)"),
                             (7.4, "filter:blur(0px) brightness(1)"), (8, "filter:blur(14px) brightness(.7)")])
        elif i == 3:
            blur_cls = ""
            blur_style = "filter:blur(14px) brightness(.7)"
        else:
            blur_cls = ""
        b.append('<div style="position:absolute;left:30px;top:%dpx;width:116px;height:66px;overflow:hidden;border-radius:2px">%s</div>'
                 % (y + 7, still(0, 0, 116, 66, 20 + i, cls=blur_cls, extra_style=blur_style + ";transform:scale(1.15)")))
        if watched:
            b.append('<div style="position:absolute;left:30px;top:%dpx;width:116px;height:3px;background:var(--acc)"></div>' % (y + 70))
        if i == 2:
            b.append('<div style="position:absolute;left:30px;top:%dpx;width:116px;height:3px;background:rgba(255,255,255,.15)"></div>' % (y + 70))
            b.append('<div class="%s" style="position:absolute;left:30px;top:%dpx;width:116px;height:3px;background:var(--acc);transform-origin:0 50%%"></div>'
                     % (sc.k([(0, "transform:scaleX(0)"), (1.0, "transform:scaleX(0)"), (3.1, "transform:scaleX(1)"), (7.4, "transform:scaleX(1);opacity:1"), (7.8, "opacity:0"), (8, "transform:scaleX(0);opacity:0")], ease="linear"), y + 70))
        tx = 168
        if watched:
            b.append('<div style="position:absolute;left:%dpx;top:%dpx;font-size:14px;font-weight:600">%s</div>' % (tx, y + 12, title))
            b.append('<div style="position:absolute;left:%dpx;top:%dpx;font-size:12.5px;color:#8b9099;width:470px">%s</div>' % (tx, y + 36, syn))
            b.append('<div class="mono" style="position:absolute;right:0;top:%dpx;font-size:11px;color:var(--acc)">watched</div>' % (y + 14))
        else:
            hid_cls = sc.k([(0, "opacity:1"), (3.4, "opacity:1"), (3.8, "opacity:0"), (7.4, "opacity:0"), (8, "opacity:1")]) if i == 2 else ""
            rev_cls = sc.k([(0, "opacity:0"), (3.4, "opacity:0"), (3.9, "opacity:1"), (7.4, "opacity:1"), (8, "opacity:0")]) if i == 2 else ""
            b.append('<div class="%s"><div style="position:absolute;left:%dpx;top:%dpx;font-size:14px;font-weight:600">Episode %d</div>'
                     '<div style="position:absolute;left:%dpx;top:%dpx;width:300px;height:8px;background:rgba(255,255,255,.07)"></div>'
                     '<div style="position:absolute;left:%dpx;top:%dpx;width:220px;height:8px;background:rgba(255,255,255,.07)"></div></div>'
                     % (hid_cls, tx, y + 12, i + 1, tx, y + 40, tx, y + 54))
            if i == 2:
                b.append('<div class="%s"><div style="position:absolute;left:%dpx;top:%dpx;font-size:14px;font-weight:600">%s</div>'
                         '<div style="position:absolute;left:%dpx;top:%dpx;font-size:12.5px;color:#8b9099;width:470px">%s</div></div>' % (rev_cls, tx, y + 12, title, tx, y + 36, syn))
                b.append('<div class="mono %s" style="position:absolute;right:0;top:%dpx;font-size:11px;color:#6b7079">hidden</div>' % (hid_cls, y + 14))
                b.append('<div class="mono %s" style="position:absolute;right:0;top:%dpx;font-size:11px;color:var(--acc)">watched</div>' % (rev_cls, y + 14))
            else:
                b.append('<div class="mono" style="position:absolute;right:0;top:%dpx;font-size:11px;color:#6b7079">hidden</div>' % (y + 14))
    return sc


SCENES = {"borrowed-chapters": borrowed, "theme-matching": themes, "early-outro-guard": guard, "auto-pick": autopick,
          "track-memory": tracks, "external-player": external, "spoiler-shield": spoilers}
