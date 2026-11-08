"""Scene pages for stremio-morphe-patches. python scenes.py pages"""
import sys
from pathlib import Path

from scenekit import (EASE, MONO, OUT, Scene, env_path, envelope, esc, player, still, svg)


def progress(sc, x, y, w, segs, played_frames, knob_frames, ticks=()):
    """A player progress bar in stage coordinates; segs: list of (a, z, colour)."""
    out = ['<div class="pbar" style="left:%.1fpx;top:%.1fpx;width:%.1fpx;right:auto">' % (x, y, w)]
    for a, z, col in segs:
        out.append('<div class="seg" style="left:%.2f%%;width:%.2f%%;background:%s;opacity:.9"></div>' % (100 * a, 100 * (z - a), col))
    out.append('<div class="played %s"></div>' % sc.k(played_frames, ease="linear"))
    for t in ticks:
        out.append('<div style="position:absolute;left:%.2f%%;top:-3px;width:2px;height:9px;background:rgba(255,255,255,.75)"></div>' % (100 * t))
    out.append('<div class="knob %s"></div></div>' % sc.k(knob_frames, ease="linear"))
    return "".join(out)


def jump_frames(w, keys, dur):
    """keys: list of (t, fraction). Returns (played, knob) keyframes; a key with the same t as the previous is a jump."""
    played = [(t, "transform:scaleX(%.4f)" % f) for t, f in keys]
    knob = [(t, "transform:translateX(%.1fpx)" % (w * f)) for t, f in keys]
    return played, knob


# ------------------------------------------------------------------ hero
def hero():
    sc = Scene(0, "", "cyan", dur=7.0)
    b = sc.body
    b.append('<div style="position:absolute;left:0;top:34px;width:300px">'
             '<div class="lbl" style="color:var(--acc)">Stremio Morphe Patches</div>'
             '<div style="font-size:30px;line-height:1.12;font-weight:650;letter-spacing:-.02em;margin-top:14px;color:#f5f6f8">Intros, recaps and credits, skipped.</div>'
             '<div style="font-size:13.5px;line-height:1.55;color:#9aa0a8;margin-top:14px">Patches for Stremio and Vimu on Android TV. Skip times from the file, six online sources and the show\'s own audio.</div>'
             '<div class="mono" style="font-size:11px;color:#6f757e;margin-top:22px;letter-spacing:.04em">ANDROID TV  ·  PHONE  ·  VIMU</div></div>')
    px, pw = 336, 480
    ph = pw * 9 / 16
    bw = pw - 36
    keys = [(0, .06), (1.6, .118), (1.6001, .118), (2.35, .118), (2.36, .262), (6.3, .40), (7.0, .42)]
    played, knob = jump_frames(bw, keys, sc.dur)
    inner = progress(sc, 18, ph - 30, bw, [(.118, .262, "var(--acc)")], played, knob, ticks=(.118, .262))
    tc_a = sc.fade(0, 2.3, 0.15)
    tc_b = sc.k([(0, "opacity:0"), (2.36, "opacity:0"), (2.5, "opacity:1"), (6.9, "opacity:1"), (7.0, "opacity:0")])
    inner += '<div class="tc %s" style="left:18px;top:%.1fpx">00:02:51</div>' % (tc_a, ph - 20)
    inner += '<div class="tc %s" style="left:18px;top:%.1fpx">00:06:20</div>' % (tc_b, ph - 20)
    inner += '<div class="tc" style="right:18px;top:%.1fpx;opacity:.6">00:24:10</div>' % (ph - 20)
    btn = sc.k([(0, "opacity:0;transform:translateX(16px)"), (0.9, "opacity:0;transform:translateX(16px)"), (1.3, "opacity:1;transform:translateX(0)"),
                (2.3, "opacity:1;transform:translateX(0)"), (2.6, "opacity:0;transform:translateX(0)"), (7.0, "opacity:0;transform:translateX(16px)")], ease=OUT)
    fill = sc.k([(0, "transform:scaleX(1)"), (1.2, "transform:scaleX(1)"), (2.3, "transform:scaleX(0)"), (7.0, "transform:scaleX(0)")], ease="linear")
    inner += ('<div class="skipbtn %s" style="right:18px;bottom:46px">Skip Intro<span class="fill %s"></span></div>' % (btn, fill))
    par = sc.k([(0, "transform:scale(1.04)"), (7.0, "transform:scale(1.04)")], ease="linear")
    b.append('<div class="player" style="left:%dpx;top:%dpx;width:%dpx;height:%.1fpx">'
             '<div class="%s" style="position:absolute;inset:0">%s</div><div class="scrim"></div>'
             '<div class="ttl">The Long Night<small>S1 · E4</small></div>%s</div>' % (px, 22, pw, ph, par, still(0, 0, pw, ph, 0), inner))
    return sc


