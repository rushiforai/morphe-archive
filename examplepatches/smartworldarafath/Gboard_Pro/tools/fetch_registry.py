import urllib.request

url = "https://raw.githubusercontent.com/Akshayykadam/PixelBoard/main/pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsFeatureRegistry.java"
req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
with urllib.request.urlopen(req) as resp:
    print(resp.read().decode('utf-8'))
