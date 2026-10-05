"""HushPinterest logo (1254 square, RGBA) and README hero (1672x941, RGB)."""
import math
import pathlib
import random
from PIL import Image, ImageDraw, ImageFilter, ImageFont

OUT = pathlib.Path(__file__).resolve().parent / "selected"
OUT.mkdir(parents=True, exist_ok=True)
S = 2  # supersample


def radial(size, inner, outer, center=None, radius=None):
    w, h = size
    cx, cy = center or (w / 2, h / 2)
    radius = radius or max(w, h) / 2
    import numpy as np
    yy, xx = np.mgrid[0:h, 0:w]
    t = np.clip(np.hypot(xx - cx, yy - cy) / radius, 0, 1)[..., None]
    a, b = np.array(inner, float), np.array(outer, float)
    return Image.fromarray((a + (b - a) * t).astype("uint8"))


def linear(size, top, bottom):
    w, h = size
    img = Image.new("RGB", size)
    d = ImageDraw.Draw(img)
    for y in range(h):
        t = y / max(1, h - 1)
        d.line([(0, y), (w, y)], fill=tuple(int(top[i] + (bottom[i] - top[i]) * t) for i in range(3)))
    return img


def logo(px):
    n = px * S
    c = n / 2
    img = Image.new("RGBA", (n, n), (0, 0, 0, 0))

    # Soft glow under the ring.
    glow = Image.new("L", (n, n), 0)
    ImageDraw.Draw(glow).ellipse([c - 0.455 * n, c - 0.455 * n, c + 0.455 * n, c + 0.455 * n], fill=150)
    glow = glow.filter(ImageFilter.GaussianBlur(0.03 * n))
    img.paste(Image.new("RGBA", (n, n), (255, 40, 80, 255)), (0, 0), glow)

    # Ring.
    ring = radial((n, n), (255, 120, 140), (200, 0, 30), radius=0.45 * n)
    mask = Image.new("L", (n, n), 0)
    ImageDraw.Draw(mask).ellipse([c - 0.44 * n, c - 0.44 * n, c + 0.44 * n, c + 0.44 * n], fill=255)
    img.paste(ring, (0, 0), mask)

    # Inner disc.
    disc = radial((n, n), (200, 10, 45), (96, 0, 18), center=(c - 0.08 * n, c - 0.1 * n), radius=0.46 * n)
    mask = Image.new("L", (n, n), 0)
    ImageDraw.Draw(mask).ellipse([c - 0.395 * n, c - 0.395 * n, c + 0.395 * n, c + 0.395 * n], fill=255)
    img.paste(disc, (0, 0), mask)

    # The H, with a soft drop shadow.
    def h_shape(draw, dx=0, dy=0, fill=255):
        r = 0.018 * n
        bar_w, top, bottom = 0.135 * n, c - 0.235 * n, c + 0.235 * n
        lx, rx = c - 0.205 * n, c + 0.205 * n - bar_w
        draw.rounded_rectangle([lx + dx, top + dy, lx + bar_w + dx, bottom + dy], r, fill=fill)
        draw.rounded_rectangle([rx + dx, top + dy, rx + bar_w + dx, bottom + dy], r, fill=fill)
        draw.rectangle([lx + bar_w - 1 + dx, c - 0.055 * n + dy, rx + 1 + dx, c + 0.05 * n + dy], fill=fill)

    shadow = Image.new("L", (n, n), 0)
    h_shape(ImageDraw.Draw(shadow), 0.012 * n, 0.018 * n, 140)
    shadow = shadow.filter(ImageFilter.GaussianBlur(0.012 * n))
    img.paste(Image.new("RGBA", (n, n), (40, 0, 8, 255)), (0, 0), shadow)
    hmask = Image.new("L", (n, n), 0)
    h_shape(ImageDraw.Draw(hmask))
    img.paste(linear((n, n), (255, 255, 255), (255, 222, 228)), (0, 0), hmask)

    # A push pin stuck through the H's lower right.
    pin = Image.new("RGBA", (n, n), (0, 0, 0, 0))
    pd = ImageDraw.Draw(pin)
    hx, hy, hr = c + 0.12 * n, c + 0.04 * n, 0.085 * n
    angle = math.radians(40)
    # Needle runs down and to the left from the head.
    nx = hx - 0.20 * n * math.cos(angle)
    ny = hy + 0.20 * n * math.sin(angle) + 0.08 * n
    pd.line([(hx, hy), (nx, ny)], fill=(150, 150, 160, 255), width=int(0.014 * n))
    pd.line([(hx, hy), (nx, ny)], fill=(220, 220, 228, 255), width=int(0.006 * n))
    # Collar.
    pd.ellipse([hx - 0.055 * n, hy + 0.02 * n, hx + 0.055 * n, hy + 0.075 * n], fill=(170, 0, 30, 255))
    head = radial((n, n), (255, 225, 232), (255, 90, 120), center=(hx - 0.03 * n, hy - 0.04 * n), radius=hr * 1.4)
    hm = Image.new("L", (n, n), 0)
    ImageDraw.Draw(hm).ellipse([hx - hr, hy - hr, hx + hr, hy + hr], fill=255)
    pin_shadow = Image.new("L", (n, n), 0)
    ImageDraw.Draw(pin_shadow).ellipse([hx - hr + 0.01 * n, hy - hr + 0.02 * n, hx + hr + 0.01 * n, hy + hr + 0.02 * n], fill=150)
    pin_shadow = pin_shadow.filter(ImageFilter.GaussianBlur(0.012 * n))
    img.paste(Image.new("RGBA", (n, n), (40, 0, 8, 255)), (0, 0), pin_shadow)
    img.alpha_composite(pin)
    img.paste(head, (0, 0), hm)
    # Highlight on the head.
    hl = Image.new("L", (n, n), 0)
    ImageDraw.Draw(hl).ellipse([hx - 0.05 * n, hy - 0.06 * n, hx - 0.005 * n, hy - 0.025 * n], fill=170)
    hl = hl.filter(ImageFilter.GaussianBlur(0.006 * n))
    img.paste(Image.new("RGBA", (n, n), (255, 255, 255, 255)), (0, 0), hl)

    return img.resize((px, px), Image.LANCZOS)


