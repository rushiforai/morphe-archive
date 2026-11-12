.class public final Lum3;
.super Lcom/opera/android/undo/UndoBar;
.source "SourceFile"


# instance fields
.field public final synthetic l:Lgn3;


# direct methods
.method public constructor <init>(Lgn3;Landroidx/fragment/app/r;Lvwh;Lva2;Lxm3;)V
    .registers 6

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lum3;->l:Lgn3;

    move-object p1, p2

    move-object p2, p3

    move-object p3, p4

    move-object p4, p5

    const/4 p5, 0x1

    invoke-direct/range {p0 .. p5}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    return-void
.end method


# virtual methods
.method public final b(Lmkm;)V
    .registers 4

    iget-object p1, p1, Lmkm;->a:Le5d;

    iget-object p1, p1, Le5d;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lmn;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lmn;-><init>(B)V

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object p1

    invoke-static {p1}, Lj$/util/stream/Stream$-EL;->toList(Ljava/util/stream/Stream;)Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lum3;->l:Lgn3;

    invoke-virtual {v0, p1}, Lgn3;->l(Ljava/util/List;)V

    invoke-virtual {p0}, Lum3;->f()V

    return-void
.end method

.method public final f()V
    .registers 7

    iget-object v0, p0, Lum3;->l:Lgn3;

    iget v1, v0, Lgn3;->N:I

    iget-object v2, p0, Lcom/opera/android/undo/UndoBar;->a:Landroid/app/Activity;

    if-lez v1, :cond_22

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v3, v0, Lgn3;->N:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const v5, 0x7f120010

    invoke-virtual {v1, v5, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_24

    :cond_22
    const-string v1, ""

    :goto_24
    iget v3, v0, Lgn3;->M:I

    if-lez v3, :cond_53

    iget v3, v0, Lgn3;->N:I

    if-lez v3, :cond_32

    const-string v3, "\n"

    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_32
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v0, v0, Lgn3;->M:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v4, 0x7f12000f

    invoke-virtual {v1, v4, v0, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_53
    iget-object p0, p0, Lcom/opera/android/undo/UndoBar;->b:Lami;

    iput-object v1, p0, Lami;->e:Ljava/lang/Object;

    iget-object p0, p0, Lami;->c:Ljava/lang/Object;

    check-cast p0, Lgtj;

    if-eqz p0, :cond_6d

    iget-object p0, p0, Lgtj;->a:Lasj;

    iget-object p0, p0, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/google/android/material/snackbar/SnackbarContentLayout;

    iget-object p0, p0, Lcom/google/android/material/snackbar/SnackbarContentLayout;->a:Landroid/widget/TextView;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_6d
    return-void
.end method
