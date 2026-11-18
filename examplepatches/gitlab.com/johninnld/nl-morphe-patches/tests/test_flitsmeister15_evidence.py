"""Accepted FM15 run copies must join source, actual output and cleanup offline."""
import copy
import gzip
import importlib.util
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

ROOT=Path(__file__).resolve().parents[1]
def load(name):
    spec=importlib.util.spec_from_file_location(name,ROOT/'scripts/navigation-alerts'/(name+'.py'))
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module
MOVING=load('verify_moving_camera_evidence')
with patch.dict(sys.modules,{'verify_moving_camera_evidence':MOVING}):
    SUITE=load('verify_native_warning_suite_evidence')
BASELINE=json.loads(gzip.decompress((ROOT/'tests/fixtures/navigation-warnings/flitsmeister15-integration-baseline.json.gz').read_bytes()))

def verify(data):
    root=Path('/offline-fm15-integration');files={str(root/'result.json'):data['outer']}
    for name,run in data['runs'].items():
        files[str(root/name/'result.json')]=run['record'];files[str(root/name/'seed-receiver-result.json')]=run['receiver'];files[run['record']['warning_suite_source_result']]=run['source']
    def text(path,*args,**kwargs):return json.dumps(files[str(path)])
    with patch.object(Path,'read_text',new=text),patch.object(Path,'read_bytes',new=lambda path,*a,**k:text(path).encode()):return SUITE.audit(root)

class Fm15SuiteEvidenceTest(unittest.TestCase):
    def test_actual_eleven_cases_for_both_receivers_pass_independent_join(self):
        result=verify(BASELINE);self.assertEqual(result['actual_starts'],22);self.assertEqual(result['actual_completions'],22);self.assertTrue(result['exact_cleanup_verified'])

    def test_modified_language_text_subtype_or_duplicate_start_is_rejected(self):
        for name in ['maps','vela']:
            for mutation in ['language','message','subtype','duplicate','source_ack','cleanup','artifact']:
                with self.subTest(receiver=name,mutation=mutation):
                    data=copy.deepcopy(BASELINE);run=data['runs'][name]
                    if mutation=='language':run['receiver']['actual_speaker_attempts'][0]['payload']['language_tag']='zz-ZZ'
                    elif mutation=='message':run['receiver']['actual_speaker_attempts'][0]['payload']['message']='Changed spoken text'
                    elif mutation=='subtype':run['receiver']['actual_speaker_attempts'][0]['payload']['native_subtype']='SPEED_999'
                    elif mutation=='duplicate':run['receiver']['diagnostics'].append(copy.deepcopy(next(row for row in run['receiver']['diagnostics'] if row['stage']=='SCHEDULER_STARTED')))
                    elif mutation=='source_ack':run['source']['scenarios']['integrated_warning_suite']['warning_suite_records'][0]['source_dispositions'][-1]['attempt_id']='different-attempt'
                    elif mutation=='cleanup':run['record']['source_permissions_after']['android.permission.ACCESS_FINE_LOCATION']['granted']=True
                    elif mutation=='artifact':run['source']['target_sha256']='0'*64
                    with self.assertRaises(AssertionError):verify(data)

    def test_failed_or_incomplete_outer_run_cannot_be_curated(self):
        data=copy.deepcopy(BASELINE);data['outer']['completed']=False
        with self.assertRaises(AssertionError):verify(data)


MOVING_BASELINES=json.loads(gzip.decompress((ROOT/'tests/fixtures/navigation-warnings/flitsmeister15-moving-source-positive.json.gz').read_bytes()))
def verify_moving(data):
    folder=Path('/offline-fm15-moving')/data['name']
    files={str(folder/'result.json'):data['record'],str(folder/'seed-receiver-result.json'):data['receiver'],data['record']['warning_suite_source_result']:data['source']}
    def text(path,*args,**kwargs):return json.dumps(files[str(path)])
    with patch.object(Path,'read_text',new=text),patch.object(Path,'read_bytes',new=lambda path,*a,**k:text(path).encode()):return MOVING.verify(folder)


