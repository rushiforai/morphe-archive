#!/usr/bin/env python3
"""Run existing acceptance tools against an explicitly owned disposable AVD.

The default shared penguin target remains unchanged. Physical devices remain
forbidden by both this descriptor validator and Android.verify().
"""
import argparse
from contextlib import contextmanager
import fcntl
import json
from pathlib import Path
import re
import runpy
import sys

import android_acceptance as base

SCRIPTS = ('android_acceptance', 'manager_ui', 'manager_case', 'manager_fault',
           'next_fixes_acceptance', 'ui_fixes_acceptance', 'artist_review_acceptance', 'artist_persistence')

@contextmanager
def target_lock(descriptor):
    with descriptor.with_suffix('.control.lock').open('a') as handle:
        try:
            fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as error:
            raise RuntimeError('Another controller owns this isolated Android target; wait for it to finish') from error
        try:
            yield
        finally:
            fcntl.flock(handle, fcntl.LOCK_UN)



def validate_target(path, repo=base.REPO_ROOT):
    scratch = (repo / '.scratch').resolve()
    path = path.expanduser().resolve()
    if not path.is_relative_to(scratch):
        raise ValueError('Owned target descriptor must be inside this checkout .scratch')
    target = json.loads(path.read_text())
    if target.get('schema') != 1 or target.get('disposable') is not True:
        raise ValueError('Expected an explicitly disposable schema-1 target')
    match = re.fullmatch(r'emulator-([0-9]+)', target['serial'])
    if not match or not (5554 <= int(match[1]) <= 5682) or int(match[1]) % 2:
        raise ValueError('Target must be an emulator with an even console port')
    if not re.fullmatch(r'finamp-isolated-[a-z0-9-]+', target['avd']):
        raise ValueError('Expected a dedicated finamp-isolated-* AVD')
    directory = Path(target['avd_directory']).resolve()
    if not directory.is_relative_to(path.parent) or not (directory / 'config.ini').is_file():
        raise ValueError('Dedicated AVD must live beside its owned descriptor')
    port = target['fixture_port']
    if type(port) is not int or not 1024 <= port <= 65535 or port == 18961:
        raise ValueError('Use a separate unprivileged fixture port')
    return target


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--target', type=Path, required=True)
    parser.add_argument('script', choices=SCRIPTS)
    parser.add_argument('arguments', nargs=argparse.REMAINDER)
    args = parser.parse_args()
    target = validate_target(args.target)
    base.SERIAL, base.AVD, base.PORT = target['serial'], target['avd'], target['fixture_port']
    base.BASE_URL = f'http://127.0.0.1:{base.PORT}'
    script = Path(__file__).with_name(args.script + '.py')
    sys.argv = [str(script), *args.arguments]
    with target_lock(args.target.expanduser().resolve()):
        if args.script == 'android_acceptance':
            # Run the already configured module rather than creating a second copy.
            base.main()
        else:
            runpy.run_path(str(script), run_name='__main__')


if __name__ == '__main__':
    main()
