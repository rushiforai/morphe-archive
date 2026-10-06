"""Rebase only the scheduler fix onto the immutable N28B archive, preserving B rendering overloads."""
from pathlib import Path
import argparse,difflib,hashlib,json,shutil,subprocess,zipfile
ROOT=Path(__file__).resolve().parents[2]
PREFIX='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/'

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--run',required=True,type=Path);parser.add_argument('--tree',required=True,type=Path);args=parser.parse_args()
    run=args.run.resolve();tree=args.tree.resolve();tree.mkdir(parents=True,exist_ok=False)
    archive=run/'pure-b-input.zip'
    if not archive.exists():subprocess.run(['git','archive','anchor/n28b-d02d7cc','--format=zip','--output='+str(archive)],cwd=ROOT,check=True)
    with zipfile.ZipFile(archive) as z:z.extractall('\\\\?\\'+str(tree))
    patch=''
    for name in ['RebuildController','RebuildCache']:
        rel=PREFIX+name+'.java';before=(run/'snapshot'/rel).read_text(encoding='utf-8');after=(ROOT/rel).read_text(encoding='utf-8')
        patch+=''.join(difflib.unified_diff(before.splitlines(True),after.splitlines(True),fromfile='a/'+rel,tofile='b/'+rel,n=1))
    with zipfile.ZipFile(archive) as z:before=z.read(PREFIX+'CaptionOverlayV2.java').decode('utf-8').replace('\r\n','\n')
    after=before.replace('boolean isValid();','boolean isValid();\n    default void onApplied() {}',1)
    old='long command = COMMAND.incrementAndGet();\n    main(\n        () -> {\n          if (command != COMMAND.get() || g != null && !g.isValid()) return;'
    new='long command = g == null ? COMMAND.incrementAndGet() : COMMAND.get();\n    main(\n        () -> {\n          if (g != null) {\n            if (!g.isValid()) return;\n            COMMAND.incrementAndGet();\n          } else if (command != COMMAND.get()) return;'
    assert after.count(old)==2;after=after.replace(old,new)
    for old in ['fallback = f;\n          dirty = true;\n          render();','currentGuard = g;\n          hideView();']:
        assert after.count(old)==1;after=after.replace(old,old+'\n          if (g != null) g.onApplied();')
    old='static void clear() {\n    long command = COMMAND.incrementAndGet();';assert after.count(old)==1
    after=after.replace(old,'static void clear() {\n    clear(null);\n  }\n\n  /** Session cleanup cannot invalidate a newer session\'s queued render command. */\n  static void clear(RenderGuard guard) {\n    if (guard != null && !guard.isValid()) return;\n    long command = guard == null ? COMMAND.incrementAndGet() : COMMAND.get();')
    at=after.index('static void clear(RenderGuard guard)')
    after=after[:at]+after[at:].replace('if (command != COMMAND.get()) return;','if (command != COMMAND.get() || guard != null && !guard.isValid()) return;',1)
    rel=PREFIX+'CaptionOverlayV2.java'
    patch+=''.join(difflib.unified_diff(before.splitlines(True),after.splitlines(True),fromfile='a/'+rel,tofile='b/'+rel,n=1))
    patch_path=run/(tree.name+'-scheduler-only.patch');patch_path.write_text(patch,encoding='utf-8')
    for check in [True,False]:
        command=['git','apply','--ignore-space-change']
        if check:command+=['--check']
        subprocess.run(command+[str(patch_path)],cwd=tree,check=True)
    rel='extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/SchedulerLifecycleRegressionTest.java';shutil.copyfile(ROOT/rel,tree/rel)
    changed=[]
    with zipfile.ZipFile(archive) as z:
        for p in (tree/'extensions/extension/src/main').rglob('*'):
            if not p.is_file():continue
            rel=p.relative_to(tree).as_posix()
            if z.read(rel)!=p.read_bytes():changed.append(rel)
            if p.suffix=='.java':assert 'CaptionRenderSpec' not in p.read_text(encoding='utf-8') and 'CaptionLanguagePager' not in p.read_text(encoding='utf-8'),p
    assert set(changed)=={PREFIX+n+'.java' for n in ['RebuildController','RebuildCache','CaptionOverlayV2']},changed
    report={'base':'d02d7ccefbd3847d7c1df3b0306e22a3a14429f0','tree':str(tree),'changed_product_files':changed,
        'c_classes_or_references':0,'patch_sha256':hashlib.sha256(patch.encode()).hexdigest(),'common_added_tests':12,
        'overlay_adaptation':'Shared show/hide/clear and RenderGuard lifecycle guard only; B geometry/overloads unchanged'}
    (run/(tree.name+'-scope.json')).write_text(json.dumps(report,indent=2),encoding='utf-8');print('B_MINIMAL_INPUT_READY',tree)

if __name__=='__main__':main()
