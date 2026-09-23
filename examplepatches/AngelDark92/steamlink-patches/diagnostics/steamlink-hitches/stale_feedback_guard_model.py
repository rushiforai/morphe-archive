"""Offline proposal model, NOT a DLL patch or runtime hook.

Checks a narrowly bounded additional early return in the host pose handler.
The model deliberately retains stock behavior for every other packet. It cannot
predict how many recorded resets would disappear: mismatch logs omit reset IDs.
No ADB, process attachment, settings writes, or binary writes.
"""
from dataclasses import dataclass
from pathlib import Path
import argparse
import hashlib
import json
import struct
import unittest


HOST_SHA256 = 'a4bc1ac8a0739c6dc53ea56a300b6332ec74c9fb850e260a483bab5ef1a7da85'
HOST_FILE_SIZE = 13_908_632
HOST_HANDLER_RVA = 0x9FC430
HOST_HANDLER_PREFIX = bytes.fromhex(
    '4055535741544156488dac2420ffffff4881ece0010000488bd94d8be0'
    '8b4a1c4c8bf28bf92b7b08'
)
SUPPORTED_CLIENTS = {('2.0.22', 5002322), ('2.0.23', 5002363)}
MAX_STALE_CYCLES = 32  # Experimental bound; observed negative jumps reach 29.


@dataclass(frozen=True)
class Packet:
    cycle: int
    reset: int
    schema: int = 0x0A
    payload_size: int = 0x168


def proposed_skip_pose_section(packet, *, last_cycle, last_reset,
                               enabled=False, verified_host=False,
                               galaxy_xr=False, client=None):
    """Additional filter only. False means execute the complete stock handler.

    A true result must return only from RVA 0x9fc430, allowing its caller to
    continue button/value handling. It DOES skip all 3 HMD/controller pose
    updates and timing/activity work in the inner handler; it is not a claim
    that all controller behavior is preserved. This is not whole-packet rejection.
    Startup ID 0, signed-ID transitions, reset changes, forward gaps and large
    backward transitions deliberately remain with stock recovery.
    """
    if not (enabled and verified_host and galaxy_xr and client in SUPPORTED_CLIENTS):
        return False
    if packet.schema != 0x0A or packet.payload_size < 0x168:
        return False
    if not (0 < packet.cycle < 0x80000000 and 0 < last_cycle < 0x80000000):
        return False
    if not (0 <= packet.reset <= 0xFFFF and 0 <= last_reset <= 0xFFFF):
        return False
    if packet.reset != last_reset:
        return False
    # Equality is not a connection-epoch check. A runtime implementation still
    # needs independently verified reconnect/lifecycle handling before enablement.
    behind = last_cycle - packet.cycle
    return 6 <= behind <= MAX_STALE_CYCLES


def verify_host_file(path):
    """Read-only exact binary/layout check for the proposal's documented target."""
    data = path.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    if len(data) != HOST_FILE_SIZE or digest != HOST_SHA256:
        raise ValueError('Unverified host binary; no layout assumptions permitted')
    pe = struct.unpack_from('<I', data, 0x3C)[0]
    if data[pe:pe + 4] != b'PE\0\0':
        raise ValueError('PE signature mismatch')
    count = struct.unpack_from('<H', data, pe + 6)[0]
    optional_size = struct.unpack_from('<H', data, pe + 20)[0]
    table = pe + 24 + optional_size
    for i in range(count):
        section = table + 40 * i
        rva, raw_size, raw = struct.unpack_from('<III', data, section + 12)
        if rva <= HOST_HANDLER_RVA and HOST_HANDLER_RVA + len(HOST_HANDLER_PREFIX) <= rva + raw_size:
            offset = raw + HOST_HANDLER_RVA - rva
            if data[offset:offset + len(HOST_HANDLER_PREFIX)] != HOST_HANDLER_PREFIX:
                raise ValueError('Handler prefix mismatch')
            return {'sha256': digest, 'size': len(data), 'handler_rva': hex(HOST_HANDLER_RVA),
                    'handler_file_offset': hex(offset), 'prefix_bytes_verified': len(HOST_HANDLER_PREFIX)}
    raise ValueError('Handler bytes not mapped by a raw PE section')


class ProposalChecks(unittest.TestCase):
    def check_packet(self, cycle=990, reset=7, **kwargs):
        options = dict(last_cycle=1000, last_reset=7, enabled=True, verified_host=True,
                       galaxy_xr=True, client=('2.0.23', 5002363))
        options.update(kwargs)
        return proposed_skip_pose_section(Packet(cycle, reset), **options)

    def test_default_off(self):
        self.assertFalse(proposed_skip_pose_section(Packet(990, 7), last_cycle=1000, last_reset=7))

    def test_lag_boundaries(self):
        for difference in range(-200, 201):
            with self.subTest(difference=difference):
                self.assertEqual(self.check_packet(cycle=1000 + difference), -32 <= difference <= -6)

    def test_all_reset_counter_changes_pass_through(self):
        for reset in range(65536):
            self.assertEqual(self.check_packet(reset=reset), reset == 7)

    def test_reset_wrap_passes_through(self):
        self.assertFalse(self.check_packet(reset=0, last_reset=65535))
        self.assertFalse(self.check_packet(reset=65535, last_reset=0))

    def test_initialization_and_large_transitions_pass_through(self):
        for incoming, previous in [(0, 10), (10, 0), (0, 0), (1, 1000),
                                   (0, 0xFFFFFFFF), (0xFFFFFFFF, 1),
                                   (0x80000000, 0x7FFFFFFF), (0x7FFFFFFF, 0x80000000)]:
            self.assertFalse(self.check_packet(cycle=incoming, last_cycle=previous))

    def test_exact_client_scope(self):
        for client in SUPPORTED_CLIENTS:
            self.assertTrue(self.check_packet(client=client))
        for client in [('2.0.22', 5002313), ('2.0.23', 5002322), ('2.0.24', 5002363), None]:
            self.assertFalse(self.check_packet(client=client))
        for key in ['enabled', 'verified_host', 'galaxy_xr']:
            self.assertFalse(self.check_packet(**{key: False}))

    def test_schema_and_length(self):
        options = dict(last_cycle=1000, last_reset=7, enabled=True, verified_host=True,
                       galaxy_xr=True, client=('2.0.23', 5002363))
        self.assertFalse(proposed_skip_pose_section(Packet(990, 7, schema=9), **options))
        self.assertFalse(proposed_skip_pose_section(Packet(990, 7, payload_size=0x167), **options))

    def test_reconnect_counterexample_remains_unsafe(self):
        # Reused host state and equal reset ID can misclassify a fresh session.
        # Keep this counterexample explicit rather than presenting model success
        # as proof that an unintegrated guard is safe to deploy.
        self.assertTrue(self.check_packet(cycle=1, last_cycle=20))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--host-dll', type=Path)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    evidence = {'kind': 'offline proposal model; no runtime patch', 'max_stale_cycles': MAX_STALE_CYCLES}
    if args.host_dll:
        evidence['host_binary'] = verify_host_file(args.host_dll)
    result = unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(ProposalChecks))
    evidence['test_methods'] = result.testsRun
    evidence['tests_passed'] = result.wasSuccessful()
    evidence['limitation'] = 'Model tests and file identity do not prove hook integration, runtime safety, or hitch improvement.'
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(evidence, indent=2), encoding='utf-8')
    print(json.dumps(evidence, indent=2))
    raise SystemExit(0 if result.wasSuccessful() else 1)


if __name__ == '__main__':
    main()
