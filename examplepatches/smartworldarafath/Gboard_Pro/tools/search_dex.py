import zipfile
import re

with zipfile.ZipFile('input/PixelBoard/PixelBoard-18.4.1.985164140-release-arm64-v8a.apk') as z:
    for name in z.namelist():
        if name.endswith('.dex'):
            data = z.read(name)
            for m in set(re.findall(b'https?://[a-zA-Z0-9./_\\-]+', data)):
                if b'github' in m or b'akshay' in m.lower():
                    print(f'{name}: {m.decode(errors="ignore")}')
