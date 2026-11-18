#!/usr/bin/env python3
"""Join actual FM15 zone decisions, receiver output and schema1 telemetry."""
import argparse
import hashlib
import json
import math
from pathlib import Path

from verify_concurrent_warning_evidence import event_key, playback
from verify_native_guidance_evidence import restored

if not __debug__:
    raise RuntimeError('Run evidence verification without Python optimization')


def audit(data):
    host, source, receiver, trace = (data[name] for name in ['host','source','receiver','trace'])
    case = source['scenarios']['integrated_warning_suite']; restored(data['outer'])
    assert data['outer']['completed'] and host['probe_completed'] and host['failure'] is None
    assert host['serial']=='emulator-5590' and host['avd']=='native_warnings_ui_api34' and host['warning_suite_cases']=='native-zone'
    assert host['installed_sha256']==data['outer']['installed'] and all(value==0 for value in host['process_exit_codes'].values())
    assert source['target_sha256']==host['installed_sha256']['nl.flitsmeister'] and source['probe_sha256']==host['helper_sha256']['source']
    assert source['probe_completed'] and source['failure'] is None and source['network_and_lease_restored'] and not source['cleanup_errors']
    assert case['target_version']=='15.0' and case['target_version_code']==1289 and case['native_binding_profile']=='15.0/1289'
    assert case['process_uid']==source['uid']!=receiver['uid']
    for flag in ['production_endpoint_used','provider_native_queue_empty','receiver_source_off_and_quiescent','real_terminal_ack_observed','managed_mute_verified','device_stream_unchanged']:
        assert case[flag],flag
    for flag in ['test_sink_used','raw_packet_emitted','coverage_override_used','detectors_started_by_probe','public_report_submission_called']:
        assert not case[flag],flag
    for flag in ['source_location_override_used','native_policy_override_used','native_decision_override_used','native_repeat_acceptance']:
        assert trace[flag] is False,flag
    assert not trace.get('failure') and not trace.get('candidate_restore_failure')
    assert trace['native_path_entry_observed'] and trace['native_path_exit_and_removal_observed']
    cleanup=trace['candidate_restore'];assert cleanup['restored'] and cleanup['everObservedNativeActive']
    assert not cleanup['wasInNativeGpsPath'] and not cleanup['wasNativeWarningActive']
    samples=trace['source_samples'];assert len(samples)>=8
    native=[sample['native'] for sample in samples]
    assert all(row['sourceProvider']=='gps' and 0<=row['sourceAgeMillis']<=2500 and abs(row['sourceSpeedMps']-trace['speed_mps'])<1 for row in native)
    assert all(row['nativePolicy']==trace['warmup']['nativePolicy'] for row in native)
    stamps=[row['sourceElapsedRealtimeNanos'] for row in native];assert all(a<b for a,b in zip(stamps,stamps[1:]))
    assert native[0]['sourceLatitude']<trace['start_latitude'] and native[-1]['sourceLatitude']>trace['end_latitude']
    assert any(trace['start_latitude']<=row['sourceLatitude']<=trace['end_latitude'] and row['nativeInGpsPath'] for row in native)
    assert any(sample['zone']['nativeSelectedIsFixture'] and sample['zone']['nativeSelectedZoneId']==trace['native_id'] for sample in samples)
    assert samples[-1]['zone']['schema1RawFields']['zoneStatus']=='inactive'
    assert all(sample['zone']['schema1RawFields']['limitKmh'] is None for sample in samples), 'This isolated fixture supplied no road-limit input'
    authorities=trace['announcements'];assert len(authorities)==2
    events=[row['authority'] for row in authorities];assert [row['phase'] for row in events]==['enter','exit']
    assert events[0]['warning_id']==events[1]['warning_id'] and events[0]['warning_id'].endswith(trace['native_id'])
    assert events[1]['announcement_index']>events[0]['announcement_index']>0
    assert events[0]['issued_elapsed_ms']<trace['source_end_crossed_elapsed_ms']<=events[1]['issued_elapsed_ms']
    assert [row for row in trace['journal_events'] if row['operation']=='ANNOUNCE']==events
    assert any(row['operation']=='UPSERT' for row in trace['journal_events']) and any(row['operation']=='CLEAR' for row in trace['journal_events'])
    starts=[row for row in receiver['diagnostics'] if row['stage']=='SCHEDULER_STARTED']
    ends=[row for row in receiver['diagnostics'] if row['stage'] in ['SCHEDULER_COMPLETED','SCHEDULER_CANCELLED','SCHEDULER_INTERRUPTED']]
    assert len(starts)==len(ends)==len(receiver['actual_speaker_attempts'])==2
    proofs=[]
    for row in authorities:
        event=row['authority'];assert event['native_type']=='AVG_SPEED_CHECK' and event['native_family']=='AvgSpeedCheck' and event['category']=='speed_control'
        assert event['native_announce_observed'] and event['capture_path']=='regular'
        assert [ack['outcome'] for ack in row['source_dispositions']]==['GRANTED','STARTED','COMPLETED']
        assert all(ack['granted'] and ack['mode']=='VOICE' for ack in row['source_dispositions'])
        proof=playback(event,receiver,starts,ends,row['source_dispositions']);assert proof['actual_terminal']['stage']=='SCHEDULER_COMPLETED';proofs.append(proof)
    assert proofs[0]['actual_terminal']['elapsed_ms']<=proofs[1]['actual_start']['elapsed_ms']
    assert {event_key(event) for event in events}=={row['event_key'] for row in starts}
    views=receiver['zone_telemetry_samples'];assert len(views)>=8
    assert all(view['limitKmh'] is None for view in views), 'Do not manufacture a road limit from the zone model maximum'
    assert all(view['provider']=='nl.flitsmeister' and view['external'] for view in views)
    approach=[view for view in views if view['approachId'].startswith(trace['native_id']) and view['approachDistanceMeters'] is not None]
    active=[view for view in views if view['zoneActive']]
    assert approach and active and approach[0]['observed_elapsed_ms']<active[0]['observed_elapsed_ms']
    assert all(view['zoneId'].startswith(trace['native_id']) and view['zoneSession']>0 and view['remainingMeters']>=0 for view in active)
    progress=[view['progressPercent'] for view in active];assert all(value is not None and 0<=value<=100 for value in progress)
    assert progress[-1]>progress[0] and all(a<=b for a,b in zip(progress,progress[1:]))
    averages=[view for view in active if view['averageKmh'] is not None]
    assert averages and all(math.isfinite(view['averageKmh']) and 0<view['averageKmh']<=500 and view['partialAverage'] and view['progressEstimated'] for view in averages)
    assert all(view['currentKmh'] is not None and abs(view['currentKmh']-trace['speed_mps']*3.6)<1 for view in views)
    assert not views[-1]['zoneActive'] and not views[-1]['approachId'] and views[-1]['remainingMeters']==-1 and views[-1]['averageKmh'] is None
    assert receiver['probe_completed'] and receiver['output_quiescent'] and receiver['preferences_restored_exactly']
    for prefix in ['source_permissions','window_settings','route_permissions']:
        assert host[prefix+'_restored_exactly'] and host[prefix+'_before']==host[prefix+'_after']
    for package,before in host['preferences_before'].items():
        after=host['final_preferences_cleanup'][package];assert after['restored_exactly'] and after['files']==before['files']
    if host['receiver']=='vela':assert host['vela_permissions_restored_exactly'] and host['vela_permissions_before']==host['vela_permissions_after']
    return {'receiver':receiver['package'],'apps':host['installed_sha256'],'helpers':host['helper_sha256'],
            'native_id':trace['native_id'],'actual_zone_playback':proofs,'source_native_fixes':len(native),
            'receiver_gps_fixes':len(receiver['native_location_samples']),'receiver_approach_samples':len(approach),
            'receiver_active_samples':len(active),'receiver_partial_average_samples':len(averages),
            'unknown_road_limit_preserved':all(view['limitKmh'] is None for view in views),
            'native_zone_data_cleared':True,'exact_rollback_verified':True,'raw_sha256':data['raw_sha256'],
            'scope':'Original detector/manager on one private average-speed camera segment with real GNSS; entry/exit speech, native path state and schema1 approach/progress/observed-partial-average/clear. No trip navigation in FM. Same-ID repeat and unsaid-revision acceptance remain open; no numeric road-limit input or physical audibility claimed.'}


