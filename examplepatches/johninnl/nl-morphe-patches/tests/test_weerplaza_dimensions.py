"""Check decoded zero-height formatting without accepting a visible dimension."""
import unittest
from verify_weerplaza import zero_dp


class BannerDimensionTests(unittest.TestCase):
    def test_apktool_zero_dp_serializations_are_equivalent(self):
        for value in ['0dp','0.0dp','0.00dp','0dip','0.0dip']:
            with self.subTest(value=value):self.assertTrue(zero_dp(value))

    def test_nonzero_or_other_dimension_does_not_pass(self):
        for value in [None,'','1dp','0.1dp','-1dp','wrap_content','match_parent','0px','zero dp']:
            with self.subTest(value=value):self.assertFalse(zero_dp(value))


if __name__=='__main__':unittest.main()
