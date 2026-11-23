import urllib.request
import json

req = urllib.request.Request(
    "https://api.github.com/repos/Akshayykadam/PixelBoard/git/trees/main?recursive=1",
    headers={"User-Agent": "Mozilla/5.0"}
)
try:
    with urllib.request.urlopen(req) as resp:
        data = json.loads(resp.read().decode())
        for item in data.get("tree", []):
            path = item.get("path", "")
            if any(k in path.lower() for k in ["update", "about", "appearance", "settings", "activity"]):
                print(path)
except Exception as e:
    print("Error:", e)
