"""Inspect an APK resource table for candidate xml entries that a test-only IME metadata can reuse."""
import re
import subprocess
import sys
from pathlib import Path

SDK = Path(r'C:\Users\14776\AppData\Local\Android\Sdk')
AAPT2 = SDK / 'build-tools/36.0.0/aapt2.exe'


def dump(apk: Path, *extra: str) -> str:
    result = subprocess.run([str(AAPT2), 'dump', 'resources', *extra, str(apk)],
                            capture_output=True, text=True, encoding='utf-8', errors='replace')
    return result.stdout + result.stderr


def main() -> None:
    apk = Path(sys.argv[1])
    text = dump(apk)
    entries = re.findall(r'^\s+resource 0x([0-9a-f]{8}) (\S+)/(\S+)\s*$', text, re.M)
    xml_entries = [(i, t, n) for i, t, n in entries if t == 'xml']
    print('total entries', len(entries), 'xml entries', len(xml_entries))
    for item in xml_entries[:40]:
        print(item)
    print('--- packages/types ---')
    for line in text.splitlines():
        if line.strip().startswith('type ') or line.strip().startswith('Package'):
            print(line.strip()[:120])
        if 'input-method' in line or 'input_method' in line:
            print('MATCH', line.strip()[:160])


if __name__ == '__main__':
    main()
