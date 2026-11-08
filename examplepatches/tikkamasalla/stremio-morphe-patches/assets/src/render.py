"""Render scene pages in installed Edge (headless) and encode looping animated WebP.

    python render.py build  SCENES_DIR OUT_DIR [name ...]   # every frame -> name.webp (880), name@2x.webp (1760), name.png (mid-loop still)
    python render.py stills SCENES_DIR OUT_DIR [name ...]   # only the PNG fallbacks, at each scene's settled moment
    python render.py peek   SCENES_DIR OUT_PNG t1,t2,t3 [name ...]   # contact strip of chosen times for review

Needs: playwright with Edge or Chrome, Pillow, and img2webp from libwebp (apt install webp); ffmpeg is the fallback.
"""
import io
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont
from playwright.sync_api import sync_playwright

FPS = int(os.environ.get("RENDER_FPS", 30))
# Edge on Windows, Chrome elsewhere; override with RENDER_CHANNEL.
CHANNEL = os.environ.get("RENDER_CHANNEL", "msedge" if os.name == "nt" else "chrome")
SET_T = "t => { document.getAnimations().forEach(a => { a.pause(); a.currentTime = t * 1000; }); }"


def scene_dur(page):
    return page.evaluate("() => Math.max(...document.getAnimations().map(a => a.effect.getTiming().duration)) / 1000")


def still_time(page):
    return float(page.evaluate("() => (document.querySelector('meta[name=still]') || {content: '0'}).content"))


def stills(scenes, out, names):
    """Only the PNG fallbacks: one settled frame per scene, rendered at 2x and scaled to 880 wide."""
    out.mkdir(parents=True, exist_ok=True)
    with sync_playwright() as p:
        br = p.chromium.launch(channel=CHANNEL, headless=True)
        for name in names:
            ctx, page = open_scene(br, scenes / (name + ".html"), 2)
            t = still_time(page)
            Image.open(io.BytesIO(shot(page, t))).resize((880, 440), Image.LANCZOS).save(out / (name + ".png"), optimize=True)
            ctx.close()
            print("%-24s still at %.2fs" % (name, t))
        br.close()


def open_scene(br, path, scale):
    ctx = br.new_context(viewport={"width": 880, "height": 440}, device_scale_factor=scale)
    page = ctx.new_page()
    page.goto(Path(path).resolve().as_uri())
    page.wait_for_timeout(300)
    return ctx, page


def shot(page, t):
    page.evaluate(SET_T, t)
    page.evaluate("() => new Promise(r => requestAnimationFrame(() => requestAnimationFrame(r)))")
    return page.screenshot(omit_background=True)


def build(scenes, out, names):
    out.mkdir(parents=True, exist_ok=True)
    with sync_playwright() as p:
        br = p.chromium.launch(channel=CHANNEL, headless=True)
        for name in names:
            ctx, page = open_scene(br, scenes / (name + ".html"), 2)
            dur = scene_dur(page)
            still_t = still_time(page)
            n = int(round(dur * FPS))
            tmp = Path(tempfile.mkdtemp(prefix="frames-", dir=str(out)))
            for i in range(n):
                (tmp / ("f%04d.png" % i)).write_bytes(shot(page, i / FPS))
            ctx.close()
            # The still fallback is the scene's settled moment (meta "still"), where every part is on screen.
            Image.open(tmp / ("f%04d.png" % min(n - 1, int(round(still_t * FPS))))).resize((880, 440), Image.LANCZOS).save(out / (name + ".png"), optimize=True)
            small = tmp / "1x"
            small.mkdir()
            for i in range(n):
                Image.open(tmp / ("f%04d.png" % i)).resize((880, 440), Image.LANCZOS).save(small / ("f%04d.png" % i))
            q2, q1 = int(os.environ.get("WEBP_Q2X", 72)), int(os.environ.get("WEBP_Q1X", 80))
            for src, q, dst in ((tmp, q2, name + "@2x.webp"), (small, q1, name + ".webp")):
                frames = [str(src / ("f%04d.png" % i)) for i in range(n)]
                if shutil.which("img2webp"):
                    # libwebp's own animation encoder; ffmpeg's block replenishment left visible tiles on gradients.
                    # A keyframe at least every 8 frames clears any lossy blending residue within a quarter second.
                    cmd = ["img2webp", "-loop", "0", "-lossy", "-q", str(q), "-m", "6", "-kmin", "3", "-kmax", "8", "-d", str(round(1000 / FPS))] + frames + ["-o", str(out / dst)]
                else:
                    cmd = ["ffmpeg", "-y", "-loglevel", "error", "-framerate", str(FPS), "-i", str(src / "f%04d.png"), "-c:v", "libwebp_anim",
                           "-lossless", "0", "-quality", str(q), "-loop", "0", str(out / dst)]
                subprocess.run(cmd, check=True, stdout=subprocess.DEVNULL)
            shutil.rmtree(tmp)
            sizes = ", ".join("%s %.2f MB" % (f.name, f.stat().st_size / 1e6) for f in sorted(out.glob(name + "*.webp")))
            print("%-24s %.1fs %d frames  %s" % (name, dur, n, sizes))
        br.close()


def peek(scenes, out_png, times, names):
    rows = []
    with sync_playwright() as p:
        br = p.chromium.launch(channel=CHANNEL, headless=True)
        for name in names:
            ctx, page = open_scene(br, scenes / (name + ".html"), 1)
            ims = [Image.open(io.BytesIO(shot(page, t))).convert("RGBA") for t in times]
            ctx.close()
            rows.append((name, ims))
        br.close()
    cw = 1180 // len(times) - 4 if len(times) > 1 else 880
    sc = min(1.0, cw / 880)
    fw, fh = int(880 * sc), int(440 * sc)
    sheet = Image.new("RGB", ((fw + 4) * len(times) + 4, (fh + 26) * len(rows) + 4), "#ffffff")
    d = ImageDraw.Draw(sheet)
    for r, (name, ims) in enumerate(rows):
        y = 4 + r * (fh + 26)
        for c, im in enumerate(ims):
            x = 4 + c * (fw + 4)
            d.text((x, y + 4), "%s  t=%.2fs" % (name, times[c]), fill="#333333")
            bg = Image.new("RGBA", im.size, "#ffffff")
            sheet.paste(Image.alpha_composite(bg, im).convert("RGB").resize((fw, fh), Image.LANCZOS), (x, y + 20))
    sheet.save(out_png)
    print("wrote", out_png, sheet.size)


if __name__ == "__main__":
    mode = sys.argv[1]
    if mode == "stills":
        scenes, out = Path(sys.argv[2]), Path(sys.argv[3])
        stills(scenes, out, sys.argv[4:] or sorted(p.stem for p in scenes.glob("*.html")))
    elif mode == "build":
        scenes, out = Path(sys.argv[2]), Path(sys.argv[3])
        names = sys.argv[4:] or sorted(p.stem for p in scenes.glob("*.html"))
        build(scenes, out, names)
    else:
        scenes, out_png, times = Path(sys.argv[2]), sys.argv[3], [float(x) for x in sys.argv[4].split(",")]
        names = sys.argv[5:] or sorted(p.stem for p in scenes.glob("*.html"))
        peek(scenes, out_png, times, names)
