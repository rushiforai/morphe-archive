# music native regression

Compile ArtworkProbe.java against Android 35, package with this manifest using D8/AAPT2, sign with the same disposable test key as the target, install, then instrument io.github.pengusto.patches.music.tests/io.github.pengusto.patches.tests.ArtworkProbe. Refuses non-ranchu hardware. Only synthetic data.

Requires scanned, readable fixture media /sdcard/Music/01-red.mp3, 02-blue.mp3, red.opus, blue.opus plus no-cover.mp3 and corrupt.mp3. Red and blue embedded images distinguish same-album tracks. Also checks missing and empty paths and malformed Opus metadata. Fixture source audio is generated sine tones; embed solid-color pictures.
