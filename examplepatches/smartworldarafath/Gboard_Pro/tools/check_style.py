import subprocess

aapt = r'C:\Users\HP Omnibook X Flip\AppData\Local\Android\Sdk\build-tools\35.0.0\aapt2.exe'
apk = r'input\PixelBoard\PixelBoard-18.4.1.985164140-release-arm64-v8a.apk'
proc = subprocess.Popen([aapt, 'dump', 'resources', apk], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
out, err = proc.communicate()
text = out.decode('utf-8', errors='replace')
for line in text.splitlines():
    if '0x7f150431' in line or '0x7f150430' in line:
        print(line)