def source_motion(data):
    case=data['source']['scenarios']['integrated_warning_suite'];receiver=data['receiver'];results=[]
    for row in case['moving_camera_records']:
        authority=row['authority'];key=MOVING.event_key(authority)
        speaker,=[item for item in receiver['actual_speaker_attempts'] if item['event_key']==key]
        started,=[item for item in receiver['diagnostics'] if item['event_key']==key and item['stage']=='SCHEDULER_STARTED']
        completed,=[item for item in receiver['diagnostics'] if item['event_key']==key and item['stage']=='SCHEDULER_COMPLETED']
        results.append(MOVING.verify_fm15_motion(case,row,authority,started,completed,speaker,receiver))
    return results

class Fm15MovingSourceEvidenceTest(unittest.TestCase):
    def test_actual_source_pipeline_witnesses_are_positive_but_not_complete_receiving_passage(self):
        for baseline in MOVING_BASELINES:
            with self.subTest(run=baseline['name']):
                self.assertEqual(len(source_motion(baseline)),3)
                with self.assertRaisesRegex(AssertionError,'receiving GPS passage'):
                    verify_moving(baseline)

    def test_missing_or_changed_native_source_witnesses_are_rejected(self):
        for baseline in MOVING_BASELINES:
            for mutation in ['source_gps','radius','policy','override','natural_clear','active_withdrawal','early_clear','source_ack','tile']:
                with self.subTest(run=baseline['name'],mutation=mutation):
                    data=copy.deepcopy(baseline);case=data['source']['scenarios']['integrated_warning_suite'];row=case['moving_camera_records'][0]
                    if mutation=='source_gps':row['native_fixes'][0]['provider']='synthetic'
                    elif mutation=='radius':row['native_active_decision_sample']['native_calculated_radius_m']=None
                    elif mutation=='policy':row['native_policy']['default_seconds_radius']=99
                    elif mutation=='override':case['source_location_override_used']=True
                    elif mutation=='natural_clear':row['natural_native_removal_observed']=False
                    elif mutation=='active_withdrawal':row['candidate_restore']['was_native_warning_active']=True
                    elif mutation=='early_clear':row['native_clear']['issued_elapsed_ms']=row['target_crossed_elapsed_ms']-1
                    elif mutation=='source_ack':row['source_dispositions'][-1]['attempt_id']='different-attempt'
                    elif mutation=='tile':case['planned_source_tile']['latitude_max']+=1
                    with self.assertRaises(AssertionError):source_motion(data)

CONCURRENT=load('verify_concurrent_warning_evidence')
CONCURRENT_BASELINES=json.loads(gzip.decompress((ROOT/'tests/fixtures/navigation-warnings/flitsmeister15-concurrent-baseline.json.gz').read_bytes()))
def verify_concurrent(data):
    folder=Path('/offline-fm15-concurrent')/data['name']
    files={str(folder/'result.json'):data['record'],str(folder/'seed-receiver-result.json'):data['receiver'],data['record']['warning_suite_source_result']:data['source']}
    with patch.object(Path,'read_text',new=lambda path,*a,**k:json.dumps(files[str(path)])):
        return CONCURRENT.audit(folder)

