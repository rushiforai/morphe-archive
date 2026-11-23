import os
from PIL import Image

SOURCE_DIR = r"C:\Users\HP Omnibook X Flip\Downloads\Telegram Desktop\Gboard app icons"
OUTPUT_DIR = r"assets\custom_icons"

os.makedirs(OUTPUT_DIR, exist_ok=True)

ICONS = [
    ("1793194329953.jpg", "icon_purple"),
    ("1793194475480.jpg", "icon_slate"),
    ("1793194555830.jpg", "icon_forest_green"),
    ("1793194627928.jpg", "icon_navy_blue"),
]

SIZES = {
    "mdpi": 48,
    "hdpi": 72,
    "xhdpi": 96,
    "xxhdpi": 144,
    "xxxhdpi": 192,
    "preview": 256,
}

for filename, base_name in ICONS:
    src_path = os.path.join(SOURCE_DIR, filename)
    with Image.open(src_path) as img:
        img = img.convert("RGBA")
        for size_name, dim in SIZES.items():
            resized = img.resize((dim, dim), Image.Resampling.LANCZOS)
            target_dir = os.path.join(OUTPUT_DIR, size_name)
            os.makedirs(target_dir, exist_ok=True)
            out_file = os.path.join(target_dir, f"{base_name}.png")
            resized.save(out_file, "PNG", optimize=True)
            print(f"Generated {out_file} ({dim}x{dim})")

print("All custom icons successfully processed!")
