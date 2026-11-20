#!/usr/bin/env python3
"""Regress accidental delayed normal-player launch after fresh popup start."""
from pathlib import Path
from tempfile import TemporaryDirectory
import importlib.util
import io
import sys
import tarfile

HERE = Path(__file__).resolve().parent.parent
ROOT = HERE.parents[2]
import_path = ROOT/'porting/revisions/v2.1.0-release'
sys.path.insert(0,str(import_path))
from verify_dev28 import verified_archive
spec=importlib.util.spec_from_file_location('v212_overlay',HERE/'overlay.py')
mod=importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)

with tarfile.open(fileobj=io.BytesIO(verified_archive()), mode='r:gz') as tf:
    baseline=tf.extractfile('helpers-smali/e/e/a/AppResume253.smali').read()
with TemporaryDirectory() as tmp:
    folder=Path(tmp)/'e/e/a'
    folder.mkdir(parents=True)
    source=folder/'AppResume253.smali'
    source.write_bytes(baseline)
    mod.protect_popup_startup(Path(tmp))
    patched=source.read_text()
    assert '.field private static resumeTarget:Ljava/lang/ref/WeakReference;' in patched
    assert patched.count('nicoid_existing_resume_target_212')==2
    assert patched.count('nicoid_resume_target_matches_212')==2
    assert patched.count('No retained session on foreground entry; skip automatic return')==1
    assert patched.count('sput-wide v0, Le/e/a/AppResume253;->directReturnDeadline:J')>=1
    resumed=patched.split('.method public static resumed(Landroid/app/Activity;)Z')[1].split('.end method')[0]
    restore=patched.split('.method private static restore(Ljava/lang/ref/WeakReference;II)V')[1].split('.end method')[0]
    assert resumed.index('->service()Landroid/app/Service;') < resumed.index('->postDelayed(')
    assert restore.index('resumeTarget:Ljava/lang/ref/WeakReference;') < restore.index('->seamlessReturn(')
    assert 'if-eq v0, v3, :nicoid_resume_target_matches_212' in restore
    # Only two runtime methods and a new field should change
    assert baseline.decode().replace('.field private static restoring:Z',
              '.field private static resumeTarget:Ljava/lang/ref/WeakReference;\n\n.field private static restoring:Z') != patched
print('PASS: app-resume captures pre-existing player and ignores newer popup service')
