"""Tests for signing_key.py: the fingerprint matches Morphe Manager, and the key
history only ever gains rows.

Run from the repository root: python3 -m unittest discover -s .github/scripts -p 'test_*.py'
"""

import unittest

import signing_key

KEY = "6sNE7CnUmEbvfVcaYklfOzJuN60m4+HH2LKlqlxhSN0="
NEW_KEY = "AAECAwQFBgcICQoLDA0ODxAREhMUFRYXGBkaGxwdHh8="


class FingerprintTest(unittest.TestCase):
    def test_matches_morphe_manager(self):
        # The "Signed by" line Morphe Manager shows for this key.
        self.assertEqual(signing_key.fingerprint(KEY), "4c2b a5d2 28d4 532f")

    def test_rejects_a_damaged_key(self):
        with self.assertRaises(ValueError):
            signing_key.fingerprint("not base64!")


class HistoryTest(unittest.TestCase):
    def setUp(self):
        self.rows = signing_key.update_history([], signing_key.fingerprint(KEY), KEY, "2026-10-31", "first")

    def test_first_key_is_current(self):
        self.assertEqual(self.rows, [["`4c2b a5d2 28d4 532f`", f"`{KEY}`", "2026-10-31", "current", "first"]])

    def test_same_key_changes_nothing(self):
        again = signing_key.update_history(self.rows, signing_key.fingerprint(KEY), KEY, "2027-01-01", "other")
        self.assertEqual(again, self.rows)

    def test_new_key_closes_the_old_row_and_keeps_it(self):
        rows = signing_key.update_history(self.rows, signing_key.fingerprint(NEW_KEY), NEW_KEY, "2027-02-03", "second")
        self.assertEqual(len(rows), 2)
        self.assertEqual(rows[0][3], "2027-02-03")
        self.assertEqual(rows[1][1], f"`{NEW_KEY}`")
        self.assertEqual(rows[1][3], "current")
        # The input list is left as it was.
        self.assertEqual(self.rows[0][3], "current")

    def test_table_round_trips(self):
        text = "intro\n" + signing_key.render_history(self.rows) + "\noutro\n"
        self.assertEqual(signing_key.parse_history(text), self.rows)


if __name__ == "__main__":
    unittest.main()
