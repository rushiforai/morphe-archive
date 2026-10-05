# Screenshots

Referenced from the main `README.md`. Captured on a phone (Android 12+) with a
patched Letterboxd 3.5.4, then downscaled — full-page shots to ~600px-wide JPG,
the bottom-nav strips to cropped PNG.

| File | Shows |
| :--- | :--- |
| `materialyou-wallpaper-film.jpg` / `-home.jpg` | Material You, Wallpaper tint (wallpaper A) |
| `materialyou-wallpaper2-film.jpg` / `-home.jpg` | Material You, Wallpaper tint (wallpaper B) |
| `materialyou-oled-film.jpg` / `-home.jpg` | Material You, Surface = Pure black (OLED) |
| `accent-green.jpg` / `accent-amber.jpg` / `accent-blue.jpg` | Accent colour on a film page (OLED) |
| `bottomnav-stock.png` | Bottom nav = Stock (grey pill, blue icon) |
| `bottomnav-nopill-white.png` | Bottom nav = No pill + white icon |
| `bottomnav-nopill-accent.png` | Bottom nav = No pill + accent icon |
| `bottomnav-accent-pill.png` | Bottom nav = Accent pill |
| `grid-default.jpg` / `grid-dense.jpg` | Denser poster grid: Cozy vs Dense |
| `videostore-before.jpg` / `videostore-after.jpg` | Hide Video Store on home |
| `spoiler-panel.jpg` / `spoiler-burst.jpg` / `spoiler-link.jpg` | Hide ratings until watched: Frosted panel / Tap to burst / Tap-to-show link |
| `spoiler-shimmer-updated.gif` | Hide ratings until watched: Shimmer style (full film page, short loop) |

To refresh one: re-capture with `adb exec-out screencap -p > raw.png`, then
`magick raw.png -resize 600x -strip -quality 82 <name>.jpg` (full-page) or
`magick raw.png -crop 1080x210+0+2205 +repage -resize 640x -strip <name>.png`
(bottom-nav strip).

For `spoiler-shimmer-updated.gif`, from a screen recording `rec.gif`:
`ffmpeg -t 3 -i rec.gif -vf "fps=10,scale=800:-1:flags=lanczos,palettegen=stats_mode=diff" pal.png`
then `ffmpeg -t 3 -i rec.gif -i pal.png -lavfi "fps=10,scale=800:-1:flags=lanczos,paletteuse=dither=none" spoiler-shimmer-updated.gif`.
