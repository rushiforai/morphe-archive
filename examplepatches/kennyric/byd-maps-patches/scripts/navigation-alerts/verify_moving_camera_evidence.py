#!/usr/bin/env python3
"""Join original camera decisions, real receiver GPS and playback acknowledgements."""
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct

if not __debug__:
    raise RuntimeError("Run validation without -O or PYTHONOPTIMIZE; assertion checks are required")



def event_key(authority):
    # The private fixture IDs are ASCII, so Java writeUTF has ordinary UTF-8 bytes.
    values = [authority['provider_session'], authority['warning_id'], authority['phase'].upper()]
    data = b''
    for value in values:
        encoded = value.encode('ascii')
        data += struct.pack('>H', len(encoded)) + encoded
    return hashlib.sha256(data + struct.pack('>q', authority['announcement_index'])).hexdigest()


FM15_PATH='fm15-report-events-v2-single-tile'
FM15_TAIL_PATH='fm15-report-events-v3-settling-tail'


def profile(case):
    value=case.get('native_binding_profile')
    if value in (None,'14.17/1287'):
        assert case.get('target_version','14.17')=='14.17' and case.get('target_version_code',1287)==1287
        assert not case.get('moving_camera_path'), 'FM15 pipeline cannot use the legacy task profile'
        return 14
    assert value=='15.0/1289' and case.get('target_version')=='15.0' and case.get('target_version_code')==1289
    assert case.get('moving_camera_path') in (FM15_PATH,FM15_TAIL_PATH), 'Only exact audited FM15 pipeline profiles are supported'
    return 15


def tile_bounds(geohash):
    assert isinstance(geohash,str) and len(geohash)==5
    alphabet='0123456789bcdefghjkmnpqrstuvwxyz';longitude=[-180.0,180.0];latitude=[-90.0,90.0];odd=True
    for character in geohash:
        assert character in alphabet
        value=alphabet.index(character)
        for mask in (16,8,4,2,1):
            interval=longitude if odd else latitude;midpoint=sum(interval)/2
            interval[0 if value&mask else 1]=midpoint;odd=not odd
    return latitude,longitude


def source_fix(sample,speed):
    assert sample['provider']=='gps', 'Actual native source GPS is required'
    assert 0<=sample['source_age_ms']<2000 and sample['source_elapsed_realtime_nanos']>0
    assert math.isclose(sample['speed_mps'],speed,abs_tol=.1) and sample['accuracy_m']<=30
    assert abs(sample['bearing'])<1
    for field,value in [('native_service_class','wd6'),('native_provider_class','pef'),('native_candidate_state_class','iji'),('native_engine_class','ajf'),('native_alert_manager_class','xl')]:
        assert sample[field]==value,field
    assert sample['native_job1_class'] and sample['native_job2_class']


