#!/usr/bin/env python3
"""Verify real reconnection rejects passed/expired camera authorities and plays a valid one."""
import argparse
import hashlib
import json
from pathlib import Path
from verify_moving_camera_evidence import event_key

if not __debug__:
    raise RuntimeError("Run validation without -O or PYTHONOPTIMIZE; assertion checks are required")



def verify(folder):
    record_path = folder / 'result.json'
    record = json.loads(record_path.read_text())
    assert record['probe_completed'] and record['failure'] is None
    assert record['warning_suite_cases'] == 'delayed-passage'
    assert record['serial'] == 'emulator-5590' and record['avd'] == 'native_warnings_ui_api34'
    for field in ['route_permissions_restored_exactly', 'source_permissions_restored_exactly',
                  'window_settings_restored_exactly']:
        assert record[field], field
    assert all(value['restored_exactly'] for value in record['final_preferences_cleanup'].values())
    if record['receiver'] == 'vela':
        assert record['vela_permissions_restored_exactly']
    source_path = Path(record['warning_suite_source_result'])
    source = json.loads(source_path.read_text())
    assert source['probe_completed'] and source['failure'] is None
    assert source['network_and_lease_restored'] and not source['cleanup_errors']
    case = source['scenarios']['integrated_warning_suite']
    assert case['production_endpoint_used'] and not case['test_sink_used']
    assert not case['raw_packet_emitted'] and not case['coverage_override_used']
    assert case['provider_native_queue_empty'] and case['receiver_source_off_and_quiescent']
    assert case['managed_mute_verified'] and case['device_stream_unchanged']
    assert case['empty_journal_preflight']['events'] == []
    receiver_path = folder / 'seed-receiver-result.json'
    receiver = json.loads(receiver_path.read_text())
    assert receiver['status'] == 'observed' and receiver['output_quiescent']
    assert receiver['preferences_restored_exactly'] and receiver['uid'] != source['uid']
    fix = receiver['preflight_native_fix']
    assert fix['provider'] == 'gps' and fix['speed_mps'] > 1.5 and fix['accuracy_m'] <= 30
    assert abs(fix['bearing']) < 1 and 0 <= fix['observed_elapsed_ms'] - fix['fix_elapsed_ms'] < 2000
    rows = case['delayed_passage_records']
    assert [row['scenario'] for row in rows] == ['passed_fresh', 'ahead_fresh', 'expired_ahead']
    diagnostics = receiver['diagnostics']
    assert sum(row['stage'] == 'SCHEDULER_STARTED' for row in diagnostics) == 1
    assert sum(row['stage'] == 'SCHEDULER_COMPLETED' for row in diagnostics) == 1
    assert len(receiver['actual_speaker_attempts']) == 1
    results = []
    for row in rows:
        authority = row['authority']
        key = event_key(authority)
        assert authority['operation'] == 'ANNOUNCE' and authority['relevance'] == 'point_ahead'
        assert not row['receiver_registered_at_native_issue']
        assert fix['observed_elapsed_ms'] < authority['issued_elapsed_ms'] < row['receiver_synchronized_elapsed_ms']
        journal = row['journal_before_receiver']
        assert any(event['warning_id'] == authority['warning_id'] for event in journal['currentState'])
        assert any(event['sequence'] == authority['sequence'] for event in journal['events'])
        entries = [event for event in diagnostics if event['event_key'] == key]
        view = [event for event in receiver['semantic_view_records']
                if event['payload']['warning_id'] == authority['warning_id']]
        assert view and all(event['payload']['message'] == authority['message'] for event in view)
        outcome = row['expected_result']
        details = {'scenario': row['scenario'], 'event_key': key, 'warning_id': authority['warning_id'],
                   'outcome': outcome, 'original_announce_until_elapsed_ms': authority['announce_until_elapsed_ms'],
                   'actual_receiver_view_sequences': [event['payload']['sequence'] for event in view]}
        if row['scenario'] == 'passed_fresh':
            assert outcome == 'REJECTED'
            rejected, = [event for event in entries if event['stage'] == 'SCHEDULER_REJECTED']
            assert authority['issued_elapsed_ms'] <= rejected['elapsed_ms'] < authority['announce_until_elapsed_ms']
            assert 35 < (fix['latitude'] - authority['latitude']) * 111195 < 250
            assert abs(fix['longitude'] - authority['longitude']) < .00001
            assert rejected['elapsed_ms'] - fix['fix_elapsed_ms'] < 5000
            assert not any(event['stage'] in ['SCHEDULER_STARTED', 'SCHEDULER_COMPLETED'] for event in entries)
            disposition, = row['source_dispositions']
            rebound, = row['same_authority_rebind_dispositions']
            assert disposition['outcome'] == rebound['outcome'] == 'REJECTED'
            assert not disposition['started'] and not rebound['started']
            assert not disposition['granted'] and not rebound['granted']
            assert disposition['attempt_id'] == rebound['attempt_id']
            assert disposition['event_key'] == rebound['event_key'] == key
            details.update({'rejected_age_ms': rejected['elapsed_ms'] - authority['issued_elapsed_ms'],
                            'persisted_nonplayback_attempt': disposition['attempt_id'],
                            'same_attempt_after_rebind': True})
        elif row['scenario'] == 'ahead_fresh':
            assert outcome == 'COMPLETED' and authority['latitude'] > fix['latitude']
            started, = [event for event in entries if event['stage'] == 'SCHEDULER_STARTED']
            completed, = [event for event in entries if event['stage'] == 'SCHEDULER_COMPLETED']
            assert authority['issued_elapsed_ms'] <= started['elapsed_ms'] < completed['elapsed_ms'] < authority['announce_until_elapsed_ms']
            speaker, = receiver['actual_speaker_attempts']
            assert speaker['event_key'] == key and speaker['started']
            for field in ['provider_session', 'warning_id', 'announcement_index', 'phase',
                          'native_type', 'native_subtype', 'category', 'relevance', 'relationship',
                          'message', 'message_origin', 'language_tag', 'native_text_key',
                          'latitude', 'longitude', 'priority']:
                assert speaker['payload'][field] == authority[field], field
            assert any(value['outcome'] == 'STARTED' and value['started'] for value in row['source_dispositions'])
            assert any(value['outcome'] == 'COMPLETED' and value['started'] for value in row['source_dispositions'])
            assert all(value['event_key'] == key and value['attempt_id'] == speaker['attempt_id']
                       for value in row['source_dispositions'])
            details.update({'issued_to_start_ms': started['elapsed_ms'] - authority['issued_elapsed_ms'],
                            'attempt_id': speaker['attempt_id'], 'message': speaker['payload']['message']})
        else:
            assert outcome == 'STATE_ONLY_NO_AUTHORITY' and row['source_dispositions'] == []
            assert journal['observed_elapsed_ms'] > authority['announce_until_elapsed_ms']
            assert not any(event['warning_id'] == authority['warning_id'] for event in journal['announcements'])
            assert not entries, 'Expired snapshot manufactured scheduler work'
            assert any(event['observed_elapsed_ms'] >= authority['announce_until_elapsed_ms']
                       and event['payload']['state_until_elapsed_ms'] > event['observed_elapsed_ms'] for event in view)
            details.update({'snapshot_age_ms': journal['observed_elapsed_ms'] - authority['issued_elapsed_ms'],
                            'state_still_displayable': True, 'announcements_in_snapshot': 0,
                            'actual_scheduler_events': 0})
        results.append(details)
    files = [record_path, source_path, receiver_path]
    return {'receiver': record['receiver'], 'folder': str(folder), 'installed_sha256': record['installed_sha256'],
            'helper_sha256': record['helper_sha256'], 'source_uid': source['uid'], 'receiver_uid': receiver['uid'],
            'raw_sha256': {str(path): hashlib.sha256(path.read_bytes()).hexdigest() for path in files},
            'cases': results, 'actual_starts': 1, 'actual_completions': 1, 'exact_cleanup_verified': True,
            'scope': 'Original accepted native camera input, genuine journal snapshots and receiver registration/source reselect with native GPS. No synthetic transport packets, cursor/clock edits or fabricated playback dispositions. Straight passage only; route bends/parallel roads and other failure boundaries remain separate.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('folders', nargs='+', type=Path)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    results = [verify(folder) for folder in args.folders]
    args.output.write_text(json.dumps({'format': 1, 'runs': results}, indent=2) + '\n')
    print(json.dumps({'verified_runs': len(results), 'delayed_cases': sum(len(row['cases']) for row in results),
                      'output': str(args.output)}))


if __name__ == '__main__':
    main()
