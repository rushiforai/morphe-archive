#!/usr/bin/env python3
"""Join FM15 receiver-death callbacks, durable uncertainty and future playback."""
import argparse
import hashlib
import json
from pathlib import Path
import re

from verify_concurrent_warning_evidence import event_key
from verify_native_guidance_evidence import common, external, restored

if not __debug__:
    raise RuntimeError('Run evidence validation without Python optimization')


def audit(data):
    host, source, outer = data['host'], data['source'], data['outer']
    case = source['scenarios']['integrated_death_recovery']
    common(host, source, case)
    restored(outer)
    assert host['scenario'] == 'death-recovery'
    assert host['installed_sha256'] == outer['installed']
    assert host['receiver_permissions_restored_exactly']
    assert host['receiver_permissions_before'] == host['receiver_permissions_after']
    for package, before in host['preferences_before'].items():
        after = host['final_preferences_cleanup'][package]
        assert after['restored_exactly'] and after['files'] == before['files']
    death = case['death_recovery']
    old, future = death['authority'], death['future_authority']
    old_key, future_key = event_key(old), event_key(future)
    pre, recovered = data['pre_death'], data['recovered']
    owner = death['owner_package']
    assert pre['package'] == recovered['package'] == owner
    assert pre['uid'] == recovered['uid'] != source['uid']
    assert owner == ('app.vela' if host['death_owner'] == 'vela' else 'org.ungoogled.android.apps.maps')
    assert old['operation'] == future['operation'] == 'ANNOUNCE'
    assert old['native_announce_observed'] and future['native_announce_observed']
    assert old_key != future_key and old['provider_session'] == future['provider_session']
    assert old['issued_elapsed_ms'] < future['issued_elapsed_ms']

    # A killed process cannot supply a terminal callback. Preserve that gap;
    # require its real pre-death STARTED and the same source-granted attempt.
    starts = [row for row in pre['diagnostics'] if row['stage'] == 'SCHEDULER_STARTED' and row['event_key'] == old_key]
    assert len(starts) == 1, 'Unique actual STARTED required before process death'
    start = starts[0]
    assert not [row for row in pre['diagnostics'] if row['event_key'] == old_key and row['stage'] in
                ['SCHEDULER_COMPLETED', 'SCHEDULER_CANCELLED', 'SCHEDULER_INTERRUPTED']]
    assert old['issued_elapsed_ms'] <= start['elapsed_ms'] < old['announce_until_elapsed_ms']
    for field, original in [('sequence', 'sequence'), ('provider_session', 'provider_session'),
                            ('native_type', 'native_type'), ('category', 'category'),
                            ('priority', 'priority'), ('issued_ms', 'issued_elapsed_ms')]:
        assert start[field] == old[original]
    acks = death['source_dispositions_before_death']
    assert [row['outcome'] for row in acks] == ['GRANTED', 'STARTED']
    attempt = acks[0]['attempt_id']
    for row in acks:
        assert row['attempt_id'] == attempt and row['receiver_uid'] == pre['uid']
        assert row['event_key'] == old_key and row['granted'] and row['mode'] == 'VOICE'
        assert row['started'] is (row['outcome'] == 'STARTED')
    assert start['elapsed_ms'] <= acks[-1]['observed_elapsed_ms']
    assert any(sample['elapsed_ms'] >= start['elapsed_ms'] and
               sample['speaker']['active'].get('started') is True and
               sample['connection']['outputOutstanding'] for sample in pre['runtime_samples'])

    before = death['before_death']
    assert before['code'] == 'OK' and before['owner_ready'] and before['owner_present']
    assert before['owner_package'] == owner and before['owner_uid'] == pre['uid']
    for label in ['before_death', 'after_death', 'after_lease_expiry']:
        status = death[label]
        assert status['provider_session'] == old['provider_session']
        assert status['pending_present'] and status['pending_started']
        assert status['pending_attempt'] == status['stored_attempt'] == attempt
        assert status['pending_event_key'] == old_key
        assert status['pending_provider_session'] == old['provider_session']
        assert status['stored_started'] and status['stored_outcome'] == 'STARTED'
        assert status['pending_outcome'] == ('STARTED' if label == 'before_death' else 'UNCERTAIN')
        if label != 'before_death': assert status['code'] == 'AUDIO_UNCERTAIN'
    assert not death['after_lease_expiry']['owner_present']
    refusal = case['live_owner_recovery_refused']
    assert refusal['before'] == refusal['after']
    assert refusal['before']['code'] == 'OK' and refusal['before']['owner_ready']
    assert refusal['both_confirmations_required'] and not refusal['activity_finished']
    recovery = case['uncertain_output_recovery']
    assert recovery['before'] == death['after_lease_expiry']
    assert recovery['after'] == death['after_recovery']
    assert recovery['both_confirmations_required'] and recovery['activity_finished']
    assert recovery['after']['code'] == 'UNOWNED'
    assert not recovery['after']['owner_present'] and not recovery['after']['pending_present']
    assert recovery['after']['provider_session'] == old['provider_session']

    # Positive platform stop evidence is distinct from the user's confirmations.
    stopped = host['outputs_verified_stopped']
    assert stopped['active_relevant_players'] == 0
    assert set(stopped['packages']) == {'org.ungoogled.android.apps.maps', 'app.vela', 'com.google.android.tts'}
    assert {pre['uid'], source['uid']} <= set(stopped['relevant_uids'])
    audio = data['audio_after']
    assert '  players:' in audio and '  ducked players' in audio
    for line in audio.split('  players:', 1)[1].split('  ducked players', 1)[0].splitlines():
        uid = re.search(r'u/pid:(\d+)/', line)
        assert not (uid and int(uid[1]) in stopped['relevant_uids'] and 'state:started' in line)
    assert host['death_force_stop_monotonic_ns'] > 0
    if 'process_stop_observations' in host:
        observations = host['process_stop_observations']
        assert all(row['stopped'] and row['samples'] and not row['samples'][-1]['processes'] for row in observations)
        assert set(stopped['packages']) <= {row['package'] for row in observations}
    assert len(data['screenshot_receipts']) == 4
    assert all(re.fullmatch(r'[0-9a-f]{64}', row['sha256']) and row['size'] > 10000
               for row in data['screenshot_receipts'].values())

    assert not any(row['stage'] == 'SCHEDULER_STARTED' and row['event_key'] == old_key
                   for row in recovered['diagnostics'])
    future_proof = external(future, recovered, death['future_source_dispositions'])
    return {'owner': owner, 'apps': host['installed_sha256'], 'helpers': host['helper_sha256'],
            'old_authority': old, 'old_actual_started': start, 'old_source_acks': acks,
            'old_attempt_fenced_through_lease_expiry': True, 'durable_status': death,
            'outputs_stopped': stopped, 'only_distinct_future_authority_played': True,
            'future_playback': future_proof, 'exact_outer_rollback_verified': True,
            'outer_completed': outer.get('completed', False), 'outer_failure': outer.get('failure'),
            'raw_sha256': data['raw_sha256'], 'screenshot_receipts': data['screenshot_receipts'],
            'scope': 'Controlled force-stop after real receiver STARTED; provider durable fence survives receiver death/lease expiry; actual parked recovery and distinct future output. Receiver preferences restored to pre-run baseline before restart; this does not prove receiver-local ledger persistence, spontaneous-crash cause, physical audibility or provider restart.'}


