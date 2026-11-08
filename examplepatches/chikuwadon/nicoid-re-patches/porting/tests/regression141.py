"""Run actual Dev121 code with controlled Android/JSON boundary doubles (no SDK)."""
from pathlib import Path
import re, subprocess, tempfile, shutil
repo=Path(__file__).resolve().parents[2]
revision=repo/'porting/revisions/v1.10.4'
with tempfile.TemporaryDirectory(prefix='nicoid141-') as temp:
    out=Path(temp);classes=out/'classes';classes.mkdir()
    files=list(Path(__file__).with_name('comment-batch141').rglob('*.java'))
    files += [revision/'java/e/e/a/Dev121.java', revision/'java/e/e/a/CommentBatchPolicy121.java',revision/'CommentBatchPolicy121Test.java']
    subprocess.run(['java','com.sun.tools.javac.Main','--release','8','-d',str(classes),*map(str,files)],check=True)
    for name in ['e.e.a.Behavior141','CommentBatchPolicy121Test']:
        subprocess.run(['java','-cp',str(classes),name],check=True)
    stage=out/'stage'
    for name in ['helpers','method-delta']:
        shutil.copytree(repo/'porting/revisions/v1.10.1'/name,stage/name)
    subprocess.run(['python3',str(revision/'patch-payloads.py'),str(stage),'1.10.4'],check=True)
    # Link/signature and register-format checks supplement, not replace, DEX assembly.
    helper=stage/'helpers/e/e/a'
    job=(helper/'CommentHistory$Job.smali').read_text()
    run=job[job.index('.method public run()V'):]
    assert '.registers 42' in run
    assert 'move-object/from16 v38, p0' in run and 'move-object/from16 v39, v18' in run and 'move/from16 v40, v23' in run
    assert 'invoke-static/range {v38 .. v40}, Le/e/a/Dev121;->progress' in run
    assert ':goto_47f\n    :audit141_job_end\n    invoke-static/range {p0 .. p0}, Le/e/a/Dev121;->done' in run
    assert '.catchall {:audit141_job_start .. :try_start_332} :audit141_job_cleanup' in run
    assert '.catchall {:try_end_350 .. :audit141_job_end} :audit141_job_cleanup' in run
    labels={m[1]:m.start() for m in re.finditer(r'^    (:\w+)\s*$',run,re.M)}
    handlers=[(labels[a],labels[b],h) for a,b,h in re.findall(r'\.catchall \{(:\w+) \.\. (:\w+)\} (:\w+)',run)]
    for a,b,h in handlers:
        for c,d,g in handlers:
            assert h==g or max(a,c)>=min(b,d), 'Conflicting catch-all regions' 
    assert run.count('Dev121;->done')==3
    assert ':goto_31f\n    invoke-static/range {p0 .. p0}, Le/e/a/Dev121;->done' in run
    for body in [run,(helper/'PlayerGestures.smali').read_text()]:
        for call in re.findall(r'invoke-\S+[^\n]*Dev121[^\n]*',body):
            if 'progress' in call or 'done' in call or 'MotionEvent' in call: assert '/range' in call,call
    ui=(helper/'CommentUi.smali').read_text()
    a=ui.index('.method public static apply(');b=ui.index('.end method',a);body=ui[a:b]
    assert '.registers 4' in body and body.index('Dev121;->ticket')<body.index('CommentContinuity118;->merge')
    assert 'invoke-static {v1, p1}, Le/e/a/Dev121;->update' in body
    for name in ['CastControls218;->publish','CastComments213;->publish','CommentGraph215;->publish']:
        assert name in body
    assert 'sget-object p0, Le/e/a/CommentUi;->MAIN' in body
    # The copy-free handoff is valid only while merge snapshots synchronously.
    assert body.index('CommentContinuity118;->merge')<body.index('Dev121;->update')
    continuity=(helper/'CommentContinuity118.smali').read_text()
    a=continuity.index('.method public static merge(');b=continuity.index('.end method',a);merge=continuity[a:b]
    assert 'new-instance v3, Ljava/util/ArrayList;' in merge and 'return-object v3' in merge
    assert 'return-object p1' not in merge and 'return-object p0' not in merge
    cast=(helper/'CastControls218$1.smali').read_text()
    assert 'Dev121;->ticket' in cast and cast.index('Dev121;->valid')<cast.index('CastControls218;->access$2')
    assert body.index('Dev121;->valid')<body.index('CommentContinuity118;->merge')
    native=(stage/'method-delta/com/sauzask/nicoid/NicoidVideoFragment.smali').read_text()
    assert native.count('Dev121;->controls')==3
    assert 'Dev121;->controls(Ljava/lang/Object;Landroid/view/MotionEvent;)V' in (helper/'PlayerGestures.smali').read_text()
    for verifier,args in [
        ('VerifyQualityRegisters195.py',[stage]),
        ('VerifyReleaseContinuity.py',[repo/'porting/revisions/v1.10.1/helpers',stage/'helpers',stage/'method-delta'])]:
        subprocess.run(['python3',str(Path(__file__).with_name(verifier)),*map(str,args)],check=True)
    print('PASS actual staged hooks, cleanup routes, worker/UI split and register formats (assembly still required)')
