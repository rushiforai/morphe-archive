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


class NotesSourceGraphTests(SourceGraphTests):
    def setUp(self):
        super().setUp()
        self.notes_ref = 'penguin/finamp-1.0.1-notes-bundle'
        self.notes_aggregate = 'e' * 40
        self.notes_commits = [f'{mask + 1000:040x}' for mask in range(128)]
        self.matrix['notes_review'] = {'source_ref': self.notes_ref, 'source_ref_commit': self.notes_aggregate}
        self.matrix['masks'].update({str(mask + 128): {'branch': self.notes_ref, 'commit': self.notes_commits[mask],
                                                      'tree': f'{mask + 2000:040x}'} for mask in range(128)})

    def git(self, repo, *args):
        if args[0] == 'rev-parse' and args[1] == 'refs/heads/' + self.notes_ref + '^{commit}':
            return self.notes_aggregate
        if args[0] == 'show' and args[-1] == self.notes_aggregate:
            return ' '.join(self.notes_commits)
        if args[0] == 'rev-parse' and args[1].endswith('^{tree}') and args[1][:-7] in self.notes_commits:
            return f'{self.notes_commits.index(args[1][:-7]) + 2000:040x}'
        if args[0] == 'rev-parse' and args[1].endswith('^') and args[1][:-1] in self.notes_commits:
            return self.commits[self.notes_commits.index(args[1][:-1])]
        return super().git(repo, *args)

    def test_accepts_complete_exact_graph(self):
        with patch('verify_source_graph.git', side_effect=self.git):
            self.assertEqual(verify('repo', self.matrix)['verified_masks'], 256)

    def test_rejects_notes_parent_mismatch(self):
        self.matrix['masks']['128']['commit'], self.matrix['masks']['129']['commit'] = (
            self.matrix['masks']['129']['commit'], self.matrix['masks']['128']['commit'])
        with patch('verify_source_graph.git', side_effect=self.git):
            with self.assertRaisesRegex(ValueError, 'retain every new selection'):
                verify('repo', self.matrix)

    def test_notes_revision_preserves_published_source_graph(self):
        previous = 'd' * 40
        self.matrix['notes_review']['previous_source_ref_commit'] = previous
        newer = [f'{mask + 3000:040x}' for mask in range(128)]
        for mask, commit in enumerate(newer, 128):
            self.matrix['masks'][str(mask)]['commit'] = commit

        def git(repo, *args):
            if args[0] == 'show' and args[-1] == self.notes_aggregate:
                return ' '.join([previous, *newer])
            if args[0] == 'show' and args[-1] == previous:
                return ' '.join(self.notes_commits)
            if args[0] == 'rev-parse' and args[1].endswith('^{tree}') and args[1][:-7] in newer:
                return f'{newer.index(args[1][:-7]) + 2000:040x}'
            if args[0] == 'rev-parse' and args[1].endswith('^') and args[1][:-1] in newer:
                return self.notes_commits[newer.index(args[1][:-1])]
            return self.git(repo, *args)

        with patch('verify_source_graph.git', side_effect=git):
            self.assertEqual(verify('repo', self.matrix)['verified_masks'], 256)


if __name__ == '__main__':
    unittest.main()
