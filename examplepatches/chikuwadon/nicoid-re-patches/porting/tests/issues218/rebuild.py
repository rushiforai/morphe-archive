"""Rebuild just the issue fixes against the reviewed stable MPP; no version changes."""
from pathlib import Path
import argparse,subprocess,zipfile,shutil,hashlib,os
p=argparse.ArgumentParser();p.add_argument('--base',type=Path,required=True);p.add_argument('--tools',type=Path,required=True);p.add_argument('--applied-dir',type=Path,required=True);p.add_argument('--work',type=Path,required=True);p.add_argument('--output',type=Path,required=True);p.add_argument('--java',default='java');args=p.parse_args()
R=Path(__file__).resolve().parents[3];A=args.tools.resolve().parent;W=args.work.resolve();W.mkdir(parents=True,exist_ok=True);J=Path(shutil.which(args.java) or args.java).resolve();T=args.tools.resolve();CP=str(T/'assemble/*')+':'+str(T/'dexlib2.jar')+':'+str(T/'guava.jar')
assert hashlib.sha256(args.base.read_bytes()).hexdigest()=='50c645076698966951fc0af784c98516a1382ece3cd18afa62c2f1f11a5cf1f7','Use the published v1.9.7 MPP'
with zipfile.ZipFile(args.base) as z:(W/'base.dex').write_bytes(z.read('nicoid/helpers.mpe'))
shutil.rmtree(W/'base-smali',ignore_errors=True)
subprocess.run([str(J),'-cp',CP,'org.jf.baksmali.Main','disassemble',str(W/'base.dex'),'-o',str(W/'base-smali')],check=True)
args.output.parent.mkdir(parents=True,exist_ok=True)
for p in ['classes','d8','new-smali']:shutil.rmtree(W/p,ignore_errors=True);(W/p).mkdir()
def run(*args):subprocess.run([str(x) for x in args],check=True)
run(J,'-jar',T/'ecj.jar','-8','-proc:none','-nowarn','-cp',str(T/'android-all-16-robolectric-13921718.jar')+':'+':'.join(str(p) for p in args.applied_dir.glob('*.jar')),'-d',W/'classes',*sorted((R/'porting/maintenance197').rglob('*.java')))
with zipfile.ZipFile(W/'new.jar','w') as z:
 for p in (W/'classes').rglob('*.class'):z.write(p,p.relative_to(W/'classes').as_posix())
run(J,'-cp',T/'r8.jar','com.android.tools.r8.D8','--release','--min-api','21','--lib',T/'android-all-16-robolectric-13921718.jar','--lib',J.parent.parent,'--classpath',args.applied_dir/'classes2.jar','--output',W/'d8',W/'new.jar')
run(J,'-cp',CP,'org.jf.baksmali.Main','disassemble',W/'d8/classes.dex','-o',W/'new-smali')
shutil.rmtree(W/'smali',ignore_errors=True);shutil.copytree(W/'base-smali',W/'smali')
for p in (W/'new-smali').rglob('*.smali'):shutil.copyfile(p,W/'smali'/p.relative_to(W/'new-smali'))
# Retain canonical implementations; add narrowly scoped session hooks.
def change(name, old, new):
 p=W/'smali/e/e/a'/name
 source=p.read_text()
 assert source.count(old)==1,(name,source.count(old))
 p.write_text(source.replace(old,new))
change('CommentUi.smali', '    invoke-static {p0, p1}, Le/e/a/CastComments213;->publish', '    invoke-static {p0, p1}, Le/e/a/CastControls218;->publish(Ljava/lang/Object;Ljava/util/ArrayList;)V\n\n    invoke-static {p0, p1}, Le/e/a/CastComments213;->publish')
change('FullscreenControls.smali','    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenScreen203;->before', '    invoke-static/range {p0 .. p0}, Le/e/a/CastControls218;->update(Ljava/lang/Object;)V\n\n    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenScreen203;->before')
change('SettingsIntegrity.smali', '    invoke-static {p0, v0}, Le/e/a/SettingsIntegrity;->casts(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V', '    invoke-static {p0, v0}, Le/e/a/SettingsIntegrity;->casts(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V\n\n    invoke-static {p0}, Le/e/a/CastControls218;->settings(Landroid/preference/PreferenceActivity;)V')
change('ModernPlayback.smali', '    invoke-static {v3, v2}, Le/e/a/ModernPlayback;->pickVideo(Lorg/json/JSONArray;I)Ljava/lang/String;', '    invoke-static {p0, v3, v2}, Le/e/a/CastControls218;->pickVideo(Ljava/lang/Object;Lorg/json/JSONArray;I)Ljava/lang/String;')
change('Quality195.smali', '    new-instance v0, Ljava/util/LinkedHashSet;', '    invoke-static {p0, p1, p2, p3}, Le/e/a/CastControls218;->outputs(Ljava/lang/Object;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;\n    move-result-object v0\n    if-eqz v0, :cast_auto_218\n    return-object v0\n    :cast_auto_218\n    new-instance v0, Ljava/util/LinkedHashSet;')
change('CommentJump.smali', '    const-string v2, "a0"\n\n    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;', '    invoke-static {p0}, Le/e/a/CastControls218;->player(Ljava/lang/Object;)Ljava/lang/Object;')
change('CommentListExtras$Follow.smali', '    const-string p4, "a0"\n\n    invoke-static {p2, p4}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;', '    invoke-static {p2}, Le/e/a/CastControls218;->player(Ljava/lang/Object;)Ljava/lang/Object;')
change('CommentListExtras$Follow.smali', '    const-string v1, "a0"\n\n    invoke-static {v0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;', '    invoke-static {v0}, Le/e/a/CastControls218;->player(Ljava/lang/Object;)Ljava/lang/Object;')
run(J,'-cp',CP,'org.jf.smali.Main','assemble','--api','21',W/'smali','-o',W/'helpers.dex')
with zipfile.ZipFile(args.base) as z,zipfile.ZipFile(args.output,'w',zipfile.ZIP_DEFLATED) as out:
 for item in z.infolist():out.writestr(item,(W/'helpers.dex').read_bytes() if item.filename=='nicoid/helpers.mpe' else z.read(item.filename))
print(args.output)
