.class public final Ll46;
.super Landroid/database/DataSetObserver;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ll46;->a:B

    iput-object p1, p0, Ll46;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onChanged()V
    .registers 4

    iget-byte v0, p0, Ll46;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Ll46;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_58

    invoke-super {p0}, Landroid/database/DataSetObserver;->onChanged()V

    check-cast v2, Lcom/opera/android/undo/UndoBar;

    iget-boolean v0, v2, Lcom/opera/android/undo/UndoBar;->g:Z

    if-nez v0, :cond_2a

    iget-boolean v0, v2, Lcom/opera/android/undo/UndoBar;->j:Z

    if-eqz v0, :cond_26

    iget-boolean v0, v2, Lcom/opera/android/undo/UndoBar;->k:Z

    if-nez v0, :cond_2a

    iput-boolean v1, v2, Lcom/opera/android/undo/UndoBar;->k:Z

    new-instance v0, Lcbl;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, v1}, Lcbl;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_2a

    :cond_26
    const/4 p0, 0x0

    invoke-virtual {v2, p0}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    :cond_2a
    :goto_2a
    return-void

    :pswitch_2b
    check-cast v2, Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout;->f()V

    return-void

    :pswitch_31
    invoke-super {p0}, Landroid/database/DataSetObserver;->onChanged()V

    check-cast v2, Lwwf;

    iget-object p0, v2, Lwwf;->a:Lvwf;

    invoke-interface {p0}, Lvwf;->m()V

    return-void

    :pswitch_3c
    check-cast v2, Landroidx/appcompat/widget/ListPopupWindow;

    iget-object p0, v2, Landroidx/appcompat/widget/ListPopupWindow;->B:Leq1;

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result p0

    if-eqz p0, :cond_49

    invoke-virtual {v2}, Landroidx/appcompat/widget/ListPopupWindow;->show()V

    :cond_49
    return-void

    :pswitch_4a
    check-cast v2, Lh2c;

    invoke-static {v2}, Lh2c;->a(Lh2c;)V

    return-void

    :pswitch_50
    check-cast v2, Ltqk;

    iput-boolean v1, v2, Lm46;->a:Z

    invoke-virtual {v2}, Ltqk;->notifyDataSetChanged()V

    return-void

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_50
        :pswitch_4a
        :pswitch_3c
        :pswitch_31
        :pswitch_2b
    .end packed-switch
.end method

.method public final onInvalidated()V
    .registers 3

    iget-byte v0, p0, Ll46;->a:B

    iget-object v1, p0, Ll46;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_20

    :pswitch_7
    invoke-super {p0}, Landroid/database/DataSetObserver;->onInvalidated()V

    return-void

    :pswitch_b
    check-cast v1, Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->f()V

    return-void

    :pswitch_11
    check-cast v1, Landroidx/appcompat/widget/ListPopupWindow;

    invoke-virtual {v1}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    return-void

    :pswitch_17
    check-cast v1, Ltqk;

    const/4 p0, 0x0

    iput-boolean p0, v1, Lm46;->a:Z

    invoke-virtual {v1}, Ltqk;->notifyDataSetInvalidated()V

    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_17
        :pswitch_7
        :pswitch_11
        :pswitch_7
        :pswitch_b
    .end packed-switch
.end method
