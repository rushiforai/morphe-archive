"""Per-record long-press deletion with confirmation and themed selection.

Applies to the three BikeRun engines. Storage is a single legacy shared
bike_run_records_v1 key. Deletes by unique run id from both R and B lists.
"""


def one(text, old, new, label):
    n = text.count(old)
    if n != 1:
        raise ValueError("%s anchor count %d" % (label, n))
    return text.replace(old, new, 1)


def records_method(owner):
    model = owner + "Records;"
    entry = owner + "Records$Entry;"
    return r"""
.method public removeId(Ljava/lang/String;)Z
    .registers 8
    const/4 v4, 0x0
    if-eqz p1, :delete_end
    iget-object v0, p0, """+model+r"""->recent:Ljava/util/ArrayList;
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
    move-result-object v1
    :delete_recent
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :delete_best_start
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, """+entry+r"""
    iget-object v3, v2, """+entry+r"""->id:Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :delete_recent
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    const/4 v4, 0x1
    goto :delete_recent
    :delete_best_start
    iget-object v0, p0, """+model+r"""->best:Ljava/util/ArrayList;
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
    move-result-object v1
    :delete_best
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :delete_end
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, """+entry+r"""
    iget-object v3, v2, """+entry+r"""->id:Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :delete_best
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    const/4 v4, 0x1
    goto :delete_best
    :delete_end
    return v4
.end method
"""


def patch_records(content, owner):
    if "removeId(Ljava/lang/String;)Z" in content:
        raise ValueError("already patched records")
    return content + "\n" + records_method(owner)


def pane_methods(owner):
    pane = owner + "$RecordsPane;"
    track = owner + "$Track;"
    records = owner + "Records;"
    return r"""
.method public onLongClick(Landroid/view/View;)Z
    .registers 10
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v0
    instance-of v1, v0, Ljava/lang/String;
    if-eqz v1, :record_long_no
    check-cast v0, Ljava/lang/String;
    iput-object v0, p0, """+pane+r"""->deleteId:Ljava/lang/String;
    iput-object p1, p0, """+pane+r"""->selectedRow:Landroid/view/View;
    const/4 v0, 0x1
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V
    invoke-virtual {p0}, """+pane+r"""->getContext()Landroid/content/Context;
    move-result-object v0
    new-instance v1, Landroid/app/AlertDialog$Builder;
    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    iget-object v2, p0, """+pane+r"""->track:"""+track+r"""
    const-string v3, "\u8a18\u9332\u3092\u524a\u9664"
    const-string v4, "Delete record"
    const-string v5, "\u5220\u9664\u8bb0\u5f55"
    invoke-virtual {v2, v3, v4, v5}, """+track+r"""->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, """+pane+r"""->track:"""+track+r"""
    const-string v3, "\u3053\u306e\u8d70\u884c\u8a18\u9332\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"
    const-string v4, "Delete this run record?"
    const-string v5, "\u786e\u5b9a\u5220\u9664\u8fd9\u6761\u8bb0\u5f55\uff1f"
    invoke-virtual {v2, v3, v4, v5}, """+track+r"""->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, """+pane+r"""->track:"""+track+r"""
    const-string v3, "\u524a\u9664"
    const-string v4, "Delete"
    const-string v5, "\u5220\u9664"
    invoke-virtual {v2, v3, v4, v5}, """+track+r"""->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v1, v3, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, """+pane+r"""->track:"""+track+r"""
    const-string v3, "\u30ad\u30e3\u30f3\u30bb\u30eb"
    const-string v4, "Cancel"
    const-string v5, "\u53d6\u6d88"
    invoke-virtual {v2, v3, v4, v5}, """+track+r"""->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    const/4 v4, 0x0
    invoke-virtual {v1, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;
    move-result-object v1
    invoke-virtual {v1, p0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V
    const/4 v0, 0x1
    return v0
    :record_long_no
    const/4 v0, 0x0
    return v0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 8
    iget-object v0, p0, """+pane+r"""->deleteId:Ljava/lang/String;
    if-eqz v0, :record_delete_done
    iget-object v1, p0, """+pane+r"""->track:"""+track+r"""
    iget-object v2, v1, """+track+r"""->records:"""+records+r"""
    invoke-virtual {v2, v0}, """+records+r"""->removeId(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :record_delete_done
    iget-object v0, v1, """+track+r"""->prefs:Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-virtual {v2}, """+records+r"""->encode()Ljava/lang/String;
    move-result-object v3
    const-string v4, "bike_run_records_v1"
    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    iget v0, v1, """+track+r"""->recordsPage:I
    invoke-virtual {p0, v0}, """+pane+r"""->select(I)V
    invoke-virtual {v1}, """+track+r"""->invalidate()V
    :record_delete_done
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 4
    iget-object v0, p0, """+pane+r"""->selectedRow:Landroid/view/View;
    if-eqz v0, :record_dismiss_done
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V
    :record_dismiss_done
    const/4 v0, 0x0
    iput-object v0, p0, """+pane+r"""->selectedRow:Landroid/view/View;
    iput-object v0, p0, """+pane+r"""->deleteId:Ljava/lang/String;
    return-void
.end method
"""


