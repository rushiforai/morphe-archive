"""Independent declaration, control-flow and payload guard failures."""
import unittest

from brabant_smali import canonical
from verify_brabant import check_original


class BrabantContractTests(unittest.TestCase):
    def test_redirecting_a_branch_between_switch_cases_fails_the_retained_contract(self):
        body = '''
            .locals 1
            goto :first
            :first
            const/4 v0, 0x1
            return v0
            :second
            const/4 v0, 0x2
            return v0
            packed-switch p0, :table
            return-void
            :table
            .packed-switch 0x0
                :first
                :second
            .end packed-switch
        '''
        expected = canonical(body)
        row = ('Lfixture;', 'method()I', 1, 1, len(expected.code), expected.digest())
        check_original(body, row, 1)
        with self.assertRaisesRegex(AssertionError, 'original body'):
            check_original(body.replace('goto :first', 'goto :second'), row, 1)

    def test_binary_access_and_local_register_changes_fail_even_with_same_code(self):
        body = '.locals 1\nconst/4 v0, 0x0\nreturn v0'
        original = canonical(body)
        row = ('Lfixture;', 'method()I', 1, 1, 2, original.digest())
        with self.assertRaisesRegex(AssertionError, 'access'):
            check_original(body, row, 9)
        with self.assertRaisesRegex(AssertionError, 'register'):
            check_original(body.replace('.locals 1', '.locals 2'), row, 1)


if __name__ == '__main__':
    unittest.main()
