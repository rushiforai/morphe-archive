"""Capture the device-side IME service state as N36 input evidence, on the real SDK35 emulator."""
import json
import re
import subprocess
from pathlib import Path

ADB = Path(r'C:\Users\14776\AppData\Local\Android\Sdk\platform-tools\adb.exe')
SERIAL = 'emulator-5554'
HOST = 'app.morphe.android.youtube'


def sh(*args: str) -> str:
    result = subprocess.run([str(ADB), '-s', SERIAL, 'shell', *args],
                            capture_output=True, text=True, encoding='utf-8', errors='replace')
    return result.stdout + result.stderr


def main() -> None:
    import sys
    out = Path(sys.argv[1])
    dump = sh('dumpsys', 'input_method')
    served = re.search(r'mServedView=(\S+)', dump)
    connection = re.search(r'mServedInputConnection=RemoteInputConnectionImpl\{connection=(\S+)', dump)
    method = re.search(r'mCurMethodId=(\S+)', dump)
    shown = re.search(r'mInputShown=(\w+)', dump)
    focused = re.search(r'mCurFocusedWindow=(\S+)', dump)
    evidence = {
        'curve': 'before/after input lane, real SDK35 emulator, real InputMethodService',
        'serial': SERIAL,
        'ime_component': method.group(1) if method else None,
        'ime_input_shown': shown.group(1) if shown else None,
        'focused_window': focused.group(1) if focused else None,
        'served_view': served.group(1) if served else None,
        'served_connection': connection.group(1) if connection else None,
        'served_view_is_product_editor': bool(served and 'InlineCaptionEditor' in served.group(1)),
        'served_connection_is_editable': bool(connection and 'EditableInputConnection' in connection.group(1)),
    }
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(evidence, indent=2), encoding='utf-8')
    print(json.dumps(evidence, indent=2))


if __name__ == '__main__':
    main()
