"""Offline analysis of capture_udp_counters.py output, with explicit socket selection.

Counters describe interval-censored drops and sampled queue accounting, not packet
age, socket capacity, payload bytes, radio loss, or physical display presentation.
No device access. Example: counters.txt --uid 10244 --port 10400 --output OUT
"""
import argparse
import datetime as dt
from decimal import Decimal
import hashlib
import json
from pathlib import Path
import re
import statistics


def parse_samples(raw, uid=None, inode=None, port=None):
    samples = []
    for number, block in enumerate(re.split(r'^SAMPLE\s*$', raw, flags=re.M)[1:], 1):
        lines = block.strip().splitlines()
        if not lines or not re.fullmatch(r'\d+\.\d+', lines[0]):
            raise ValueError(f'Sample {number}: missing epoch timestamp')
        epoch_ns = int(Decimal(lines[0]) * 1_000_000_000)
        if samples and epoch_ns <= samples[-1]['epoch_ns']:
            raise ValueError(f'Sample {number}: timestamp is not increasing')
        sockets = []
        udp = [line.split()[1:] for line in lines if line.startswith('Udp:')]
        if len(udp) != 2 or len(udp[0]) != len(udp[1]):
            raise ValueError(f'Sample {number}: missing or malformed IPv4 UDP counters')
        counters = dict(zip(udp[0], map(int, udp[1])))
        if 'RcvbufErrors' not in counters:
            raise ValueError(f'Sample {number}: missing RcvbufErrors')
        for line in lines[1:]:
            if not re.match(r'^\s*\d+:', line):
                continue
            fields = line.split()
            if len(fields) != 13:
                raise ValueError(f'Sample {number}: unexpected socket row shape')
            local, remote = fields[1], fields[2]
            local_port = int(local.rsplit(':', 1)[1], 16)
            socket_uid, socket_inode = int(fields[7]), int(fields[9])
            if uid is not None and uid != socket_uid:
                continue
            if inode is not None and inode != socket_inode:
                continue
            if port is not None and port != local_port:
                continue
            tx, rx = (int(value, 16) for value in fields[4].split(':'))
            sockets.append({'uid': socket_uid, 'inode': socket_inode,
                            'family': 'udp4' if len(local.split(':')[0]) == 8 else 'udp6',
                            'local_hex': local, 'remote_hex': remote, 'state_hex': fields[3],
                            'tx_queue': tx, 'rx_queue': rx, 'socket_drops': int(fields[-1])})
        sample = {'sample': number, 'epoch_ns': epoch_ns, 'epoch': epoch_ns / 1e9,
                  'device_utc': dt.datetime.fromtimestamp(epoch_ns / 1e9, dt.timezone.utc).isoformat(),
                  'udp4': counters, 'matching_socket_count': len(sockets),
                  'socket': sockets[0] if len(sockets) == 1 else None,
                  'selection_status': 'selected' if len(sockets) == 1 else
                                      ('missing' if not sockets else 'ambiguous')}
        samples.append(sample)
    if len(samples) < 2:
        raise ValueError('At least 2 complete samples required')
    return samples


def identity(socket):
    return tuple(socket[key] for key in ('family', 'uid', 'inode', 'local_hex', 'remote_hex'))


