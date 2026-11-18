"""Switch payload changes must not disappear behind instruction-only hashes."""
from pathlib import Path
import tempfile
import unittest

from mediahuis_emitted import code, digest
from mediahuis_switches import switch_semantics


PACKED = """.class public Lfixture/Switch;
.super Ljava/lang/Object;
.method public static choose(I)I
    .locals 1
    packed-switch p0, :switch_data
    const/4 v0, 0x0
    return v0
    :case_zero
    const/4 v0, 0x1
    return v0
    :case_other
    const/4 v0, 0x2
    return v0
{padding}
    :switch_data
    .packed-switch 0x0
        :case_zero
    .end packed-switch
.end method
"""


class MediahuisSwitchSemanticsTest(unittest.TestCase):
    def normalized(self, text):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            path = root / "smali/fixture/Switch.smali"
            path.parent.mkdir(parents=True)
            path.write_text(text)
            return (digest(code(root, "fixture/Switch", "choose(I)I")), switch_semantics(root, "fixture/Switch", "choose(I)I"))

    def test_valid_case_target_change_is_significant(self):
        original = PACKED.format(padding="")
        changed = original.replace("        :case_zero", "        :case_other")
        self.assertNotEqual(self.normalized(original), self.normalized(changed))

    def test_valid_packed_key_change_is_significant(self):
        original = PACKED.format(padding="")
        changed = original.replace(".packed-switch 0x0", ".packed-switch 0x1")
        self.assertNotEqual(self.normalized(original), self.normalized(changed))

    def test_switch_case_into_alignment_nop_is_rejected(self):
        changed = PACKED.format(padding="    :case_padding\n    nop\n")
        changed = changed.replace("        :case_zero", "        :case_padding")
        with self.assertRaisesRegex(AssertionError, "padding"):
            self.normalized(changed)

    def test_alignment_padding_keeps_complete_switch_semantics(self):
        self.assertEqual(self.normalized(PACKED.format(padding="")), self.normalized(PACKED.format(padding="    nop\n")))

    def test_label_renaming_keeps_true_case_destinations(self):
        original = PACKED.format(padding="")
        self.assertEqual(self.normalized(original), self.normalized(original.replace(":case_zero", ":renamed_case")))

    def test_sparse_key_and_valid_target_changes_are_significant(self):
        original = PACKED.format(padding="").replace("packed-switch p0", "sparse-switch p0")
        original = original.replace(".packed-switch 0x0\n        :case_zero\n    .end packed-switch", ".sparse-switch\n        0x3 -> :case_zero\n    .end sparse-switch")
        changed_key = original.replace("0x3 ->", "0x4 ->")
        changed_target = original.replace("0x3 -> :case_zero", "0x3 -> :case_other")
        self.assertNotEqual(self.normalized(original), self.normalized(changed_key))
        self.assertNotEqual(self.normalized(original), self.normalized(changed_target))


if __name__ == "__main__":
    unittest.main()
