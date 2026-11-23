import urllib.request

url = "https://raw.githubusercontent.com/Akshayykadam/PixelBoard/main/pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/updater/PixelBoardUpdateFeature.java"
req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
with urllib.request.urlopen(req) as resp:
    code = resp.read().decode('utf-8')
    print("Length:", len(code))
    lines = code.splitlines()
    print("\n".join(lines[:120]))
