#!/usr/bin/env python3
"""Rebuild the scoped comment overlay on the verified v2.1.3 Android bundle."""
import argparse
from copy import copy
import hashlib
import re
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
sys.path.insert(0, str(ROOT / 'porting/revisions/v2.1.0-release'))
sys.path.insert(0, str(ROOT / '.github/scripts'))
from stage_verified import assemble, disassemble, require, run
from verify_android_mpp import validate_mpp

VERSION = '2.1.4-dev.1'
BASE_HASH = '89e3892ad8cf44666e03bc4af6be3632599a320d8817777b4dfdb56f239c932a'
CLASSES = {'CommentClock', 'CommentSource280', 'ScrollingComments267', 'ScrollingTimeline267'}
HELPER = Path('e/e/a')


def replace_method(path, signature, body):
    code = path.read_text()
    pattern = rf'^\.method {re.escape(signature)}\n.*?^\.end method'
    replacement = f'.method {signature}\n{body.strip(chr(10))}\n.end method'
    code, n = re.subn(pattern, lambda _: replacement, code, flags=re.M | re.S)
    require(n == 1, f'Expected exactly one method {signature} in {path.name}')
    path.write_text(code)


def update_helpers(directory):
    replace_method(directory / 'CommentMotion.smali', 'public static frame(Ljava/lang/Object;)V', '''
    .locals 6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v1
    invoke-static {p0, v1, v2}, Le/e/a/CommentClock;->capture(Ljava/lang/Object;J)Le/e/a/CommentClock$Sample;
    move-result-object v0
    iget v3, v0, Le/e/a/CommentClock$Sample;->position:I
    iget v4, v0, Le/e/a/CommentClock$Sample;->rate:F
    iget-boolean v5, v0, Le/e/a/CommentClock$Sample;->playing:Z
    invoke-static {p0}, Le/e/a/CommentMotion;->state(Ljava/lang/Object;)Le/e/a/CommentMotionRules;
    move-result-object v0
    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentMotionRules;->frame(JIFZ)V
    return-void
''')
    replace_method(directory / 'CommentVisuals.smali',
                   'public static scrolling(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;Z)Ljava/util/ArrayList;', '''
    .locals 1
    invoke-static {p0}, Le/e/a/CommentStyle;->refresh(Ljava/lang/Object;)V
    invoke-static {p0, p1, p2, p3}, Le/e/a/ScrollingComments267;->draw(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;Z)Ljava/util/ArrayList;
    move-result-object v0
    return-object v0
''')
    path = directory / 'ScrollingViewportResize.smali'
    code, removed = re.subn(r'^\.method (?:static update|static resize)\(.*?^\.end method\n?',
                            '', path.read_text(), flags=re.M | re.S)
    require(removed == 2, 'Expected only the two obsolete scrolling resize methods')
    path.write_text(code)
    path = directory / 'PlaybackDisplayOptions.smali'
    code = path.read_text()
    descriptions = {
        "Scrolling comments wait for space. Fixed comments can overlap scrolling comments.":
            "Scrolling comments wait briefly for space. Overlap is allowed in crowded scenes. Fixed comments can also overlap.",
        "跑馬燈留言會等到有空位再顯示。固定留言仍可能與跑馬燈留言重疊":
            "跑馬燈留言會短暫等待空位，擁擠時允許重疊。固定留言也可能重疊",
        "流れるコメントは空きが出るまで待機します。固定コメントは流れるコメントと重なることがあります":
            "流れるコメントは空きを短時間待ち、混雑時は重なりを許容します。固定コメントも重なることがあります",
    }
    def smali_literal(value):
        return '"' + value.encode('unicode_escape').decode('ascii') + '"'
    for previous, updated in descriptions.items():
        previous, updated = smali_literal(previous), smali_literal(updated)
        require(code.count(previous) == 1, 'Unexpected overlap summary')
        code = code.replace(previous, updated)
    path.write_text(code)
    path = directory / 'PatchVersion237.smali'
    code = path.read_text()
    require(code.count('"2.1.3"') == 1, 'Unexpected patch version owner')
    path.write_text(code.replace('"2.1.3"', f'"{VERSION}"'))


def update_native(path):
    code = path.read_text()
    start = code.index('.method public run()V')
    end = code.index('.end method', start)
    method = code[start:end]
    # The canvas has been posted here. Do not hold SurfaceHolder through the pacing sleep.
    old = '    move-result-wide v8\n    :try_end_86'
    require(method.count(old) == 1, 'Normal renderer postamble changed')
    method = method.replace(old, '    move-result-wide v8\n\n    monitor-exit v7\n    :try_end_86')
    method = method.replace('    .catchall {:try_start_92 .. :try_end_95} :catchall_ab\n', '')
    method = method.replace('    :try_start_95\n', '')
    method = method.replace('    sub-long v2, v8, v2\n\n    monitor-exit v7',
                            '    sub-long v2, v8, v2')
    # A Java catch parameter in a catch-all path has to begin with move-exception.
    method = method.replace('    :catch_95\n',
                            '    goto :after_sleep\n\n    :catch_95\n    move-exception v10\n\n    :after_sleep\n')
    # Retain the original exception/monitor teardown coverage for lockCanvas and posting.
    method = method.replace('    :goto_a3\n', '    :goto_a3\n    :try_start_95\n')
    require(method.count('monitor-exit v7') == 2, 'Invalid SurfaceHolder monitor balance')
    path.write_text(code[:start] + method + code[end:])


