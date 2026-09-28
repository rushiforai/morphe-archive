# Copyright 2026 Hushfeed contributors
# https://github.com/SysAdminDoc/hushfeed
#
# Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).

from __future__ import annotations

from pathlib import Path

from PIL import Image, ImageChops, ImageDraw, ImageFilter, ImageFont, ImageOps


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]

WIDTH = 1600
HEIGHT = 900

INK = "#f5f7ff"
MUTED = "#aeb4c3"
CYAN = "#25f4ee"
PINK = "#fe2c55"
LAVENDER = "#cdd6f4"
SURFACE = "#151521"
EDGE = "#303040"

FONT_REGULAR = Path("C:/Windows/Fonts/segoeui.ttf")
FONT_SEMIBOLD = Path("C:/Windows/Fonts/seguisb.ttf")
FONT_BOLD = Path("C:/Windows/Fonts/segoeuib.ttf")


def font(path: Path, size: int) -> ImageFont.FreeTypeFont:
    return ImageFont.truetype(str(path), size=size)


def vertical_gradient(top: str, bottom: str) -> Image.Image:
    strip = Image.linear_gradient("L").resize((1, HEIGHT))
    return ImageOps.colorize(strip, top, bottom).resize((WIDTH, HEIGHT)).convert("RGBA")


def add_glow(canvas: Image.Image, box: tuple[int, int, int, int], color: str, opacity: int) -> None:
    glow = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
    draw = ImageDraw.Draw(glow)
    draw.ellipse(box, fill=(*ImageColor.getrgb(color), opacity))
    glow = glow.filter(ImageFilter.GaussianBlur(135))
    canvas.alpha_composite(glow)


def rounded_asset(image: Image.Image, size: tuple[int, int], radius: int) -> Image.Image:
    fitted = ImageOps.fit(image.convert("RGBA"), size, method=Image.Resampling.LANCZOS)
    mask = Image.new("L", size, 0)
    ImageDraw.Draw(mask).rounded_rectangle((0, 0, size[0], size[1]), radius=radius, fill=255)
    fitted.putalpha(ImageChops.multiply(fitted.getchannel("A"), mask))
    return fitted


def place_screen(
    canvas: Image.Image,
    source: Path,
    xy: tuple[int, int],
    width: int,
    *,
    radius: int = 28,
    emphasis: bool = False,
) -> None:
    screenshot = Image.open(source).convert("RGBA")
    height = round(width * screenshot.height / screenshot.width)
    x, y = xy
    margin = 12 if emphasis else 9

    shadow = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
    shadow_draw = ImageDraw.Draw(shadow)
    shadow_draw.rounded_rectangle(
        (x - margin + 8, y - margin + 18, x + width + margin + 8, y + height + margin + 18),
        radius=radius + margin,
        fill=(0, 0, 0, 165),
    )
    shadow = shadow.filter(ImageFilter.GaussianBlur(24))
    canvas.alpha_composite(shadow)

    frame = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
    frame_draw = ImageDraw.Draw(frame)
    frame_draw.rounded_rectangle(
        (x - margin, y - margin, x + width + margin, y + height + margin),
        radius=radius + margin,
        fill=SURFACE,
        outline=CYAN if emphasis else EDGE,
        width=3 if emphasis else 2,
    )
    canvas.alpha_composite(frame)

    screen = rounded_asset(screenshot, (width, height), radius)
    canvas.alpha_composite(screen, (x, y))


def draw_pill(draw: ImageDraw.ImageDraw, x: int, y: int, label: str) -> int:
    label_font = font(FONT_SEMIBOLD, 22)
    text_width = round(draw.textlength(label, font=label_font))
    width = text_width + 38
    draw.rounded_rectangle((x, y, x + width, y + 48), radius=24, fill="#1d1d2b", outline="#3a3a4c", width=2)
    draw.text((x + 19, y + 11), label, font=label_font, fill=LAVENDER)
    return x + width + 12


def add_brand(canvas: Image.Image, *, compact: bool = False) -> None:
    draw = ImageDraw.Draw(canvas)
    icon_size = 104 if compact else 120
    icon = Image.open(ROOT / "patches-bundle.png").convert("RGBA")
    icon.thumbnail((icon_size, icon_size), Image.Resampling.LANCZOS)
    canvas.alpha_composite(icon, (86, 64 if compact else 72))

    brand_x = 86 + icon_size + 26
    brand_y = 87 if compact else 103
    draw.text((brand_x, brand_y), "HUSHFEED", font=font(FONT_BOLD, 36), fill=INK)
    draw.rectangle((brand_x, brand_y + 53, brand_x + 164, brand_y + 58), fill=CYAN)
    draw.rectangle((brand_x + 164, brand_y + 53, brand_x + 218, brand_y + 58), fill=PINK)


def base_canvas() -> Image.Image:
    canvas = vertical_gradient("#11111b", "#0a0b12")
    add_glow(canvas, (-260, -280, 700, 520), PINK, 66)
    add_glow(canvas, (980, 360, 1900, 1180), CYAN, 48)
    return canvas


