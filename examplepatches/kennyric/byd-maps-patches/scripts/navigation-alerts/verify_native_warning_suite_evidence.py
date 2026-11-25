#!/usr/bin/env python3
"""Audit FM15's accepted native warning suite through both actual receiving maps."""
import argparse
import hashlib
import json
from pathlib import Path
import re
from verify_moving_camera_evidence import event_key

if not __debug__:
    raise RuntimeError("Run validation without -O or PYTHONOPTIMIZE; assertion checks are required")

SUBTYPES=('SPEED_50','SPEED_100','SPEED_130','WRONG_WAY_DRIVER','PERSON_ON_ROAD',
          'STATIONARY_VEHICLE','OBSTACLE','AMBULANCE','FIRE_DEPARTMENT','POLICE','ROAD_SERVICE')
SEMANTICS=('provider_session','warning_id','announcement_index','phase','native_type','native_subtype',
           'native_family','category','priority','relevance','relationship','message','message_origin',
           'language_tag','native_text_key','latitude','longitude','native_instruction',
           'native_instruction_language_tag','native_announced_text')

def sha(file):
    return hashlib.sha256(file.read_bytes()).hexdigest()

def verify(folder):
    record_file=folder/'result.json';receiver_file=folder/'seed-receiver-result.json'
    record=json.loads(record_file.read_text());source_file=Path(record['warning_suite_source_result'])
    source=json.loads(source_file.read_text());receiver=json.loads(receiver_file.read_text())
    assert record['probe_completed'] and record['failure'] is None
    assert record['serial']=='emulator-5590' and record['avd']=='native_warnings_ui_api34'
    assert record['warning_suite_cases']=='all' and record['warning_categories']==127
    assert all(value==0 for value in record['process_exit_codes'].values())
    assert source['probe_completed'] and source['failure'] is None
    assert source['network_and_lease_restored'] and not source['cleanup_errors']
    assert source['target_sha256']==record['installed_sha256']['nl.flitsmeister']
    assert source['probe_sha256']==record['helper_sha256']['source']
    assert all(re.fullmatch('[a-f0-9]{64}',value) for value in [*record['installed_sha256'].values(),*record['helper_sha256'].values()])
    for key in ['source_permissions','window_settings']:
        assert record[key+'_restored_exactly'] and record[key+'_before']==record[key+'_after'],key
    assert set(record['final_preferences_cleanup'])==set(record['preferences_before'])
    for package,before in record['preferences_before'].items():
        after=record['final_preferences_cleanup'][package]
        assert after['restored_exactly'] and after['files']==before['files'],package
    if record['receiver']=='vela':
        assert record['vela_permissions_restored_exactly'] and record['vela_permissions_before']==record['vela_permissions_after']
    case=source['scenarios']['integrated_warning_suite']
    assert case['target_version']=='15.0' and case['target_version_code']==1289 and case['native_binding_profile']=='15.0/1289'
    assert case['probe_completed'] and case['process_uid']==source['uid'] and source['uid']!=receiver['uid']
    for key in ['production_endpoint_used','provider_native_queue_empty','receiver_source_off_and_quiescent','real_terminal_ack_observed','managed_mute_verified','device_stream_unchanged']:
        assert case[key],key
    for key in ['test_sink_used','raw_packet_emitted','coverage_override_used','detectors_started_by_probe','public_report_submission_called']:
        assert not case[key],key
    assert 'Lfc0;->J' in case['actual_native_roots']
    assert receiver['status']=='observed' and receiver['output_quiescent'] and receiver['preferences_restored_exactly']
    assert receiver['package'] in record['installed_sha256']
    rows=case['warning_suite_records'];assert [row['native_subtype'] for row in rows]==list(SUBTYPES)
    attempts=receiver['actual_speaker_attempts'];diagnostics=receiver['diagnostics']
    assert len(attempts)==11 and len({row['attempt_id'] for row in attempts})==11
    assert sum(row['stage']=='SCHEDULER_STARTED' for row in diagnostics)==11
    assert sum(row['stage']=='SCHEDULER_COMPLETED' for row in diagnostics)==11
    results=[];intervals=[]
    for index,row in enumerate(rows):
        assert row['index']==index and row['source_terminal']=='COMPLETED'
        authority=row['authority'];key=event_key(authority)
        assert authority['operation']=='ANNOUNCE' and authority['native_announce_observed']
        assert authority['native_subtype']==row['native_subtype']
        assert authority['message'] and authority['language_tag'] and authority['native_text_key']
        assert row['expected_native_text_fragment'] in authority['message']
        speaker,=[item for item in attempts if item['event_key']==key]
        assert speaker['started']
        for field in SEMANTICS:assert speaker['payload'].get(field)==authority.get(field),field
        accepted,=[item for item in diagnostics if item['event_key']==key and item['stage']=='RECEIVER_ACCEPTED' and item['sequence']==authority['sequence']]
        started,=[item for item in diagnostics if item['event_key']==key and item['stage']=='SCHEDULER_STARTED']
        completed,=[item for item in diagnostics if item['event_key']==key and item['stage']=='SCHEDULER_COMPLETED']
        assert authority['issued_elapsed_ms']<=accepted['elapsed_ms']<=started['elapsed_ms']<completed['elapsed_ms']
        assert started['elapsed_ms']<authority['announce_until_elapsed_ms']
        acknowledgements=row['source_dispositions']
        assert [item['outcome'] for item in acknowledgements]==['GRANTED','STARTED','COMPLETED']
        for item in acknowledgements:
            assert item['event_key']==key and item['attempt_id']==speaker['attempt_id']
            assert item['receiver_uid']==receiver['uid'] and item['mode']=='VOICE' and item['granted']
        assert [item['started'] for item in acknowledgements]==[False,True,True]
        assert acknowledgements[0]['observed_elapsed_ms']<=acknowledgements[1]['observed_elapsed_ms']<=acknowledgements[2]['observed_elapsed_ms']
        assert started['elapsed_ms']<=acknowledgements[1]['observed_elapsed_ms']
        assert completed['elapsed_ms']<=acknowledgements[2]['observed_elapsed_ms']
        if row['family']=='early':
            assert not row['controlled_native_input']['native_gps_present'] and row['controlled_native_input']['native_speed_mps']==0
            assert 'latitude' not in authority and 'longitude' not in authority
            assert authority['category']=='emergency_vehicle' and authority['priority']==0 and authority['relevance']=='moving_emergency'
        intervals.append((started['elapsed_ms'],completed['elapsed_ms']))
        results.append({'native_subtype':row['native_subtype'],'event_key':key,'attempt_id':speaker['attempt_id'],
                        'message':authority['message'],'language_tag':authority['language_tag'],
                        'issued_to_start_ms':started['elapsed_ms']-authority['issued_elapsed_ms'],
                        'actual_start_elapsed_ms':started['elapsed_ms'],'actual_complete_elapsed_ms':completed['elapsed_ms'],
                        'source_ack_outcomes':[item['outcome'] for item in acknowledgements]})
    intervals.sort();assert all(intervals[index][1]<=intervals[index+1][0] for index in range(len(intervals)-1))
    return {'receiver':record['receiver'],'target_package':receiver['package'],'source_version':'15.0/1289',
            'installed_sha256':record['installed_sha256'],'helper_sha256':record['helper_sha256'],
            'raw_sha256':{str(file):sha(file) for file in [record_file,source_file,receiver_file]},
            'cases':results,'actual_starts':11,'actual_completions':11,'duplicate_starts':0,
            'exact_cleanup_verified':True,'source_uid':source['uid'],'receiver_uid':receiver['uid']}

