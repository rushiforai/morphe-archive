"""Guard the playlist gesture bridge without installing an APK."""
from pathlib import Path
base=Path(__file__).resolve().parents[1]
src=(base/"java/e/e/a/PlaylistGestureRouter.java").read_text()
builder=(base/"build_mpp.py").read_text()
for item in ['"nicoid_local_playlists"','v instanceof ListView','v instanceof ScrollView',
             'GestureControls110.excluded','Dev128.allowClaim','blockedTag',
             'getLongPressTimeout','superDispatchTouchEvent(cancel)',
             'GestureControls110.perform(a,action)','return -1;','return 0;']:
    assert item in src,item
assert 'PlaylistGestureRouter;->touch' in builder
assert 'if-ltz v0, :nicoid_existing_list_gesture' in builder
assert 'BASE_ROOT / "java"' in builder
assert "scrollTo(0,s." not in src
print("PASS: local playlist gesture source contracts")
