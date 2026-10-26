#!/usr/bin/env python3
"""Exercise #1504 through the installed app's real UI on a disposable emulator.

Requires English UI, a visible top search bar, and no real user data. No APK is
installed or uninstalled by this script. A failed setup is an error, never PASS.
"""
import argparse
import re
import subprocess
import time
import xml.etree.ElementTree as ET
from pathlib import Path


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--adb', required=True)
    p.add_argument('--serial', default='emulator-5580')
    p.add_argument('--package', default='de.mm20.launcher2.release')
    p.add_argument('--button', choices=['hidden', 'visible'], default='hidden')
    p.add_argument('--layout', choices=['separate', 'home'], default='separate')
    p.add_argument('--start-page', choices=['home', 'widgets', 'search'], default='home')
    p.add_argument('--artifacts', type=Path, required=True)
    a = p.parse_args()
    assert a.serial.startswith('emulator-'), 'Refusing physical-device execution'
    assert a.package in ('de.mm20.launcher2.release', 'de.mm20.launcher2.debug')
    a.artifacts.mkdir(parents=True, exist_ok=True)

    def adb(*args, binary=False):
        r = subprocess.run([a.adb, '-s', a.serial, *map(str, args)],
                           check=True, capture_output=True, timeout=30)
        return r.stdout if binary else r.stdout.decode()

    assert adb('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'

    def snapshot(name):
        # uiautomator can return exit 0 after failing to dump. Never accept a
        # previous dump (e.g. the other installed launcher's last window).
        for attempt in range(4):
            adb('shell', 'rm', '-f', '/sdcard/penguin-kvaesitso.xml')
            result = adb('shell', 'uiautomator', 'dump', '/sdcard/penguin-kvaesitso.xml')
            if 'dumped to:' not in result:
                time.sleep(.5)
                continue
            xml = adb('shell', 'cat', '/sdcard/penguin-kvaesitso.xml')
            root = ET.fromstring(xml)
            if any(n.get('package') == a.package for n in root.iter('node')):
                (a.artifacts / (name + '.xml')).write_text(xml)
                return root
            time.sleep(.5)
        raise AssertionError('No fresh UI hierarchy from target package: ' + a.package)

    def find(root, label):
        matches = [n for n in root.iter('node')
                   if label in (n.get('text'), n.get('content-desc'))]
        if label == 'More actions':
            # Notes also have an overflow; select this fixture's top search bar.
            matches.sort(key=lambda n: int(re.findall(r'\d+', n.get('bounds'))[1]))
        return next(iter(matches), None)

    def tap(label, name):
        root = snapshot(name)
        n = find(root, label)
        assert n is not None, 'Required UI control missing: ' + label
        x1, y1, x2, y2 = map(int, re.findall(r'\d+', n.get('bounds')))
        adb('shell', 'input', 'tap', (x1+x2)//2, (y1+y2)//2)
        time.sleep(.4)

    def back():
        adb('shell', 'input', 'keyevent', 'KEYCODE_BACK')
        time.sleep(.4)

    def scroll_to(label, name):
        for attempt in range(8):
            root = snapshot(name + '-' + str(attempt))
            if find(root, label) is not None:
                return
            adb('shell', 'input', 'swipe', 540, 1800, 540, 700, 350)
            time.sleep(.3)
        raise AssertionError('Control not reachable by scrolling: ' + label)

    def preference_switch(root, label):
        n = find(root, label)
        assert n is not None, 'Preference missing: ' + label
        parents = {child: parent for parent in root.iter() for child in parent}
        while n in parents:
            n = parents[n]
            switches = [s for s in n.iter('node') if s.get('checkable') == 'true']
            if switches:
                assert len(switches) == 1, 'Cannot identify preference switch: ' + label
                return switches[0]
        raise AssertionError('Preference switch missing: ' + label)

    def set_switch(label, wanted):
        root = snapshot('preference-before-' + label)
        if (preference_switch(root, label).get('checked') == 'true') != wanted:
            tap(label, 'toggle-' + label)
        root = snapshot('preference-after-' + label)
        assert (preference_switch(root, label).get('checked') == 'true') == wanted

    adb('shell', 'am', 'force-stop', a.package)
    adb('shell', 'am', 'start', '-W', '-a', 'android.intent.action.MAIN',
        '-c', 'android.intent.category.HOME', '-p', a.package)
    tap('More actions', 'home')
    tap('Settings', 'initial-menu')
    tap('Home screen', 'settings')
    wanted = a.button == 'visible'
    set_switch('Edit button', wanted)
    set_switch('Widgets on home screen', a.layout == 'home')
    print('Verified edit button preference: ' + a.button, flush=True)
    back()
    back()
    if a.start_page == 'widgets' and a.layout == 'separate':
        adb('shell', 'input', 'swipe', 540, 1800, 540, 800, 350)
    elif a.start_page == 'search':
        tap('Search', 'open-search')
    tap('More actions', 'home-after-setting')
    menu = snapshot('menu')
    (a.artifacts / 'menu.png').write_bytes(adb('exec-out', 'screencap', '-p', binary=True))
    labels = [n.get('text') for n in menu.iter('node') if n.get('text')]
    print('Search bar menu: ' + ', '.join(labels), flush=True)
    if wanted:
        assert find(menu, 'Edit widgets') is None, 'Duplicate menu action with visible button'
        back()
        if a.layout == 'separate' and a.start_page != 'widgets':
            adb('shell', 'input', 'swipe', 540, 1800, 540, 800, 350)
        scroll_to('Edit widgets', 'find-visible-edit-button')
        tap('Edit widgets', 'visible-edit-button')
    else:
        assert find(menu, 'Edit widgets') is not None, (
            'FAIL #1504: Edit widgets is inaccessible from the search bar menu '
            'when the edit button is hidden')
        tap('Edit widgets', 'edit-action')
    editor = snapshot('editor')
    assert find(editor, 'Done') is not None, 'Widget editor navigation missing'
    assert find(editor, 'Edit widgets') is not None, 'Widget editor title missing'
    # The actual widget editor has an Add widget action; a menu label alone
    # must never satisfy this regression test. The full-height clock may put
    # the action below the viewport in the combined home layout.
    scroll_to('Add widget', 'find-add-widget')
    editor = snapshot('editor-visible')
    assert find(editor, 'Add widget') is not None, 'Widget editing did not expose Add widget'
    (a.artifacts / 'editor.png').write_bytes(adb('exec-out', 'screencap', '-p', binary=True))
    tap('Done', 'done')
    tap('More actions', 'after-done')
    again = snapshot('menu-after-done')
    assert (find(again, 'Edit widgets') is not None) != wanted
    if not wanted:
        tap('Edit widgets', 'edit-again')
        back()
        tap('More actions', 'after-back')
        assert find(snapshot('menu-after-back'), 'Edit widgets') is not None
    back()
    # Entering/exiting edit mode must not silently enable the hidden button.
    tap('More actions', 'verify-preference-home')
    tap('Settings', 'verify-preference-menu')
    tap('Home screen', 'verify-preference-settings')
    assert (preference_switch(snapshot('final-preference'), 'Edit button').get('checked') == 'true') == wanted
    print('PASS: ' + a.button + ' button, ' + a.layout + ' layout, from ' + a.start_page +
          '; editor usable, exits unlock navigation, preference preserved')


if __name__ == '__main__':
    main()
