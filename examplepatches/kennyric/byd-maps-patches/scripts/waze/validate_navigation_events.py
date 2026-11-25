#!/usr/bin/env python3
"""Verify the independently signed navigation receiver's JSONL capture."""
import argparse
import json
import math
from pathlib import Path


def verify(path):
    rows = [json.loads(line) for line in path.read_text().splitlines() if line.strip()]
    session = rows[-1]['extras']['publisher_session_id']
    rows = [r for r in rows if r['extras']['publisher_session_id'] == session]
    events = [r['extras'] for r in rows]
    assert len(events) >= 10, 'Incomplete capture'
    assert all(r['receiver_uid'] != r['sender_uid'] and r['sender_package'] == 'com.waze' for r in rows)
    assert all(e['schema_version'] == 1 for e in events)
    assert all(a['sequence'] < b['sequence'] for a, b in zip(events, events[1:]))
    for e in events:
        assert e['road_updated_elapsed_ms'] <= e['sent_elapsed_ms']
        assert e['zone_updated_elapsed_ms'] <= e['sent_elapsed_ms']
        if e['road_speed_limit_status'] != 'valid':
            assert 'road_speed_limit_kmh' not in e
        if e['zone_status'] != 'active':
            assert 'zone_average_speed_kmh' not in e
    assert any(e.get('road_speed_limit_kmh') == 120 for e in events)
    assert any(math.isclose(e.get('road_speed_limit_kmh', -1000), 104.60736) for e in events)
    assert any(e.get('road_speed_limit_kmh') == 100 and e.get('road_speed_limit_display_unit') == 'metric' for e in events)
    zone = next(e for e in events if e.get('zone_progress_percent') == 28)
    expected = zone['zone_observed_distance_m'] * 3600 / (zone['zone_updated_elapsed_ms'] - zone['zone_observation_start_elapsed_ms'])
    assert math.isclose(zone['zone_average_speed_kmh'], expected)
    assert zone['zone_average_partial'] and not zone['zone_progress_estimated']
    first = next(e for e in events if e.get('zone_segment_id') == 'probe-a')
    second = next(e for e in events if e.get('zone_segment_id') == 'probe-b')
    assert second['zone_session'] > first['zone_session']
    assert second['zone_progress_estimated'] and 'zone_average_speed_kmh' not in second
    assert events[-1]['zone_status'] == events[-1]['road_speed_limit_status'] == 'disabled'
    active_seen = False
    clearing = 0
    for e in events:
        active_seen |= e['zone_status'] == 'active'
        if active_seen and e['zone_status'] == 'disabled':
            clearing += 1
    assert clearing == 1, 'Publication continued after disable'
    return {'events': len(events), 'different_uid': True, 'authenticated_sender': True,
            'native_progress': zone['zone_progress_percent'], 'observed_average_kmh': zone['zone_average_speed_kmh'],
            'units_and_cached_state_checks': True, 'disable_clearing': True}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('events', type=Path)
    args = parser.parse_args()
    print(json.dumps(verify(args.events), indent=2))
