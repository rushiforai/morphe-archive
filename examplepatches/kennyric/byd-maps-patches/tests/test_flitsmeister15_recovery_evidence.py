"""Real receiver-death records must retain the old grant and reject replay."""
import copy
import gzip
import importlib.util
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
BASELINE = json.loads(gzip.decompress((ROOT / 'tests/fixtures/navigation-warnings/flitsmeister15-death-recovery-baseline.json.gz').read_bytes()))


def audit(data):
    path = ROOT / 'scripts/navigation-alerts/verify_receiver_recovery_evidence.py'
    assert path.exists(), 'Independent receiver-death verifier is missing'
    with patch.object(sys, 'path', [str(path.parent), *sys.path]):
        spec = importlib.util.spec_from_file_location('receiver_recovery_evidence', path)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
    return module.audit(data)


class RecoveryEvidenceTest(unittest.TestCase):
    def test_both_real_death_records_join_ledger_callback_and_future_playback(self):
        for name, data in BASELINE.items():
            with self.subTest(receiver=name):
                proof = audit(data)
                self.assertTrue(proof['old_attempt_fenced_through_lease_expiry'])
                self.assertTrue(proof['only_distinct_future_authority_played'])
                self.assertEqual(proof['owner'], data['pre_death']['package'])

    def test_missing_fence_stop_callback_ack_or_rollback_is_rejected(self):
        for name, original in BASELINE.items():
            for mutation in ['lost_ledger', 'lease_unfenced', 'wrong_attempt', 'wrong_uid',
                             'missing_start', 'premature_terminal', 'replay', 'future_payload',
                             'live_recovery', 'one_confirmation', 'active_audio', 'cleanup']:
                with self.subTest(receiver=name, mutation=mutation):
                    data = copy.deepcopy(original)
                    case = data['source']['scenarios']['integrated_death_recovery']
                    death = case['death_recovery']
                    if mutation == 'lost_ledger': death['after_death']['stored_started'] = False
                    elif mutation == 'lease_unfenced': death['after_lease_expiry']['pending_outcome'] = 'COMPLETED'
                    elif mutation == 'wrong_attempt': death['source_dispositions_before_death'][-1]['attempt_id'] = 'wrong'
                    elif mutation == 'wrong_uid': death['source_dispositions_before_death'][-1]['receiver_uid'] += 1
                    elif mutation == 'missing_start':
                        data['pre_death']['diagnostics'] = [row for row in data['pre_death']['diagnostics'] if row['stage'] != 'SCHEDULER_STARTED']
                    elif mutation == 'premature_terminal':
                        row = copy.deepcopy(next(row for row in data['pre_death']['diagnostics'] if row['stage'] == 'SCHEDULER_STARTED' and row['sequence'] == death['authority']['sequence']))
                        row['stage'] = 'SCHEDULER_COMPLETED'
                        data['pre_death']['diagnostics'].append(row)
                    elif mutation == 'replay':
                        data['recovered']['diagnostics'].append(copy.deepcopy(next(row for row in data['pre_death']['diagnostics'] if row['stage'] == 'SCHEDULER_STARTED' and row['sequence'] == death['authority']['sequence'])))
                    elif mutation == 'future_payload': data['recovered']['actual_speaker_attempts'][0]['payload']['message'] = 'changed'
                    elif mutation == 'live_recovery': case['live_owner_recovery_refused']['after']['pending_present'] = True
                    elif mutation == 'one_confirmation': case['uncertain_output_recovery']['both_confirmations_required'] = False
                    elif mutation == 'active_audio':
                        data['audio_after'] = data['audio_after'].replace('  players:', '  players:\n piid:999 state:started u/pid:' + str(data['pre_death']['uid']) + '/999')
                    elif mutation == 'cleanup': data['outer']['restored_exactly'] = False
                    with self.assertRaises(AssertionError): audit(data)


if __name__ == '__main__':
    unittest.main()
