"""Medición por ADB: reinicia FaroTV sin borrar datos ni preferencias.

Los tiempos de am start describen la actividad Android, no la carga completa de
la interfaz web. meminfo del paquete no suma necesariamente todos los procesos
del motor Cobalt. No convierte gfxinfo en una medida de FPS del vídeo.
"""
import argparse
import json
import re
import statistics
import subprocess
import time
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', required=True)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--samples', type=int, default=3)
    parser.add_argument('--settle', type=float, default=12)
    args = parser.parse_args()
    if not 1 <= args.samples <= 10 or not 5 <= args.settle <= 60:
        parser.error('Usa de 1 a 10 muestras y de 5 a 60 segundos de espera.')
    adb = [args.adb, '-s', args.serial]
    package = 'app.tvpatches.android.youtube.tv'

    def shell(*command):
        return subprocess.check_output(adb + ['shell', *command], timeout=90,
                                       encoding='utf-8', errors='replace')

    component = shell('cmd', 'package', 'resolve-activity', '--brief', '-a',
                      'android.intent.action.MAIN', '-c',
                      'android.intent.category.LEANBACK_LAUNCHER', '-p', package).strip().splitlines()[-1]
    if not re.fullmatch(r'[A-Za-z0-9_.$]+/[A-Za-z0-9_.$]+', component):
        raise RuntimeError('No se pudo resolver la actividad de FaroTV.')
    args.output.mkdir(parents=True, exist_ok=True)
    samples = []
    for index in range(args.samples):
        startup = shell('am', 'start', '-S', '-W', '-n', component)
        if 'Status: ok' not in startup:
            raise RuntimeError(startup)
        time.sleep(args.settle)
        memory = shell('dumpsys', 'meminfo', package)
        sample = {'sample': index + 1, 'startup': startup,
                  'memory': memory, 'cpu': shell('dumpsys', 'cpuinfo'),
                  'gfx': shell('dumpsys', 'gfxinfo', package, 'framestats')}
        for field, pattern, text in [
            ('wait_ms', r'^WaitTime: (\d+)', startup),
            ('total_ms', r'^TotalTime: (\d+)', startup),
            ('main_pss_kib', r'TOTAL PSS:\s*(\d+)', memory),
        ]:
            match = re.search(pattern, text, re.MULTILINE)
            sample[field] = int(match[1]) if match else None
        samples.append(sample)
        report = {'device': args.serial, 'component': component,
                  'settle_seconds': args.settle, 'samples': samples,
                  'median_wait_ms': statistics.median(s['wait_ms'] for s in samples if s['wait_ms'] is not None)}
        (args.output / 'startup.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
        print(json.dumps({k: sample[k] for k in ['sample', 'wait_ms', 'total_ms', 'main_pss_kib']}), flush=True)
    logs = shell('logcat', '-d', '-v', 'threadtime', '-s', 'TvPatches', 'AndroidRuntime')
    (args.output / 'logcat.txt').write_text(logs, encoding='utf-8')
    (args.output / 'screen.png').write_bytes(subprocess.check_output(adb + ['exec-out', 'screencap', '-p'], timeout=60))


if __name__ == '__main__':
    main()
