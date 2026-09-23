"""Correlate exported Perfetto evidence with host logs; offline, standard library only.

Requires analyze_trace.py JSON exports and capture_live.py's bracketed clock calls.
Example: --trace-analysis TRACE_DIR --commands commands.json --clock-start clocks-start.txt
--clock-end clocks-end.txt --host-events host-events.csv --host-utc-offset +02:00 --output OUT
"""
from pathlib import Path
import argparse
import collections
import csv
import datetime as dt
import hashlib
import json
import math
import re
import statistics


def read_json(path):
    return json.loads(path.read_text(encoding='utf-8-sig'))


def parse_timezone(value):
    match = re.fullmatch(r'([+-])(\d{2}):(\d{2})', value)
    if not match or int(match[2]) > 23 or int(match[3]) > 59:
        raise argparse.ArgumentTypeError('Use an explicit host UTC offset, such as +02:00.')
    minutes = int(match[2]) * 60 + int(match[3])
    return dt.timezone(dt.timedelta(minutes=minutes * (1 if match[1] == '+' else -1)))


def align_clocks(commands_path, start_path, end_path, clocks):
    command = ['shell', 'date +%s.%N; cat /proc/uptime']
    calls = [row for row in read_json(commands_path)
             if row.get('command') == command and row.get('exit') == 0]
    if len(calls) != 2:
        raise ValueError(f'Expected exactly 2 successful standalone clock calls; found {len(calls)}.')
    samples = []
    for name, path, call in zip(('start', 'end'), (start_path, end_path), calls):
        device_epoch = float(path.read_text(encoding='utf-8-sig').strip().splitlines()[0])
        elapsed = float(call['elapsed_s'])
        if elapsed < 0:
            raise ValueError('Clock call duration cannot be negative.')
        midpoint = float(call['host_epoch']) + elapsed / 2
        samples.append({'name': name, 'device_epoch_s': device_epoch,
                        'host_call_start_epoch_s': float(call['host_epoch']),
                        'host_call_end_epoch_s': float(call['host_epoch']) + elapsed,
                        'host_midpoint_epoch_s': midpoint,
                        'device_minus_host_s': device_epoch - midpoint,
                        'bracket_half_width_s': elapsed / 2})
    if samples[1]['host_call_start_epoch_s'] <= samples[0]['host_call_end_epoch_s']:
        raise ValueError('Start/end clock call brackets are not ordered.')
    offset = statistics.mean(row['device_minus_host_s'] for row in samples)
    realtime = [row for row in clocks if row.get('clock_name') == 'REALTIME']
    machines = {row.get('machine_id') for row in realtime}
    if not realtime or len(machines) != 1:
        raise ValueError('Require REALTIME snapshots for exactly 1 trace machine.')
    # Integer arithmetic avoids loss of nanoseconds near the Unix epoch scale.
    conversions = sorted(int(row['clock_value']) - int(row['ts']) for row in realtime)
    boot_to_wall = conversions[len(conversions) // 2]
    residual_ns = max(abs(value - boot_to_wall) for value in conversions)
    uncertainty = max(abs(row['device_minus_host_s'] - offset) + row['bracket_half_width_s']
                      for row in samples) + residual_ns / 1e9
    # Round outward to 10 ms; this is a conservative working bound, not a confidence interval.
    uncertainty = math.ceil(uncertainty * 100) / 100
    return {'samples': samples, 'device_minus_host_s': offset,
            'cross_device_uncertainty_s': uncertainty,
            'boot_to_device_wall_ns': boot_to_wall,
            'realtime_snapshot_count': len(realtime),
            'realtime_mapping_max_residual_ns': residual_ns,
            'method': 'Mean device-minus-host offset from bracket midpoints; uncertainty includes '
                      'half call duration, endpoint offset variation, and REALTIME mapping residual; '
                      'rounded outward to 10 ms. No strict cross-device ordering within this bound.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('trace-analysis', 'commands', 'clock-start', 'clock-end', 'host-events', 'output'):
        parser.add_argument('--' + name, type=Path, required=True)
    parser.add_argument('--host-utc-offset', type=parse_timezone, required=True)
    parser.add_argument('--gap-ms', type=float, default=50)
    parser.add_argument('--context-seconds', type=float, default=0.5)
    args = parser.parse_args()
    if args.gap_ms <= 0 or args.context_seconds < 0:
        parser.error('gap-ms must be positive and context-seconds nonnegative.')
    names = ('bounds', 'clocks', 'app_slice_gaps', 'app_flush_gc', 'steam_logs', 'health')
    data = {name: read_json(args.trace_analysis / (name + '.json')) for name in names}
    if len(data['bounds']) != 1:
        raise ValueError('Expected 1 trace-bounds row.')
    alignment = align_clocks(args.commands, args.clock_start, args.clock_end, data['clocks'])
    uncertainty = alignment['cross_device_uncertainty_s']
    offset_ns = round(alignment['device_minus_host_s'] * 1e9)
    conversion_ns = alignment['boot_to_device_wall_ns'] - offset_ns
    def host_epoch(trace_ns):
        return (int(trace_ns) + conversion_ns) / 1e9
    def local(epoch):
        return dt.datetime.fromtimestamp(epoch, args.host_utc_offset).isoformat(timespec='milliseconds')
    trace_start_ns, trace_end_ns = (int(data['bounds'][0][key]) for key in ('start_ts', 'end_ts'))
    if trace_end_ns <= trace_start_ns:
        raise ValueError('Trace duration must be positive.')
    start_epoch, end_epoch = host_epoch(trace_start_ns), host_epoch(trace_end_ns)
    rows, gaps = [], []
    def device_event(kind, start_ns, end_ns, source, detail, **extra):
        start, end = host_epoch(start_ns), host_epoch(end_ns)
        row = {'origin': 'device_trace', 'kind': kind, 'start_trace_ns': int(start_ns),
               'end_trace_ns': int(end_ns), 'start_host_epoch_s': start, 'end_host_epoch_s': end,
               'start_host_local': local(start), 'end_host_local': local(end),
               'duration_ms': (int(end_ns) - int(start_ns)) / 1e6,
               'cross_device_uncertainty_s': uncertainty, 'source': source, 'detail': detail, **extra}
        rows.append(row)
        return row
    gap_names = {'queueBuffer': 'decoder_output_gap',
                 'HIDL::IComponent::queue::client': 'decoder_input_gap',
                 'HIDL::IComponentListener::onWorkDone::server': 'decoder_completion_gap'}
    for index, row in enumerate(data['app_slice_gaps']):
        if row['name'] not in gap_names or row.get('prev_ts') is None:
            continue
        duration = (int(row['ts']) - int(row['prev_ts'])) / 1e6
        if duration > args.gap_ms:
            gaps.append(device_event(gap_names[row['name']], row['prev_ts'], row['ts'],
                         f'app_slice_gaps.json[{index}]', row['name'],
                         tid=row.get('tid'), thread_name=row.get('thread_name'),
                         metric='Interval between successive slice starts on the same thread/name; '
                                'not the duration of queueBuffer or a direct display-freeze measurement.'))
    for index, row in enumerate(data['app_flush_gc']):
        name = row['name']
        kind = ('decoder_flush' if 'flush' in name.lower() else
                'explicit_gc' if ' GC' in name else 'gc_suspend')
        end_ns = int(row['ts']) + max(0, int(row['dur']))
        device_event(kind, row['ts'], end_ns, f'app_flush_gc.json[{index}]', name,
                     tid=row.get('tid'), thread_name=row.get('thread_name'))
    for index, row in enumerate(data['steam_logs']):
        kind = 'client_fec_log' if 'SVLFEC' in row['msg'] else 'client_stream_log'
        device_event(kind, row['ts'], row['ts'], f'steam_logs.json[{index}]', row['msg'].strip())
    with args.host_events.open(encoding='utf-8-sig', newline='') as handle:
        for source in csv.DictReader(handle):
            stamp = dt.datetime.fromisoformat(source['timestamp_local'])
            if stamp.tzinfo is None:
                stamp = stamp.replace(tzinfo=args.host_utc_offset)
            epoch = stamp.timestamp()
            if epoch < start_epoch - uncertainty or epoch > end_epoch + uncertainty:
                continue
            row = {'origin': 'host_log', 'kind': source['kind'],
                   'start_host_epoch_s': epoch, 'end_host_epoch_s': epoch,
                   'start_host_local': local(epoch), 'end_host_local': local(epoch),
                   'duration_ms': 0, 'cross_device_uncertainty_s': uncertainty,
                   'source': f'{args.host_events.name}:{source["source_line"]}',
                   'detail': source['detail'], 'within_trace_nominal': start_epoch <= epoch <= end_epoch,
                   'trace_boundary_uncertain': min(abs(epoch-start_epoch), abs(epoch-end_epoch)) <= uncertainty}
            match = re.search(r'wgp id \((-?\d+)\).*last id \((-?\d+)\).*diff: \((-?\d+)\)', source['detail'])
            if match:
                row.update(dict(zip(('wgp_id', 'last_id', 'id_difference'), map(int, match.groups()))))
            rows.append(row)
    rows.sort(key=lambda row: (row['start_host_epoch_s'], row['origin'], row['kind']))
    for index, row in enumerate(rows, 1):
        row['event_id'] = index
    host_reset_kinds = {'encoder_reset', 'stream_reset', 'frame_id_mismatch', 'client_reset_request'}
    for gap in gaps:
        device_matches = [row for row in rows if row is not gap and row['origin'] == 'device_trace'
                          and row['kind'] in ('decoder_flush', 'client_fec_log', 'explicit_gc', 'gc_suspend')
                          and row['end_trace_ns'] >= gap['start_trace_ns']
                          and row['start_trace_ns'] <= gap['end_trace_ns']]
        gap['same_device_overlapping_event_ids'] = [row['event_id'] for row in device_matches]
        gap['same_device_overlapping_counts'] = dict(collections.Counter(row['kind'] for row in device_matches))
        context = args.context_seconds + uncertainty
        gap['nearby_host_reset_event_ids'] = [row['event_id'] for row in rows
            if row['origin'] == 'host_log' and row['kind'] in host_reset_kinds
            and gap['start_host_epoch_s'] - context <= row['start_host_epoch_s'] <= gap['end_host_epoch_s'] + context]
    host_rows = [row for row in rows if row['origin'] == 'host_log' and row['within_trace_nominal']]
    gap_summary = {}
    for kind in gap_names.values():
        selected = [row for row in gaps if row['kind'] == kind]
        largest = max(selected, key=lambda row: row['duration_ms'], default=None)
        gap_summary[kind] = {'count_above_threshold': len(selected),
                             'maximum_ms': largest['duration_ms'] if largest else None,
                             'largest_event': largest}
    paths = [args.trace_analysis / (name + '.json') for name in names]
    paths += [args.commands, args.clock_start, args.clock_end, args.host_events]
    summary = {'schema_version': 1,
        'sources': [{'path': str(path.resolve()), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest()}
                    for path in paths],
        'alignment': alignment,
        'trace': {'start_ns': trace_start_ns, 'end_ns': trace_end_ns,
                  'duration_s': (trace_end_ns - trace_start_ns) / 1e9,
                  'start_host_epoch_s': start_epoch, 'end_host_epoch_s': end_epoch,
                  'start_host_local': local(start_epoch), 'end_host_local': local(end_epoch)},
        'gap_threshold_ms': args.gap_ms, 'association_context_s': args.context_seconds,
        'gaps': gap_summary,
        'host_counts_within_trace_nominal': dict(collections.Counter(row['kind'] for row in host_rows)),
        'host_events_near_uncertain_trace_boundary': [row['event_id'] for row in rows
            if row['origin'] == 'host_log' and row['trace_boundary_uncertain']],
        'device_event_counts': dict(collections.Counter(row['kind'] for row in rows if row['origin'] == 'device_trace')),
        'trace_health': data['health'],
        'limitations': ['Gap exports contain only intervals selected by analyze_trace.py (currently >20 ms). '
                       'They cannot establish a complete frame-latency distribution.',
                       'Timeline sorting is for navigation; do not infer strict cross-device order inside '
                       f'the +/-{uncertainty:.3f} s alignment bound or causation from nearby events.',
                       'queueBuffer gaps identify decoder output activity gaps, not directly measured panel freezes.',
                       'Counts preserve source rows; correlated mismatches, flushes, and resets are not independent hitch counts.',
                       'Explicit GC or object inspection in the capture may perturb timing; inspect command provenance.'],
        'events': rows}
    args.output.mkdir(parents=True, exist_ok=True)
    (args.output / 'correlated-summary.json').write_text(json.dumps(summary, indent=2), encoding='utf-8')
    fields = ('event_id', 'origin', 'kind', 'start_host_local', 'end_host_local', 'duration_ms',
              'cross_device_uncertainty_s', 'source', 'detail')
    with (args.output / 'correlated-timeline.csv').open('w', encoding='utf-8', newline='') as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, extrasaction='ignore')
        writer.writeheader()
        writer.writerows(rows)
    print(json.dumps({'output': str(args.output.resolve()), 'alignment': alignment,
                      'gaps': {kind: {key: value for key, value in result.items() if key != 'largest_event'}
                               for kind, result in gap_summary.items()},
                      'host_counts': summary['host_counts_within_trace_nominal']}, indent=2))


if __name__ == '__main__':
    main()
