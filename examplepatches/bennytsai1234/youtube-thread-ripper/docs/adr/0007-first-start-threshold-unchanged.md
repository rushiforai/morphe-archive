# Stall recovery leaves the first start alone

2026-10-03, `1cd2b10`. The app starts the first playback at 1.6 s buffered and resumes after a stall at 5 s. Startup on the phone takes about 3 s, of which about 1.3 s is app start before the first media request; the 1.6 s threshold (about 0.3 MB at 1080p) is not what it waits for. So `Stall recovery` lowers only the resume threshold (to 1.6 s by default, off unless enabled) and leaves the first start unchanged.
