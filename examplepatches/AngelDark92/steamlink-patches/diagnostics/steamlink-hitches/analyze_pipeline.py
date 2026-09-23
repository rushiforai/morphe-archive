"""Export frame-ID-bearing Codec2 events and output-gap context from a saved trace.

Offline only. Codec2 work completion is not proof of a displayed frame; ts=0 work
callbacks during reset are deliberately retained and never matched to a frame.
"""
import argparse
import collections
import datetime
import json
from pathlib import Path
import re
import sys


GXR2 = re.compile(r'GXR2 (\w+) fid=(-?\d+)(?: a=(-?\d+) b=(-?\d+) c=(-?\d+))?')
FAULT_REASONS = ('staging-capacity', 'null-data', 'unowned-pointer', 'stale-generation',
                 'negative-size', 'oversize', 'codec-input-unavailable', 'codec-generation',
                 'codec-capacity', 'codec-submit-failed')
RESULT_FIELDS = {
    'inputResult': ('index_or_error', 'timeout_us', 'unused'),
    'queueResult': ('status', 'bytes', 'input_index'),
    'outputResult': ('index_or_error', 'bytes', 'timeout_us'),
    'releaseResult': ('status', 'output_index', 'render'),
    'imageResult': ('status', 'unused_b', 'unused_c'),
    'imageTimestamp': ('timestamp_ns', 'unused_b', 'unused_c'),
    'imageTimestampError': ('status', 'unused_b', 'unused_c'),
    'helperFault': ('reason_code', 'bytes', 'capacity'),
    'faultGeneration': ('entry_generation', 'current_generation', 'fec_already_faulted'),
    'nativeFault': ('scene_return_address', 'unused_b', 'unused_c'),
    'fecDuplicateCandidate': ('flags', 'accepted_marker', 'submitted_attempt_marker'),
    'fecPacketOutcome': ('candidate_flags', 'context_acquisitions', 'candidate_snapshots'),
    'fecAcquireState': ('accepted_marker', 'submitted_attempt_marker', 'packet_context_frame_id'),
}


def parse_gxr2(name):
    match = GXR2.fullmatch(name)
    if not match:
        return None
    stage, frame = match[1], int(match[2])
    result = {'gxr2_stage': stage, 'frame_id': frame,
              'gxr2_kind': 'event' if match[3] is not None else 'span'}
    if match[3] is not None:
        values = [int(match[index]) for index in (3, 4, 5)]
        result.update(zip(('a', 'b', 'c'), values))
        result['result'] = dict(zip(RESULT_FIELDS.get(stage, ('a', 'b', 'c')), values))
        if stage == 'helperFault':
            reason = values[0]
            result['fault_reason'] = FAULT_REASONS[reason] if 0 <= reason < len(FAULT_REASONS) else 'unknown'
        if stage == 'nativeFault':
            result['scene_return_address_hex'] = hex(values[0])
        if stage == 'fecDuplicateCandidate':
            result['candidate_state'] = dict(descriptor_present=bool(values[0] & 1),
                accepted_match=bool(values[0] & 2), submitted_attempt_match=bool(values[0] & 4))
    return result


