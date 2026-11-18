"""The emitted menu guard must hide subscribe while preserving the login caller."""
from pathlib import Path
import tempfile
import unittest

from mediahuis_contracts import MENU_BUILDER, MENU_SUBSCRIBE
from mediahuis_emitted import verify_menu_subscription


PREDICATE = """.class public L{owner};
.super Ljava/lang/Object;
.method public static {signature}
    .locals 1
{prefix}    const/4 v0, 0x1
    return v0
.end method
"""
BUILDER = """.class public L{owner};
.super Ljava/lang/Object;
.method public {signature}
    .locals 1
    const-string v0, "LOGIN_BUTTON"
    return-object v0
.end method
"""


class MediahuisMenuSubscriptionTest(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        self.predicate = self.write(MENU_SUBSCRIBE, PREDICATE.format(
            owner=MENU_SUBSCRIBE[0], signature=MENU_SUBSCRIBE[1], prefix=""))
        self.builder = self.write(MENU_BUILDER, BUILDER.format(
            owner=MENU_BUILDER[0], signature=MENU_BUILDER[1]))
        # Literal instruction digests for the two hand-written fixtures above.
        self.originals = [
            [*MENU_SUBSCRIBE, "a64f2332fc11f1d96d6736f352c88af2573d0ddf5b1fab9a8fce8caaaabafd4d"],
            [*MENU_BUILDER, "786893b09b85ee3a89748385e7d646ebdb23c5a0b63fbe143a615d458270c337"],
        ]

    def write(self, target, text):
        path = self.root / "smali" / (target[0] + ".smali")
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text)
        return path

    def add_prefix(self, value="0x0", opcode="return"):
        self.predicate.write_text(PREDICATE.format(
            owner=MENU_SUBSCRIBE[0], signature=MENU_SUBSCRIBE[1],
            prefix=f"    const/4 v0, {value}\n    {opcode} v0\n"))

    def test_original_is_retained_when_premium_is_off(self):
        verify_menu_subscription(self.root, False, self.originals)

    def test_original_subscribe_enabled_boundary_is_rejected(self):
        with self.assertRaisesRegex(AssertionError, "subscription disabled"):
            verify_menu_subscription(self.root, True, self.originals)

    def test_false_prefix_retains_original_predicate_and_login_caller(self):
        self.add_prefix()
        verify_menu_subscription(self.root, True, self.originals)

    def test_object_return_is_rejected_for_boolean_predicate(self):
        self.add_prefix(opcode="return-object")
        with self.assertRaisesRegex(AssertionError, "subscription disabled"):
            verify_menu_subscription(self.root, True, self.originals)

    def test_false_prefix_cannot_hide_an_altered_original_tail(self):
        self.add_prefix()
        self.predicate.write_text(self.predicate.read_text().replace(
            "const/4 v0, 0x1", "const/4 v0, 0x2"))
        with self.assertRaisesRegex(AssertionError, "predicate tail"):
            verify_menu_subscription(self.root, True, self.originals)

    def test_false_prefix_cannot_hide_a_removed_login_caller(self):
        self.add_prefix()
        self.builder.write_text(self.builder.read_text().replace(
            '"LOGIN_BUTTON"', '"SUBSCRIBE_BUTTON"'))
        with self.assertRaisesRegex(AssertionError, "subscribe/login caller"):
            verify_menu_subscription(self.root, True, self.originals)


if __name__ == "__main__":
    unittest.main()
