import base64
import importlib.util
import io
import tempfile
import unittest
import zipfile
from contextlib import redirect_stderr, redirect_stdout
from pathlib import Path

spec = importlib.util.spec_from_file_location(
    "bundle_signature", Path(__file__).parents[1] / "bundle_signature.py"
)
signature = importlib.util.module_from_spec(spec)
spec.loader.exec_module(signature)

REPO = Path(__file__).parents[2]
SEED = bytes(range(32))
# An empty archive with 22 bytes ahead of it, signed by morphe-patcher 2.1.0-dev.7's
# PatchBundleSignature with SEED. Its fingerprint is the one the patcher printed for the key.
FIXTURE = b"HushMessenger fixture\n" + b"PK\x05\x06" + b"\0" * 18
FIXTURE_KEY = "A6EHv/POEL4dcN0Y50vAmWfk1jCbpQ1fHdyGZBJVMbg="
FIXTURE_SIGNATURE = (
    "pIbRMnWdSjEpD3xgb74oQ7neJBTxQ9XKcT3jp/cRfhq9e53tCjuZ3nDBuFFOTkcvhq449URO4fCjjMxYP2X9DA=="
)
FIXTURE_FINGERPRINT = "5647 5aa7 5463 474c"


def archive(comment=b""):
    data = io.BytesIO()
    with zipfile.ZipFile(data, "w") as bundle:
        bundle.writestr("classes.dex", b"fixture")
        bundle.writestr("extensions/messenger.mpe", b"fixture")
        bundle.comment = comment
    return data.getvalue()


def with_comment(data, comment):
    return data[:-2] + len(comment).to_bytes(2, "little") + comment


class Ed25519(unittest.TestCase):
    def test_rfc_8032_vectors(self):
        for secret, public, message, expected in (
            (
                "9d61b19deffd5a60ba844af492ec2cc44449c5697b326919703bac031cae7f60",
                "d75a980182b10ab7d54bfed3c964073a0ee172f3daa62325af021a68f707511a",
                "",
                "e5564300c360ac729086e2cc806e828a84877f1eb8e5d974d873e065224901555fb8821590a33bacc61e39701cf9b46bd25bf5f0595bbe24655141438e7a100b",
            ),
            (
                "4ccd089b28ff96da9db6c346ec114e0f5b8a319f35aba624da8cf6ed4fb8a6fb",
                "3d4017c3e843895a92b70aa74d1b7ebc9c982ccf2ec4968cc0cd55f12af4660c",
                "72",
                "92a009a9f0d4cab8720e820b5f642540a2b27b5416503f8fb3762223ebdb69da085ac1e43e15996e458f3613d0f11d8c387b2eaeb4302aeeb00d291612bb0c00",
            ),
        ):
            seed, message = bytes.fromhex(secret), bytes.fromhex(message)
            self.assertEqual(public, signature.public_key(seed).hex())
            self.assertEqual(expected, signature.ed25519_sign(seed, message).hex())
            self.assertTrue(
                signature.ed25519_verify(
                    bytes.fromhex(public), message, bytes.fromhex(expected)
                )
            )
            self.assertFalse(
                signature.ed25519_verify(
                    bytes.fromhex(public), message + b"x", bytes.fromhex(expected)
                )
            )

    def test_a_short_key_is_refused(self):
        with self.assertRaisesRegex(ValueError, "32 bytes"):
            signature.public_key(b"short")


