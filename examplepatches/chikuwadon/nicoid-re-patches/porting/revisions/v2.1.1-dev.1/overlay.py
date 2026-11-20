#!/usr/bin/env python3
"""Minimal fail-closed v2.1.1-dev.1 Smali hooks on the approved v2.1.0 baseline."""
from pathlib import Path


def replace_once(body: str, old: str, new: str, tag: str) -> str:
    count=body.count(old)
    if count!=1:
        raise RuntimeError(f'{tag}: expected one anchor, found {count}')
    return body.replace(old,new,1)


def patch(helpers: Path) -> None:
    f=helpers/'e/e/a/BulkSelection.smali'
    s=f.read_text()
    header='''    invoke-static {v0, v1, v2}, Le/e/a/SelectionUi191;->footer(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    move-result-object v1'''
    s=replace_once(s,header,header+'''

    invoke-static {v1, p0}, Le/e/a/BulkMove211;->installNative(Landroid/widget/LinearLayout;Ljava/lang/Object;)V''','native footer')
    header='''    invoke-static {p0, v2}, Le/e/a/SelectionUi191;->enabled(Landroid/widget/LinearLayout;I)V'''
    s=replace_once(s,header,header+'''

    invoke-static {p0, v2}, Le/e/a/BulkMove211;->refresh(Landroid/widget/LinearLayout;I)V''','native selection update')
    f.write_text(s)

    f=helpers/'e/e/a/LocalPlaylists$Page.smali'
    s=f.read_text()
    header='''    move-result-object v0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;'''
    start=s.index('.method selectionChanged()V')
    stop=s.index('.end method',start)
    section=s[start:stop]
    section=replace_once(section,header,header+'''

    invoke-static {v0, p0}, Le/e/a/BulkMove211;->installLocal(Landroid/widget/LinearLayout;Ljava/lang/Object;)V''','local footer')
    s=s[:start]+section+s[stop:]
    header='''    invoke-static {v0, v1}, Le/e/a/SelectionUi191;->enabled(Landroid/widget/LinearLayout;I)V'''
    s=replace_once(s,header,header+'''

    invoke-static {v0, v1}, Le/e/a/BulkMove211;->refresh(Landroid/widget/LinearLayout;I)V''','local selection update')
    f.write_text(s)

    f=helpers/'e/e/a/AmbientLight$Layer.smali'
    s=f.read_text()
    header='''    invoke-virtual {p0, v4}, Le/e/a/AmbientLight$Layer;->installDetailPlanes(Landroid/view/View;)V

    return v6'''
    s=replace_once(s,header,'''
'''.join([header.split('\n\n')[0],'''    invoke-direct {p0}, Le/e/a/AmbientLight$Layer;->screenSpreadEnabled()Z

    move-result v0

    invoke-static {v4, v0}, Le/e/a/AmbientPanelBlend211;->update(Landroid/view/View;Z)V''','    return v6']),'ambient detail panel rendering')
    header='''    .line 522
    iget-object v0, p0, Le/e/a/AmbientLight$Layer;->normalPageView:Landroid/view/View;'''
    s=replace_once(s,header,'''
'''.join(['''    .line 522
    iget-object v0, p0, Le/e/a/AmbientLight$Layer;->normalPageView:Landroid/view/View;

    invoke-static {v0}, Le/e/a/AmbientPanelBlend211;->clear(Landroid/view/View;)V''','''    iget-object v0, p0, Le/e/a/AmbientLight$Layer;->normalPageView:Landroid/view/View;''']),'ambient cleanup')
    f.write_text(s)

if __name__=='__main__':
    import argparse
    parser=argparse.ArgumentParser()
    parser.add_argument('helper_sources',type=Path)
    args=parser.parse_args()
    patch(args.helper_sources)
    print('PASS: checked Smali anchors for bulk move UI and ambient dark-panel backgrounds')