"""Muestreo de una sesión de FaroTV; no cambia ajustes ni inicia vídeos.
Los porcentajes CPU se calculan de contadores /proc, no de gfxinfo.
"""
import argparse
import json
import re
import subprocess
import time
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', required=True)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--seconds', type=int, default=360)
    parser.add_argument('--interval', type=int, default=30)
    args = parser.parse_args()
    if not 30 <= args.seconds <= 3600 or not 10 <= args.interval <= 60:
        parser.error('Duración: 30–3600 s; intervalo: 10–60 s.')
    adb = [args.adb, '-s', args.serial]
    package = 'app.tvpatches.android.youtube.tv'
    args.output.mkdir(parents=True, exist_ok=True)

    def shell(command):
        return subprocess.check_output(adb + ['shell', command], timeout=20,
                                       encoding='utf-8', errors='replace')

    start = time.monotonic()
    rows = []
    previous = None
    for tick in range(args.seconds // args.interval + 1):
        time.sleep(max(0, start + tick * args.interval - time.monotonic()))
        row = {'elapsed_s': round(time.monotonic() - start, 2)}
        try:
            pid = shell('pidof ' + package).strip().split()[0]
            if not pid.isdigit():
                raise RuntimeError('PID no válido')
            row['pid'] = int(pid)
            raw = shell('cat /proc/stat; echo MEM; cat /proc/meminfo; echo VM; cat /proc/vmstat; '
                        'echo APP; cat /proc/' + pid + '/stat')
            system, rest = raw.split('MEM\n', 1)
            memory, rest = rest.split('VM\n', 1)
            vm, process = rest.split('APP\n', 1)
            cpu = list(map(int, system.splitlines()[0].split()[1:9]))
            cores = len(re.findall(r'^cpu\d+ ', system, re.MULTILINE))
            fields = process.rsplit(')', 1)[1].split()
            app_ticks = int(fields[11]) + int(fields[12])
            mem = dict((k, int(v)) for k, v in re.findall(r'^(\w+):\s*(\d+)', memory, re.MULTILINE))
            virtual = dict((k, int(v)) for k, v in re.findall(r'^(\w+) (\d+)', vm, re.MULTILINE))
            row.update(mem_available_kib=mem.get('MemAvailable'), swap_free_kib=mem.get('SwapFree'),
                       swap_total_kib=mem.get('SwapTotal'), pswpin=virtual.get('pswpin'),
                       pswpout=virtual.get('pswpout'), major_faults=virtual.get('pgmajfault'))
            current = {'pid': pid, 'cpu': cpu, 'ticks': app_ticks}
            if previous:
                delta = sum(cpu) - sum(previous['cpu'])
                if delta > 0:
                    idle = cpu[3] + cpu[4] - previous['cpu'][3] - previous['cpu'][4]
                    row['system_busy_percent'] = round(100 * (delta - idle) / delta, 2)
                    if previous['pid'] == pid:
                        row['main_cpu_one_core_percent'] = round(100 * cores * (app_ticks - previous['ticks']) / delta, 2)
            previous = current
            pss = shell('dumpsys meminfo ' + pid)
            (args.output / f'memory-{tick:03}.txt').write_text(pss, encoding='utf-8')
            match = re.search(r'TOTAL PSS:\s*(\d+)', pss)
            row['main_pss_kib'] = int(match[1]) if match else None
            media = shell('dumpsys media_session')
            if 'package=' + package in media:
                own = media.split('package=' + package, 1)[1].split('queueTitle=', 1)[0]
                state = re.search(r'PlaybackState \{state=(\d+)', own)
                row['playback_state'] = int(state[1]) if state else None
            phase = args.output / 'phase.txt'
            row['phase'] = phase.read_text(encoding='utf-8').strip() if phase.exists() else 'sin etiqueta'
        except Exception as error:
            row['error'] = str(error)
        rows.append(row)
        (args.output / 'session.json').write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding='utf-8')
        print(json.dumps(row, ensure_ascii=False), flush=True)
    (args.output / 'logcat.txt').write_text(shell('logcat -d -v threadtime -s TvPatches AndroidRuntime ActivityManager'), encoding='utf-8')


if __name__ == '__main__':
    main()
