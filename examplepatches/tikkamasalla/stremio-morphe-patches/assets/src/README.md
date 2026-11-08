# Card sources

Every card on the front page is an HTML scene, rendered frame by frame in a headless browser and encoded as a looping animated WebP.

```sh
python scenes.py pages                     # one HTML page per card
python render.py build pages ..            # every frame -> ../<name>@2x.webp, ../<name>.webp, ../<name>.png
python render.py peek pages look.png 1,3,5 # a strip of chosen moments, for review
```

`scenekit.py` holds the shared frame: card size, header, type scale, film stills, player and waveform parts. Each scene sets its own accent colour.

Needs Python 3.10 or later, Playwright with Edge (Windows) or Chrome (`RENDER_CHANNEL` overrides), Pillow, and `img2webp` from libwebp (`apt install webp`). ffmpeg is the fallback encoder. `RENDER_FPS`, `WEBP_Q2X` and `WEBP_Q1X` tune a card that runs over 2.5 MB.

The fonts in `fonts/` are Inter and JetBrains Mono, under the SIL Open Font License (texts included).
