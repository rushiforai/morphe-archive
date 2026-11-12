.class public final Lirk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lspm;


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;

.field public final synthetic c:Lmrk;


# direct methods
.method public constructor <init>(Lmrk;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lirk;->c:Lmrk;

    const-string p1, ""

    iput-object p1, p0, Lirk;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/CharSequence;)V
    .registers 5

    iget-object v0, p0, Lirk;->c:Lmrk;

    iget-object v1, v0, Lmrk;->H:Lxpm;

    iget-object v2, v1, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v2

    if-eqz v2, :cond_12

    iget-object p1, v1, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p1}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object p1

    :cond_12
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lirk;->b:Ljava/lang/String;

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_49

    iput-object p1, p0, Lirk;->b:Ljava/lang/String;

    iget-boolean v2, v0, Lmrk;->R:Z

    if-nez v2, :cond_27

    const/4 v2, 0x0

    iput-object v2, v0, Lmrk;->S:Ljava/lang/Integer;

    :cond_27
    invoke-virtual {v0}, Lmrk;->c()Z

    move-result v2

    if-eqz v2, :cond_49

    iget-object v1, v1, Lxpm;->c:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_43

    iget-object v1, v0, Lmrk;->v:Ligi;

    invoke-virtual {v1}, Ligi;->O()Z

    move-result v1

    if-eqz v1, :cond_49

    :cond_43
    const/4 v1, 0x1

    iput-boolean v1, p0, Lirk;->a:Z

    invoke-virtual {v0, p1}, Lmrk;->i(Ljava/lang/String;)V

    :cond_49
    return-void
.end method

.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    return-void
.end method

.method public final b(II)V
    .registers 5

    if-nez p1, :cond_10

    iget-object p0, p0, Lirk;->c:Lmrk;

    iget-object p1, p0, Lmrk;->b:Landroid/view/ViewGroup;

    new-instance v0, Lbr;

    const/16 v1, 0x18

    invoke-direct {v0, p0, p2, v1}, Lbr;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_10
    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public final c(ILandroid/view/KeyEvent;)Z
    .registers 10

    iget-object v0, p0, Lirk;->c:Lmrk;

    invoke-virtual {v0}, Lmrk;->d()Z

    move-result v1

    const/16 v2, 0x14

    const/16 v3, 0x13

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v1, :cond_20

    invoke-static {v4, p2}, Lfr3;->H(ILandroid/view/KeyEvent;)Z

    move-result p0

    if-eqz p0, :cond_59

    if-eq p1, v3, :cond_18

    if-ne p1, v2, :cond_59

    :cond_18
    invoke-virtual {v0}, Lmrk;->f()V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lmrk;->h(Lbsi;)V

    return v5

    :cond_20
    invoke-static {v4, p2}, Lfr3;->H(ILandroid/view/KeyEvent;)Z

    move-result v0

    const/4 v1, 0x4

    const/16 v6, 0x3d

    if-eqz v0, :cond_48

    if-eq p1, v3, :cond_40

    if-eq p1, v2, :cond_37

    if-ne p1, v6, :cond_59

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    invoke-virtual {p0, p1, v1}, Lirk;->b(II)V

    return v5

    :cond_37
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p2, 0x2

    invoke-virtual {p0, p1, p2}, Lirk;->b(II)V

    return v5

    :cond_40
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    invoke-virtual {p0, p1, v5}, Lirk;->b(II)V

    return v5

    :cond_48
    invoke-static {v1, p2}, Lfr3;->H(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_59

    if-ne p1, v6, :cond_59

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p2, 0x3

    invoke-virtual {p0, p1, p2}, Lirk;->b(II)V

    return v5

    :cond_59
    return v4
.end method

.method public final d(II)V
    .registers 3

    return-void
.end method

.method public final e()V
    .registers 1

    iget-object p0, p0, Lirk;->c:Lmrk;

    iget-object p0, p0, Lmrk;->P:Lc1f;

    if-eqz p0, :cond_9

    invoke-virtual {p0}, Lc1f;->b()V

    :cond_9
    return-void
.end method

.method public final f(Z)V
    .registers 2

    return-void
.end method

.method public final g()V
    .registers 2

    iget-object v0, p0, Lirk;->c:Lmrk;

    iget-object v0, v0, Lmrk;->H:Lxpm;

    iget-object v0, v0, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lirk;->a(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final h()V
    .registers 1

    return-void
.end method

.method public final i()V
    .registers 1

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    iget-object p2, p0, Lirk;->c:Lmrk;

    iget-boolean p2, p2, Lmrk;->T:Z

    if-nez p2, :cond_9

    invoke-virtual {p0, p1}, Lirk;->a(Ljava/lang/CharSequence;)V

    :cond_9
    return-void
.end method
