#!/usr/bin/env python3
"""Fail-closed v2.1.1-dev.3 hooks on the reviewed v2.1.0 Media3 helper bytecode."""
from pathlib import Path


def replace_once(body, old, new, tag):
    count = body.count(old)
    if count != 1:
        raise RuntimeError(f'{tag}: required one anchor, found {count}')
    return body.replace(old, new, 1)


def method(body, name, update):
    start = body.index(name)
    end = body.index('.end method', start)
    return body[:start] + update(body[start:end]) + body[end:]


def patch(helpers: Path) -> None:
    # Preserve the native and local playlist bulk selection footer behaviour.
    f = helpers/'e/e/a/BulkSelection.smali'
    s = f.read_text()
    anchor = '''    invoke-static {v0, v1, v2}, Le/e/a/SelectionUi191;->footer(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    move-result-object v1'''
    s = replace_once(s, anchor, anchor + '''

    invoke-static {v1, p0}, Le/e/a/BulkMove211;->installNative(Landroid/widget/LinearLayout;Ljava/lang/Object;)V''', 'native footer')
    anchor = '''    invoke-static {p0, v2}, Le/e/a/SelectionUi191;->enabled(Landroid/widget/LinearLayout;I)V'''
    s = replace_once(s, anchor, anchor + '''

    invoke-static {p0, v2}, Le/e/a/BulkMove211;->refresh(Landroid/widget/LinearLayout;I)V''', 'native footer refresh')
    f.write_text(s)

    f = helpers/'e/e/a/LocalPlaylists$Page.smali'
    s = f.read_text()
    def patch_selection(section):
        anchor = '''    move-result-object v0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;'''
        return replace_once(section, anchor, anchor + '''

    invoke-static {v0, p0}, Le/e/a/BulkMove211;->installLocal(Landroid/widget/LinearLayout;Ljava/lang/Object;)V''', 'local footer')
    s = method(s, '.method selectionChanged()V', patch_selection)
    def patch_move(section):
        anchor = '''    invoke-static {v0, v1, v2}, Le/e/a/LocalPlaylists;->choose(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/Consumer;)V'''
        updated = '''    invoke-static {p0, v2}, Le/e/a/MoveConfirm212;->wrapLocal(Ljava/lang/Object;Ljava/util/function/Consumer;)Ljava/util/function/Consumer;

    move-result-object v2

''' + anchor
        return replace_once(section, anchor, updated, 'post-destination local confirmation')
    s = method(s, '.method moveSelected()V', patch_move)
    anchor = '''    invoke-static {v0, v1}, Le/e/a/SelectionUi191;->enabled(Landroid/widget/LinearLayout;I)V'''
    s = replace_once(s, anchor, anchor + '''

    invoke-static {v0, v1}, Le/e/a/BulkMove211;->refresh(Landroid/widget/LinearLayout;I)V''', 'local footer refresh')
    f.write_text(s)

    # Each opaque panel receives its OWN coloured glow in the background stack.
    # This draws after the dark panel background but before text/images/icons.
    # The hook does not depend on nicoid_ambient_full_spread.
    f = helpers/'e/e/a/AmbientLight$Layer.smali'
    s = f.read_text()
    def detail(section):
        anchor = '''    invoke-virtual {v1, v2, p1, p0}, Le/e/a/AmbientLight$Layer$DetailPlane;->update(Landroid/view/View;Landroid/view/View;Le/e/a/AmbientLight$Glow;)V

    return-void'''
        new = '''    invoke-virtual {v1, v2, p1, p0}, Le/e/a/AmbientLight$Layer$DetailPlane;->update(Landroid/view/View;Landroid/view/View;Le/e/a/AmbientLight$Glow;)V

    invoke-static {p1, p0}, Le/e/a/AmbientPanelGlow213;->update(Landroid/view/View;Ljava/lang/Object;)V

    return-void'''
        return replace_once(section, anchor, new, 'all-mode ambient panel glow')
    s = method(s, '.method installDetailPlanes(Landroid/view/View;)V', detail)
    def cleanup(section):
        anchor = '''    .line 522
    iget-object v0, p0, Le/e/a/AmbientLight$Layer;->normalPageView:Landroid/view/View;'''
        return replace_once(section, anchor, anchor + '''

    invoke-static {v0}, Le/e/a/AmbientPanelGlow213;->clear(Landroid/view/View;)V''', 'panel glow cleanup')
    s = method(s, '.method removePageGlow()V', cleanup)
    f.write_text(s)

    # New badges use the existing tab bar's built-in compound Drawable plumbing.
    f = helpers/'e/e/a/MultiTabs227.smali'
    s = f.read_text()
    def badge(section):
        anchor = '''    .registers 4

    .line 30'''
        add = '''    .registers 4

    invoke-static {p0}, Le/e/a/TabSymbols213;->badge(Ljava/lang/Object;)I

    move-result v0

    if-eqz v0, :nicoid_tab_badge_legacy_213

    return v0

    :nicoid_tab_badge_legacy_213
    .line 30'''
        return replace_once(section, anchor, add, 'new tab badge classification')
    s = method(s, '.method static badge(Le/e/a/SavedTabs227$Tab;)I', badge)
    f.write_text(s)

    f = helpers/'e/e/a/MultiTabs227$TabBadge.smali'
    s = f.read_text()
    def draw(section):
        anchor = '''    .registers 12

    .line 34'''
        add = '''    .registers 12

    iget v0, p0, Le/e/a/MultiTabs227$TabBadge;->kind:I

    const/4 v1, 0x5

    if-lt v0, v1, :nicoid_tab_badge_draw_legacy_213

    iget-object v1, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    invoke-static {p1, v0, v1, p0}, Le/e/a/TabSymbols213;->draw(Landroid/graphics/Canvas;ILandroid/graphics/Paint;Landroid/graphics/drawable/Drawable;)V

    return-void

    :nicoid_tab_badge_draw_legacy_213
    .line 34'''
        return replace_once(section, anchor, add, 'tab icon drawing')
    s = method(s, '.method public draw(Landroid/graphics/Canvas;)V', draw)
    f.write_text(s)

    f = helpers/'e/e/a/MultiTabs227$Host.smali'
    s = f.read_text()
    def accessibility(section):
        anchor = '''    invoke-virtual {v12, v2}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V'''
        return replace_once(section, anchor, anchor + '''

    invoke-static {v12, v1}, Le/e/a/TabSymbols213;->describe(Landroid/view/View;Ljava/lang/Object;)V''', 'new tab accessible labels')
    s = method(s, '.method bar()V', accessibility)
    f.write_text(s)


if __name__ == '__main__':
    import argparse
    a = argparse.ArgumentParser();a.add_argument('smali', type=Path)
    patch(a.parse_args().smali)
    print('PASS: verified all ambient and tab-icon hook anchors plus existing bulk selection hooks')