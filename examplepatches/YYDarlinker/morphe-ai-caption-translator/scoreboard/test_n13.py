"""Local-only N13 request budget and frozen-input guards."""
import hashlib
import json
from pathlib import Path
from tempfile import TemporaryDirectory
import unittest
from unittest import mock

import live_n13
import run


class N13BudgetTests(unittest.TestCase):
    def test_frozen_block_17_and_unchanged_prompt(self):
        payload = live_n13.frozen_repair_payload()
        self.assertEqual('b17_1219_1299', payload['block'])
        self.assertIn(1229, payload['avoid_event_end_after'])
        self.assertEqual(live_n13.PROMPT_SHA256,
                         hashlib.sha256(run.current_prompt().encode('utf-8')).hexdigest())

    def test_prior_attempts_count_sent_not_prepared(self):
        with TemporaryDirectory() as directory:
            root = Path(directory)
            for count, spent in ((0, 0), (1, 123), (1, 456)):
                (root / f'live-n13-block17-{count}-{spent}.json').write_text(json.dumps({
                    'block': live_n13.BLOCK, 'source_ids': live_n13.SOURCE_IDS,
                    'api_attempts': count, 'token_usage': {
                        'prompt_tokens': spent, 'completion_tokens': count,
                        'total_tokens': spent + count}}), encoding='utf-8')
            self.assertEqual((2, 579, 2, 581), live_n13.previous_usage(root))

    def test_exhausted_budget_rejects_without_network(self):
        with TemporaryDirectory() as directory:
            root = Path(directory)
            results = root / 'scoreboard/results'
            results.mkdir(parents=True)
            for i in range(live_n13.MAX_ATTEMPTS):
                (results / f'live-n13-block17-{i}.json').write_text(json.dumps({
                    'block': live_n13.BLOCK, 'source_ids': live_n13.SOURCE_IDS,
                    'api_attempts': 1, 'token_usage': {'prompt_tokens': 10,
                    'completion_tokens': 10, 'total_tokens': 20}}), encoding='utf-8')
            with mock.patch.object(run, 'ROOT', root), \
                 mock.patch.object(live_n13.urllib.request, 'build_opener',
                                   side_effect=AssertionError('no network')):
                with self.assertRaisesRegex(ValueError, 'budget exhausted'):
                    live_n13.one_attempt()
            self.assertFalse((results / '.live-n13-block17.lock').exists())


if __name__ == '__main__':
    unittest.main()
