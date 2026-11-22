"""実機スクショから公開可能な UI だけを切り出し、個人情報をモックへ置換する。

原本はリポジトリ外に置く。1220×2712 の XIG07 キャプチャ専用。
使い方: python3 scripts/anonymize-readers.py --chat /tmp/chat.png --readers /tmp/readers.png
"""
import argparse
from pathlib import Path
import unicodedata

from PIL import Image, ImageChops, ImageDraw, ImageFilter, ImageFont

SURFACE = (23, 28, 25)
AVATAR = (198, 220, 209)
AVATAR_INK = (41, 68, 56)
TEXT = (239, 244, 241)


def font(size):
    for path in Path('/System/Library/Fonts').glob('*.ttc'):
        if unicodedata.normalize('NFC', path.name) == 'ヒラギノ角ゴシック W4.ttc':
            return ImageFont.truetype(str(path), size)
    raise RuntimeError('日本語フォントが見つかりません。')


def avatar(target, x, y, size, letter):
    draw = ImageDraw.Draw(target)
    draw.ellipse((x, y, x + size - 1, y + size - 1), fill=AVATAR)
    draw.text((x + size / 2, y + size / 2), letter, font=font(round(size * .43)),
              fill=AVATAR_INK, anchor='mm')


def bubble(target, source, box, color, text):
    # 元の吹き出し輪郭だけをマスクにする。文字と背景の画素は持ち込まない。
    patch = source.crop(box)
    mask = Image.new('L', patch.size)
    pixels = []
    for r, g, b in patch.get_flattened_data():
        pixels.append(255 if max(abs(r-color[0]), abs(g-color[1]), abs(b-color[2])) < 16 else 0)
    mask.putdata(pixels)
    mask = mask.filter(ImageFilter.MaxFilter(3)).filter(ImageFilter.MinFilter(3))
    flood = mask.copy()
    ImageDraw.floodfill(flood, (0, 0), 128)
    holes = flood.point(lambda p: 255 if p == 0 else 0)
    mask = ImageChops.lighter(mask, holes)
    target.paste(color, box[:2], mask)
    ink = (20, 27, 18) if color[1] > 100 else TEXT
    draw = ImageDraw.Draw(target)
    draw.text(((box[0] + box[2]) / 2, (box[1] + box[3]) / 2), text,
              fill=ink, font=font(40), anchor='mm')


def receipt(target, box, text):
    # 写真の明るい画素が紛れないよう、既読数・時刻も同じ位置に描き直す。
    ImageDraw.Draw(target).text(box[:2], text, fill=TEXT, font=font(32))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--chat', type=Path, required=True)
    parser.add_argument('--readers', type=Path, required=True)
    args = parser.parse_args()
    chat = Image.open(args.chat).convert('RGB')
    readers = Image.open(args.readers).convert('RGB')
    if chat.size != (1220, 2712) or readers.size != (1220, 2712):
        raise ValueError('スクショは 1220×2712 である必要があります。')
    out = Path(__file__).resolve().parents[1] / 'public/screenshots/readers'
    out.mkdir(parents=True, exist_ok=True)

    source = chat.crop((0, 1060, 1220, 1560))
    result = Image.new('RGB', source.size, SURFACE)
    avatar(result, 25, 21, 97, 'B')
    ImageDraw.Draw(result).text((145, 26), 'メンバー B', font=font(36), fill=TEXT)
    bubble(result, source, (137, 85, 295, 208), (42, 42, 42), '了解！')
    bubble(result, source, (1013, 308, 1201, 437), (173, 228, 155), '集合！')
    for box, text in [((308, 92), '既読 4'), ((308, 150), '2:22'),
                      ((905, 326), '既読 5'), ((932, 379), '2:22')]:
        receipt(result, box, text)
    for i, letter in enumerate('ACDE'):
        avatar(result, 415 + i * 34, 94, 48, letter)
    for i, letter in enumerate('ABCD'):
        avatar(result, 747 + i * 34, 326, 48, letter)
    result.save(out / 'chat-anonymized.png')

    # 原画像全体を下敷きにしない。安全な固定文言の矩形だけを白リストでコピーする。
    source = readers.crop((60, 504, 1160, 2256))
    result = Image.new('RGB', source.size, (0, 0, 0))
    safe_regions = [(50, 65, 650, 230), (60, 270, 400, 335),
                    (60, 1230, 800, 1395), (60, 1440, 1050, 1560),
                    (780, 1600, 1030, 1695)]
    for box in safe_regions:
        result.paste(source.crop(box), box[:2])
    for i, letter in enumerate('ABCDE'):
        y = 372 + 169 * i
        avatar(result, 66, y, 116, letter)
        ImageDraw.Draw(result).text((223, y + 58), f'メンバー {letter}',
                                   fill=(232,232,232), font=font(48), anchor='lm')
    alpha = Image.new('L', result.size)
    ImageDraw.Draw(alpha).rounded_rectangle((0, 0, 1099, 1751), radius=80, fill=255)
    result.putalpha(alpha)
    result.save(out / 'dialog-anonymized.png')
    print(f'匿名化済み画像のみを出力: {out}')


if __name__ == '__main__':
    main()