def analyze(samples):
    intervals = []
    for previous, current in zip(samples, samples[1:]):
        start, end = previous['epoch_ns'], current['epoch_ns']
        interval = {'previous_sample': previous['sample'], 'sample': current['sample'],
                    'start_epoch_ns': start, 'end_epoch_ns': end,
                    'start_device_utc': previous['device_utc'], 'end_device_utc': current['device_utc'],
                    'seconds': (end - start) / 1e9}
        old, new = previous['socket'], current['socket']
        global_delta = current['udp4']['RcvbufErrors'] - previous['udp4']['RcvbufErrors']
        interval['udp4_rcvbuf_errors_delta'] = global_delta if global_delta >= 0 else None
        if old is None or new is None:
            interval['status'] = 'socket_not_uniquely_selected'
        elif identity(old) != identity(new):
            interval['status'] = 'socket_identity_changed'
        elif new['socket_drops'] < old['socket_drops']:
            interval['status'] = 'socket_counter_decreased'
        else:
            interval.update(status='valid', uid=new['uid'], inode=new['inode'],
                            socket_drops_delta=new['socket_drops'] - old['socket_drops'],
                            previous_rx_queue=old['rx_queue'], current_rx_queue=new['rx_queue'])
            if new['family'] == 'udp4' and global_delta >= 0:
                interval['matches_udp4_rcvbuf_delta'] = interval['socket_drops_delta'] == global_delta
        intervals.append(interval)
    valid = [row for row in intervals if row['status'] == 'valid']
    selected = [row['socket'] for row in samples if row['socket'] is not None]
    comparable = [row for row in valid if 'matches_udp4_rcvbuf_delta' in row]
    elapsed = sum(row['seconds'] for row in valid)
    drops = sum(row['socket_drops_delta'] for row in valid)
    cadence = [row['seconds'] for row in intervals]
    nonempty = sum(socket['rx_queue'] > 0 for socket in selected)
    summary = {
        'sample_count': len(samples), 'first_device_utc': samples[0]['device_utc'],
        'last_device_utc': samples[-1]['device_utc'],
        'sample_span_s': (samples[-1]['epoch_ns'] - samples[0]['epoch_ns']) / 1e9,
        'cadence_s': {'minimum': min(cadence), 'median': statistics.median(cadence),
                      'mean': statistics.mean(cadence), 'maximum': max(cadence)},
        'selected_samples': len(selected), 'missing_samples': sum(row['selection_status'] == 'missing' for row in samples),
        'ambiguous_samples': sum(row['selection_status'] == 'ambiguous' for row in samples),
        'identities': [dict(zip(('family', 'uid', 'inode', 'local_hex', 'remote_hex'), values))
                       for values in sorted({identity(socket) for socket in selected})],
        'valid_intervals': len(valid), 'excluded_intervals': len(intervals) - len(valid),
        'valid_interval_seconds': elapsed, 'app_socket_drop_delta_sum': drops,
        'app_socket_drops_per_valid_second': drops / elapsed if elapsed else None,
        'intervals_with_app_drops': sum(row['socket_drops_delta'] > 0 for row in valid),
        'udp4_comparable_intervals': len(comparable),
        'udp4_matching_drop_intervals': sum(row['matches_udp4_rcvbuf_delta'] for row in comparable),
        'max_sampled_rx_queue': max((socket['rx_queue'] for socket in selected), default=None),
        'median_sampled_rx_queue': statistics.median(socket['rx_queue'] for socket in selected) if selected else None,
        'nonempty_queue_samples': nonempty,
        'nonempty_queue_sample_fraction': nonempty / len(selected) if selected else None,
        'queue_samples_above_2mib': sum(socket['rx_queue'] > 2 * 1024 * 1024 for socket in selected),
        'queue_samples_above_8mib': sum(socket['rx_queue'] > 8 * 1024 * 1024 for socket in selected),
        'limitations': [
            'SAMPLE timestamps precede sequential reads; counters are not atomic or exact event times.',
            'Drop increments belong somewhere within adjacent sample intervals, with read skew.',
            'Deltas never cross missing/ambiguous selections, identity changes, or decreasing socket counters.',
            'Queue bytes are sampled kernel accounting, not payload size, packet age, or configured capacity.',
            'Nonempty sample fraction is not a measured fraction of wall time spent queued.',
            'Global UDP RcvbufErrors covers IPv4; no equality claim is made for IPv6 sockets.',
            'Different sessions and unequal windows are descriptive comparisons, not controlled A/B proof.',
        ],
    }
    return summary, intervals