def hero(icon):
    w, h = 1672, 941
    bg = linear((w, h), (30, 8, 14), (12, 4, 8)).convert("RGBA")
    # A faded masonry grid of pins on the right.
    random.seed(7)
    grid = Image.new("RGBA", (w, h), (0, 0, 0, 0))
    gd = ImageDraw.Draw(grid)
    col_w, gap, x0 = 120, 18, 980
    for col in range(6):
        x = x0 + col * (col_w + gap)
        y = -random.randint(20, 160)
        while y < h:
            tile = random.choice([150, 190, 230, 280])
            shade = random.randint(40, 75)
            gd.rounded_rectangle([x, y, x + col_w, y + tile], 18, fill=(shade + 40, shade // 3, shade // 2, 255))
            y += tile + gap
    fade = Image.new("L", (w, h), 0)
    import numpy as np
    ramp = np.clip((np.arange(w) - 960) / 520 * 150, 0, 255).astype("uint8")
    fade = Image.fromarray(np.tile(ramp, (h, 1)))
    from PIL import ImageChops
    bg.paste(grid, (0, 0), ImageChops.multiply(grid.split()[3], fade))
    shade = Image.new("RGBA", (w, h), (0, 0, 0, 0))
    bg = Image.alpha_composite(bg, shade)

    mark = icon.resize((430, 430), Image.LANCZOS)
    bg.alpha_composite(mark, (120, (h - 430) // 2 - 40))
    d = ImageDraw.Draw(bg)
    title = ImageFont.truetype(r"C:\Windows\Fonts\segoeuib.ttf", 112)
    tag = ImageFont.truetype(r"C:\Windows\Fonts\seguisb.ttf", 50)
    small = ImageFont.truetype(r"C:\Windows\Fonts\segoeui.ttf", 34)
    tx = 600
    d.text((tx, 300), "HushPinterest", font=title, fill=(255, 255, 255))
    d.text((tx + 4, 450), "Keep the pins. Lose the ads.", font=tag, fill=(255, 143, 163))
    d.text((tx + 4, 530), "Morphe patches for Pinterest on Android", font=small, fill=(214, 190, 196))
    return bg.convert("RGB")


icon = logo(1254)
icon.save(OUT / "logo-master.png")
hero(icon).save(OUT / "hero-master.png")
print("done")
