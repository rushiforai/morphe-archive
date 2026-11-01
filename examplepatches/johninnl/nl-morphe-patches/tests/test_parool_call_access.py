"""Exercise the decoded-call auditor against real DEX declaration semantics."""
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import verify_parool


class CallAccessTests(unittest.TestCase):
    def audit(self, kind, target_flags, target_name="target"):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "smali/nl/persgroep/edition/AccessProbe.smali"
            source.parent.mkdir(parents=True)
            source.write_text(f""".class public Lnl/persgroep/edition/AccessProbe;
.super Ljava/lang/Object;
.method public static morpheProbe(Lnl/persgroep/edition/AccessProbe;)V
    .locals 0
    invoke-{kind} {{p0}}, Lnl/persgroep/edition/AccessProbe;->{target_name}()V
    return-void
.end method
.method {target_flags} {target_name}()V
    .locals 0
    return-void
.end method
""")
            # Every invoked type is in this actual decoded fixture. No SDK
            # stubs participate in the access decision under test.
            with patch.object(verify_parool, "sdk_classes", return_value=(lambda _: None, None)):
                verify_parool.verify_call_kinds(root, True, False)

    def test_virtual_call_to_private_instance_is_rejected(self):
        with self.assertRaisesRegex(AssertionError, "direct/private"):
            self.audit("virtual", "private final")

    def test_direct_call_to_private_instance_is_valid(self):
        self.audit("direct", "private final")

    def test_direct_call_to_public_ordinary_method_is_rejected(self):
        with self.assertRaisesRegex(AssertionError, "direct/private"):
            self.audit("direct", "public final")

    def test_public_virtual_and_constructor_direct_are_valid(self):
        self.audit("virtual", "public final")
        self.audit("direct", "public constructor", "<init>")


if __name__ == "__main__":
    unittest.main()
