import zipfile
import re

with zipfile.ZipFile('input/PixelBoard/PixelBoard-18.4.1.985164140-release-arm64-v8a.apk') as z:
    data = z.read('classes.dex')
    idx = data.find(b'https://github.com/Akshayykadam/PixelBoard')
    print('Context around URL:')
    start = max(0, idx - 500)
    end = min(len(data), idx + 500)
    print(repr(data[start:end]))
