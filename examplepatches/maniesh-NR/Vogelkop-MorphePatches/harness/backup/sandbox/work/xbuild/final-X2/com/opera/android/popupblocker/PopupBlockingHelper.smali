.class public final Lcom/opera/android/popupblocker/PopupBlockingHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static createUndoBar(Landroid/view/View;Lcom/opera/android/browser/chromium/ChromiumContent;)Lcom/opera/android/undo/UndoBar;
    .registers 8
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/opera/android/browser/chromium/ChromiumContent;",
            ")",
            "Lcom/opera/android/undo/UndoBar;"
        }
    .end annotation

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Landroid/app/Activity;

    new-instance v0, Lcom/opera/android/undo/UndoBar;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lcz4;

    invoke-direct {v2, p1}, Lcz4;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    new-instance v3, Lj06;

    const/16 p0, 0x18

    invoke-direct {v3, p0}, Lj06;-><init>(B)V

    new-instance v4, Lr16;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    const/4 p0, 0x1

    iput-boolean p0, v0, Lcom/opera/android/undo/UndoBar;->f:Z

    const p0, 0x7f140d31

    invoke-virtual {v1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    iget-object p1, v0, Lcom/opera/android/undo/UndoBar;->b:Lami;

    iput-object p0, p1, Lami;->f:Ljava/lang/Object;

    iget-object p0, p1, Lami;->c:Ljava/lang/Object;

    check-cast p0, Lgtj;

    if-eqz p0, :cond_38

    invoke-virtual {p1, p0}, Lami;->A(Lgtj;)V

    :cond_38
    iget p0, v0, Lcom/opera/android/undo/UndoBar;->h:I

    const p1, 0x7f140d2f

    if-eq p0, p1, :cond_44

    iput p1, v0, Lcom/opera/android/undo/UndoBar;->h:I

    invoke-virtual {v0}, Lcom/opera/android/undo/UndoBar;->f()V

    :cond_44
    return-object v0
.end method

.method public static onPopupBlocked(Landroid/view/View;Lcom/opera/android/undo/UndoBar;Ljava/lang/String;)V
    .registers 4
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/opera/android/undo/UndoBar;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/opera/android/undo/UndoBar;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-nez p0, :cond_17

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    :cond_17
    return-void
.end method
