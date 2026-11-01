"""Partial exploratory rebuilds cannot replace shipped native resources."""
from pathlib import Path
import json
import unittest
import tempfile
from copy import deepcopy
from pfd import make_delta
from build_native_payloads import sha, verify_receipts, source_test_receipt

from build_native_payloads import PRODUCTION, payload_output


class OutputPolicyTests(unittest.TestCase):
    def test_partial_defaults_to_private_work_directory(self):
        self.assertEqual(payload_output([2], None, Path('/tmp/finamp-test')),
                         Path('/tmp/finamp-test/partial-payloads').resolve())

    def test_partial_rejects_production_and_descendants(self):
        for target in [PRODUCTION, PRODUCTION / 'arm64-v8a']:
            with self.assertRaises(ValueError):
                payload_output([2], target, Path('/tmp/finamp-test'))

    def test_old_seven_mask_matrix_is_partial_now(self):
        for limit in (8, 32, 64):
            with self.subTest(limit=limit), self.assertRaises(ValueError):
                payload_output(range(1, limit), PRODUCTION, Path('/tmp/finamp-test'))

    def test_source_matrix_contains_every_independent_combination(self):
        matrix = json.loads(Path(__file__).with_name('native-sources.json').read_text())
        bits = [1, 2, 4, 8, 16, 32, 64]
        self.assertEqual(set(map(int, matrix['mask_bits'])), set(bits))
        self.assertEqual(set(map(int, matrix['masks'])), set(range(128)))
        for mask in range(128):
            entry = matrix['masks'][str(mask)]
            expected = {feature for bit in bits if mask & bit
                        for feature in matrix['masks'][str(bit)]['features']}
            self.assertEqual(set(entry['features']), expected, mask)
            self.assertRegex(entry['commit'], r'^[0-9a-f]{40}$')
            self.assertRegex(entry['tree'], r'^[0-9a-f]{40}$')
            # A single aggregate ref retains all mask commits as parents;
            # the immutable commit and tree pins identify the exact selection.
            self.assertEqual(entry['branch'], matrix['asyncvalue_review']['source_ref'])
        self.assertEqual(len({entry['commit'] for entry in matrix['masks'].values()}), 128)
        self.assertRegex(matrix['asyncvalue_review']['source_ref'],
                         r'^penguin/finamp-1\.0\.1-[a-z0-9-]+$')
        self.assertRegex(matrix['asyncvalue_review']['source_ref_commit'], r'^[0-9a-f]{40}$')
        self.assertEqual(set(matrix['asyncvalue_review']['updated_masks']),
                         {mask for mask in range(128) if mask & 4})

    def test_complete_matrix_can_replace_production(self):
        self.assertEqual(payload_output(range(1, 128), None, Path('/tmp/finamp-test')),
                         PRODUCTION.resolve())


class ResumeTests(unittest.TestCase):
    def test_resume_rejects_changed_receipt_source_size_hash_and_payload(self):
        before, after = b'original native bytes' * 10, b'changed native bytes' * 10
        delta = make_delta(before, after)
        matrix = {'masks': {'32': {'commit': 'source32'}}}
        receipt = {'32': {'source': 'source32', 'delta_sha256': sha(delta),
                          'native_sha256': sha(after), 'native_bytes': len(after),
                          'delta_bytes': len(delta)}}
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory)
            (output / 'arm64-v8a').mkdir()
            payload = output / 'arm64-v8a/32.pfd'
            payload.write_bytes(delta)
            verify_receipts(receipt, matrix, output, before)
            for key, bad in [('source', 'other'), ('native_bytes', 1),
                             ('delta_bytes', 1), ('native_sha256', '0' * 64),
                             ('delta_sha256', '0' * 64)]:
                changed = deepcopy(receipt)
                changed['32'][key] = bad
                with self.subTest(key=key), self.assertRaises(ValueError):
                    verify_receipts(changed, matrix, output, before)
            payload.write_bytes(delta[:-1])
            with self.assertRaises(ValueError):
                verify_receipts(receipt, matrix, output, before)

    def test_tested_resume_rejects_untested_or_replaced_log(self):
        before, after = b'original', b'patched'
        delta = make_delta(before, after)
        log = b'00:13 +27: All tests passed!\n'
        matrix = {'masks': {'32': {'commit': 'source32'}}}
        receipt = {'32': {'source': 'source32', 'delta_sha256': sha(delta),
                          'native_sha256': sha(after), 'native_bytes': len(after),
                          'delta_bytes': len(delta)}}
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory)
            (output / 'arm64-v8a').mkdir()
            (output / 'arm64-v8a/32.pfd').write_bytes(delta)
            (output / 'test-32.log').write_bytes(log)
            with self.assertRaises(ValueError):
                verify_receipts(receipt, matrix, output, before, output)
            receipt['32']['source_tests'] = source_test_receipt(log)
            verify_receipts(receipt, matrix, output, before, output)
            (output / 'test-32.log').write_bytes(log + b'replaced\n')
            with self.assertRaises(ValueError):
                verify_receipts(receipt, matrix, output, before, output)

    def test_source_log_needs_one_positive_success_summary(self):
        for log in [b'', b'00:01 +0: All tests passed!', b'00:01 +1 -1: Some tests failed.',
                    b'00:01 +1: All tests passed!\n00:02 +2: All tests passed!']:
            with self.subTest(log=log), self.assertRaises(ValueError):
                source_test_receipt(log)
