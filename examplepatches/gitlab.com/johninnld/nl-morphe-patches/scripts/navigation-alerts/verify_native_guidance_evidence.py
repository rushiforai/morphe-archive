#!/usr/bin/env python3
"""Audit controlled FM15 route guidance and explicit receiver handover evidence."""
import argparse
import hashlib
import json
from pathlib import Path

from verify_concurrent_warning_evidence import event_key,playback

if not __debug__:
    raise RuntimeError('Run validation without -O or PYTHONOPTIMIZE; assertion checks are required')


def restored(outer):
    assert outer['restored_exactly'] and outer['before']==outer['after']
    assert not outer['cleanup_errors'] and outer['helpers_removed'] and outer['snapshot_removed']


def common(host,source,case):
    assert host['serial']=='emulator-5590' and host['avd']=='native_warnings_ui_api34'
    assert host['probe_completed'] and host['failure'] is None and all(code==0 for code in host['process_exit_codes'].values())
    assert source['probe_completed'] and source['failure'] is None
    assert source['network_and_lease_restored'] and not source['cleanup_errors']
    assert source['target_sha256']==host['installed_sha256']['nl.flitsmeister']
    assert source['probe_sha256']==host['helper_sha256']['source']
    assert case['target_version']=='15.0' and case['target_version_code']==1289 and case['native_binding_profile']=='15.0/1289'
    assert case['process_uid']==source['uid'] and 'Lfc0;->J' in case['actual_native_roots']
    for field in ['production_endpoint_used','provider_native_queue_empty','receiver_source_off_and_quiescent','real_terminal_ack_observed','managed_mute_verified','device_stream_unchanged']:
        assert case[field],field
    for field in ['test_sink_used','raw_packet_emitted','coverage_override_used','detectors_started_by_probe','public_report_submission_called']:
        assert not case[field],field
    for prefix in ['source_permissions','window_settings']:
        assert host[prefix+'_restored_exactly'] and host[prefix+'_before']==host[prefix+'_after']


def external(authority,receiver,acks):
    assert receiver['probe_completed'] and receiver['output_quiescent'] and receiver['preferences_restored_exactly']
    assert len(receiver['actual_speaker_attempts'])==1
    starts=[row for row in receiver['diagnostics'] if row['stage']=='SCHEDULER_STARTED']
    ends=[row for row in receiver['diagnostics'] if row['event_key']==event_key(authority) and row['stage'] in ['SCHEDULER_COMPLETED','SCHEDULER_CANCELLED','SCHEDULER_INTERRUPTED']]
    assert len(starts)==len(ends)==1 and ends[0]['stage']=='SCHEDULER_COMPLETED'
    assert [row['outcome'] for row in acks]==['GRANTED','STARTED','COMPLETED']
    assert all(row['granted'] and row['mode']=='VOICE' for row in acks)
    return playback(authority,receiver,starts,ends,acks)


def guidance_run(data):
    host=data['record'];source=data['source'];receiver=data['receiver'];case=source['scenarios']['integrated_warning_suite']
    common(host,source,case)
    assert receiver['uid']!=source['uid']
    assert host['route_permissions_restored_exactly'] and host['route_permissions_before']==host['route_permissions_after']
    for package,before in host['preferences_before'].items():
        after=host['final_preferences_cleanup'][package]
        assert after['restored_exactly'] and after['files']==before['files']
    route=receiver['actual_native_route']
    assert all(route[field] for field in ['actual_route_ready','native_navigation_active','current_route_present','current_step_present'])
    authority=case['native_guidance_authority']
    assert authority['native_announce_observed'] and authority['priority']==0 and authority['native_subtype']=='ROAD_SERVICE'
    assert authority['relevance']=='moving_emergency' and 'latitude' not in authority and 'longitude' not in authority
    proof=external(authority,receiver,case['native_guidance_source_dispositions'])
    started=proof['actual_start']['elapsed_ms'];completed=proof['actual_terminal']['elapsed_ms']
    if host['receiver']=='maps':
        before=receiver['native_manager_before_warning'];after=receiver['native_manager_after_warning']
        assert before['job_identity']==after['job_identity'] and before['starts']==after['starts']==1
        assert before['controlled_duration_ms']==after['controlled_duration_ms']==10000
        assert before['stops']==before['releases']==before['terminal_count']==0
        assert after['stops']==after['releases']==after['terminal_count']==1
        assert after['terminal_result']=='CANCELLED' and after['native_player_cleared'] and after['native_job_cancel_flag']
        events=after['events']
        assert any(row['event']=='media_start_return' and row['detail']=='isPlaying=true' for row in events)
        def time(name):
            event,=[row for row in events if row['event']==name]
            return event['elapsed_realtime_ns']/1000000
        assert time('native_manager_start_callback')<=time('media_start_return')<authority['issued_elapsed_ms']
        assert time('media_start_return')<time('media_stop_enter')<=time('media_stop_return')<=time('media_release_return')<=started
        assert after['new_current_route_pull_job'] and after['new_current_route_pull_job']!=after['job_identity']
        assert completed<=after['regeneration_observed_elapsed_ms']
        native={'before':before,'after':after,'scope':'Controlled native manager media actually started/stopped/released. Distinct current-route pull job created after external completion; subsequent native playback is not witnessed.'}
    else:
        assert host['receiver']=='vela' and receiver['native_vela_original_listener_restored']
        assert host['vela_permissions_restored_exactly'] and host['vela_permissions_before']==host['vela_permissions_after']
        assert host['hidden_api_policy_restored_exactly'] and host['hidden_api_policy_before']==host['hidden_api_policy_after']
        before=receiver['native_vela_guidance_before_warning'];after=receiver['native_vela_guidance_after_warning']
        for snapshot in [before,after]:
            assert all(snapshot['actual_route'][field] for field in ['native_navigation_active','current_route_present','current_step_present'])
            assert not snapshot['actual_route']['native_navigation_paused'] and not snapshot['actual_route']['native_arrived']
        assert before['actual_route']['route_identity']==after['actual_route']['route_identity']==route['route_identity']
        assert before['controlled_native_id']==after['controlled_native_id'] and after['regenerated_native_id']!=after['controlled_native_id']
        events=after['events']
        def time(identity,event):
            row,=[row for row in events if row['id']==identity and row['event']==event]
            return row['elapsed_ms']
        assert time(after['controlled_native_id'],'start')<authority['issued_elapsed_ms']
        assert time(after['controlled_native_id'],'stop_interrupted')<=started
        assert after['external_done_elapsed_ms']==completed<time(after['regenerated_native_id'],'start')
        assert not after['regenerated_native_id'].startswith('vela-warning-')
        assert host['fresh_post_warning_fix']
        native={'before':before,'after':after,'fresh_host_fix_request':host['fresh_post_warning_fix'],
                'scope':'Controlled original guide content STARTED, then stopped before external start. Distinct native content STARTED on same actual route after external completion. Fresh host GNSS requested; no actual receiver GPS sample archived to prove fix causality.'}
    return {'receiver':host['receiver'],'apps':host['installed_sha256'],'helpers':host['helper_sha256'],
            'actual_route':route,'external_playback':proof,'native_guidance':native,'exact_subrun_cleanup_verified':True}


