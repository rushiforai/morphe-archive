#!/usr/bin/env python3
"""Audit FM15 provider death, retained ledger, a fresh fenced warning and parked recovery."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from verify_concurrent_warning_evidence import event_key
from verify_native_guidance_evidence import external, restored

if not __debug__:
    raise RuntimeError('Run validation without Python optimization')


def audit(data):
    host, source, seed = data['host'], data['source'], data['seed']
    case = source['scenarios']['integrated_restart_recovery']
    restored(data['outer'])
    assert host['probe_completed'] and host['failure'] is None
    assert host['scenario'] == 'provider-restart' and host['serial'] == 'emulator-5590' and host['avd'] == 'native_warnings_ui_api34'
    assert host['installed_sha256'] == data['outer']['installed']
    assert host['process_exit_codes'] == {'seed-source': 1, 'seed-receiver': 0, 'restarted-source': 0,
                                        'fenced-receiver': 0, 'recovered-receiver': 0}
    assert not seed['probe_completed'] and seed['failure'] == "RuntimeError('Actual native capture failed: integrated_restart_seed')"
    for result in [seed, source]:
        assert result['target_sha256'] == host['installed_sha256']['nl.flitsmeister']
        assert result['probe_sha256'] == host['helper_sha256']['source']
        assert result['network_and_lease_restored'] and not result['cleanup_errors']
    assert source['probe_completed'] and source['failure'] is None
    assert case['target_version'] == '15.0' and case['target_version_code'] == 1289 and case['native_binding_profile'] == '15.0/1289'
    assert case['process_uid'] == source['uid'] == seed['uid']
    assert 'Lfc0;->J' in case['actual_native_roots']
    for name in ['production_endpoint_used', 'provider_native_queue_empty', 'receiver_source_off_and_quiescent',
                 'real_terminal_ack_observed', 'managed_mute_verified', 'device_stream_unchanged']:
        assert case[name]
    for name in ['test_sink_used', 'raw_packet_emitted', 'coverage_override_used', 'detectors_started_by_probe', 'public_report_submission_called']:
        assert not case[name]
    for prefix in ['source_permissions', 'window_settings']:
        assert host[prefix+'_restored_exactly'] and host[prefix+'_before'] == host[prefix+'_after']
    for package, before in host['preferences_before'].items():
        after = host['final_preferences_cleanup'][package]
        assert after['restored_exactly'] and after['files'] == before['files']

    started = host['seed_started']; authority = started['authority']; old_key = event_key(authority)
    pre, fenced, recovered = data['seed_progress'], data['fenced'], data['recovered']
    assert pre['package'] == fenced['package'] == recovered['package']
    assert pre['uid'] == fenced['uid'] == recovered['uid'] != source['uid']
    assert pre['package'] == ('app.vela' if host['receiver'] == 'vela' else 'org.ungoogled.android.apps.maps')
    starts = [row for row in pre['diagnostics'] if row['stage'] == 'SCHEDULER_STARTED' and row['event_key'] == old_key]
    assert len(starts) == 1
    assert not any(row['stage'] in ['SCHEDULER_COMPLETED', 'SCHEDULER_CANCELLED', 'SCHEDULER_INTERRUPTED']
                   and row['event_key'] == old_key for row in pre['diagnostics'])
    acks = started['source_dispositions']
    assert [row['outcome'] for row in acks] == ['GRANTED', 'STARTED']
    attempt = acks[0]['attempt_id']
    for ack in acks:
        assert ack['event_key'] == old_key and ack['attempt_id'] == attempt and ack['receiver_uid'] == pre['uid']
        assert ack['granted'] and ack['mode'] == 'VOICE' and ack['started'] is (ack['outcome'] == 'STARTED')
    assert authority['issued_elapsed_ms'] <= starts[0]['elapsed_ms'] <= acks[-1]['observed_elapsed_ms'] < authority['announce_until_elapsed_ms']
    before = started['pending']; loaded = case['reloaded_pending']; blocked = case['after_fenced_native']
    assert before['owner_present'] and before['owner_ready'] and before['owner_package'] == pre['package']
    assert before['owner_uid'] == pre['uid'] and before['pending_outcome'] == 'STARTED'
    assert loaded == host['reloaded_pending'] and blocked == host['fenced_native_event']['pending']
    assert loaded['provider_session'] != before['provider_session']
    for state in [before, loaded, blocked]:
        assert state['pending_attempt'] == state['stored_attempt'] == attempt
        assert state['pending_started'] and state['stored_started'] and state['stored_outcome'] == 'STARTED'
        assert state['pending_present'] and state['pending_event_key'] == old_key
        assert state['pending_provider_session'] == authority['provider_session']
    for state in [loaded, blocked]:
        assert state['code'] == 'AUDIO_UNCERTAIN' and state['pending_outcome'] == 'UNCERTAIN' and not state['owner_present']
        assert state['provider_session'] == loaded['provider_session']

    fresh = case['fenced_native_authority']; fresh_key = event_key(fresh)
    assert fresh == host['fenced_native_event']['authority']
    assert fresh['operation'] == 'ANNOUNCE' and fresh['native_announce_observed']
    assert fresh['provider_session'] == loaded['provider_session'] and fresh_key != old_key
    accepted = [row for row in fenced['diagnostics'] if row['stage'] == 'RECEIVER_ACCEPTED'
                and row['event_key'] == fresh_key and row['sequence'] == fresh['sequence']]
    assert len(accepted) == 1 and fresh['issued_elapsed_ms'] <= accepted[0]['elapsed_ms'] < fresh['announce_until_elapsed_ms']
    assert not fenced['actual_speaker_attempts'] and not any(row['stage'] == 'SCHEDULER_STARTED' for row in fenced['diagnostics'])
    assert any(row['session'] == 'ready' and row['audio'] == 'AUDIO_UNCERTAIN' for row in fenced['states'])
    assert fenced['probe_completed'] and fenced['output_quiescent'] and fenced['preferences_restored_exactly']

    stopped = host['outputs_verified_stopped']
    assert stopped['active_relevant_players'] == 0
    assert set(stopped['packages']) == {'org.ungoogled.android.apps.maps', 'app.vela', 'com.google.android.tts'}
    assert {source['uid'], pre['uid']} <= set(stopped['relevant_uids'])
    audio = data['audio_after']; assert '  players:' in audio and '  ducked players' in audio
    for line in audio.split('  players:', 1)[1].split('  ducked players', 1)[0].splitlines():
        uid = re.search(r'u/pid:(\d+)/', line)
        assert not (uid and int(uid[1]) in stopped['relevant_uids'] and 'state:started' in line)
    recovery = case['uncertain_output_recovery']
    assert recovery['before'] == blocked and recovery['after'] == case['after_recovery']
    assert recovery['both_confirmations_required'] and recovery['activity_finished']
    assert recovery['after']['code'] == 'UNOWNED' and not recovery['after']['pending_present'] and not recovery['after']['owner_present']
    assert recovery['after']['provider_session'] == loaded['provider_session']
    assert len(data['screenshots']) == 2 and all(row['size'] > 10000 for row in data['screenshots'].values())
    future = case['future_authority']
    assert future['native_announce_observed'] and future['provider_session'] == loaded['provider_session']
    assert event_key(future) not in [old_key, fresh_key] and future['issued_elapsed_ms'] > fresh['issued_elapsed_ms']
    future_proof = external(future, recovered, case['future_source_dispositions'])
    if host['receiver'] == 'vela':
        assert host['vela_permissions_restored_exactly'] and host['vela_permissions_before'] == host['vela_permissions_after']
        status = host['visible_vela_uncertainty_status']
        assert status['text'] == 'Waiting for previous audio to stop'
        assert status['text'] in data['visible_ui_text']
        assert data['visible_ui_screenshot']['size'] > 10000
    return {'receiver': pre['package'], 'apps': host['installed_sha256'], 'helpers': host['helper_sha256'],
            'old_authority': authority, 'old_actual_start': starts[0], 'old_source_acks': acks,
            'old_durable_attempt_retained': True, 'reloaded_pending': loaded,
            'fresh_native_authority_fenced': True, 'fresh_authority': fresh, 'fresh_receiver_acceptance': accepted[0],
            'positive_platform_stop': stopped, 'only_future_authority_completed': True, 'future_playback': future_proof,
            'exact_outer_rollback_verified': True, 'outer_completed': data['outer'].get('completed', False),
            'outer_failure': data['outer'].get('failure'), 'raw_sha256': data['raw_sha256'],
            'scope': 'Controlled source+receiver force-stop after actual STARTED; fresh native warning fenced in a new provider session while old durable grant remains unknown; parked recovery then distinct future completion. Receiver preferences reset before reconnect; not receiver-local ledger persistence, natural crash attribution or physical audibility.'}


def read_run(folder):
    host = json.loads((folder/'result.json').read_text())
    paths = {'host': folder/'result.json', 'outer': folder.parent/'result.json', 'seed': Path(host['expected_killed_source_result']),
             'source': Path(host['restarted_source_result']), 'seed_progress': folder/'seed-receiver-progress.json',
             'fenced': folder/'fenced-receiver-result.json', 'recovered': folder/'recovered-receiver-result.json'}
    data = {name: json.loads(path.read_text()) for name, path in paths.items()}
    audio = folder/'audio-before-parked-reset.txt'; data['audio_after'] = audio.read_text()
    data['raw_sha256'] = {str(path): hashlib.sha256(path.read_bytes()).hexdigest() for path in [*paths.values(), audio]}
    for name, expected in host['helper_sha256'].items():
        assert hashlib.sha256((folder/(name+'-helper.apk')).read_bytes()).hexdigest() == expected
    data['screenshots'] = {}
    for name in ['actual_window_screenshot', 'confirmations_screenshot']:
        content = (folder/(name+'.png')).read_bytes(); assert content.startswith(b'\x89PNG\r\n\x1a\n')
        data['screenshots'][name] = {'sha256': hashlib.sha256(content).hexdigest(), 'size': len(content)}
    if host['receiver'] == 'vela':
        status = host['visible_vela_uncertainty_status']; xml = Path(status['xml']); image = Path(status['screenshot'])
        data['visible_ui_text'] = '\n'.join(node.get('text') or node.get('content-desc') or '' for node in ET.parse(xml).iter('node') if node.get('package') == 'app.vela')
        content = image.read_bytes(); assert content.startswith(b'\x89PNG\r\n\x1a\n')
        data['visible_ui_screenshot'] = {'sha256': hashlib.sha256(content).hexdigest(), 'size': len(content)}
        data['raw_sha256'].update({str(path): hashlib.sha256(path.read_bytes()).hexdigest() for path in [xml, image]})
    return data


def main():
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('folders', nargs='+', type=Path)
    parser.add_argument('--output', required=True, type=Path); args = parser.parse_args()
    if args.output.exists(): parser.error('Retain previous proofs; use a fresh output')
    proofs = [audit(read_run(folder)) for folder in args.folders]
    args.output.write_text(json.dumps({'source_version': '15.0/1289', 'runs': proofs}, indent=2)+'\n')
    print(json.dumps({'verified': [row['receiver'] for row in proofs]}))


if __name__ == '__main__': main()