def hero_a() -> Image.Image:
    canvas = base_canvas()
    draw = ImageDraw.Draw(canvas)
    add_brand(canvas)

    draw.text((92, 252), "MORPHE PATCHES FOR TIKTOK", font=font(FONT_SEMIBOLD, 24), fill=CYAN)
    draw.text((88, 300), "Take back\nyour feed.", font=font(FONT_BOLD, 88), fill=INK, spacing=-5)
    draw.text(
        (94, 525),
        "Filter the noise. Prevent accidental taps.\nTune playback, downloads, privacy, and more.",
        font=font(FONT_REGULAR, 31),
        fill=MUTED,
        spacing=13,
    )

    pill_x = 92
    pill_x = draw_pill(draw, pill_x, 676, "Feed filters")
    pill_x = draw_pill(draw, pill_x, 676, "Gesture guards")
    pill_x = 92
    pill_x = draw_pill(draw, pill_x, 738, "Playback")
    draw_pill(draw, pill_x, 738, "Downloads")

    draw.text((94, 822), "OPEN SOURCE  |  SETTINGS INSIDE TIKTOK", font=font(FONT_SEMIBOLD, 20), fill="#7e8494")

    shots = HERE / "screenshots" / "current-run"
    place_screen(canvas, shots / "feed_filter.png", (790, 179), 278)
    place_screen(canvas, shots / "downloads.png", (1288, 183), 278)
    place_screen(canvas, shots / "settings.png", (1010, 77), 356, emphasis=True)
    return canvas


def hero_b() -> Image.Image:
    canvas = base_canvas()
    draw = ImageDraw.Draw(canvas)
    add_brand(canvas, compact=True)

    draw.text((90, 223), "YOUR FEED. YOUR RULES.", font=font(FONT_SEMIBOLD, 25), fill=CYAN)
    draw.text((87, 270), "Less noise.\nMore control.", font=font(FONT_BOLD, 80), fill=INK, spacing=-3)
    draw.text(
        (92, 485),
        "A focused patch bundle that puts feed,\nplayback, downloads, and privacy in your hands.",
        font=font(FONT_REGULAR, 30),
        fill=MUTED,
        spacing=12,
    )

    draw.rounded_rectangle((90, 633, 668, 761), radius=25, fill="#161622", outline="#343446", width=2)
    draw.rectangle((90, 633, 98, 761), fill=PINK)
    draw.text((126, 658), "BUILT FOR MORPHE", font=font(FONT_SEMIBOLD, 21), fill=PINK)
    draw.text((126, 696), "Fine-grained controls in one native settings screen.", font=font(FONT_REGULAR, 24), fill=LAVENDER)

    shots = HERE / "screenshots" / "current-run"
    place_screen(canvas, shots / "interface.png", (777, 170), 282)
    place_screen(canvas, shots / "downloads.png", (1301, 170), 282)
    place_screen(canvas, shots / "feed_filter.png", (1035, 72), 350, emphasis=True)
    return canvas


def fit_inside(image: Image.Image, size: tuple[int, int], background: str) -> Image.Image:
    result = Image.new("RGBA", size, background)
    copy = image.copy().convert("RGBA")
    copy.thumbnail(size, Image.Resampling.LANCZOS)
    x = (size[0] - copy.width) // 2
    y = (size[1] - copy.height) // 2
    result.alpha_composite(copy, (x, y))
    return result


def comparison(current: Image.Image, a: Image.Image, b: Image.Image) -> Image.Image:
    sheet = Image.new("RGBA", (1600, 1060), "#090a10")
    draw = ImageDraw.Draw(sheet)
    card_size = (720, 405)
    cards = [
        ("CURRENT", current, (50, 95)),
        ("CONCEPT A", a, (830, 95)),
        ("CONCEPT B", b, (50, 610)),
    ]
    for label, image, (x, y) in cards:
        draw.text((x, y - 45), label, font=font(FONT_SEMIBOLD, 24), fill=MUTED)
        draw.rounded_rectangle((x - 2, y - 2, x + card_size[0] + 2, y + card_size[1] + 2), radius=14, outline="#343446", width=2)
        sheet.alpha_composite(fit_inside(image, card_size, "#11111b"), (x, y))
    draw.text((830, 610), "REVIEW NOTES", font=font(FONT_SEMIBOLD, 24), fill=MUTED)
    notes = (
        "A keeps the approved H prominent and leads\n"
        "with the clearest benefit. Three current app\n"
        "screens prove the product immediately.\n\n"
        "B is quieter, but the smaller copy card and\n"
        "feature-first screenshot make it less direct."
    )
    draw.multiline_text((830, 660), notes, font=font(FONT_REGULAR, 30), fill=LAVENDER, spacing=13)
    return sheet


def main() -> None:
    a = hero_a()
    b = hero_b()
    current = Image.open(HERE / "previous" / "readme-header.png").convert("RGBA")

    a.save(HERE / "hero-candidate-a.png", optimize=True)
    b.save(HERE / "hero-candidate-b.png", optimize=True)
    a.resize((960, 540), Image.Resampling.LANCZOS).save(HERE / "github-preview-a.png", optimize=True)
    b.resize((960, 540), Image.Resampling.LANCZOS).save(HERE / "github-preview-b.png", optimize=True)
    comparison(current, a, b).save(HERE / "comparison.png", optimize=True)


if __name__ == "__main__":
    from PIL import ImageColor

    main()