def read_run(folder):
    host = json.loads((folder / 'result.json').read_text())
    role = host['death_owner']
    files = {'host': folder / 'result.json', 'outer': folder.parent / 'result.json',
             'source': Path(host['source_result']), 'pre_death': folder / (role + '-pre-death-progress.json'),
             'recovered': folder / (role + '-recovered-result.json')}
    data = {name: json.loads(path.read_text()) for name, path in files.items()}
    audio = folder / 'audio-after-all-outputs-stopped.txt'
    data['audio_after'] = audio.read_text()
    data['raw_sha256'] = {str(path): hashlib.sha256(path.read_bytes()).hexdigest() for path in [*files.values(), audio]}
    for name, expected in host['helper_sha256'].items():
        assert hashlib.sha256((folder / (name + '-helper.apk')).read_bytes()).hexdigest() == expected
    data['screenshot_receipts'] = {}
    for stem in ['live_owner_recovery_refused', 'live_owner_recovery_refused-confirmations',
                 'uncertain_output_recovery', 'uncertain_output_recovery-confirmations']:
        content = (folder / (stem + '.png')).read_bytes()
        assert content.startswith(b'\x89PNG\r\n\x1a\n')
        data['screenshot_receipts'][stem] = {'sha256': hashlib.sha256(content).hexdigest(), 'size': len(content)}
    return data


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('folders', nargs='+', type=Path)
    parser.add_argument('--output', required=True, type=Path)
    args = parser.parse_args()
    if args.output.exists(): parser.error('Use a fresh output; retain previous evidence')
    proofs = [audit(read_run(folder)) for folder in args.folders]
    args.output.write_text(json.dumps({'source_version': '15.0/1289', 'runs': proofs}, indent=2) + '\n')
    print(json.dumps({'verified_receivers': [proof['owner'] for proof in proofs]}))


if __name__ == '__main__':
    main()
