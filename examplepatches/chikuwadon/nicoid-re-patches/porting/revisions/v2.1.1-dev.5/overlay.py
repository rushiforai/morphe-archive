#!/usr/bin/env python3
"""Scoped v2.1.1-dev.5 helper/native hooks from the reviewed v2.1.0 payload."""
from pathlib import Path


def once(body: str, old: str, new: str, name: str) -> str:
    count = body.count(old)
    if count != 1:
        raise RuntimeError(f'{name}: expected exactly one anchor, got {count}')
    return body.replace(old, new, 1)


def in_method(body: str, signature: str, fn):
    start=body.index(signature)
    end=body.index('.end method', start)
    return body[:start]+fn(body[start:end])+body[end:]


def patch(helpers:Path) -> None:
    f=helpers/'e/e/a/BulkSelection.smali';s=f.read_text()
    a='''    invoke-static {v0, v1, v2}, Le/e/a/SelectionUi191;->footer(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;\n\n    move-result-object v1'''
    s=once(s,a,a+'''\n\n    invoke-static {v1, p0}, Le/e/a/BulkMove211;->installNative(Landroid/widget/LinearLayout;Ljava/lang/Object;)V''','bulk footer')
    a='''    invoke-static {p0, v2}, Le/e/a/SelectionUi191;->enabled(Landroid/widget/LinearLayout;I)V'''
    s=once(s,a,a+'''\n\n    invoke-static {p0, v2}, Le/e/a/BulkMove211;->refresh(Landroid/widget/LinearLayout;I)V''','bulk selection count')
    f.write_text(s)

    f=helpers/'e/e/a/LocalPlaylists$Page.smali';s=f.read_text()
    def selection(text):
        a='''    move-result-object v0\n\n    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;'''
        return once(text,a,a+'''\n\n    invoke-static {v0, p0}, Le/e/a/BulkMove211;->installLocal(Landroid/widget/LinearLayout;Ljava/lang/Object;)V''','local bulk footer')
    s=in_method(s,'.method selectionChanged()V',selection)
    def move(text):
        a='''    invoke-static {v0, v1, v2}, Le/e/a/LocalPlaylists;->choose(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/Consumer;)V'''
        b='''    invoke-static {p0, v2}, Le/e/a/MoveConfirm212;->wrapLocal(Ljava/lang/Object;Ljava/util/function/Consumer;)Ljava/util/function/Consumer;\n\n    move-result-object v2\n\n'''+a
        return once(text,a,b,'local post-destination confirmation')
    s=in_method(s,'.method moveSelected()V',move)
    a='''    invoke-static {v0, v1}, Le/e/a/SelectionUi191;->enabled(Landroid/widget/LinearLayout;I)V'''
    s=once(s,a,a+'''\n\n    invoke-static {v0, v1}, Le/e/a/BulkMove211;->refresh(Landroid/widget/LinearLayout;I)V''','local selected count')
    def local_title(text):
        anchor='.registers 9'
        return once(text,anchor,anchor+'''\n\n    invoke-static {p0, p1}, Le/e/a/TabFolderNav214;->localToolbar(Ljava/lang/Object;Ljava/lang/String;)V''','local toolbar/title')
    s=in_method(s,'.method toolbar(Ljava/lang/String;)V',local_title)
    def local_long(text):
        original='''    invoke-virtual {v0, v5, v1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;'''
        insert='''    invoke-static {v3, v5, v6}, Le/e/a/TabFolderNav214;->localMenuItems(Landroid/content/Context;[Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v2, v7, v4, v6}, Le/e/a/TabFolderNav214;->localMenuListener(Landroid/content/DialogInterface$OnClickListener;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v1

'''+original
        return once(text,original,insert,'local folder entry in original action list')
    s=in_method(s,'.method editCatalog(Ljava/lang/String;Ljava/lang/String;Z)V',local_long)
    f.write_text(s)

    # Stable v2.1.0 ambient baseline: don't add any v2.1.1-dev.1-3 page-only hooks.
    # Update the background of the VISIBLE pager at the compositor entry point,
    # so menu/related/video-info pages all receive the same source palette.
    f=helpers/'e/e/a/AmbientLight$Layer.smali';s=f.read_text()
    def exterior(text):
        anchor='''    invoke-virtual {v1, v5, v5, v7, v8}, Le/e/a/AmbientLight$Glow;->setBounds(IIII)V'''
        return once(text,anchor,anchor+'''\n\n    invoke-static {v0, v4, v3}, Le/e/a/AmbientBackplate214;->update(Ljava/lang/Object;Landroid/view/View;Landroid/view/View;)V''','ambient root compositing')
    s=in_method(s,'.method installNormalExterior(Landroid/view/View;)V',exterior)
    def clean(text):
        a='.method removePerimeter()V\n    .registers 8'
        return once(text,a,a+'''\n\n    invoke-static {p0}, Le/e/a/AmbientBackplate214;->clear(Ljava/lang/Object;)V''','ambient cleanup')
    s=in_method(s,'.method removePerimeter()V',clean)
    f.write_text(s)

    # Preserve the existing v2.1.1-dev.3 tab bar glyphs.
    f=helpers/'e/e/a/MultiTabs227.smali';s=f.read_text()
    def badge(text):
        a='''    .registers 4\n\n    .line 30'''
        b='''    .registers 4\n\n    invoke-static {p0}, Le/e/a/TabSymbols213;->badge(Ljava/lang/Object;)I\n\n    move-result v0\n\n    if-eqz v0, :nicoid_tab_badge_legacy_213\n\n    return v0\n\n    :nicoid_tab_badge_legacy_213\n    .line 30'''
        return once(text,a,b,'tab badge')
    s=in_method(s,'.method static badge(Le/e/a/SavedTabs227$Tab;)I',badge)
    def independent_local_match(text):
        a="""    if-eqz v2, :cond_a

    return-object v1"""
        b="""    if-eqz v2, :cond_a

    invoke-static {p0, v1}, Le/e/a/TabFolderNav214;->sameLocalTab(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    return-object v1"""
        return once(text,a,b,'independent local playlist tabs')
    s=in_method(s,'.method static match(Le/e/a/SavedTabs227$Tab;)Le/e/a/SavedTabs227$Tab;',independent_local_match)
    f.write_text(s)
    f=helpers/'e/e/a/MultiTabs227$TabBadge.smali';s=f.read_text()
    def draw(text):
        a='''    .registers 12\n\n    .line 34'''
        b='''    .registers 12\n\n    iget v0, p0, Le/e/a/MultiTabs227$TabBadge;->kind:I\n\n    const/4 v1, 0x5\n\n    if-lt v0, v1, :nicoid_tab_badge_draw_legacy_213\n\n    iget-object v1, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;\n\n    invoke-static {p1, v0, v1, p0}, Le/e/a/TabSymbols213;->draw(Landroid/graphics/Canvas;ILandroid/graphics/Paint;Landroid/graphics/drawable/Drawable;)V\n\n    return-void\n\n    :nicoid_tab_badge_draw_legacy_213\n    .line 34'''
        return once(text,a,b,'tab glyph draw')
    s=in_method(s,'.method public draw(Landroid/graphics/Canvas;)V',draw);f.write_text(s)
    f=helpers/'e/e/a/MultiTabs227$Host.smali';s=f.read_text()
    def access(text):
        a='''    invoke-virtual {v12, v2}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V'''
        return once(text,a,a+'''\n\n    invoke-static {v12, v1}, Le/e/a/TabSymbols213;->describe(Landroid/view/View;Ljava/lang/Object;)V''','tab icon accessibility')
    s=in_method(s,'.method bar()V',access);f.write_text(s)

    f=helpers/'e/e/a/MultiTabs227$1.smali';s=f.read_text()
    def resume(text):
        a='''.method public onActivityResumed(Landroid/app/Activity;)V\n    .registers 4'''
        return once(text,a,a+'''\n\n    invoke-static {p1}, Le/e/a/TabFolderNav214;->restoreMylistRoot(Landroid/app/Activity;)V''','restore root on Back')
    s=in_method(s,'.method public onActivityResumed(Landroid/app/Activity;)V',resume);f.write_text(s)

    f=helpers/'e/e/a/TabRoutes228.smali';s=f.read_text()
    def intent(text):
        a='''    :cond_69\n    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;'''
        return once(text,a,'''    :cond_69\n    invoke-static {p0, p1}, Le/e/a/TabFolderNav214;->localIntent(Landroid/content/Intent;Ljava/lang/Object;)V\n\n    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;''','local tab restoring intent')
    s=in_method(s,'.method static intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;',intent)
    def switch(text):
        a='''    invoke-virtual {v0, v5}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V'''
        return once(text,a,a+'''\n\n    invoke-static {v0, p1}, Le/e/a/TabFolderNav214;->localActivated(Landroid/app/Activity;Ljava/lang/Object;)V''','local tab folder restore')
    s=in_method(s,'.method static switchPage(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V',switch);f.write_text(s)