# ------------------------------------------------------------------ fingerprint lookahead
def fingerprint():
    sc = Scene(1, "Fingerprint Lookahead", "teal", dur=8.0)
    sc.cap("<b>1</b>  fingerprint S1 E5 while S1 E4 plays", 0.15, 2.6)
    sc.cap("<b>2</b>  align against S1 E2 and S1 E3", 2.6, 4.6)
    sc.cap("<b>3</b>  2 of 2 agree  ·  intro skip ready", 4.6, 7.5)
    b = sc.body
    pw = 360
    ph = pw * 9 / 16
    bw = pw - 36
    played = [(0, "transform:scaleX(.46)"), (8, "transform:scaleX(.49)")]
    knob = [(0, "transform:translateX(%.1fpx)" % (bw * .46)), (8, "transform:translateX(%.1fpx)" % (bw * .49))]
    inner = progress(sc, 18, ph - 30, bw, [], played, knob)
    inner += '<div class="tc" style="left:18px;top:%.1fpx">00:11:06</div><div class="tc" style="right:18px;top:%.1fpx;opacity:.6">00:23:40</div>' % (ph - 20, ph - 20)
    b.append(player(0, 18, pw, 2, "Harbour Lights", "S1 · E4", inner))
    # up next card
    uy = 18 + ph + 22
    b.append('<div class="win" style="left:0;top:%.1fpx;width:%dpx;height:84px">' % (uy, pw) +
             still(10, 10, 112, 63, 5) +
             '<div class="lbl" style="position:absolute;left:136px;top:16px">Up next</div>'
             '<div style="position:absolute;left:136px;top:30px;font-size:13px;font-weight:600">Low Tide <span style="color:#7d838d;font-weight:400">S1 · E5</span></div>'
             '<div style="position:absolute;left:136px;top:56px;width:210px;height:14px">'
             '<span class="mono %s" style="position:absolute;font-size:11px;color:#9aa0a8">fingerprinting audio ...</span>'
             '<span class="mono %s" style="position:absolute;font-size:11px;color:#9aa0a8">matching E2, E3 ...</span>'
             '<span class="mono %s" style="position:absolute;font-size:11px;color:var(--acc)">intro 01:28 to 02:38</span></div></div>'
             % (sc.fade(0.15, 2.5, 0.3), sc.fade(2.6, 4.5, 0.3), sc.fade(4.7, 7.5, 0.3)))
    # analysis window
    ax, aw, ah = 384, 432, 330
    rows = [("E5", "next", 92, 0), ("E2", "", 172, -72), ("E3", "", 252, 60)]
    lx0, lw = 56, aw - 72
    n = 240
    step = lw / n
    m_from, m_len = 92, 56
    body = []
    body.append('<div style="position:absolute;left:0;right:0;top:0;height:34px;border-bottom:1px solid rgba(255,255,255,.06);display:flex;align-items:center;padding:0 16px;gap:10px">'
                '<span class="lbl">Audio fingerprints</span><span class="mono" style="font-size:11px;color:#6b7079;margin-left:auto">00:00 to 05:00</span></div>')
    band = sc.fade(4.4, 7.5, 0.4)
    mx = lx0 + m_from * step
    body.append('<div class="%s" style="position:absolute;left:%.1fpx;width:%.1fpx;top:52px;height:240px;background:linear-gradient(180deg,rgba(46,196,182,.14),rgba(46,196,182,.05));'
                'box-shadow:inset 1px 0 0 var(--acc),inset -1px 0 0 var(--acc)"></div>' % (band, mx, m_len * step))
    body.append('<div class="mono %s" style="position:absolute;left:%.1fpx;top:40px;font-size:10.5px;color:var(--acc)">intro  2/2</div>' % (band, mx + 6))
    for lab, sub, yc, off in rows:
        body.append('<div class="mono" style="position:absolute;left:16px;top:%dpx;font-size:12px;color:#e8eaed">%s</div>' % (yc - 9, lab))
        if sub:
            body.append('<div class="mono" style="position:absolute;left:16px;top:%dpx;font-size:10px;color:#6b7079">%s</div>' % (yc + 7, sub))
        pre = 50
        amps = envelope(n + 2 * pre, {"E5": 3, "E2": 5, "E3": 8}[lab], m_from + pre, m_len)
        x0 = -pre * step
        d = env_path(x0, 30, step, amps, 26)
        clip = "cl%s" % lab
        hl = [0] * len(amps)
        layer = ('<path d="%s" fill="#3a3f47"/>' % d)
        if lab == "E5":
            sweep = sc.k([(0, "clip-path:inset(0 100% 0 0)"), (0.3, "clip-path:inset(0 100% 0 0)"), (2.4, "clip-path:inset(0 0% 0 0)"),
                          (7.5, "clip-path:inset(0 0% 0 0)"), (8, "clip-path:inset(0 100% 0 0)")], ease="linear")
            layer += '<path d="%s" fill="#aeb4bc" class="%s"/>' % (d, sweep)
        layer += ('<clipPath id="%s"><rect x="%.1f" y="0" width="%.1f" height="60"/></clipPath>' % (clip, m_from * step, m_len * step))
        g_hl = '<g clip-path="url(#%s)"><path d="%s" fill="var(--acc)" class="%s"/></g>' % (clip, d, sc.fade(4.4, 7.5, 0.4))
        if off:
            dx = off * step
            slide = sc.k([(0, "transform:translateX(%.1fpx);opacity:0" % dx), (0.4, "transform:translateX(%.1fpx);opacity:1" % dx),
                          (2.6, "transform:translateX(%.1fpx)" % dx), (4.2, "transform:translateX(0px)"), (7.5, "transform:translateX(0px);opacity:1"),
                          (7.9, "transform:translateX(0px);opacity:0"), (8, "transform:translateX(%.1fpx);opacity:0" % dx)])
            inner_svg = '<g class="%s">%s</g>' % (slide, layer) + g_hl.replace('class="%s"' % sc.fade(0, 0), "")
            # the teal fill sits on the aligned position, so it is drawn without the slide
            inner_svg = '<g class="%s">%s</g>%s' % (slide, layer, g_hl)
        else:
            inner_svg = layer + g_hl
        body.append(svg(lw, 60, '<clipPath id="lane%s"><rect x="0" y="0" width="%.1f" height="60"/></clipPath><g clip-path="url(#lane%s)">%s</g>'
                        % (lab, lw, lab, inner_svg), style="left:%dpx;top:%dpx" % (lx0, yc - 30)))
        if lab == "E5":
            head = sc.k([(0, "transform:translateX(0);opacity:0"), (0.3, "transform:translateX(0);opacity:1"), (2.4, "transform:translateX(%.1fpx);opacity:1" % lw),
                         (2.6, "transform:translateX(%.1fpx);opacity:0" % lw), (8, "transform:translateX(%.1fpx);opacity:0" % lw)], ease="linear")
            body.append('<div class="%s" style="position:absolute;left:%dpx;top:%dpx;width:1px;height:68px;background:var(--acc);box-shadow:0 0 12px var(--acc)"></div>' % (head, lx0, yc - 34))
        if off:
            body.append('<div class="mono %s" style="position:absolute;right:16px;top:%dpx;font-size:10.5px;color:#7d838d">offset %+.1f s</div>'
                        % (sc.fade(2.8, 7.5, 0.3), yc - 44, -off * 1.25))
    body.append('<div style="position:absolute;left:%dpx;right:16px;bottom:16px;display:flex;justify-content:space-between" class="mono">' % lx0 +
                "".join('<span style="font-size:10px;color:#5d636c">0%d:00</span>' % k for k in range(6)) + '</div>')
    b.append('<div class="win" style="left:%dpx;top:0;width:%dpx;height:%dpx">%s</div>' % (ax, aw, ah, "".join(body)))
    return sc