def diagnostic_exports(events):
    """Keep event groups conservative: no timestamp-0 or reset-overlapping joins."""
    diagnostic = [event for event in events if 'gxr2_stage' in event]
    # Include platform flushes even with GXR2 present. They can reveal missing
    # helper lifecycle markers; the extra segments intentionally over-separate.
    resets = [event for event in events if event['stage'] == 'codec_flush'
              or event.get('gxr2_stage') in ('codecFlush', 'codecStop', 'codecInit')]
    starts = sorted(set(event['ts'] for event in resets))
    import bisect
    stages = collections.defaultdict(list)
    groups = collections.defaultdict(list)
    for index, event in enumerate(events):
        event['event_index'] = index
        event['reset_segment'] = bisect.bisect_right(starts, event['ts'])
        end = event['ts'] + max(event['dur'], 0)
        event['crosses_reset'] = any(event['ts'] < boundary < end for boundary in starts)
        event['during_reset'] = any(reset['ts'] <= event['ts'] < reset['ts'] + max(reset['dur'], 1)
                                    for reset in resets)
        if 'gxr2_stage' in event:
            stages[event['gxr2_stage']].append(event)
            frame = event['frame_id']
            if frame > 0 and event['dur'] >= 0 and not event['crosses_reset'] and not event['during_reset']:
                groups[(event['reset_segment'], frame)].append(index)
    durations = {}
    for stage, selected in stages.items():
        spans = [event['dur'] / 1e6 for event in selected
                 if event['gxr2_kind'] == 'span' and event['dur'] >= 0]
        durations[stage] = {'count': len(selected), 'complete_span_count': len(spans),
                            'incomplete_span_count': sum(event['dur'] < 0 for event in selected),
                            'total_ms': sum(spans) if spans else None,
                            'maximum_ms': max(spans) if spans else None}
    frames = [{'reset_segment': segment, 'frame_id': frame, 'event_indices': indices}
              for (segment, frame), indices in sorted(groups.items())]
    faults = [event for event in diagnostic if event['gxr2_stage'] in
              ('helperFault', 'nativeFault', 'periodicFault', 'faultGeneration')]
    return {
        'status': 'present' if diagnostic else 'absent',
        'event_count': len(diagnostic), 'reset_boundary_count': len(starts),
        'stage_durations': durations,
        'helper_fault_reasons': dict(collections.Counter(event['fault_reason'] for event in faults
                                                        if 'fault_reason' in event)),
        'native_fault_callers': dict(collections.Counter(event['scene_return_address_hex'] for event in faults
                                                        if 'scene_return_address_hex' in event)),
        'interpretation': 'CompleteSubmit entry observes a completed-frame submission attempt; '
                          'assemblyAcquire observes staging allocation, not first-packet arrival. '
                          'FEC duplicate candidates are post-Periodic marker snapshots, not executed branch proof. '
                          'Packet context -1 means other/unclassified acquisition; it does not identify a skipped-frame request. '
                          'No per-stage latency or physical presentation is inferred from grouping.',
    }, frames, faults