def audit(folder):
    file=folder/'result.json';outer=json.loads(file.read_text())
    assert outer['completed'] and outer['restored_exactly'] and outer['before']==outer['after']
    assert not outer['cleanup_errors'] and outer['snapshot_removed'] and outer['helpers_removed']
    runs=[verify(folder/name) for name in ['maps','vela']]
    assert all(run['installed_sha256']==outer['installed'] for run in runs)
    assert runs[0]['helper_sha256']==runs[1]['helper_sha256']
    return {'format':1,'source_version':'15.0/1289','outer_raw_sha256':sha(file),'runs':runs,
            'actual_starts':22,'actual_completions':22,'exact_cleanup_verified':True,
            'scope':'Controlled original accepted native warning entries through actual Maps/Vela phone speakers. Native text/language, authority identity, unique callbacks and source acknowledgements joined. No natural detector, moving lead/route, car-output or physical-audibility acceptance is claimed.'}

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('folder',type=Path);parser.add_argument('--output',type=Path,required=True);args=parser.parse_args()
    if args.output.exists():parser.error('Use a fresh output file; retain previous evidence')
    result=audit(args.folder);args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({'verified_receivers':2,'actual_starts':22,'actual_completions':22,'output':str(args.output)}))
if __name__=='__main__':main()