def self_test():
    def block(epoch, drops, errors, inode=70, queue='00000000:00102030', extra=''):
        return (f'SAMPLE\n{epoch}.125\n'
                f' 1: C601A8C0:28A0 F001A8C0:28A0 01 {queue} 00:00000000 00000000 42 0 {inode} 2 0 {drops}\n'
                f'{extra}Udp: InDatagrams RcvbufErrors\nUdp: 100 {errors}\n')
    raw = block(1, 10, 20) + block(2, 15, 25, queue='000000FF:00000000')
    rows = parse_samples(raw, uid=42, port=10400)
    summary, intervals = analyze(rows)
    assert rows[0]['socket']['rx_queue'] == 0x102030
    assert rows[1]['socket']['tx_queue'] == 255 and intervals[0]['socket_drops_delta'] == 5
    assert summary['app_socket_drops_per_valid_second'] == 5
    assert intervals[0]['matches_udp4_rcvbuf_delta'] is True
    _, intervals = analyze(parse_samples(raw + block(3, 1, 26, inode=71) + block(4, 0, 2, inode=71), uid=42))
    assert [row['status'] for row in intervals] == ['valid', 'socket_identity_changed', 'socket_counter_decreased']
    _, intervals = analyze(parse_samples(raw + block(3, 1, 26, inode=71) + block(4, 20, 30), inode=70))
    assert [row['status'] for row in intervals] == ['valid', 'socket_not_uniquely_selected', 'socket_not_uniquely_selected']
    duplicate = ' 2: C601A8C0:28A0 F001A8C0:28A0 01 0:0 00:0 0 42 0 99 2 0 7\n'
    assert parse_samples(block(1, 0, 0, extra=duplicate) + block(2, 0, 0), uid=42)[0]['selection_status'] == 'ambiguous'
    try:
        parse_samples(block(2, 0, 0) + block(1, 0, 0), uid=42)
        raise AssertionError('unordered timestamps accepted')
    except ValueError:
        pass
    print('PASS: hex queues, decimal drops, timestamps, attribution, identity change, counter decrease, missing and ambiguous sockets')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('counters', type=Path, nargs='?')
    parser.add_argument('--uid', type=int)
    parser.add_argument('--inode', type=int)
    parser.add_argument('--port', type=int)
    parser.add_argument('--output', type=Path)
    parser.add_argument('--self-test', action='store_true')
    args = parser.parse_args()
    if args.self_test:
        self_test()
        return
    if not args.counters or not args.output or (args.uid is None and args.inode is None):
        parser.error('counters, --output, and --uid or --inode required')
    if any(value is not None and value < 0 for value in (args.uid, args.inode, args.port)) or (args.port or 0) > 65535:
        parser.error('selectors must be nonnegative; port must not exceed 65535')
    if args.output.exists() and (not args.output.is_dir() or any(args.output.iterdir())):
        parser.error('--output must be new or empty')
    capture_path = args.counters.parent / 'result.json'
    if not capture_path.exists():
        parser.error('collector result.json missing: wait for collector completion')
    capture_bytes = capture_path.read_bytes()
    capture = json.loads(capture_bytes)
    if capture.get('exit_code') != 0 or capture.get('timed_out'):
        parser.error('collector did not finish successfully')
    raw = args.counters.read_bytes()
    samples = parse_samples(raw.decode('utf-8-sig'), args.uid, args.inode, args.port)
    if capture.get('samples_requested') != len(samples):
        parser.error('parsed sample count differs from collector receipt')
    summary, intervals = analyze(samples)
    if not summary['selected_samples']:
        parser.error('selector matches no sockets; verify current package UID/inode')
    summary['provenance'] = {'source': str(args.counters.resolve()), 'source_bytes': len(raw),
                             'sha256': hashlib.sha256(raw).hexdigest(),
                             'capture_result_sha256': hashlib.sha256(capture_bytes).hexdigest(),
                             'script_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                             'selectors': {'uid': args.uid, 'inode': args.inode, 'port': args.port},
                             'collector': capture}
    if args.counters.read_bytes() != raw or capture_path.read_bytes() != capture_bytes:
        raise ValueError('Input changed during analysis')
    args.output.mkdir(parents=True, exist_ok=True)
    for name, data in (('summary', summary), ('socket-samples', samples), ('intervals', intervals)):
        (args.output / f'{name}.json').write_text(json.dumps(data, indent=2), encoding='utf-8')
    print(json.dumps(summary, indent=2))


if __name__ == '__main__':
    main()