def self_test():
    assert parse_gxr2('GXR2 inputResult fid=42 a=-1 b=20000 c=0')['result']['index_or_error'] == -1
    assert parse_gxr2('GXR2 helperFault fid=42 a=2 b=99 c=0')['fault_reason'] == 'unowned-pointer'
    assert parse_gxr2('GXR2 nativeFault fid=-1 a=255 b=0 c=0')['scene_return_address_hex'] == '0xff'
    assert parse_gxr2('GXR2 helperFault fid=1 a=99 b=0 c=0')['fault_reason'] == 'unknown'
    assert parse_gxr2('GXR2 outputResult fid=1 a=1') is None
    def event(ts, dur, name):
        return dict(ts=ts, dur=dur, name=name, stage='gxr2', **parse_gxr2(name))
    events = [event(0, 30, 'GXR2 completeSubmit fid=42'),
              event(5, 2, 'GXR2 queueInput fid=42'),
              event(10, 5, 'GXR2 codecFlush fid=-1'),
              event(12, 0, 'GXR2 outputResult fid=42 a=1 b=100 c=0'),
              event(16, 0, 'GXR2 outputResult fid=0 a=1 b=100 c=0'),
              event(20, 2, 'GXR2 queueInput fid=42'),
              event(30, -1, 'GXR2 dequeueInput fid=42'),
              event(40, 1, 'GXR2 codecInit fid=-1')]
    summary, frames, faults = diagnostic_exports(events)
    assert summary['status'] == 'present' and len(frames) == 2 and not faults
    assert frames[0]['event_indices'] == [1] and frames[1]['event_indices'] == [5]
    assert events[0]['crosses_reset'] and events[3]['during_reset']
    assert summary['stage_durations']['dequeueInput']['incomplete_span_count'] == 1
    assert diagnostic_exports([])[0]['status'] == 'absent'
    print('GXR2 parser self-test passed: signed results, reasons, reset separation, zero IDs, incomplete spans, absent telemetry.')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('trace', type=Path)
    parser.add_argument('--python-tools', type=Path, required=True)
    parser.add_argument('--processor', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--pid', type=int, required=True)
    args = parser.parse_args()
    if args.pid <= 0:
        parser.error('--pid must be positive')
    if args.output.exists() and (not args.output.is_dir() or any(args.output.iterdir())):
        parser.error('--output must be new or empty')
    sys.path.insert(0, str(args.python_tools.resolve()))
    from perfetto.trace_processor import TraceProcessor, TraceProcessorConfig
    args.output.mkdir(parents=True, exist_ok=True)
    with TraceProcessor(trace=str(args.trace.resolve()), config=TraceProcessorConfig(
            bin_path=str(args.processor.resolve()))) as tp:
        def query(sql):
            return [vars(row) for row in tp.query(sql)]
        health = query("SELECT name,idx,value,severity FROM stats WHERE value != 0 "
                       "AND severity IN ('error','data_loss')")
        clocks = query("SELECT ts,clock_value FROM clock_snapshot WHERE clock_name='REALTIME'")
        mappings = sorted(row['clock_value'] - row['ts'] for row in clocks)
        conversion = mappings[len(mappings) // 2] if mappings else None
        events = query(f"""SELECT s.ts,s.dur,s.name,t.tid,t.name thread_name
            FROM slice s JOIN thread_track tr ON s.track_id=tr.id
            JOIN thread t USING(utid) JOIN process p USING(upid)
            WHERE p.pid={args.pid} AND (s.name LIKE 'CCodecBufferChannel::queue(%'
              OR s.name LIKE 'CCodecBufferChannel::onWorkDone(%'
              OR s.name='queueBuffer' OR s.name LIKE '%IComponent::flush%'
              OR s.name LIKE 'GXR2 %')
            ORDER BY s.ts,s.id""")
    previous = {}
    gaps = []
    for event in events:
        name = event['name']
        match = re.fullmatch(r'CCodecBufferChannel::(queue|onWorkDone)\((.*)@ts=(-?\d+)\)', name)
        event['stage'] = ('codec_queue' if match[1] == 'queue' else 'codec_work_done') if match else (
            'surface_queue' if name == 'queueBuffer' else 'codec_flush')
        if match:
            event.update(codec=match[2], codec_timestamp=int(match[3]))
        diagnostic = parse_gxr2(name)
        if diagnostic:
            event.update(diagnostic)
            event['stage'] = 'gxr2.' + diagnostic['gxr2_stage']
        elif name.startswith('GXR2 '):
            event['stage'] = 'gxr2.unparsed'
        if conversion is not None:
            event['device_utc'] = datetime.datetime.fromtimestamp(
                (event['ts'] + conversion) / 1e9, datetime.timezone.utc).isoformat(timespec='microseconds')
        if event['stage'] == 'surface_queue':
            key = event['tid']
            old = previous.get(key)
            if old and event['ts'] - old['ts'] > 50_000_000:
                gaps.append({'start_ts': old['ts'], 'end_ts': event['ts'], 'tid': key,
                             'gap_ms': (event['ts'] - old['ts']) / 1e6})
            previous[key] = event
    gaps.sort(key=lambda item: item['gap_ms'], reverse=True)
    diagnostics, frame_groups, faults = diagnostic_exports(events)
    for gap in gaps:
        gap['context'] = [event for event in events
                          if gap['start_ts'] - 30_000_000 <= event['ts'] <= gap['end_ts'] + 30_000_000]
    summary = {
        'pid': args.pid, 'trace': str(args.trace.resolve()),
        'stage_counts': dict(collections.Counter(event['stage'] for event in events)),
        'zero_timestamp_work_callbacks': sum(event['stage'] == 'codec_work_done'
                                             and event.get('codec_timestamp') == 0 for event in events),
        'output_gaps_above_50ms': len(gaps),
        'largest_output_gap_ms': gaps[0]['gap_ms'] if gaps else None,
        'health': health,
        'gxr2': diagnostics,
        'limitations': [
            'Surface queue intervals are decoded-output cadence, not physical display timing.',
            'Codec timestamps equal native frame IDs only when verified for the installed app.',
            'Work callbacks may return empty/reset work. No frame latency inferred from ts=0.',
            'Device UTC has not been aligned to host clock by this tool.',
            'Trace parser and data-loss counters must be considered before attributing missing events.',
            'GXR2 events lack codec-instance identity. Frame groups assume one active decoder and '
            'conservatively split at every helper/platform reset marker; they are not proven frame joins.',
            'Frame 0, negative IDs, incomplete/reset-crossing spans and events during reset are excluded '
            'from GXR2 frame groups. Raw events remain available.',
        ],
    }
    for name, value in [('pipeline-events', events), ('output-gap-context', gaps), ('pipeline-summary', summary),
                        ('gxr2-frame-groups', frame_groups), ('gxr2-faults', faults)]:
        (args.output / (name + '.json')).write_text(json.dumps(value, indent=2), encoding='utf-8')
    print(json.dumps(summary, indent=2))


if __name__ == '__main__':
    if sys.argv[1:] == ['--self-test']:
        self_test()
    else:
        main()
