"""Independent consent migration, manual-route and complete-method checks."""
import hashlib
import os
from pathlib import Path
import re
import unittest

from atv_smali import class_methods, graph
from verify_videoland import CONTRACTS, CONSENT_CONTRACTS, edited_graph, verify_methods


class ConsentPolicyTests(unittest.TestCase):
    def test_reject_only_on_first_migration_or_real_reconsent(self):
        program = graph(CONSENT_CONTRACTS[0]['edits'][0]['effect'])
        def execute(migrated, needs_consent):
            pc, result, value, text, events = 0, None, None, None, []
            while pc < len(program):
                row = program[pc]
                if row.startswith('const-string p1,'): text = row.split('"')[1]
                elif row.startswith('const/4 v0,'): value = bool(int(row.rsplit(' ', 1)[1], 16))
                elif '->getBoolean(' in row: result = migrated
                elif '->shouldShowBanner()Z' in row: result = needs_consent
                elif row == 'move-result v0': value = result
                elif row.startswith('if-eqz v0,') and not value:
                    pc = int(row.split('@')[1]); continue
                elif '->saveConsent(' in row: events.append(('reject', text))
                elif '->putBoolean(' in row: events.append(('marker', text, value))
                elif '->apply()V' in row: events.append(('persist',))
                pc += 1
            return events
        for migrated, needs_consent in ((False, False), (False, True), (True, True)):
            self.assertEqual(execute(migrated, needs_consent), [
                ('reject', 'Banner - Reject All'), ('marker', 'necessary_consent_policy_v1', True), ('persist',)])
        self.assertEqual(execute(True, False), [])

    def test_startup_returns_native_ready_without_permission_result(self):
        program = graph(CONSENT_CONTRACTS[1]['edits'][0]['effect'])
        self.assertEqual(program, [
            'new-instance v0, Lri/o;', 'const/4 v1, 0x1', 'const/4 v2, 0x1',
            'const/4 v3, 0x0',
            'invoke-direct {v0, v1, v2, v3}, Lri/o;-><init>(ZZLcom/bedrockstreaming/feature/splash/domain/usecase/tasks/f;)V',
            'return-object v0'])

    def test_manual_toggle_records_explicit_opt_in(self):
        effect = CONSENT_CONTRACTS[-1]['edits'][0]['effect']
        self.assertIn('PushPermissionStatus;->d:', effect)


@unittest.skipUnless(os.environ.get('VIDEOLAND_CONSENT_ORIGINAL') and os.environ.get('VIDEOLAND_CONSENT_OUTPUT'),
                     'Provide independently decoded original and consent candidate roots')
class ConsentArtifactTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.before, cls.after = {}, {}
        for env, result in [('VIDEOLAND_CONSENT_ORIGINAL', cls.before), ('VIDEOLAND_CONSENT_OUTPUT', cls.after)]:
            root = Path(os.environ[env])
            extra = [{'owner': 'Lcom/bedrockstreaming/feature/pushnotification/presentation/mobile/PushNotificationPermissionActivity;'}]
            for contract in CONTRACTS + CONSENT_CONTRACTS + extra:
                owner = contract['owner'][1:-1]
                package, leaf = owner.rsplit('/', 1)
                candidates = list(root.glob('smali*/' + owner + '*.smali'))
                candidates += list(root.glob('smali*/' + package + '.*/' + leaf + '*.smali'))
                matches = [p for p in set(candidates) if
                    re.search(r'^\.class[^\n]* (L[^;]+;)', p.read_text(), re.M)[1] == contract['owner']]
                assert len(matches) == 1, owner
                result.update(class_methods(matches[0]))

    def test_all_effects_and_original_tails(self):
        verify_methods(self.before, self.after, True, True, True)

    def test_nonzero_inserted_branch_destinations_are_verified(self):
        for contract in CONSENT_CONTRACTS:
            key = contract['owner'] + '->' + contract['signature']
            branches = [i for i, row in enumerate(self.after[key]) if row.startswith('if-')]
            if not any(edit['remove'] == 0 for edit in contract['edits']):
                continue
            with self.subTest(key=key):
                after = dict(self.after)
                after[key] = list(after[key])
                # Corrupt an inserted branch target as the nonzero-offset
                # assembler relocation bug did; preserved tails are insufficient.
                before_branches = set(self.before[key])
                index = next(i for i in branches if self.after[key][i] not in before_branches)
                after[key][index] = re.sub(r'@\d+', '@0', after[key][index])
                with self.assertRaisesRegex(AssertionError, 'Incorrect consent effect'):
                    verify_methods(self.before, after, True, True, True)

    def test_each_consent_effect_is_required(self):
        for contract in CONSENT_CONTRACTS:
            key = contract['owner'] + '->' + contract['signature']
            with self.subTest(key=key):
                after = dict(self.after)
                after[key] = self.before[key]
                with self.assertRaisesRegex(AssertionError, 'Incorrect consent effect.*' + re.escape(key)):
                    verify_methods(self.before, after, True, True, True)

    def test_notification_activity_and_request_bookkeeping_remain_original(self):
        # q(FALSE) is the app's real status update/finish, not a synthetic callback.
        activity = 'Lcom/bedrockstreaming/feature/pushnotification/presentation/mobile/PushNotificationPermissionActivity;'
        key = activity + '->q(' + activity + 'Ljava/lang/Boolean;)V'
        self.assertEqual(self.before[key], self.after[key])
        self.assertTrue(any('->finish()V' in row for row in self.after[key]))
        for signature in ('onCreate(Landroid/os/Bundle;)V', 'A()V', 'B()V'):
            self.assertEqual(self.before[activity + '->' + signature], self.after[activity + '->' + signature])
        self.assertTrue(any('Lki/i;-><init>' in row for row in self.after[activity + '->A()V']))
        self.assertTrue(any('Lki/j;-><init>' in row for row in self.after[activity + '->B()V']))


if __name__ == '__main__':
    unittest.main()
