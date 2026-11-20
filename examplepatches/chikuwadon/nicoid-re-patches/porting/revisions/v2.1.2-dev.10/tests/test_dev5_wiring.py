#!/usr/bin/env python3
"""Fail the private build if the dev.5 regressions are no longer wired."""
from pathlib import Path
src=Path(__file__).resolve().parents[1]
def contains(path,*needles):
    body=(src/path).read_text()
    for needle in needles:
        if needle not in body: raise AssertionError(f'Missing {needle} in {path}')
contains('harden_dev5.py',
    'ResumeGuard273;->capture(Ljava/lang/Object;)Z',
    'ResumeGuard273;->matches(Ljava/lang/Object;)Z',
    'ResumeModes272;->reparent',
    'nicoid_app_resume_popup',
    'MiniGhost272;->afterRelease',
    'AppSwitchGuard;->track')
contains('ResumeGuard273.java',
    'existingService!=null || existingState!=null',
    'if(service!=null && service!=serviceNow)return false',
    'readInstance(pending,"service")!=serviceNow')
contains('ResumeModes272.java',
    'public static void reparent(PreferenceActivity activity)',
    'nicoid_app_resume_background',
    'nicoid_app_resume_popup',
    'バックグラウンド再生からの復帰時の動作',
    'ポップアップ再生からの復帰時の動作',
    'When returning from background playback',
    'When returning from popup playback',
    '從背景播放返回時的行為',
    '從彈出視窗播放返回時的行為',
    'if(!p.contains(BG))',
    'if(!p.contains(POP))')
contains('MiniGhost272.java',
    'Closed second mini owner retaining the same video',
    'field(owner,"video")!=video',
    'Removed orphaned retained mini panel from actual host')
contains('stage_candidate.py',
    "CANDIDATE_VERSION='2.1.2-dev.10'",
    "'e/e/a/SettingsCategories241.smali'",
    "'e/e/a/AppSwitchGuard.smali'",
    "'ResumeGuard273.java'",
    "'ResumeGuard273'",)
print('PASS: retained dev.5 session capture and identity, mini cleanup, settings classification and localization')
