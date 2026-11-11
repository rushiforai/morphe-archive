"""The storage audit must be able to fail: on the STOCK image with nothing accounted it has to find the legacy
renderer's accesses (Init header writes, Setup/Flip projection views) as RENDERER hits, and the owner functions
of other classes (QSVLClient, ValueTransportSystem) must be classified, not skipped."""
import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, '..', 'tools'))
try:
    import scene_lib
    import audit_native_support as _  # noqa: F401
except ImportError:
    scene_lib = None


@unittest.skipUnless(scene_lib is not None and os.path.exists(scene_lib.lib_path(5002395)), 'needs decoded 5002395')
class AuditSelfTest(unittest.TestCase):
    def test_detector_finds_renderer_accesses_on_stock(self):
        import storage_audit
        import nq_sites
        s = scene_lib.Scene(5002395)
        from audit_native_support import decode_all
        ins = decode_all(s)
        hits, bad = storage_audit.audit_storage(s, ins, [(0x1728, 0x17E8), (0x17E8, 0x17F0), (0x1800, 0x1818), (0x1A10, 0x1BF0)],
                                               (0x17F0, 0x1800), [], (0, 0), 0)
        kinds = {}
        for h in hits:
            kinds[h[-1]] = kinds.get(h[-1], 0) + 1
        self.assertGreater(kinds.get('RENDERER', 0), 20, kinds)
        names = {h[5] for h in hits if h[-1] == 'RENDERER'}
        for needle in ('4Init', 'SetupSwapchains', 'FlipFrame', 'GetProjectionLayers'):
            self.assertTrue(any(needle in n for n in names), (needle, names))
        self.assertTrue(any(h[-1] == 'FOREIGN' and 'QSVLClient' in h[5] for h in hits), 'owner functions are classified')


if __name__ == '__main__':
    unittest.main()
