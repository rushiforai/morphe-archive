"""Ensure the APK comparator rejects semantic mutations, including branch targets."""
import unittest

from verify_at4k import normalized


class At4kComparisonTests(unittest.TestCase):
    def test_nondefault_field_and_signature_changes_remain_visible(self):
        self.assertNotEqual(normalized('.field public a:Z = false'), normalized('.field public a:Z = true'))
        self.assertNotEqual(normalized('.method public a()V'), normalized('.method public a(I)V'))
        self.assertEqual(normalized('.field public a:Z = false'), normalized('.field public a:Z'))

    def test_label_renaming_preserves_distinct_branch_targets(self):
        original = 'if-eqz v0, :cond_0\n:cond_0\nreturn-void\n:cond_1\nthrow v1'
        renamed = original.replace('cond_0', 'renamed_a').replace('cond_1', 'renamed_b')
        mutated = original.replace('if-eqz v0, :cond_0', 'if-eqz v0, :cond_1')
        self.assertEqual(normalized(original), normalized(renamed))
        self.assertNotEqual(normalized(original), normalized(mutated))
