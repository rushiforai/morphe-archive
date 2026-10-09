#!/usr/bin/env python3
"""Use a bounded foreground handoff and the authenticated upload feed."""
from pathlib import Path
import re, sys
root = Path(sys.argv[1]) / 'smali'
def replace(path, signature, body):
    file = root / path
    source = file.read_text()
    pattern = r'(?m)^\.method [^\n]*' + re.escape(signature) + r'\n[\s\S]*?^\.end method'
    source, count = re.subn(pattern, body, source)
    assert count == 1, (path, signature, count)
    file.write_text(source)
replace('e/e/a/q0.smali', 'onClick(Landroid/view/View;)V', '''.method public onClick(Landroid/view/View;)V
    .locals 1
    iget-object v0, p0, Le/e/a/q0;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;
    invoke-static {v0}, Le/e/a/PlaybackReturn;->open(Ljava/lang/Object;)V
    return-void
.end method''')
replace('com/sauzask/nicoid/NicoidNicorepoActivity.smali', 'onCreateOptionsMenu(Landroid/view/Menu;)Z', '''.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->menu(Landroid/app/Activity;Landroid/view/Menu;)Z
    move-result v0
    return v0
.end method''')
replace('com/sauzask/nicoid/NicoidNicorepoActivity.smali', 'onPrepareOptionsMenu(Landroid/view/Menu;)Z', '''.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    const/4 v0, 0x1
    return v0
.end method''')
replace('com/sauzask/nicoid/NicoidNicorepoActivity.smali', 't()V', '''.method public final t()V
    .locals 0
    invoke-static {p0}, Le/e/a/FollowFeed;->load(Landroid/app/Activity;)V
    return-void
.end method''')

# Restore the account entry immediately after followed users, before Settings.
top = root / 'com/sauzask/nicoid/NicoidTopActivity.smali'
source = top.read_text()
fav = source.index('com.sauzask.nicoid.NicoidFavUserActivity')
label = re.search(r'goto(?:/\w+)? (:\w+)', source[fav:]).group(1)
start = source.index('    ' + label + '\n', fav)
needle = '    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V'
pos = source.index(needle, start) + len(needle)
entry = r'''

    if-eqz p2, :follow_feed_done
    new-instance v5, Landroid/content/Intent;
    invoke-direct {v5, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v1
    const-string v2, "com.sauzask.nicoid.NicoidNicorepoActivity"
    invoke-virtual {v5, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    const-string v3, "ニコレポ"
    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    const-string v4, "フォロー中の新着動画"
    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    move-object v1, v7
    const/4 v2, 0x0
    const/4 v6, 0x0
    invoke-static/range {v1 .. v6}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V
    :follow_feed_done
'''
assert ':follow_feed_done' not in source
top.write_text(source[:pos] + entry + source[pos:])

# Apply theme CSS without changing license text or dialog behavior.
license_file = root / 'com/sauzask/nicoid/NicoidSetting$g.smali'
license_source = license_file.read_text()
old_load = 'invoke-virtual/range {v1 .. v6}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V'
assert license_source.count(old_load) == 1
license_file.write_text(license_source.replace(old_load, 'invoke-static/range {v1 .. v6}, Le/e/a/LicenseTheme;->load(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V'))
