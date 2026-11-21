#!/usr/bin/env python3
# Copyright (C) 2026 lavinhoque33
# Licensed under the GNU General Public License v3.0.
# Written by lavinhoque33, 2026-11-20.
"""Replay both revisions of the real JVM Litho engine; counts are not an Android frame benchmark."""
import argparse
import os
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]
SOURCE = Path('extensions/shared/src/main/java')
SHARED = 'app/morphe/extension/shared'
COMPONENTS = f'{SHARED}/patches/components'
YOUTUBE = 'app/morphe/extension/youtube'
BASELINE = '75c8329e2e'

STUBS = {
    'android/annotation/SuppressLint.java': 'package android.annotation; public @interface SuppressLint { String[] value(); }',
    'androidx/annotation/NonNull.java': 'package androidx.annotation; public @interface NonNull {}',
    'androidx/annotation/Nullable.java': 'package androidx.annotation; public @interface Nullable {}',
    'androidx/annotation/RequiresApi.java': 'package androidx.annotation; public @interface RequiresApi { int value(); }',
    f'{SHARED}/settings/BooleanSetting.java': '''package app.morphe.extension.shared.settings;
        public final class BooleanSetting {
            public final boolean rebootApp = false;
            private final String key;
            public BooleanSetting(String key) { this.key = key; }
            public boolean get() { return Boolean.getBoolean(key); }
        }''',
    f'{SHARED}/settings/BaseSettings.java': '''package app.morphe.extension.shared.settings;
        public final class BaseSettings {
            public static final BooleanSetting DEBUG = new BooleanSetting("debug");
            public static final BooleanSetting DEBUG_PROTOBUFFER = new BooleanSetting("protodebug");
        }''',
    f'{SHARED}/utils/Logger.java': '''package app.morphe.extension.shared.utils;
        import java.util.function.Supplier;
        public final class Logger {
            public static void printDebug(Supplier<String> message) {
                if (Boolean.getBoolean("debug")) message.get();
            }
            public static void printException(Supplier<String> message) { printException(message, null); }
            public static void printException(Supplier<String> message, Throwable error) {
                if (!(error instanceof IllegalStateException)) throw new AssertionError(message.get(), error);
            }
        }''',
    f'{SHARED}/utils/PackageUtils.java': '''package app.morphe.extension.shared.utils;
        public final class PackageUtils {
            public static boolean isVersionOrGreater(String version) { return true; }
        }''',
    f'{SHARED}/utils/Utils.java': '''package app.morphe.extension.shared.utils;
        import java.util.LinkedHashMap;
        import java.util.Map;
        public final class Utils {
            public static boolean isContextSet() { return true; }
            public static <K,V> Map<K,V> createSizeRestrictedMap(int size) {
                return new LinkedHashMap<>() {
                    protected boolean removeEldestEntry(Map.Entry<K,V> eldest) { return size() > size; }
                };
            }
        }''',
}


def replace_once(source, old, new):
    if source.count(old) != 1:
        raise AssertionError(f'Fixture instrumentation site moved: {old!r}')
    return source.replace(old, new)