def patch_native(native:Path)->None:
    f=native/'com/sauzask/nicoid/NicoidMylistGroupActivity$a.smali';s=f.read_text()
    a='''    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V'''
    b='''    invoke-static {p1, p2}, Le/e/a/TabFolderNav214;->routeMylistTap(Landroid/app/Activity;Landroid/content/Intent;)V\n\n'''+a
    s=in_method(s,'.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V',lambda x: once(x,a,b,'native normal mylist click'));f.write_text(s)
    f=native/'com/sauzask/nicoid/NicoidMylistGroupActivity$b.smali';s=f.read_text()
    a='''    invoke-virtual {p2, p3, p4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;'''
    b=a+'''\n\n    invoke-static {p2, p0, p1}, Le/e/a/TabFolderNav214;->prepareMylistMenu(Landroid/app/AlertDialog$Builder;Ljava/lang/Object;I)V'''
    def native_long(text):
        text=once(text,a,b,'native Mylist choice before delete')
        create='''    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;'''
        picker='''    invoke-static {p2}, Le/e/a/TabFolderNav214;->mylistMenu(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;'''
        return once(text,create,picker,'native Mylist action picker')
    s=in_method(s,'.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z',native_long);f.write_text(s)


    # Standard and three-button Back both return a reused Mylist folder tab to root.
    f=native/'com/sauzask/nicoid/NicoidVideoListActivity.smali';s=f.read_text()
    for signature in ('.method public onBackPressed()V',
                      '.method public onKeyDown(ILandroid/view/KeyEvent;)Z'):
        if signature in s:raise RuntimeError('Native Back signature already present: '+signature)
    native_back='''
.method public onBackPressed()V
    .registers 2

    invoke-static {p0}, Le/e/a/TabFolderNav214;->backToMylistRoot(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :default_back_215
    return-void
    :default_back_215
    invoke-super {p0}, Lcom/sauzask/nicoid/NicoidActivity;->onBackPressed()V
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    const/4 v0, 0x4
    if-ne p1, v0, :default_key_215
    invoke-static {p0}, Le/e/a/TabFolderNav214;->backToMylistRoot(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :default_key_215
    const/4 v0, 0x1
    return v0
    :default_key_215
    invoke-super {p0, p1, p2}, Lcom/sauzask/nicoid/NicoidActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z
    move-result v0
    return v0
.end method
'''
    f.write_text(s+native_back)


if __name__=='__main__':
    import argparse
    cli=argparse.ArgumentParser();cli.add_argument('--helpers',type=Path,required=True);cli.add_argument('--native',type=Path,required=True)
    args=cli.parse_args();patch(args.helpers);patch_native(args.native)
    print('PASS: v2.1.1-dev.5 Back, menu, tab and ambient hooks')