# ------------------------------------------------------------------ skip sources
def skip_sources():
    sc = Scene(2, "Chapter-aware skip sources", "amber", dur=7.0)
    sc.cap("source <b>1</b>  file chapters  ·  Opening 01:12 to 02:41", 0.2, 6.6)
    b = sc.body
    pw = 540
    ph = pw * 9 / 16
    bw = pw - 36
    keys = [(0, .02), (1.9, .05), (2.6, .05), (2.62, .112), (6.2, .22), (7.0, .23)]
    played, knob = jump_frames(bw, keys, sc.dur)
    a, z = .05, .112
    inner = progress(sc, 18, ph - 30, bw, [(a, z, "var(--acc)")], played, knob, ticks=(a, z, .87))
    inner += '<div class="mono" style="position:absolute;left:%.1fpx;top:%.1fpx;font-size:10px;color:rgba(255,255,255,.75);transform:translateX(-50%%)">Opening</div>' % (18 + bw * (a + z) / 2, ph - 48)
    inner += '<div class="mono" style="position:absolute;left:%.1fpx;top:%.1fpx;font-size:10px;color:rgba(255,255,255,.55);transform:translateX(-50%%)">Ending</div>' % (18 + bw * .9, ph - 48)
    inner += '<div class="tc %s" style="left:18px;top:%.1fpx">00:01:12</div>' % (sc.k([(0, "opacity:1"), (2.6, "opacity:1"), (2.62, "opacity:0"), (6.9, "opacity:0"), (7, "opacity:1")]), ph - 20)
    inner += '<div class="tc %s" style="left:18px;top:%.1fpx">00:02:41</div>' % (sc.k([(0, "opacity:0"), (2.6, "opacity:0"), (2.62, "opacity:1"), (6.9, "opacity:1"), (7, "opacity:0")]), ph - 20)
    inner += '<div class="tc" style="right:18px;top:%.1fpx;opacity:.6">00:23:58</div>' % (ph - 20)
    btn = sc.k([(0, "opacity:0;transform:translateX(18px)"), (0.6, "opacity:0;transform:translateX(18px)"), (1.05, "opacity:1;transform:translateX(0)"),
                (2.6, "opacity:1;transform:translateX(0)"), (2.9, "opacity:0;transform:translateX(0)"), (7, "opacity:0;transform:translateX(18px)")], ease=OUT)
    fill = sc.k([(0, "transform:scaleX(1)"), (1.0, "transform:scaleX(1)"), (2.6, "transform:scaleX(0)"), (7, "transform:scaleX(0)")], ease="linear")
    inner += '<div class="skipbtn %s" style="right:18px;bottom:48px">Skip Intro<span class="fill %s"></span></div>' % (btn, fill)
    b.append(player(0, 18, pw, 6, "Glass Coast", "S2 · E1", inner))
    # sources list
    lx, lw = 568, 248
    names = ["File chapters", "IntroKiller times", "AniSkip", "TheIntroDB", "IntroDB.app", "SkipDB", "Fingerprint Lookahead"]
    rows = []
    rows.append('<div class="lbl" style="position:absolute;left:0;top:22px">Sources, in order</div>')
    for i, nm in enumerate(names):
        y = 44 + i * 36
        rows.append('<div style="position:absolute;left:0;right:0;top:%dpx;height:36px;border-top:1px solid rgba(255,255,255,.06)"></div>' % y)
        rows.append('<div class="mono" style="position:absolute;left:12px;top:%dpx;font-size:11px;color:#5d636c">%d</div>' % (y + 12, i + 1))
        rows.append('<div style="position:absolute;left:34px;top:%dpx;font-size:13px;color:%s">%s</div>' % (y + 9, "#6b7079" if i else "#c9cdd2", nm))
    on = sc.k([(0, "opacity:0;transform:scaleY(.6)"), (0.25, "opacity:0;transform:scaleY(.6)"), (0.6, "opacity:1;transform:scaleY(1)"),
               (6.6, "opacity:1;transform:scaleY(1)"), (7, "opacity:0;transform:scaleY(.6)")], ease=OUT)
    rows.append('<div class="%s" style="position:absolute;left:0;top:45px;width:2px;height:35px;background:var(--acc);box-shadow:0 0 10px var(--acc)"></div>' % on)
    rows.append('<div class="%s" style="position:absolute;left:2px;right:0;top:45px;height:35px;background:linear-gradient(90deg,rgba(245,165,36,.14),transparent)"></div>' % sc.fade(0.3, 6.6, 0.35))
    rows.append('<div class="mono %s" style="position:absolute;right:10px;top:57px;font-size:10.5px;color:var(--acc)">used</div>' % sc.fade(0.5, 6.6, 0.3))
    rows.append('<div style="position:absolute;left:0;right:0;top:296px;border-top:1px solid rgba(255,255,255,.06)"></div>')
    b.append('<div style="position:absolute;left:%dpx;top:0;width:%dpx;height:330px">%s</div>' % (lx, lw, "".join(rows)))
    return sc


SCENES = {"hero": hero, "fingerprint-lookahead": fingerprint, "skip-sources": skip_sources}


# Settled moments for the PNG fallbacks: every part of the scene is on screen and nothing is mid-transition.
STILLS = {"hero": 1.8, "fingerprint-lookahead": 6.2, "skip-sources": 1.8, "borrowed-chapters": 6.6, "theme-matching": 6.2,
          "early-outro-guard": 4.6, "auto-pick": 5.8, "track-memory": 6.0, "external-player": 4.95, "spoiler-shield": 5.6}


def main():
    out = Path(sys.argv[1])
    out.mkdir(parents=True, exist_ok=True)
    import scenes_more
    SCENES.update(scenes_more.SCENES)
    for name in (sys.argv[2:] or SCENES):
        sc = SCENES[name]()
        sc.still = STILLS.get(name)
        (out / (name + ".html")).write_text(sc.html(), encoding="utf-8", newline="\n")
        print("scene", name)


if __name__ == "__main__":
    main()
