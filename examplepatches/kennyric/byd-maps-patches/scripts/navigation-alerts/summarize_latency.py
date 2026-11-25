#!/usr/bin/env python3
"""Summarize one receiver's bounded warning trace; never invent missing start/acceptance samples."""
import argparse
import collections
import json
import math
from pathlib import Path

TERMINALS = {'NOT_STARTED', 'COMPLETED', 'INTERRUPTED', 'CANCELLED', 'USER_MUTED',
             'USER_FILTERED', 'EXPIRED', 'REJECTED', 'FAILED', 'UNCERTAIN'}


def summarize(records, minimum=100):
    if not isinstance(records, list) or minimum < 1:
        raise ValueError('Expected a record list and positive sample minimum')
    events = {}
    outcomes = collections.Counter()
    for row in records:
        if not isinstance(row, dict):
            raise ValueError('Trace row must be an object')
        if row.get('preview') is True:
            continue
        stage = row.get('stage')
        if not isinstance(stage, str):
            raise ValueError('Missing stage')
        if stage != 'RECEIVER_ACCEPTED' and not stage.startswith('SCHEDULER_'):
            continue  # Grant-only/source records do not establish receiver acceptance or output.
        session, sequence = row.get('provider_session'), row.get('sequence')
        issued, elapsed = row.get('issued_ms'), row.get('elapsed_ms')
        if (not isinstance(session, str) or not session or type(sequence) is not int or sequence <= 0
                or type(issued) is not int or type(elapsed) is not int or issued < 0 or elapsed < issued):
            raise ValueError('Malformed identity or monotonic time')
        key = (session, sequence)
        event = events.setdefault(key, {'issued': issued, 'stages': {}})
        if event['issued'] != issued:
            raise ValueError('One transport identity has conflicting original issue times')
        previous = event['stages'].get(stage)
        if previous is None or elapsed < previous:
            event['stages'][stage] = elapsed
    delivery, startup = [], []
    missing_accept, missing_start = 0, 0
    for event in events.values():
        stages = event['stages']
        accepted, started = stages.get('RECEIVER_ACCEPTED'), stages.get('SCHEDULER_STARTED')
        if accepted is not None:
            delivery.append(accepted - event['issued'])
        if started is not None:
            if accepted is None:
                missing_accept += 1
            elif started < accepted:
                raise ValueError('Playback start predates receiver acceptance')
            else:
                startup.append(started - accepted)
        elif accepted is not None:
            missing_start += 1
        for stage in stages:
            if stage.removeprefix('SCHEDULER_') in TERMINALS:
                outcomes[stage.removeprefix('SCHEDULER_')] += 1

    def metrics(values):
        ordered = sorted(values)
        def percentile(p):
            return ordered[max(0, math.ceil(p * len(ordered)) - 1)] if ordered else None
        return {'samples': len(ordered), 'p95_ms': percentile(.95), 'p99_ms': percentile(.99),
                'max_ms': ordered[-1] if ordered else None,
                'sample_status': 'sufficient' if len(ordered) >= minimum else 'inconclusive'}

    return {'minimum_samples': minimum, 'unique_transport_events': len(events),
            'native_issue_to_receiver': metrics(delivery), 'receiver_to_started': metrics(startup),
            'started_without_retained_acceptance': missing_accept,
            'accepted_without_retained_start': missing_start, 'outcome_counts': dict(sorted(outcomes.items())),
            'scope': 'Empirical trace summary for one receiver only; filter scenario/readiness/priority before comparing design targets. Missing records may reflect bounded trace retention; queued/completed alone never count as started.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('trace', type=Path)
    parser.add_argument('--minimum-samples', type=int, default=100)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    data = json.loads(args.trace.read_text())
    result = summarize(data['records'] if isinstance(data, dict) else data, args.minimum_samples)
    text = json.dumps(result, indent=2) + '\n'
    if args.output:
        args.output.write_text(text)
    else:
        print(text, end='')


if __name__ == '__main__':
    main()
