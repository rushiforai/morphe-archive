#!/usr/bin/env python3
"""Structural regression checks against apktool-decoded real input/output APKs."""
import pathlib
import re
import sys
import unittest
import xml.etree.ElementTree as ET

ROOT = pathlib.Path(sys.argv.pop(1))
ANDROID = '{http://schemas.android.com/apk/res/android}'
EXT = 'Lnl/nlziet/pip/NativePip;'


def smali(suffix):
    files = list(ROOT.glob('smali*/' + suffix + '.smali'))
    assert len(files) == 1, (suffix, files)
    return files[0].read_text()


def method(text, name):
    return re.search(r'\.method[^\n]* ' + re.escape(name) + r'\([^\n]*\n(.*?)\.end method', text, re.S).group(1)


class NativePipApk(unittest.TestCase):
    def test_activity_declares_pip_and_retains_single_task(self):
        root = ET.parse(ROOT / 'AndroidManifest.xml').getroot()
        activity = next(a for a in root.iter('activity') if a.get(ANDROID + 'name') == 'nl.nlziet.mobile.app.di.mobile.InjectActivity')
        self.assertEqual(activity.get(ANDROID + 'supportsPictureInPicture'), 'true')
        self.assertEqual(activity.get(ANDROID + 'launchMode'), 'singleTask')
        self.assertTrue({'orientation', 'screenSize', 'smallestScreenSize', 'screenLayout'} <= set(activity.get(ANDROID + 'configChanges').split('|')))

    def test_leave_hook_is_activity_scoped(self):
        activity = smali('nl/nlziet/mobile/app/di/mobile/InjectActivity')
        self.assertIn(EXT + '->onUserLeaveHint(Landroid/app/Activity;)V', activity)
        self.assertIn('Lfi5;->onUserLeaveHint()V', activity)

    def test_sdk_pause_only_is_conditional(self):
        fragment = smali('nl/nlziet/mobile/presentation/ui/player/PlayerFragment')
        pause = method(fragment, 'onPause')
        self.assertIn(EXT + '->onPlayerPause(Ljava/lang/Object;)V', pause)
        self.assertIn('Ljava/util/Timer;->cancel()V', pause)
        self.assertIn('Landroidx/fragment/app/o;->onPause()V', pause)

    def test_pip_mode_callback_and_resume_restore(self):
        activity = smali('nl/nlziet/mobile/app/di/mobile/InjectActivity')
        self.assertIn(EXT + '->onModeChanged(Landroid/app/Activity;ZLandroid/content/res/Configuration;)V', activity)
        self.assertIn(EXT + '->onResume(Landroid/app/Activity;)V', method(activity, 'onResume'))

    def test_stop_and_destroy_cleanup_remain(self):
        fragment = smali('nl/nlziet/mobile/presentation/ui/player/PlayerFragment')
        self.assertIn('Lcom/bitmovin/player/PlayerView;->onStop()V', method(fragment, 'onStop'))
        self.assertIn('Lcom/bitmovin/player/api/Player;->unload()V', method(fragment, 'onStop'))
        self.assertIn('Landroidx/fragment/app/o;->onDestroyView()V', method(fragment, 'onDestroyView'))

    def test_extension_is_present_without_bundled_sdk_stubs(self):
        self.assertTrue(list(ROOT.glob('smali*/nl/nlziet/pip/NativePip.smali')), 'Native PiP runtime extension missing')
        self.assertEqual(len(list(ROOT.glob('smali*/com/bitmovin/player/PlayerView.smali'))), 1)


if __name__ == '__main__':
    unittest.main()
