#!/usr/bin/env python3
"""Check the compiled controller's dataset projection without requiring an Android device.

The Android UI is not exercised here. Minimal model fields match mappings independently
verified against the original APK. The actual extension class files execute the algorithm.
"""
import argparse
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--project', type=Path, default=ROOT)
args = parser.parse_args()
project = args.project.resolve()
work = ROOT / '.work/thread-host'
classes = work / 'classes'
models = work / 'src/com/rubenmayayo/reddit/models/reddit/CommentViewModel.java'
toolbar = work / 'src/androidx/appcompat/widget/Toolbar.java'
view = work / 'src/android/view/View.java'
group = work / 'src/android/view/ViewGroup.java'
for path in (classes, models.parent, toolbar.parent, view.parent):
    path.mkdir(parents=True, exist_ok=True)
view.write_text('package android.view; public class View { }\n')
group.write_text('package android.view; public class ViewGroup extends View { '
                 'public ViewGroup(){} public ViewGroup(android.content.Context context){} '
                 'public int getChildCount(){return 0;} public View getChildAt(int index){return null;} }\n')
models.write_text('package com.rubenmayayo.reddit.models.reddit;\n'
                  'public class CommentViewModel { public int R; public boolean S=true; '
                  'public CommentViewModel(int level){R=level;} }\n')
toolbar.write_text('package androidx.appcompat.widget;\n'
                   'public abstract class Toolbar extends android.view.ViewGroup { '
                   'public Toolbar(android.content.Context context){super(context);} }\n')
java = ROOT / '.work/toolchain/jdk-21.0.13+9/bin'
android = ROOT / '.work/android-sdk/platforms/android-36/android.jar'
compiled = project / 'extensions/extension/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes'
if not (compiled / 'app/morphe/extension/boost/CommentsScreenTweaks$Controller.class').is_file():
    parser.exit(1, 'Compiled extension classes missing; run the normal build first.\n')
subprocess.run([str(java/'javac'), '-cp', ':'.join(map(str,(project/'extensions/extension/build/boost-native-api',android))), '-d', str(classes), str(view), str(group), str(models), str(toolbar),
                str(ROOT/'tools/ThreadBoundaryHostCheck.java')], check=True)
subprocess.run([str(java/'java'), '-cp', ':'.join(map(str, (classes, compiled, project/'extensions/extension/build/boost-native-api', android))),
                'ThreadBoundaryHostCheck'], check=True)
