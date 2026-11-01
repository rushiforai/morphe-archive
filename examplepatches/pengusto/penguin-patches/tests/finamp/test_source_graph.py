"""The aggregate source ref must retain the exact matrix, not just a name."""
import unittest
from unittest.mock import patch

from verify_source_graph import verify


class SourceGraphTests(unittest.TestCase):
    def setUp(self):
        self.commits = [f'{mask:040x}' for mask in range(128)]
        self.ref = 'penguin/finamp-1.0.1-asyncvalue-bundle'
        self.aggregate = 'f' * 40
        self.matrix = {'asyncvalue_review': {'source_ref': self.ref, 'source_ref_commit': self.aggregate},
                       'masks': {str(mask): {'branch': self.ref, 'commit': self.commits[mask],
                                             'tree': f'{mask + 128:040x}'} for mask in range(128)}}

    def git(self, repo, *args):
        if args[0] == 'rev-parse' and args[1].startswith('refs/heads/'):
            return self.aggregate
        if args[0] == 'show':
            return ' '.join(self.commits)
        if args[0] == 'diff':
            return 'expected source diff'
        if args[0] == 'rev-parse' and args[1].endswith('^{tree}'):
            mask = self.commits.index(args[1][:-7])
            return f'{mask + 128:040x}'
        raise AssertionError(args)

    def test_accepts_complete_exact_graph(self):
        with patch('verify_source_graph.git', side_effect=self.git):
            result = verify('repo', self.matrix, 'expected source diff')
            self.assertEqual(result['verified_masks'], 128)
            self.assertEqual(result['verified_diffs'], 64)

    def test_rejects_wrong_review_diff(self):
        with patch('verify_source_graph.git', side_effect=self.git):
            with self.assertRaisesRegex(ValueError, 'source diff mismatch'):
                verify('repo', self.matrix, 'different source diff')

    def test_rejects_missing_parent_or_wrong_tree(self):
        with patch('verify_source_graph.git', side_effect=self.git):
            self.commits.pop()
            with self.assertRaisesRegex(ValueError, 'retain every selection'):
                verify('repo', self.matrix)
        self.commits.append(f'{127:040x}')
        self.matrix['masks']['4']['tree'] = 'bad'
        with patch('verify_source_graph.git', side_effect=self.git):
            with self.assertRaisesRegex(ValueError, 'tree mismatch for mask 4'):
                verify('repo', self.matrix)


if __name__ == '__main__':
    unittest.main()
