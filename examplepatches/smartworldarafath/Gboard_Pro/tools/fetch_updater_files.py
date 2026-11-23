import urllib.request

files = [
    "pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/updater/PixelBoardUpdateFeature.java",
    "pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/updater/PixelBoardUpdateManager.java",
    "pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/updater/ReleaseInfo.java"
]

for f in files:
    url = f"https://raw.githubusercontent.com/Akshayykadam/PixelBoard/main/{f}"
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    try:
        with urllib.request.urlopen(req) as resp:
            content = resp.read().decode('utf-8')
            print(f"=== {f} ({len(content)} bytes) ===")
            print(content[:500])
            print("...\n")
    except Exception as e:
        print(f"Failed {f}: {e}")
