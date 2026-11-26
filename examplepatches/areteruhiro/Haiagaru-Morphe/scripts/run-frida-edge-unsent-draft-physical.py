import json, pathlib, subprocess, sys, time, frida, frida_tools

serial, package = sys.argv[1:3]
adb = 'D:/Android/Sdk/platform-tools/adb.exe'
result = subprocess.run([adb, '-s', serial, 'shell', 'pidof', package], text=True, capture_output=True)
if result.returncode == 0 and result.stdout.strip():
    pid = int(result.stdout.split()[0])
    device = frida.get_device(serial, timeout=20)
    session = device.attach(pid)
    spawned = False
else:
    device = frida.get_device(serial, timeout=20)
    pid = device.spawn([package])
    session = device.attach(pid)
    spawned = True

try:
    bridge = pathlib.Path(frida_tools.__file__).parent / 'bridges' / 'java.js'
    source = bridge.read_text(encoding='utf-8') + '\nconst Java=bridge;\n'
    source += pathlib.Path('scripts/frida-edge-unsent-draft-physical.js').read_text(encoding='utf-8-sig')
    script = session.create_script(source)
    script.on('message', lambda message, data: print(json.dumps(message, ensure_ascii=False), flush=True))
    script.load()
    if spawned:
        device.resume(pid)
        time.sleep(2)
    print('PREPARE', json.dumps(script.exports_sync.prepare(), ensure_ascii=False), flush=True)
    time.sleep(1.8)
    # Background the visible composer using Android's real Home key event.
    subprocess.run([adb, '-s', serial, 'shell', 'input', 'keyevent', '3'], check=True)
    time.sleep(2.0)
    print('AFTER_BACK', json.dumps(script.exports_sync.inspectandclean(), ensure_ascii=False), flush=True)
finally:
    session.detach()