class Fm15ConcurrentEvidenceTest(unittest.TestCase):
    def test_actual_preempted_attempt_keeps_false_sample_and_joins_native_start_ack(self):
        for baseline in CONCURRENT_BASELINES:
            result=verify_concurrent(baseline)
            preempted=result['pairs'][1]['events'][0]
            self.assertFalse(preempted['actual_speaker_attempt']['started'])
            self.assertEqual(preempted['source_started_ack']['outcome'],'STARTED')
            self.assertEqual(result['actual_starts_including_warmup'],7)

    def test_missing_duplicate_callback_wrong_ack_or_payload_is_rejected(self):
        for baseline in CONCURRENT_BASELINES:
            for mutation in ['missing_start','duplicate_start','ack_attempt','ack_uid','ack_started','missing_ack','message','language','subtype']:
                with self.subTest(receiver=baseline['name'],mutation=mutation):
                    data=copy.deepcopy(baseline);case=data['source']['scenarios']['integrated_warning_suite'];pair=case['concurrent_warning_records'][1]
                    payload=next(row for row in data['receiver']['actual_speaker_attempts'] if row['payload']['warning_id']==pair['first_authority']['warning_id'])
                    key=payload['event_key'];callback=next(row for row in data['receiver']['diagnostics'] if row['event_key']==key and row['stage']=='SCHEDULER_STARTED')
                    ack=next(row for row in pair['source_dispositions'] if row['event_key']==key and row['outcome']=='STARTED')
                    if mutation=='missing_start':data['receiver']['diagnostics'].remove(callback)
                    elif mutation=='duplicate_start':data['receiver']['diagnostics'].append(copy.deepcopy(callback))
                    elif mutation=='ack_attempt':ack['attempt_id']='different'
                    elif mutation=='ack_uid':ack['receiver_uid']+=1
                    elif mutation=='ack_started':ack['started']=False
                    elif mutation=='missing_ack':pair['source_dispositions'].remove(ack)
                    elif mutation=='message':payload['payload']['message']='changed'
                    elif mutation=='language':payload['payload']['language_tag']='zz-ZZ'
                    elif mutation=='subtype':payload['payload']['native_subtype']='changed'
                    with self.assertRaises(AssertionError):verify_concurrent(data)

MOVING_COMPLETE=json.loads(gzip.decompress((ROOT/'tests/fixtures/navigation-warnings/flitsmeister15-moving-baseline.json.gz').read_bytes()))
def verify_moving_cohort(data):
    root=Path('/offline-moving-cohort');files={str(root/'result.json'):data['outer']}
    for name,run in data['runs'].items():
        files[str(root/name/'result.json')]=run['record'];files[str(root/name/'seed-receiver-result.json')]=run['receiver'];files[run['record']['warning_suite_source_result']]=run['source']
    def text(path,*a,**k):return json.dumps(files[str(path)])
    with patch.object(Path,'read_text',new=text),patch.object(Path,'read_bytes',new=lambda path,*a,**k:text(path).encode()):return MOVING.audit_cohort(root)

class Fm15CompleteMovingEvidenceTest(unittest.TestCase):
    def test_real_complete_three_speeds_both_receivers_pass_strict_audit(self):
        proof=verify_moving_cohort(MOVING_COMPLETE)
        self.assertEqual(proof['actual_starts'],6);self.assertEqual(proof['actual_completions'],6)
        self.assertTrue(proof['exact_outer_rollback_verified'])
        for run in proof['runs']:
            self.assertTrue(all(row['receiver_crossing_witness'] for row in run['cases']))

    def test_actual_passage_tail_and_semantic_negative_controls(self):
        for name in ['maps','vela']:
            for mutation in ['receiver_passage','tail_duration','tail_source_gps','tail_clear','message','language','source_ack','duplicate_start']:
                with self.subTest(receiver=name,mutation=mutation):
                    data=copy.deepcopy(MOVING_COMPLETE);run=data['runs'][name];case=run['source']['scenarios']['integrated_warning_suite'];row=case['moving_camera_records'][0];receiver=run['receiver']
                    speaker=next(item for item in receiver['actual_speaker_attempts'] if item['event_key']==MOVING.event_key(row['authority']))
                    if mutation=='receiver_passage':
                        for fix in receiver['native_location_samples']:fix['latitude']=row['target_latitude']-.001
                    elif mutation=='tail_duration':row['receiver_gps_settling_tail']['observed_duration_ms']=1
                    elif mutation=='tail_source_gps':row['receiver_gps_settling_tail']['native_fixes'][0]['provider']='synthetic'
                    elif mutation=='tail_clear':row['receiver_gps_settling_tail']['after_native_clear_sequence']-=1
                    elif mutation=='message':speaker['payload']['message']='changed'
                    elif mutation=='language':speaker['payload']['language_tag']='zz-ZZ'
                    elif mutation=='source_ack':row['source_dispositions'][-1]['attempt_id']='wrong'
                    elif mutation=='duplicate_start':receiver['diagnostics'].append(copy.deepcopy(next(item for item in receiver['diagnostics'] if item['stage']=='SCHEDULER_STARTED')))
                    with self.assertRaises(AssertionError):verify_moving_cohort(data)

    def test_incomplete_outer_cleanup_cannot_be_curated(self):
        for field in ['completed','restored_exactly','helpers_removed','snapshot_removed']:
            data=copy.deepcopy(MOVING_COMPLETE);data['outer'][field]=False
            with self.subTest(field=field),self.assertRaises(AssertionError):verify_moving_cohort(data)

