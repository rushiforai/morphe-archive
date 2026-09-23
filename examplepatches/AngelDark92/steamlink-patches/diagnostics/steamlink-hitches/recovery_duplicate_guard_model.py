"""Offline FEC duplicate-guard proposal and exact-base audit. Never writes an APK.

This models the existing 128-entry equality checks, not the entire FEC/codec
state machine. Passing checks does not establish runtime recovery or improvement.
"""
from pathlib import Path
import argparse
import hashlib
import json
import unittest


BASES = {
    ('2.0.22', '5002322'): dict(size=2283400,
        sha='e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f',
        function=0x167050, site=0x167094,
        function_sha='e1c49caa38c49b97f2151263b39d9e7777a394bfda36faa1186c1119fae7bc14'),
    ('2.0.23', '5002363'): dict(size=2292008,
        sha='628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0',
        function=0x167f1c, site=0x167f60,
        function_sha='22eb5623fd4bc06b3464dcadaf26c160cd4b460c3e0f428ebefeb72052700121'),
}
ORIGINAL = bytes.fromhex('28010034')  # cbz w8, site + 0x24
PROPOSED = bytes.fromhex('1f2003d5')  # nop: execute the existing equality checks


def duplicate_guard(frame_id, descriptor_present, accepted, submitted, enabled=False):
    """True means the native duplicate guard returns before frame initialization.

    Markers mean accepted/submission-attempt bookkeeping, NOT decoded success.
    No invented serial ordering or connection epoch is introduced here.
    """
    if not 0 <= frame_id <= 0xffff or len(accepted) != 128 or len(submitted) != 128:
        raise ValueError('Require uint16 wire frame ID and 2 complete 128-entry rings')
    slot = frame_id & 127
    return bool(descriptor_present or enabled) and (
        accepted[slot] == frame_id or submitted[slot] == frame_id)


def initial_ring():
    # Native constructor: entry 0 = -1; entries 1..127 = 0.
    return [0xffffffff] + [0] * 127


def late_duplicate_guard(frame_id, accepted, submitted):
    """InternalAcceptFrameFromRX already applies this without descriptor gating."""
    return duplicate_guard(frame_id, True, accepted, submitted)


def audit_base(repo, version, code):
    layout = BASES[(version, code)]
    path = repo / f'decoded-apk-android-steamlinkvr-release-base-{version}-{code}/lib/arm64-v8a/libvrlink_scene.so'
    before = path.read_bytes()
    digest = lambda value: hashlib.sha256(value).hexdigest()
    if len(before) != layout['size'] or digest(before) != layout['sha']:
        raise ValueError(f'Exact pristine base identity mismatch: {version}/{code}')
    lo, site = layout['function'], layout['site']
    if digest(before[lo:lo + 0x294]) != layout['function_sha'] or before[site:site + 4] != ORIGINAL:
        raise ValueError('Function/site mismatch')
    # Preview in memory only; there is deliberately no binary output option.
    preview = bytearray(before)
    preview[site:site + 4] = PROPOSED
    assert [i for i, (a, b) in enumerate(zip(before, preview)) if a != b] == list(range(site, site + 4))
    again = bytearray(preview)
    again[site:site + 4] = PROPOSED
    assert again == preview
    assert path.read_bytes() == before
    return dict(version=version, code=code, source=str(path.resolve()),
        size=len(before), sha256=digest(before), function_offset=hex(lo),
        function_size='0x294', function_sha256=layout['function_sha'], site=hex(site),
        original=ORIGINAL.hex(), proposed=PROPOSED.hex(),
        context_start=hex(site - 16), context_hex=before[site - 16:site + 32].hex(),
        preview_sha256=digest(preview), changed_bytes=4, idempotent_preview=True,
        source_unchanged=True)