class BundleSignature(unittest.TestCase):
    def test_signs_exactly_as_the_patcher_does(self):
        comment = f"MorpheSig1 {FIXTURE_KEY} {FIXTURE_SIGNATURE}".encode("ascii")
        self.assertEqual(with_comment(FIXTURE, comment), signature.sign(FIXTURE, SEED))
        self.assertEqual(FIXTURE_KEY, signature.verify(with_comment(FIXTURE, comment)))
        self.assertEqual(FIXTURE_FINGERPRINT, signature.fingerprint(FIXTURE_KEY))

    def test_a_signed_bundle_stays_a_readable_zip(self):
        signed = signature.sign(archive(), SEED)
        self.assertEqual(FIXTURE_KEY, signature.verify(signed))
        with zipfile.ZipFile(io.BytesIO(signed)) as bundle:
            self.assertEqual(b"fixture", bundle.read("classes.dex"))
            self.assertTrue(bundle.comment.startswith(b"MorpheSig1 " + FIXTURE_KEY.encode()))

    def test_changed_content_or_a_swapped_key_is_refused(self):
        signed = signature.sign(archive(), SEED)
        flipped = bytearray(signed)
        flipped[40] ^= 1
        other = signature.sign(archive(), bytes(32))
        other_key, other_signature = signature.verify(other), other.rsplit(b" ", 1)[1]
        _, key, sig = signed[signature.comment_offset(signed) :].split(b" ")
        start = signed[: signature.comment_offset(signed)]
        for tampered in (
            bytes(flipped),
            start + b"MorpheSig1 " + key + b" " + other_signature,
            start + b"MorpheSig1 " + other_key.encode() + b" " + sig,
        ):
            with self.assertRaisesRegex(ValueError, "doesn't match its content"):
                signature.verify(tampered)

    def test_an_unsigned_bundle_or_another_comment_is_no_signature(self):
        self.assertIsNone(signature.verify(archive()))
        self.assertIsNone(signature.verify(archive(b"Built by hand")))
        self.assertIsNone(signature.verify(archive(b"MorpheSig1")))
        self.assertIsNone(signature.verify(b"not a zip archive at all"))

    def test_a_malformed_signature_is_refused(self):
        key = FIXTURE_KEY.encode()
        short = base64.b64encode(b"short")
        for comment in (
            b"MorpheSig1 " + key,
            b"MorpheSig1 " + key + b" " + key + b" extra",
            b"MorpheSig1 !!!! " + key,
            b"MorpheSig1 " + key + b" !!!!",
            b"MorpheSig1 " + short + b" " + key,
        ):
            with self.subTest(comment=comment), self.assertRaisesRegex(
                ValueError, "malformed"
            ):
                signature.verify(archive(comment))

    def test_a_small_order_key_is_refused(self):
        # The identity point as the key makes a zero signature verify on any content. The patcher's
        # BouncyCastle refuses such a key as malformed, so a forged comment can't pass here either.
        identity = base64.b64encode(b"\x01" + b"\0" * 31)
        comment = b"MorpheSig1 " + identity + b" " + base64.b64encode(b"\x01" + b"\0" * 63)
        with self.assertRaisesRegex(ValueError, "doesn't match its content"):
            signature.verify(archive(comment))

    def test_base64_without_its_padding_is_read_as_the_patcher_reads_it(self):
        bare = f"MorpheSig1 {FIXTURE_KEY.rstrip('=')} {FIXTURE_SIGNATURE.rstrip('=')}"
        self.assertEqual(FIXTURE_KEY, signature.verify(with_comment(FIXTURE, bare.encode("ascii"))))
        # Padding that is there has to be right, as Java's decoder wants it.
        wrong = f"MorpheSig1 {FIXTURE_KEY}= {FIXTURE_SIGNATURE}"
        with self.assertRaisesRegex(ValueError, "malformed"):
            signature.verify(with_comment(FIXTURE, wrong.encode("ascii")))

    def test_sign_refuses_a_signed_bundle_or_no_zip(self):
        for data in (signature.sign(archive(), SEED), archive(b"x"), b"not a zip"):
            with self.assertRaisesRegex(ValueError, "already signed or isn't a zip"):
                signature.sign(data, SEED)

    def test_keys_must_be_base64_32_bytes(self):
        self.assertEqual(SEED, signature.read_key(base64.b64encode(SEED).decode() + "\n"))
        for text in ("", "not base64!", base64.b64encode(b"short").decode()):
            with self.assertRaisesRegex(ValueError, "Base64 32-byte"):
                signature.read_key(text)
        with tempfile.TemporaryDirectory() as temp:
            public = Path(temp) / "morphe-signing.pub"
            public.write_text(base64.b64encode(b"short").decode(), encoding="ascii")
            with self.assertRaisesRegex(ValueError, "morphe-signing.pub isn't"):
                signature.read_public(public)

    def test_generate_never_replaces_a_key(self):
        with tempfile.TemporaryDirectory() as temp:
            key, public = Path(temp) / "keys/bundle.key", Path(temp) / "morphe-signing.pub"
            written = signature.generate(key, public)
            seed = signature.read_key(key.read_text(encoding="ascii"))
            self.assertEqual(written, base64.b64encode(signature.public_key(seed)).decode())
            self.assertEqual(written, signature.read_public(public))
            before = key.read_bytes(), public.read_bytes()
            with self.assertRaisesRegex(ValueError, "already exists"):
                signature.generate(key, public)
            self.assertEqual(before, (key.read_bytes(), public.read_bytes()))

    def test_the_command_line_checks_a_bundle_and_its_key(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            signed, unsigned = root / "signed.mpp", root / "unsigned.mpp"
            signed.write_bytes(signature.sign(archive(), SEED))
            unsigned.write_bytes(archive())
            ours, theirs = root / "ours.pub", root / "theirs.pub"
            ours.write_text(FIXTURE_KEY + "\n", encoding="ascii")
            theirs.write_text(signature.verify(signature.sign(archive(), bytes(32))), encoding="ascii")
            for arguments, code, text in (
                (["verify", str(signed)], 0, FIXTURE_FINGERPRINT),
                (["verify", str(signed), "--public", str(ours)], 0, FIXTURE_FINGERPRINT),
                (["verify", str(signed), "--public", str(theirs)], 1, "another key"),
                (["verify", str(unsigned)], 1, "isn't signed"),
                (["verify", str(root / "missing.mpp")], 1, "missing.mpp"),
            ):
                output = io.StringIO()
                with self.subTest(arguments=arguments), redirect_stdout(output), redirect_stderr(output):
                    self.assertEqual(code, signature.main(arguments))
                self.assertIn(text, output.getvalue())

    def test_the_repository_publishes_one_public_key(self):
        key = signature.read_public(REPO / "morphe-signing.pub")
        self.assertEqual("4d8d c2b3 fbcd 3ab6", signature.fingerprint(key))
        ignored = (REPO / ".gitignore").read_text(encoding="utf-8").splitlines()
        self.assertIn("morphe-signing.key", ignored)


if __name__ == "__main__":
    unittest.main()
