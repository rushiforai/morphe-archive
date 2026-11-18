"""DEX payload padding normalization must never hide executable changes."""
from pathlib import Path
import tempfile
import unittest

from mediahuis_emitted import code, digest


BODY = """.class public Lfixture/Padding;
.super Ljava/lang/Object;
.method public static choose(I)I
    .locals 1
    packed-switch p0, :switch_data
    const/4 v0, 0x0
    return v0
    :case_zero
    const/4 v0, 0x1
    return v0
{padding}
    :switch_data
    .packed-switch 0x0
        :case_zero
    .end packed-switch
.end method
"""


class MediahuisPayloadPaddingTest(unittest.TestCase):
    def instructions(self, text):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            path = root / "smali/fixture/Padding.smali"
            path.parent.mkdir(parents=True)
            path.write_text(text)
            return code(root, "fixture/Padding", "choose(I)I")

    def test_only_terminal_switch_payload_padding_is_equivalent(self):
        original = self.instructions(BODY.format(padding=""))
        padded = self.instructions(BODY.format(padding="    nop\n"))
        self.assertEqual(original, padded)
        self.assertEqual(digest(original), digest(padded))

    def test_executable_nop_is_retained(self):
        original = BODY.format(padding="")
        changed = original.replace("    return v0", "    nop\n    return v0", 1)
        self.assertNotEqual(digest(self.instructions(original)), digest(self.instructions(changed)))

    def test_changed_executable_instruction_is_retained(self):
        original = BODY.format(padding="")
        changed = original.replace("const/4 v0, 0x0", "const/4 v0, 0x2", 1)
        self.assertNotEqual(digest(self.instructions(original)), digest(self.instructions(changed)))

    def test_fallthrough_into_padding_is_not_normalized(self):
        changed = BODY.format(padding="    nop\n").replace("    const/4 v0, 0x1\n    return v0", "    const/4 v0, 0x1")
        self.assertEqual(self.instructions(changed)[-1], "nop")

    def test_branch_into_alignment_nop_is_rejected(self):
        changed = BODY.format(padding="    :executable_padding\n    nop\n")
        changed = changed.replace("    const/4 v0, 0x0", "    goto :executable_padding\n    const/4 v0, 0x0", 1)
        with self.assertRaisesRegex(AssertionError, "branch.*enters"):
            self.instructions(changed)


if __name__ == "__main__":
    unittest.main()
