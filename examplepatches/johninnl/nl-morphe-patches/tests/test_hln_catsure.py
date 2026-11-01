"""Reject register drift at the preserved local persistence boundaries."""
from pathlib import Path
import unittest

from hln_catsure import QueueVM
from hln_onboarding import Obj


class HlnCatsurePersistenceTests(unittest.TestCase):
    def fixture(self):
        vm = QueueVM(Path('unused'))
        vm.persistence = Obj('Lxc1;')
        vm.persisted = []
        return vm, Obj('Lib1;')

    def construct(self, vm, task, selector=1, store=None):
        vm.invoke('Lib1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lzs3;B)V',
                  [task, vm.persistence if store is None else store, 'controlled-serialized-queue', 0, selector], 'invoke-direct')

    def test_skipped_original_selector_initialization_is_rejected(self):
        vm, task = self.fixture()
        with self.assertRaisesRegex(AssertionError, 'selector 1'):
            self.construct(vm, task, selector='NewQueue: ')

    def test_skipped_original_launch_mask_initialization_is_rejected(self):
        vm, task = self.fixture()
        self.construct(vm, task)
        with self.assertRaisesRegex(AssertionError, 'mask 3'):
            vm.invoke('Lrw8;->N(Lfw3;Lsv3;Ljw3;Lh17;I)Ld2g;',
                      [Obj('Lhg2;'), 0, 0, task, 6], 'invoke-static')

    def test_coroutine_preserves_original_store_identity(self):
        vm, task = self.fixture()
        with self.assertRaisesRegex(AssertionError, 'original local persistence instance'):
            self.construct(vm, task, store=Obj('Lxc1;'))

    def test_original_selector_mask_and_store_reach_persistence(self):
        vm, task = self.fixture()
        self.construct(vm, task)
        vm.invoke('Lrw8;->N(Lfw3;Lsv3;Ljw3;Lh17;I)Ld2g;',
                  [Obj('Lhg2;'), 0, 0, task, 3], 'invoke-static')
        self.assertEqual(vm.events, [('persisted', [])])


if __name__ == '__main__':
    unittest.main()