def verify_fm15_motion(case,row,authority,started,completed,speaker,receiver):
    for field in ['source_location_override_used','native_history_override_used','native_policy_override_used','candidate_reapply_used']:
        assert case[field] is False,field
    assert row['native_policy']=={'default_seconds_radius':20,'speed_trap_seconds_radius':30,'traffic_jam_seconds_radius':30,'toll_max_distance_m':1000}, 'Original native lead configuration'
    assert row['requested_travel_seconds']==row['native_policy']['default_seconds_radius']+12
    speed=row['speed_kmh']/3.6;fixes=row['native_fixes'];assert len(fixes)>=10, 'Actual native source trajectory missing'
    warm=row['native_warmup'];source_fix(warm,speed)
    tile=case['planned_source_tile'];assert tile['precision']==5
    latitude,longitude=tile_bounds(tile['geohash'])
    assert latitude==[tile['latitude_min'],tile['latitude_max']] and longitude==[tile['longitude_min'],tile['longitude_max']], 'Independent precision-5 tile bounds'
    assert row['planned_source_geohash']==tile['geohash'] and tile['interior_latitude_margin_m']>=100
    for point in [warm,*fixes]:
        source_fix(point,speed)
        assert latitude[0]<point['latitude']<latitude[1] and longitude[0]<point['longitude']<longitude[1]
        assert math.isclose(point['longitude'],row['target_longitude'],abs_tol=.000003)
    for value in [row['target_latitude'],row['planned_end_latitude']]:
        assert latitude[0]+tile['interior_latitude_margin_m']/111195<value<latitude[1]-tile['interior_latitude_margin_m']/111195
    assert longitude[0]<row['target_longitude']<longitude[1]
    assert math.isclose(authority['latitude'],row['target_latitude'],abs_tol=1e-10) and math.isclose(authority['longitude'],row['target_longitude'],abs_tol=1e-10)
    timestamps=[point['source_elapsed_realtime_nanos']//1000000 for point in fixes]
    assert timestamps==sorted(set(timestamps)), 'Distinct original source fixes must remain ordered'
    assert all(fixes[index]['latitude']<=fixes[index+1]['latitude'] for index in range(len(fixes)-1))
    crossing,= [point for point in fixes if point['latitude']>=row['target_latitude']][:1]
    crossed=row['target_crossed_elapsed_ms']
    assert crossed==crossing['source_elapsed_realtime_nanos']//1000000, 'Crossing must use the actual source GPS timestamp'
    assert any(point['latitude']<row['target_latitude'] for point in fixes)
    assert 0<=row['target_crossing_observed_elapsed_ms']-crossed<2000
    active=row['native_active_decision_sample'];decision=row['native_decision_sample']
    for sample in [active,decision]:
        source_fix(sample,speed)
        assert sample['native_relevant'] and sample['native_engine_active'] and sample['native_warning_active']
        assert sample['native_validation_path']=='CALCULATED_RADIUS' and sample['native_reason']=='CALCULATED_RADIUS_VALID'
        radius=sample['native_calculated_radius_m'];distance=sample['native_distance_m']
        assert isinstance(radius,(int,float)) and math.isfinite(radius) and radius>0, 'Actual native calculated radius missing'
        assert isinstance(distance,(int,float)) and math.isfinite(distance) and 0<distance<=radius
        assert math.isclose(radius,sample['speed_mps']*row['native_policy']['default_seconds_radius'],rel_tol=.02,abs_tol=1), 'Observed native radius/configuration mismatch'
        assert sample['source_elapsed_realtime_nanos']//1000000<=sample['native_first_active_elapsed_ms']<=authority['issued_elapsed_ms']
    # This probe observes the journal after native dispatch. Its observer timestamp is not the native decision clock.
    assert authority['issued_elapsed_ms']<=row['native_decision_elapsed_ms']<crossed
    assert 0<=row['native_decision_elapsed_ms']-authority['issued_elapsed_ms']<2000
    assert row['native_input_admitted_elapsed_ms']<active['native_first_active_elapsed_ms']
    assert started['elapsed_ms']<=row['source_started_observed_elapsed_ms']<crossed
    assert completed['elapsed_ms']<=row['source_completed_observed_elapsed_ms']<crossed
    assert row['natural_native_removal_observed'] is True
    restored=row['candidate_restore']
    assert restored['restored'] and restored['ever_observed_native_active']
    assert not restored['was_native_warning_active'] and not restored['was_in_native_gps_path'], 'Cleanup must not withdraw an active warning'
    assert row['native_clear']['issued_elapsed_ms']>=crossed, 'Natural source CLEAR must follow actual passage'
    if case['moving_camera_path']==FM15_TAIL_PATH:
        tail=row['receiver_gps_settling_tail']
        assert row['settling_tail_requested_ms']==tail['requested_duration_ms']==4000
        assert tail['after_native_clear_sequence']==row['native_clear']['sequence']
        assert tail['started_elapsed_ms']>=row['native_clear']['issued_elapsed_ms']
        assert tail['observed_duration_ms']==tail['completed_elapsed_ms']-tail['started_elapsed_ms']>=4000
        assert len(tail['gps_requests'])>=3 and len(tail['native_fixes'])>=2
        for request in tail['gps_requests']:
            assert request['origin']=='host_gnss_request_only' and request['phase']=='receiver_gps_settling_tail'
            assert tail['started_elapsed_ms']<=request['source_elapsed_ms']<=tail['completed_elapsed_ms']
            assert latitude[0]<request['latitude']<latitude[1] and longitude[0]<request['longitude']<longitude[1]
        for sample in tail['native_fixes']:
            source_fix(sample,speed)
            assert sample['latitude']>=row['target_latitude'] and sample['past_target_m']>0
            assert latitude[0]<sample['latitude']<latitude[1] and longitude[0]<sample['longitude']<longitude[1]
            assert crossed<=sample['source_elapsed_realtime_nanos']//1000000<=tail['completed_elapsed_ms']
            assert not sample['native_warning_active'] and not sample['native_in_gps_path']
    dispositions=row['source_dispositions']
    assert [value['outcome'] for value in dispositions]==['GRANTED','STARTED','COMPLETED']
    assert [value['started'] for value in dispositions]==[False,True,True]
    assert all(value['attempt_id']==speaker['attempt_id'] and value['event_key']==event_key(authority) and value['receiver_uid']==receiver['uid'] and value['mode']=='VOICE' and value['granted'] for value in dispositions)
    assert dispositions[0]['observed_elapsed_ms']<=dispositions[1]['observed_elapsed_ms']<=dispositions[2]['observed_elapsed_ms']<crossed
    assert 0<=row['source_started_observed_elapsed_ms']-dispositions[1]['observed_elapsed_ms']<250
    assert 0<=row['source_completed_observed_elapsed_ms']-dispositions[2]['observed_elapsed_ms']<250
    return {'native_source_gps_samples':len(fixes),'native_calculated_radius_m':active['native_calculated_radius_m'],
            'native_engine_distance_m':active['native_distance_m'],'native_policy':row['native_policy'],
            'native_first_active_elapsed_ms':active['native_first_active_elapsed_ms'],
            'native_decision_observer_elapsed_ms':row['native_decision_elapsed_ms'],
            'native_to_start_ms':started['elapsed_ms']-active['native_first_active_elapsed_ms'],
            'natural_passage_clear_before_input_withdrawal':True,'precision5_tile':tile['geohash']}


def verify(folder):
    record = json.loads((folder / 'result.json').read_text())
    assert record['probe_completed'] and record['failure'] is None
    assert record['serial'] == 'emulator-5590' and record['avd'] == 'native_warnings_ui_api34'
    assert record['warning_suite_cases'] == 'moving-camera'
    for key in ['route_permissions_restored_exactly', 'source_permissions_restored_exactly',
                'window_settings_restored_exactly']:
        assert record[key], key
    assert all(value['restored_exactly'] for value in record['final_preferences_cleanup'].values())
    source = json.loads(Path(record['warning_suite_source_result']).read_text())
    assert source['probe_completed'] and source['failure'] is None
    assert source['network_and_lease_restored'] and not source['cleanup_errors']
    case = source['scenarios']['integrated_warning_suite']
    assert case['production_endpoint_used'] and not case['test_sink_used']
    assert not case['raw_packet_emitted'] and not case['coverage_override_used']
    assert case['managed_mute_verified'] and case['device_stream_unchanged']
    assert case['provider_native_queue_empty'] and case['receiver_source_off_and_quiescent']
    version=profile(case)
    receiver = json.loads((folder / 'seed-receiver-result.json').read_text())
    assert receiver['status'] == 'observed' and receiver['output_quiescent']
    assert receiver['preferences_restored_exactly'] and receiver['uid'] != source['uid']
    if record['receiver'] == 'vela':
        assert record['vela_permissions_restored_exactly']
    rows = case['moving_camera_records']
    assert [row['speed_kmh'] for row in rows] == [50, 100, 130]
    attempts = receiver['actual_speaker_attempts']
    assert len(attempts) == 3 and len({row['attempt_id'] for row in attempts}) == 3
    diagnostics = receiver['diagnostics']
    assert sum(row['stage'] == 'SCHEDULER_STARTED' for row in diagnostics) == 3
    assert sum(row['stage'] == 'SCHEDULER_COMPLETED' for row in diagnostics) == 3
    results = []
    for row in rows:
        authority = row['authority']
        assert authority['operation'] == 'ANNOUNCE' and authority['native_type'] == 'SPEED_CAM'
        assert authority['native_subtype'] == 'SPEED_' + str(row['speed_kmh'])
        assert authority['relevance'] == 'point_ahead' and authority['priority'] == 1
        if version==15:
            assert authority['native_announce_observed'] and authority['native_family']=='SpeedCam'
            assert authority['message'] and authority['language_tag'] and authority['native_text_key']
            assert authority['message_origin']=='native_text'
        key = event_key(authority)
        speaker, = [attempt for attempt in attempts if attempt['event_key'] == key]
        payload = speaker['payload']
        assert speaker['started']
        for field in ['provider_session', 'warning_id', 'announcement_index', 'phase',
                      'native_type', 'native_subtype', 'category', 'relevance', 'relationship',
                      'message', 'message_origin', 'language_tag', 'native_text_key',
                      'latitude', 'longitude', 'priority']:
            assert payload[field] == authority[field], field
        if version==15:
            for field in ['native_family','native_instruction','native_instruction_language_tag','native_announced_text']:
                assert payload.get(field)==authority.get(field),field
        accepted, = [event for event in diagnostics if event['stage'] == 'RECEIVER_ACCEPTED'
                     and event['sequence'] == authority['sequence'] and event['event_key'] == key]
        started, = [event for event in diagnostics if event['stage'] == 'SCHEDULER_STARTED'
                    and event['event_key'] == key]
        completed, = [event for event in diagnostics if event['stage'] == 'SCHEDULER_COMPLETED'
                      and event['event_key'] == key]
        decision = row['native_decision_elapsed_ms']
        crossed = row['target_crossed_elapsed_ms']
        issued = authority['issued_elapsed_ms']
        if version==14:
            assert row['native_task_class']=='x9i'
            assert decision<=issued
        assert issued <= accepted['elapsed_ms'] <= started['elapsed_ms'] < completed['elapsed_ms'] < crossed
        assert 0 <= started['elapsed_ms'] - issued < 2000, 'Extra receiving delay'
        assert started['elapsed_ms']<authority['announce_until_elapsed_ms']
        assert crossed - started['elapsed_ms'] > 12000, 'Native lead collapsed to a twelve-second gate'
        speed = row['speed_kmh'] / 3.6
        if version==14:assert 19 < row['native_decision_remaining_m'] / speed <= 20.2
        clear = row['native_clear']
        assert clear['operation'] == 'CLEAR' and clear['warning_id'] == authority['warning_id']
        assert clear['announcement_index'] == authority['announcement_index']
        assert clear['provider_session']==authority['provider_session']
        assert clear['sequence'] > authority['sequence'] and clear['issued_elapsed_ms'] >= completed['elapsed_ms']
        assert row['source_terminal'] == 'COMPLETED'
        assert any(value['outcome'] == 'STARTED' and value['started'] for value in row['source_dispositions'])
        assert any(value['outcome'] == 'COMPLETED' and value['started'] for value in row['source_dispositions'])
        assert all(value['receiver_uid'] == receiver['uid'] and value['mode'] == 'VOICE'
                   for value in row['source_dispositions'])
        motion=verify_fm15_motion(case,row,authority,started,completed,speaker,receiver) if version==15 else {}
        native_fixes = row['native_fixes']
        first_fix_ms=native_fixes[0]['source_elapsed_realtime_nanos']//1000000 if version==15 else native_fixes[0]['source_elapsed_ms']
        samples = [fix for fix in receiver['native_location_samples']
                   if first_fix_ms <= fix['fix_elapsed_ms'] <= crossed + 2500
                   and abs(fix['speed_mps'] - speed) < .1]
        assert len(samples) >= 10, 'No moving native receiving location witness'
        assert any(fix['latitude'] < row['target_latitude'] for fix in samples)
        receiving_crossed=any(fix['latitude']>=row['target_latitude'] for fix in samples)
        assert receiving_crossed, 'Actual receiving GPS passage past the target must be witnessed'
        if version==15:
            motion.update({'receiver_crossing_witness':True,
                           'receiver_before_target_sample':next(fix for fix in samples if fix['latitude']<row['target_latitude']),
                           'receiver_after_target_sample':next(fix for fix in samples if fix['latitude']>=row['target_latitude']),
                           'receiver_last_fix_relative_to_source_cross_ms':samples[-1]['fix_elapsed_ms']-crossed})
            if case['moving_camera_path']==FM15_TAIL_PATH:
                tail=row['receiver_gps_settling_tail']
                motion['source_settling_tail']={field:tail[field] for field in ['started_elapsed_ms','completed_elapsed_ms','observed_duration_ms','after_native_clear_sequence']}
        for fix in samples:
            assert fix['provider'] == 'gps' and 0 <= fix['observed_elapsed_ms'] - fix['fix_elapsed_ms'] < 2000
            assert math.isclose(fix['longitude'], row['target_longitude'], abs_tol=0.000003)
        results.append({'speed_kmh': row['speed_kmh'], 'native_decision_distance_m': row['native_decision_remaining_m'],
                        'decision_to_start_ms': started['elapsed_ms'] - decision,
                        'decision_clock_origin':'journal_observer' if version==15 else 'native_task_decision',
                        'issued_to_start_ms': started['elapsed_ms'] - issued,
                        'receiver_accept_to_start_ms': started['elapsed_ms'] - accepted['elapsed_ms'],
                        'started_lead_ms': crossed - started['elapsed_ms'],
                        'completion_lead_ms': crossed - completed['elapsed_ms'],
                        'native_receiving_gps_samples': len(samples), 'native_clear_sequence': clear['sequence'],
                        'message': payload['message'], 'language_tag':payload['language_tag'],
                        'native_text_key':payload['native_text_key'], 'warning_id': authority['warning_id'],
                        'event_key': key, 'attempt_id': speaker['attempt_id'],**motion})
    if version==15:
        assert source['target_sha256']==record['installed_sha256']['nl.flitsmeister'] and source['probe_sha256']==record['helper_sha256']['source']
        for name in ['route_permissions','source_permissions','window_settings']:
            assert record[name+'_before']==record[name+'_after'],name
        for package,before in record['preferences_before'].items():assert record['final_preferences_cleanup'][package]['files']==before['files']
    evidence_files = [folder / 'result.json', folder / 'seed-receiver-result.json',
                      Path(record['warning_suite_source_result'])]
    return {'receiver': record['receiver'], 'folder': str(folder),
            'source_version':'15.0/1289' if version==15 else '14.17/1287','moving_camera_path':case['moving_camera_path'] if version==15 else 'fm14-speedcam-task', 'installed_sha256': record['installed_sha256'],
            'raw_sha256': {str(path): hashlib.sha256(path.read_bytes()).hexdigest() for path in evidence_files},
            'helper_sha256': record['helper_sha256'], 'source_uid': source['uid'], 'receiver_uid': receiver['uid'],
            'cases': results, 'actual_starts': 3, 'actual_completions': 3,
            'extra_start_from_native_update_or_clear': False, 'exact_cleanup_verified': True,
            'scope': ('Existing FM15 report-event pipeline over private candidate augmentation, actual native source/receiving GPS, original configuration/calculated-radius observations and natural passage/CLEAR before input withdrawal. Single stable precision-5 source tile; both source and receiving GPS passage are explicitly witnessed. Not natural repository detection, arbitrary routes, car output or physical driving.' if version==15 else 'Original SpeedCamTask.a/d decisions with private candidate/location fixtures and real emulator GPS in the receiver. No public repository mutation or direct warning-manager trigger; not natural detector, physical driving or car-output acceptance.')}


def audit_cohort(folder):
    file=folder/'result.json';outer=json.loads(file.read_text())
    assert outer['completed'] and outer['restored_exactly'] and outer['before']==outer['after']
    assert not outer['cleanup_errors'] and outer['snapshot_removed'] and outer['helpers_removed']
    runs=[verify(folder/name) for name in ['maps','vela']]
    assert all(run['installed_sha256']==outer['installed'] for run in runs)
    assert runs[0]['helper_sha256']==runs[1]['helper_sha256']
    assert all(run['moving_camera_path']==FM15_TAIL_PATH for run in runs)
    return {'format':1,'source_version':'15.0/1289','runs':runs,
            'outer_raw_sha256':hashlib.sha256(file.read_bytes()).hexdigest(),
            'actual_starts':6,'actual_completions':6,'exact_outer_rollback_verified':True}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('folders', nargs='*', type=Path)
    parser.add_argument('--cohort',type=Path,help='Require both FM15 receiving runs and exact outer rollback')
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if bool(args.folders)==bool(args.cohort):parser.error('Supply folders or one --cohort')
    if args.output.exists():parser.error('Use a fresh output file; retain previous evidence')
    proof=audit_cohort(args.cohort) if args.cohort else {'format':1,'runs':[verify(folder) for folder in args.folders]}
    results=proof['runs']
    args.output.write_text(json.dumps(proof, indent=2) + '\n')
    print(json.dumps({'verified': len(results), 'native_camera_cases': sum(len(row['cases']) for row in results),
                      'output': str(args.output)}))


if __name__ == '__main__':
    main()
