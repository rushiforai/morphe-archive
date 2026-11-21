#!/usr/bin/env python3
"""Locale and NicoRepo source contracts for the isolated selection test MPP."""
from pathlib import Path
base=Path(__file__).resolve().parents[1]
src=(base/"LocalePatch215.java").read_text(encoding="utf-8")
bridge=(base/"BulkVideoActions215.java").read_text(encoding="utf-8")
stage=(base/"stage_candidate.py").read_text(encoding="utf-8")
required={
    "再生キュー": ("Playback queue","播放佇列"),
    "再生待ちの動画はありません": ("No videos in the playback queue","播放佇列中沒有影片"),
    "再生キューから削除しますか？": ("Remove from playback queue?","要從播放佇列移除嗎？"),
    "複数選択": ("Select multiple","多選"),
    "全選択": ("Select all","全選"),
    "全解除": ("Deselect all","取消全選"),
    "移動": ("Move","移動"),
    "完了": ("Done","完成"),
    "登録": ("Add","加入"),
}
for jp,(en,zh) in required.items():
    line=f'case "{jp}": return pair("{en}", "{zh}");'
    assert src.count(line)==1, f"Missing or inconsistent Japanese/English/Traditional Chinese: {jp}"
assert "return LocalePatch215.label(c,ja,en,zh);" in bridge
assert 'title.endsWith(suffix)' in src and 'String suffix = "の投稿動画"' in src
assert '"Refresh".equals(refreshMarker)' in src and '"重新整理".equals(refreshMarker)' in src
assert 'menu.size()!=1' in src and 'shouldSkipTabRefresh(Menu menu)' in src
assert 'first.getItemId()!=0' in src
for code in (
    "LocalePatch215;->lookup", "LocalePatch215;->title",
    "LocalePatch215;->shouldSkipTabRefresh",
):
    assert code in stage, code
assert 'OWNER / "UiStrings.smali"' in stage
assert 'OWNER / "TabChrome228.smali"' in stage
assert 'OWNER / "TabRecovery244.smali"' in stage
assert '"v2.1.5-dev.11"' in stage, "Do not regress direct comment renderer"

# A retained LocalPlaylists.Page must not force its actions into NicoRepo's menu.
assert 'isActivePlaylist(Activity activity)' in src
assert 'intent.getBooleanExtra("nicoid_local_playlists", false)' in src
assert '.method public static options(Landroid/app/Activity;Landroid/view/Menu;)Z' in stage
assert 'fix_stale_playlist_menu(smali)' in stage
assert 'LocalePatch215;->isActivePlaylist(Landroid/app/Activity;)Z' in stage
assert ':nicoid_active_playlist_menu' in stage
print("PASS: trilingual UI, single NicoRepo Refresh and active-page overflow menu isolation")