def stage(args, tmp):
    require(hashlib.sha256(args.base.read_bytes()).hexdigest() == BASE_HASH, 'Use the official v2.1.3 MPP')
    require(args.base.resolve() != args.output.resolve(), 'Choose a separate candidate output')
    validate_mpp(args.base, '2.1.3')
    with ZipFile(args.base) as base:
        for name, key in [('helpers', 'nicoid/helpers.mpe'), ('native', 'nicoid/method-delta.dex')]:
            (tmp / (name + '.dex')).write_bytes(base.read(key))
        classes = tmp / 'classes'
        classes.mkdir()
        run('javac', '--release', '8', '-encoding', 'UTF-8', '-cp', args.android_jar, '-d', classes,
            *sorted(HERE.glob('stubs/**/*.java')), *sorted(HERE.glob('java/**/*.java')))
        def owns(name):
            return name.stem.split('$', 1)[0] in CLASSES
        dexout = tmp / 'generated'
        dexout.mkdir()
        run(args.d8, '--min-api', '28', '--lib', args.android_jar, '--output', dexout,
            *sorted(p for p in classes.rglob('*.class') if owns(p)))
        new = disassemble(dexout / 'classes.dex', tmp / 'generated-smali', args.tools)
        # D8 may add shared lambda metadata. Existing shared definitions take precedence.
        require(all((p.parent == HELPER and owns(p)) or p == Path('com/android/tools/r8/annotations/LambdaMethod.smali')
                    for p in new), 'Unexpected compiled classes or compile-time stubs')
        directory = tmp / 'helpers'
        original = disassemble(tmp / 'helpers.dex', directory, args.tools)
        for path in original:
            if path.parent == HELPER and owns(path):
                (directory / path).unlink()
        for path, data in new.items():
            if path.parent == HELPER:
                (directory / path).write_bytes(data)
            else:
                require(path in original, 'Missing shared D8 metadata in base')
        update_helpers(directory / HELPER)
        touched = {HELPER / (n + '.smali') for n in
                   ('CommentMotion', 'CommentVisuals', 'ScrollingViewportResize', 'PatchVersion237', 'PlaybackDisplayOptions')}
        helper_out = tmp / 'helpers-out.dex'
        assemble(directory, helper_out, args.tools)
        checked = disassemble(helper_out, tmp / 'helpers-checked', args.tools)
        require(checked.keys() == original.keys() - {p for p in original if owns(p)}
                | {p for p in new if p.parent == HELPER}, 'Unexpected helper class set')
        require(all(checked[p] == data for p, data in original.items()
                    if p not in touched and not owns(p)), 'Unexpected unrelated helper code changes')
        require(all(checked[p] != original[p] for p in touched), 'Missing helper hooks')
        print(f'PASS: scoped helper changes among {len(checked)} assembled classes', flush=True)

        native_dir = tmp / 'native'
        original_native = disassemble(tmp / 'native.dex', native_dir, args.tools)
        normal = HELPER / 't.smali'
        update_native(native_dir / normal)
        native_out = tmp / 'native-out.dex'
        assemble(native_dir, native_out, args.tools)
        native = disassemble(native_out, tmp / 'native-checked', args.tools)
        require(native.keys() == original_native.keys(), 'Unexpected native class set')
        require({p for p in native if native[p] != original_native[p]} == {normal}, 'Unexpected native diff')
        print(f'PASS: only normal render loop changed among {len(native)} native classes', flush=True)
        manifest = 'META-INF/MANIFEST.MF'
        overrides = {'nicoid/helpers.mpe': helper_out.read_bytes(), 'nicoid/method-delta.dex': native_out.read_bytes(),
                     manifest: base.read(manifest).replace(b'Version: 2.1.3\r\n', f'Version: {VERSION}\r\n'.encode())}
        args.output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(args.output, 'w') as out:
            for entry in base.infolist():
                out.writestr(copy(entry), overrides.get(entry.filename, base.read(entry.filename)))
        with ZipFile(args.output) as out:
            require(out.namelist() == base.namelist(), 'MPP entry list changed')
            require(all(out.read(p) == base.read(p) for p in base.namelist() if p not in overrides), 'Unexpected MPP entry diff')
    print('PASS:', validate_mpp(args.output, VERSION), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ['base', 'output', 'tools', 'android-jar', 'd8']:
        parser.add_argument('--' + name, type=Path, required=True)
    args = parser.parse_args()
    with TemporaryDirectory(prefix='nicoid-comment-') as temp:
        stage(args, Path(temp))


if __name__ == '__main__':
    main()
