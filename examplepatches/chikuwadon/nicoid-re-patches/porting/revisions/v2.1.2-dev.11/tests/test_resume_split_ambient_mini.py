#!/usr/bin/env python3
"""Structure and localization regression guards for v2.1.2-dev.4."""
from pathlib import Path
base=Path(__file__).resolve().parents[1]
source=(base/'ResumeModes272.java').read_text()
checks={
    'background and popup independent keys':'public static final String BG = "nicoid_app_resume_background"' in source and 'public static final String POP = "nicoid_app_resume_popup"' in source,
    'retain legacy preference':'public static final String LEGACY = "nicoid_app_resume_playback"' in source,
    'migrate existing settings':'private static void migrate(SharedPreferences p)' in source and 'if(!p.contains(BG))' in source and 'if(!p.contains(POP))' in source,
    'resolve actual playback mode':'public static String selection(SharedPreferences prefs)' in source and 'popupService(service)' in source,
    'do not derive return destination from app switch':'return initial(prefs,key)' in source,
    'japanese':'ポップアップ再生からの復帰時の動作' in source and 'バックグラウンド再生からの復帰時の動作' in source,
    'english':'When returning from popup playback' in source and 'When returning from background playback' in source,
    'traditional chinese':'從彈出視窗播放返回時的行為' in source and '從背景播放返回時的行為' in source,
    'all 3 languages in every choice':'返回一般播放' in source and '返回全螢幕播放' in source and '維持彈出視窗播放' in source,
    'reparent only the popup setting':'source.removePreference(popup)' in source and 'destination.addPreference(popup)' in source,
    'keep previously disabled controls':'.putString("player_buttons_hidden_v1"' not in source,
}
mini=(base/'MiniGhost272.java').read_text()
checks.update({
    'clean only tagged orphan': 'TAG.equals(child.getTag()) && child!=activeDirect && child!=activeMini' in mini,
    'defer mini cleanup after close':'MAIN.postDelayed(' in mini,
    'never force playback':'.start()' not in mini,
})
ambient=(base/'AmbientCard217.java').read_text()
checks.update({
    'pre-draw page change detection':'addOnScrollChangedListener(scroll)' in ambient and 'addOnGlobalLayoutListener(layout)' in ambient,
    'repaint stale menu backgrounds':'hasStaleCard()' in ambient and 'view.getBackground() != entry.getValue()' in ambient,
    'restore owned page backgrounds':'panel.unbind()' in ambient and 'cards.clear()' in ambient,
})
overlay=(base/'overlay.py').read_text()
checks.update({
    'resume settings hooks':'revise_resume_preferences(helpers)' in overlay,
    'orphan cleanup hooks':'cleanup_stale_mini(helpers)' in overlay,
    'use ambient cleanup':'AmbientCard217;->clear' in overlay,
})
for name,ok in checks.items():
    if not ok:raise AssertionError('FAILED: '+name)
print('PASS:',len(checks),'resume split, localization, ambient and mini cleanup source assertions')