class GuardChecks(unittest.TestCase):
    def test_constructor_all_wire_ids_pass(self):
        accepted, submitted = initial_ring(), initial_ring()
        for fid in range(65536):
            self.assertFalse(duplicate_guard(fid, False, accepted, submitted, True))

    def test_only_new_behavior_is_flag_clear_and_exact_marker_match(self):
        for fid in [0, 1, 127, 128, 14528, 65535]:
            for present in [False, True]:
                for a_match in [False, True]:
                    for s_match in [False, True]:
                        a, s = initial_ring(), initial_ring()
                        a[fid & 127] = fid if a_match else (fid + 128) & 0xffff
                        s[fid & 127] = fid if s_match else (fid + 256) & 0xffff
                        old = duplicate_guard(fid, present, a, s)
                        new = duplicate_guard(fid, present, a, s, True)
                        self.assertEqual(new, a_match or s_match)
                        self.assertEqual(new != old, not present and (a_match or s_match))
                        # For an unchanged marker state, every newly rejected
                        # descriptor would already be rejected at submission.
                        if new and not old:
                            self.assertTrue(late_duplicate_guard(fid, a, s))

    def test_recovery_clears_descriptor_but_retains_marker(self):
        a, s = initial_ring(), initial_ring()
        s[14528 & 127] = 14528
        self.assertTrue(duplicate_guard(14528, True, a, s))
        self.assertFalse(duplicate_guard(14528, False, a, s))
        self.assertTrue(duplicate_guard(14528, False, a, s, True))
        self.assertFalse(duplicate_guard(14529, False, a, s, True))

    def test_ring_slot_reuse_is_not_id_equality(self):
        a, s = initial_ring(), initial_ring()
        s[5] = 5
        self.assertFalse(duplicate_guard(133, False, a, s, True))
        s[5] = 133
        self.assertFalse(duplicate_guard(5, False, a, s, True))

    def test_normal_sequential_wire_wrap(self):
        a, s = initial_ring(), initial_ring()
        for n in range(65536 + 256):
            fid = n & 0xffff
            self.assertFalse(duplicate_guard(fid, False, a, s, True))
            s[fid & 127] = fid

    def test_reconnect_requires_real_lifecycle_reset(self):
        a, s = initial_ring(), initial_ring()
        s[7] = 7
        # Deliberate counterexample: reused object/rings can suppress a fresh ID.
        self.assertTrue(duplicate_guard(7, False, a, s, True))
        self.assertFalse(duplicate_guard(7, False, initial_ring(), initial_ring(), True))

    def test_marked_keyframe_replay_is_already_rejected_later(self):
        a, s = initial_ring(), initial_ring()
        s[42] = 42
        # Neither existing equality guard checks a keyframe bit. The proposal
        # moves rejection before allocation; it does not newly make this frame
        # eligible/ineligible for eventual submission with unchanged markers.
        self.assertTrue(duplicate_guard(42, False, a, s, True))
        self.assertTrue(late_duplicate_guard(42, a, s))
        self.assertFalse(duplicate_guard(43, False, a, s, True))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo', type=Path, default=Path.cwd())
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    checks = unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(GuardChecks))
    bases = [audit_base(args.repo, *pair) for pair in BASES]
    result = dict(kind='offline proposal model and pristine native byte preview; no APK/MPP produced',
        checks=checks.testsRun, passed=checks.wasSuccessful(), bases=bases,
        limitations=['Marker arrays are not present in existing live telemetry.',
            'Accepted/submitted markers do not prove successful decode.',
            'Model is not a complete FEC state machine or reconnect/keyframe recovery proof.',
            'Full production ELF guards, dependency compatibility, Morphe APK tests, and runtime tests remain required.'])
    if args.output:
        if args.output.exists():
            raise ValueError('Refusing to overwrite an earlier proposal receipt')
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(result, indent=2), encoding='utf-8')
    print(json.dumps(result, indent=2))
    raise SystemExit(0 if checks.wasSuccessful() else 1)


if __name__ == '__main__':
    main()
