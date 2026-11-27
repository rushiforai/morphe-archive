# Renders the FaroTV SVGs into the PNG sizes YouTube TV 7.32.300 uses, with headless Chrome.
# Usage: python -I render.py <output dir>
import os, re, subprocess, sys, tempfile
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.abspath(sys.argv[1]) if len(sys.argv) > 1 else os.path.join(HERE, "png")
CHROME = r"C:\Program Files\Google\Chrome\Application\chrome.exe"

def read(name):
    return open(os.path.join(HERE, name), encoding="utf-8").read()

def inline_marks(svg):
    """Replace <image href="farotv-mark.svg" x y width height/> with a nested <svg>."""
    mark = read("farotv-mark.svg")
    inner = re.sub(r"^.*?<svg[^>]*>", "", mark, flags=re.S).rsplit("</svg>", 1)[0]
    def repl(m):
        attrs = dict(re.findall(r'(\w+)="([^"]*)"', m.group(0)))
        return '<svg x="%s" y="%s" width="%s" height="%s" viewBox="0 0 512 512">%s</svg>' % (
            attrs.get("x", "0"), attrs.get("y", "0"), attrs["width"], attrs["height"], inner)
    return re.sub(r'<image href="farotv-mark.svg"[^>]*/>', repl, svg)

def render(svg_text, w, h, path):
    tmp = tempfile.mkdtemp()
    svg_file = os.path.join(tmp, "a.svg")
    open(svg_file, "w", encoding="utf-8").write(svg_text)
    html = os.path.join(tmp, "a.html")
    open(html, "w", encoding="utf-8").write(
        '<html><body style="margin:0;background:transparent"><img src="a.svg" style="width:%dpx;height:%dpx;display:block"></body></html>' % (w, h))
    shot = os.path.join(tmp, "shot.png")
    subprocess.run([CHROME, "--headless=new", "--disable-gpu", "--hide-scrollbars", "--force-device-scale-factor=1",
                    "--default-background-color=00000000", "--window-size=%d,%d" % (w, h),
                    "--screenshot=" + shot, "file:///" + html.replace("\\", "/")], check=True,
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    im = Image.open(shot).convert("RGBA").crop((0, 0, w, h))
    os.makedirs(os.path.dirname(path), exist_ok=True)
    im.save(path, optimize=True)
    print("OK", path, im.size)

mark = read("farotv-mark.svg")
banner = inline_marks(read("farotv-banner.svg"))
icons = {"mipmap-mdpi": (80, 48), "mipmap-hdpi": (120, 72), "mipmap-xhdpi": (160, 96),
         "mipmap-xxhdpi": (240, None), "mipmap-xxxhdpi": (320, None)}
for folder, (launcher, app) in icons.items():
    render(mark, launcher, launcher, os.path.join(OUT, folder, "ic_launcher.png"))
    if app:
        render(mark, app, app, os.path.join(OUT, folder, "ic_app.png"))
render(mark, 96, 96, os.path.join(OUT, "drawable", "tv_channel_logo.png"))
render(banner, 320, 180, os.path.join(OUT, "drawable", "app_banner.png"))
render(banner, 960, 540, os.path.join(HERE, "preview-banner.png"))
render(mark, 512, 512, os.path.join(HERE, "preview-icon.png"))