def patch_pane(content, owner):
    pane = owner + "$RecordsPane;"
    entry = owner + "Records$Entry;"
    content = one(content, ".super Landroid/widget/LinearLayout;",
                  ".super Landroid/widget/LinearLayout;\n"
                  ".implements Landroid/view/View$OnLongClickListener;\n"
                  ".implements Landroid/content/DialogInterface$OnClickListener;\n"
                  ".implements Landroid/content/DialogInterface$OnDismissListener;",
                  "pane listener interfaces")
    content = one(content, "# instance fields",
                  "# instance fields\n.field private deleteId:Ljava/lang/String;\n"
                  ".field private selectedRow:Landroid/view/View;\n",
                  "pane selection fields")
    head = ".method select(I)V\n    .registers 14"
    content = one(content, head,
                  ".method select(I)V\n    .registers 16",
                  "record render register headroom")
    anchor = "    check-cast v2, " + entry
    content = one(content, anchor, anchor + "\n\n    move-object v12, v2",
                  "retain item identifier while formatting")
    ctor = ("    invoke-direct {v8, v9, v6, v2}, " + owner
            + "$RecordRow;-><init>(" + owner
            + "$Track;Ljava/lang/String;Ljava/lang/String;)V")
    hooks = (ctor + "\n\n"
             "    iget-object v9, v12, " + entry + "->id:Ljava/lang/String;\n\n"
             "    invoke-virtual {v8, v9}, Landroid/view/View;->setTag(Ljava/lang/Object;)V\n\n"
             "    invoke-virtual {v8, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V\n\n"
             "    invoke-direct {p0, v8}, " + pane + "->styleRecordRow(Landroid/view/View;)V")
    content = one(content, ctor, hooks, "enable record long press")
    return content + "\n" + pane_methods(owner) + "\n" + row_style(owner)


def row_style(owner):
    pane = owner + "$RecordsPane;"
    track = owner + "$Track;"
    # Android's selectableItemBackground resource resolved from the actual
    # nicoid app theme, not a hardcoded highlight color.
    return r"""
.method private styleRecordRow(Landroid/view/View;)V
    .registers 8
    new-instance v0, Landroid/util/TypedValue;
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V
    invoke-virtual {p0}, """+pane+r"""->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;
    move-result-object v1
    const v2, 0x101030e    # android:attr/selectableItemBackground
    const/4 v3, 0x1
    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z
    move-result v1
    if-eqz v1, :row_style_done
    iget v0, v0, Landroid/util/TypedValue;->resourceId:I
    if-eqz v0, :row_style_done
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V
    :row_style_done
    invoke-virtual {p1, v3}, Landroid/view/View;->setClickable(Z)V
    return-void
.end method
"""
