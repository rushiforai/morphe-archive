"""Execute real generated campaign helpers against observed-marker fixtures."""
from pathlib import Path
import re
import unittest

from hln_companion import exercise_companions, verify_retained_normalizer
from hln_contracts import MODEL, OWNER, TYPE
from hln_emitted import evaluate, obj
import test_hln_filters


class HlnCompanionTests(unittest.TestCase):
    def fixture(self, ads=True):
        root = test_hln_filters.HlnFilterTests.fixture(self, ads=ads, premium=False)
        path = Path(__file__).parents[1] / 'patches/src/main/kotlin/patches/hln/CompanionCampaignPatch.kt'
        self.assertTrue(path.is_file(), 'Scoped companion campaign filter must exist')
        source = path.read_text()
        methods = []
        for name, result, params, locals_, body in re.findall(r'helper\("(morphe(?:Companion\w*|Normalize))", "([^"]+)", (listOf\([^\n]+?\)), (\d+), """(.*?)"""\)', source, re.S):
            values = re.findall(r'"([^"]+)"', params)
            body = body.replace('${MODEL}', 'Lcom/kubus/module/network/model/').replace('$FILTER', TYPE)
            methods.append('.method public static ' + name + '(' + ''.join(values) + ')' + result + '\n.locals ' + locals_ + '\n' + body + '\n.end method\n')
        self.assertEqual(len(methods), 3, 'Use both real generated helper bodies and wrapper')
        self.assertIn('normalizer.setName("morpheNormalizeOriginal")', source)
        path = root / 'smali' / (OWNER + '.smali')
        text = path.read_text()
        text, count = re.subn(r'(^\.method[^\n]* )morpheNormalize\(', r'\1morpheNormalizeOriginal(', text, flags=re.M)
        self.assertEqual(count, 1)
        path.write_text(text + '\n' + '\n'.join(methods))
        return root

    def test_observed_companion_family_only_when_ads_selected(self):
        exercise_companions(self.fixture(), enabled=True)

    def test_unselected_ads_keep_companion_and_editorial_identity(self):
        exercise_companions(self.fixture(ads=False), enabled=False)

    def test_original_normalizer_keeps_pinned_branch_targets(self):
        verify_retained_normalizer(self.fixture())

    def test_retargeted_original_branch_is_rejected(self):
        root = self.fixture()
        path = root / 'smali' / (OWNER + '.smali')
        text = path.read_text()
        pattern = r'(^\.method[^\n]* morpheNormalizeOriginal\([^\n]+\n.*?)(if-eqz p0, :keep)'
        text, count = re.subn(pattern, lambda match: match[1] + 'if-eqz p0, :drop', text, flags=re.M | re.S)
        self.assertEqual(count, 1)
        path.write_text(text)
        with self.assertRaisesRegex(AssertionError, 'original branch targets'):
            verify_retained_normalizer(root)

    def test_wrapper_preserves_existing_nested_editorial_policy(self):
        from verify_hln import verify_filters
        root = self.fixture()
        verify_filters(root, ads=True, premium=False)
        editorial = obj('com/popular/core/model/data/ArticleItem', advertorial=False)
        paid = obj('com/popular/core/model/data/ArticleItem', advertorial=True)
        kept = obj(MODEL + 'CompactTeaser', b=editorial)
        removed = obj(MODEL + 'CompactTeaser', b=paid)
        self.assertIs(evaluate(root, 'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;', [kept]), kept)
        self.assertFalse(evaluate(root, 'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;', [removed]))


if __name__ == '__main__':
    unittest.main()