def guidance(data):
    outer=data['outer'];assert outer['completed'];restored(outer)
    runs=[guidance_run(data['runs'][name]) for name in ['maps','vela']]
    assert all(run['apps']==outer['installed'] for run in runs)
    return {'source_version':'15.0/1289','runs':runs,'exact_outer_rollback_verified':True,
            'scope':'Controlled native guide input on actual app-created routes, source-produced P0 phone-speaker preemption and route regeneration. Not natural maneuver triggering, next-step transitions, physical audibility/driving or car output.'}


def handover(data):
    host=data['record'];source=data['source'];case=source['scenarios']['integrated_handover'];common(host,source,case)
    restored(data['outer'])
    assert host['receiver_permissions_restored_exactly'] and host['receiver_permissions_before']==host['receiver_permissions_after']
    receivers=data['receivers'];assert len({source['uid'],receivers['maps']['uid'],receivers['vela']['uid']})==3
    assert case['both_confirmed_before_first_warning'] and case['contender_busy_observed_before_release']
    rows=case['handover_records'];assert [row['index'] for row in rows]==[1,2]
    assert [row['owner'] for row in rows]==[receivers['maps']['package'],receivers['vela']['package']]
    proofs=[external(row['authority'],receivers[name],row['source_dispositions']) for name,row in zip(['maps','vela'],rows)]
    busy=host['contender_busy_state'];assert busy in receivers['vela']['states']
    assert busy['audio']=='BUSY:'+receivers['maps']['package'] and busy['session']=='ready'
    release,=[row for row in receivers['maps']['states'] if row['session']=='off' and row['audio']=='DISCONNECTED']
    assert proofs[0]['actual_terminal']['elapsed_ms']<=busy['elapsed_ms']<release['elapsed_ms']<=rows[1]['authority']['issued_elapsed_ms']
    busy_cancel,=[row for row in receivers['vela']['diagnostics'] if row['stage']=='SCHEDULER_CANCELLED' and row['event_key']==event_key(rows[0]['authority'])]
    assert busy['elapsed_ms']<=busy_cancel['elapsed_ms']<=release['elapsed_ms']
    return {'source_version':'15.0/1289','apps':host['installed_sha256'],'helpers':host['helper_sha256'],
            'contender_busy_state':busy,'unstarted_contender_cancel':busy_cancel,'explicit_owner_disconnect':release,'playback_proofs':proofs,
            'exact_subrun_cleanup_verified':True,'exact_outer_rollback_verified':True,
            'outer_completed':data['outer'].get('completed',False),'outer_failure':data['outer'].get('failure'),
            'scope':'Accepted handover subrun only: two independent visible receiver UIDs; BUSY then explicit owner disconnect and next owner playback. The containing cohort failed death-maps; this does not accept process-death recovery.'}


def read_data(root,kind):
    def read(file):return json.loads(file.read_text())
    files=[]
    def record(file):files.append(file);return read(file)
    if kind=='guidance':
        data={'outer':record(root/'result.json'),'runs':{}}
        for name in ['maps','vela']:
            folder=root/name;host=record(folder/'result.json')
            data['runs'][name]={'record':host,'source':record(Path(host['warning_suite_source_result'])),'receiver':record(folder/'seed-receiver-result.json')}
    else:
        host=record(root/'result.json');data={'record':host,'outer':record(root.parent/'result.json'),'source':record(Path(host['source_result'])),
            'receivers':{name:record(root/(name+'-result.json')) for name in ['maps','vela']}}
    proof=(guidance if kind=='guidance' else handover)(data)
    proof['raw_sha256']={str(file):hashlib.sha256(file.read_bytes()).hexdigest() for file in files}
    return proof


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('kind',choices=['guidance','handover']);parser.add_argument('folder',type=Path);parser.add_argument('--output',type=Path,required=True);args=parser.parse_args()
    if args.output.exists():parser.error('Use a fresh output file; retain previous evidence')
    args.output.write_text(json.dumps(read_data(args.folder,args.kind),indent=2)+'\n')
    print(json.dumps({'verified':args.kind,'output':str(args.output)}))


if __name__=='__main__':main()