def read_run(folder):
    host=json.loads((folder/'result.json').read_text());files={'host':folder/'result.json','outer':folder.parent/'result.json',
        'source':Path(host['warning_suite_source_result']),'receiver':folder/'seed-receiver-result.json','trace':Path(host['native_zone_trace'])}
    data={name:json.loads(path.read_text()) for name,path in files.items()}
    assert hashlib.sha256(files['trace'].read_bytes()).hexdigest()==host['native_zone_trace_sha256']==data['source']['scenarios']['integrated_warning_suite']['native_zone_trace_sha256']
    for name,expected in host['helper_sha256'].items():assert hashlib.sha256((folder/(name+'-helper.apk')).read_bytes()).hexdigest()==expected
    data['raw_sha256']={str(path):hashlib.sha256(path.read_bytes()).hexdigest() for path in files.values()};return data


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('folders',nargs='+',type=Path);parser.add_argument('--output',type=Path,required=True);args=parser.parse_args()
    if args.output.exists():parser.error('Retain previous evidence; select a fresh output')
    proofs=[audit(read_run(folder)) for folder in args.folders];args.output.write_text(json.dumps({'source_version':'15.0/1289','runs':proofs},indent=2)+'\n')
    print(json.dumps({'verified':[row['receiver'] for row in proofs]}))


if __name__=='__main__':main()
