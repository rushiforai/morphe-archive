"""Actual private native camera-zone entry/exit must preserve output and data provenance."""
import copy
import gzip
import importlib.util
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

ROOT=Path(__file__).resolve().parents[1]
BASELINE=json.loads(gzip.decompress((ROOT/'tests/fixtures/navigation-warnings/flitsmeister15-zone-baseline.json.gz').read_bytes()))
with patch.object(sys,'path',[str(ROOT/'scripts/navigation-alerts'),*sys.path]):
    spec=importlib.util.spec_from_file_location('native_zone_evidence',ROOT/'scripts/navigation-alerts/verify_native_zone_evidence.py')
    API=importlib.util.module_from_spec(spec);spec.loader.exec_module(API)


class ZoneEvidenceTest(unittest.TestCase):
    def test_actual_native_start_end_and_schema1_progress_pass_for_both_receivers(self):
        self.assertEqual({'maps','vela'},set(BASELINE))
        for role,data in BASELINE.items():
            with self.subTest(receiver=role):
                proof=API.audit(data)
                self.assertEqual(2,len(proof['actual_zone_playback']))
                self.assertTrue(proof['native_zone_data_cleared'])
                self.assertTrue(proof['unknown_road_limit_preserved'])

    def test_known_zone_max_does_not_allow_fabricating_an_unreported_road_limit(self):
        for role,original in BASELINE.items():
            for where in ['source','receiver']:
                with self.subTest(receiver=role,where=where):
                    data=copy.deepcopy(original)
                    if where=='source':data['trace']['source_samples'][0]['zone']['schema1RawFields']['limitKmh']=100
                    else:data['receiver']['zone_telemetry_samples'][0]['limitKmh']=100
                    with self.assertRaises(AssertionError):API.audit(data)

    def test_missing_native_or_modified_output_and_cleanup_are_rejected(self):
        for role,original in BASELINE.items():
            for mutation in ['gps','policy','override','withdrawal','invented_announce','phase','ack_uid','message','average','source_clear','receiver_clear','duplicate_start','cleanup']:
                with self.subTest(receiver=role,mutation=mutation):
                    d=copy.deepcopy(original);trace=d['trace'];receiver=d['receiver']
                    if mutation=='gps':trace['source_samples'][0]['native']['sourceProvider']='fake'
                    elif mutation=='policy':trace['source_samples'][0]['native']['nativePolicy']['defaultSecondsRadius']+=1
                    elif mutation=='override':trace['native_decision_override_used']=True
                    elif mutation=='withdrawal':trace['candidate_restore']['wasInNativeGpsPath']=True
                    elif mutation=='invented_announce':next(row for row in trace['journal_events'] if row['operation']=='UPSERT')['operation']='ANNOUNCE'
                    elif mutation=='phase':trace['announcements'][1]['authority']['phase']='enter'
                    elif mutation=='ack_uid':trace['announcements'][0]['source_dispositions'][1]['receiver_uid']+=1
                    elif mutation=='message':receiver['actual_speaker_attempts'][0]['payload']['message']='changed'
                    elif mutation=='average':next(row for row in receiver['zone_telemetry_samples'] if row['averageKmh'] is not None)['partialAverage']=False
                    elif mutation=='source_clear':trace['source_samples'][-1]['zone']['schema1RawFields']['zoneStatus']='active'
                    elif mutation=='receiver_clear':receiver['zone_telemetry_samples'][-1]['zoneActive']=True
                    elif mutation=='duplicate_start':receiver['diagnostics'].append(copy.deepcopy(next(row for row in receiver['diagnostics'] if row['stage']=='SCHEDULER_STARTED')))
                    elif mutation=='cleanup':d['outer']['restored_exactly']=False
                    with self.assertRaises(AssertionError):API.audit(d)


if __name__=='__main__':unittest.main()
