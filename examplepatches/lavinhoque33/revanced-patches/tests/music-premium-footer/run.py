#!/usr/bin/env python3
# Copyright (C) 2026 lavinhoque33
# Licensed under the GNU General Public License v3.0 or later.
# Written by lavinhoque33, 2026-11-17.
"""Compile the actual ads helper and test both restart-loaded setting values."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / ('extensions/shared/src/main/java/app/morphe/extension/'
                 'music/patches/ads/MusicAdsPatch.java')
SOURCES = {
    'android/view/View.java': '''
package android.view;
public class View { public static final int VISIBLE = 0, INVISIBLE = 4, GONE = 8; }
''',
    'app/morphe/extension/music/settings/Settings.java': '''
package app.morphe.extension.music.settings;
public class Settings {
    public static final Flag HIDE_GET_PREMIUM_LABEL = new Flag();
    public static final Flag HIDE_MUSIC_ADS = new Flag();
    public static class Flag { public boolean get() { return Boolean.getBoolean("hide"); } }
}
''',
    'MusicPremiumFooterTest.java': '''
import android.view.View;
import app.morphe.extension.music.patches.ads.MusicAdsPatch;
public class MusicPremiumFooterTest {
    public static void main(String[] args) {
        boolean hide = Boolean.parseBoolean(args[0]);
        for (int original : new int[] {View.VISIBLE, View.INVISIBLE, View.GONE}) {
            int actual = MusicAdsPatch.getPremiumLabelVisibility(new View(), original);
            int expected = hide ? View.GONE : original;
            if (actual != expected) throw new AssertionError(actual + " != " + expected);
        }
        System.out.println("Premium footer: hide=" + hide + ": 3 visibility cases passed");
    }
}
''',
}


def main():
    java_home = os.environ.get('JAVA_HOME')
    def tool(name):
        return str(Path(java_home) / 'bin' / name) if java_home else name
    with tempfile.TemporaryDirectory(prefix='rvx-footer-tests-') as directory:
        output = Path(directory)
        sources = [str(SOURCE)]
        for name, content in SOURCES.items():
            path = output / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content)
            sources.append(str(path))
        subprocess.run([tool('javac'), '-d', str(output), *sources], check=True)
        for hide in ('true', 'false'):
            subprocess.run([tool('java'), f'-Dhide={hide}', '-cp', str(output),
                            'MusicPremiumFooterTest', hide], check=True)


if __name__ == '__main__':
    main()