def replay(revision, debug):
    def source(name):
        path = SOURCE / name
        if revision == 'before':
            return subprocess.check_output(['git', 'show', f'{BASELINE}:{path}'], cwd=ROOT, text=True)
        return (ROOT / path).read_text()

    files = dict(STUBS)
    for path in [f'{COMPONENTS}/{name}.java' for name in (
            'Filter', 'FilterGroup', 'FilterGroupList', 'StringFilterGroup', 'ByteArrayFilterGroup',
            'ByteArrayFilterGroupList', 'ContextInterface', 'LithoFilterPatch')]:
        files[path] = source(path)
    for name in ('TrieSearch', 'StringTrieSearch', 'ByteTrieSearch'):
        path = f'{SHARED}/utils/{name}.java'
        files[path] = source(path)

    quick_action_path = f'{YOUTUBE}/patches/components/QuickActionFilter.java'
    quick_action = source(quick_action_path)
    files[quick_action_path] = quick_action
    settings = sorted(set(re.findall(r'\bSettings\.(\w+)', quick_action)))
    settings_fields = '\n'.join(f'public static final BooleanSetting {key} = new BooleanSetting("{key}");'
                                for key in settings)
    files[f'{YOUTUBE}/settings/Settings.java'] = f'''package app.morphe.extension.youtube.settings;
        import app.morphe.extension.shared.settings.BooleanSetting;
        public final class Settings {{ {settings_fields} }}'''

    fixture = (Path(__file__).parent / 'LithoReplay.java.in').read_text()
    if revision == 'before':
        fixture = fixture.replace('extends LazyBufferFilter', 'extends Filter')
        fixture = fixture.replace('isFilteredLazy(', 'isFiltered(').replace('Buffer buffer,', 'byte[] buffer,')
        fixture = fixture.replace('buffer.get()', 'buffer')
        fixture = fixture.replace('implements LithoFilterPatch.EncodableElement', '')
        fixture = fixture.replace('/* DISPATCH */', '''
            LithoFilterPatch.setDirectProtoBuffer(element == null ? (byte[]) null : element.patch_encodeElement());
            if (context == null) return false;
            return LithoFilterPatch.isFiltered(context.identifier, null, null, context.path, context);''')
    else:
        path = f'{COMPONENTS}/LazyBufferFilter.java'
        files[path] = source(path)
        fixture = fixture.replace('/* DISPATCH */', '''
            return LithoFilterPatch.isFilteredElement(context, null, null, element);''')
    files[f'{COMPONENTS}/LithoReplay.java'] = fixture

    engine = f'{COMPONENTS}/LithoFilterPatch.java'
    files[engine] = replace_once(files[engine], 'new DummyFilter() // Replaced during patching, do not touch.',
                                 f'new {YOUTUBE.replace("/", ".")}.patches.components.QuickActionFilter(),'
                                 '\n            new LithoReplay.Probe()')
    files[engine] = replace_once(files[engine], 'duplicate.get(copy);',
                                 'duplicate.get(copy);\n            LithoReplay.copied(copy.length);')
    files[engine] = replace_once(files[engine], 'if (!group.isEnabled()) return false;',
                                 'if (!group.isEnabled()) return false;\n                            LithoReplay.matched();')

    def tool(name):
        return str(Path(os.environ['JAVA_HOME']) / 'bin' / name) if 'JAVA_HOME' in os.environ else name

    with tempfile.TemporaryDirectory(prefix=f'rvx-litho-{revision}-') as directory:
        build = Path(directory)
        for name, text in files.items():
            path = build / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)
        subprocess.run([tool('javac'), '-d', str(build), *(str(build / path) for path in files)], check=True)
        return subprocess.check_output([
            tool('java'), f'-Ddebug={str(debug).lower()}', f'-Dprotodebug={str(debug).lower()}',
            '-cp', str(build), f'{COMPONENTS.replace("/", ".")}.LithoReplay', revision,
        ], text=True)


if __name__ == '__main__':
    cli = argparse.ArgumentParser(description=__doc__)
    cli.add_argument('--revision', choices=['before', 'after', 'both'], default='both')
    cli.add_argument('--debug-protobuffer', action='store_true', help='Exercise opt-in byte logging too')
    options = cli.parse_args()
    revisions = ('before', 'after') if options.revision == 'both' else (options.revision,)
    reports = []
    for revision in revisions:
        report = replay(revision, options.debug_protobuffer)
        print(f'{revision}\n{report}', end='')
        reports.append([row.split()[:3] for row in report.splitlines()])
    if len(reports) == 2 and reports[0] != reports[1]:
        raise AssertionError('Filter decisions or enabled match counts changed between revisions')
