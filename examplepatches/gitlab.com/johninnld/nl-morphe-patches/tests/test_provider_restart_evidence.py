"""Provider restart must retain the old ledger and fence a fresh native authority."""
import copy
import gzip
import importlib.util
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
BASELINE = json.loads(gzip.decompress((ROOT/'tests/fixtures/navigation-warnings/flitsmeister15-provider-restart-baseline.json.gz').read_bytes()))


def verify(data):
    path = ROOT/'scripts/navigation-alerts/verify_provider_restart_evidence.py'
    assert path.exists(), 'Independent provider restart verifier is missing'
    with patch.object(sys, 'path', [str(path.parent), *sys.path]):
        spec = importlib.util.spec_from_file_location('provider_restart_evidence', path)
        api = importlib.util.module_from_spec(spec); spec.loader.exec_module(api)
    return api.audit(data)


class ProviderRestartEvidenceTest(unittest.TestCase):
    def test_real_restart_requires_new_session_old_ledger_and_fresh_fenced_warning(self):
        for role, data in BASELINE.items():
            with self.subTest(receiver=role):
                proof = verify(data)
                self.assertTrue(proof['fresh_native_authority_fenced'])
                self.assertTrue(proof['old_durable_attempt_retained'])
                self.assertTrue(proof['only_future_authority_completed'])

    def test_corrupted_restart_or_output_evidence_is_rejected(self):
        for role, original in BASELINE.items():
            for mutation in ['seed_exit', 'seed_started', 'same_session', 'lost_ledger',
                             'fenced_not_received', 'fenced_started', 'expired_fence',
                             'recovery_confirmation', 'future_language', 'future_ack', 'active_audio', 'cleanup']:
                with self.subTest(receiver=role, mutation=mutation):
                    d = copy.deepcopy(original); host = d['host']; case = d['source']['scenarios']['integrated_restart_recovery']
                    if mutation == 'seed_exit': host['process_exit_codes']['seed-source'] = 0
                    elif mutation == 'seed_started': host['seed_started']['source_dispositions'][-1]['started'] = False
                    elif mutation == 'same_session': case['reloaded_pending']['provider_session'] = host['seed_started']['pending']['provider_session']
                    elif mutation == 'lost_ledger': case['reloaded_pending']['stored_attempt'] = 'wrong'
                    elif mutation == 'fenced_not_received': d['fenced']['diagnostics'] = [r for r in d['fenced']['diagnostics'] if r['stage'] != 'RECEIVER_ACCEPTED']
                    elif mutation == 'fenced_started': d['fenced']['diagnostics'].append({'stage': 'SCHEDULER_STARTED'})
                    elif mutation == 'expired_fence': case['fenced_native_authority']['announce_until_elapsed_ms'] = 0
                    elif mutation == 'recovery_confirmation': case['uncertain_output_recovery']['both_confirmations_required'] = False
                    elif mutation == 'future_language': d['recovered']['actual_speaker_attempts'][0]['payload']['language_tag'] = 'wrong'
                    elif mutation == 'future_ack': case['future_source_dispositions'][-1]['attempt_id'] = 'wrong'
                    elif mutation == 'active_audio': d['audio_after'] = d['audio_after'].replace('  players:', '  players:\n piid:999 state:started u/pid:'+str(d['fenced']['uid'])+'/999')
                    elif mutation == 'cleanup': d['outer']['restored_exactly'] = False
                    with self.assertRaises(AssertionError): verify(d)


if __name__ == '__main__': unittest.main()