with patch.dict(sys.modules,{'verify_concurrent_warning_evidence':CONCURRENT}):
    GUIDANCE=load('verify_native_guidance_evidence')
GUIDANCE_BASELINE=json.loads(gzip.decompress((ROOT/'tests/fixtures/navigation-warnings/flitsmeister15-guidance-handover-baseline.json.gz').read_bytes()))
class Fm15GuidanceHandoverEvidenceTest(unittest.TestCase):
    def test_actual_guidance_and_handover_subrun_have_bounded_acceptance(self):
        proof=GUIDANCE.guidance(GUIDANCE_BASELINE['guidance']);self.assertEqual(len(proof['runs']),2)
        proof=GUIDANCE.handover(GUIDANCE_BASELINE['handover']);self.assertFalse(proof['outer_completed']);self.assertTrue(proof['outer_failure']);self.assertEqual(len(proof['playback_proofs']),2)

    def test_guidance_requires_native_stop_regeneration_exact_payload_and_ack(self):
        for name in ['maps','vela']:
            for mutation in ['language','ack_uid','native_stop','regeneration','route','cleanup']:
                with self.subTest(receiver=name,mutation=mutation):
                    data=copy.deepcopy(GUIDANCE_BASELINE['guidance']);run=data['runs'][name];receiver=run['receiver'];case=run['source']['scenarios']['integrated_warning_suite']
                    if mutation=='language':receiver['actual_speaker_attempts'][0]['payload']['language_tag']='zz-ZZ'
                    elif mutation=='ack_uid':case['native_guidance_source_dispositions'][1]['receiver_uid']+=1
                    elif mutation=='native_stop':
                        if name=='maps':receiver['native_manager_after_warning']['stops']=0
                        else:receiver['native_vela_guidance_after_warning']['events']=[row for row in receiver['native_vela_guidance_after_warning']['events'] if row['event']!='stop_interrupted']
                    elif mutation=='regeneration':
                        if name=='maps':receiver['native_manager_after_warning']['new_current_route_pull_job']=receiver['native_manager_after_warning']['job_identity']
                        else:receiver['native_vela_guidance_after_warning']['regenerated_native_id']=receiver['native_vela_guidance_after_warning']['controlled_native_id']
                    elif mutation=='route':receiver['actual_native_route']['current_step_present']=False
                    elif mutation=='cleanup':data['outer']['helpers_removed']=False
                    with self.assertRaises((AssertionError,ValueError)):GUIDANCE.guidance(data)

    def test_handover_requires_busy_release_ack_identity_and_unique_start(self):
        for mutation in ['busy','release','ack_attempt','ack_uid','duplicate_start','payload']:
            with self.subTest(mutation=mutation):
                data=copy.deepcopy(GUIDANCE_BASELINE['handover']);r=data['receivers']['vela'];case=data['source']['scenarios']['integrated_handover']
                if mutation=='busy':data['record']['contender_busy_state']['audio']='READY'
                elif mutation=='release':data['receivers']['maps']['states']=[row for row in data['receivers']['maps']['states'] if row['audio']!='DISCONNECTED']
                elif mutation=='ack_attempt':case['handover_records'][1]['source_dispositions'][1]['attempt_id']='wrong'
                elif mutation=='ack_uid':case['handover_records'][1]['source_dispositions'][1]['receiver_uid']+=1
                elif mutation=='duplicate_start':r['diagnostics'].append(copy.deepcopy(next(row for row in r['diagnostics'] if row['stage']=='SCHEDULER_STARTED')))
                elif mutation=='payload':r['actual_speaker_attempts'][0]['payload']['message']='changed'
                with self.assertRaises((AssertionError,ValueError)):GUIDANCE.handover(data)

if __name__=='__main__':unittest.main()
