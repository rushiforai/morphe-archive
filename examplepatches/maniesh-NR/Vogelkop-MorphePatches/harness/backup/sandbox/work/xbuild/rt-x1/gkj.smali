.class public final Lgkj;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/CharSequence;

.field public e:Lekj;

.field public f:Lfkj;

.field public g:Lqp2;

.field public h:Ldkj;

.field public i:Ldkj;

.field public j:Lql;

.field public k:I

.field public l:I

.field public m:I

.field public n:Z

.field public o:Lpxh;


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget v0, p0, Lgkj;->l:I

    if-eqz v0, :cond_9

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_9
    iget-object p0, p0, Lgkj;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final getNeutralButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lgkj;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget v0, p0, Lgkj;->k:I

    if-eqz v0, :cond_9

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_9
    iget-object p0, p0, Lgkj;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 4

    iget v0, p0, Lgkj;->m:I

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_f

    :cond_d
    iget-object v0, p0, Lgkj;->d:Ljava/lang/CharSequence;

    :goto_f
    invoke-virtual {p1, v0}, Laz0;->setTitle(Ljava/lang/CharSequence;)Laz0;

    iget-object v0, p1, Laz0;->a:Lwy0;

    iget-object p0, p0, Lgkj;->o:Lpxh;

    if-eqz p0, :cond_26

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    iput-object p0, v0, Lwy0;->f:Ljava/lang/CharSequence;

    :cond_26
    const/4 p0, 0x1

    iput-boolean p0, v0, Lwy0;->k:Z

    return-void
.end method

.method public final onDialogCreated(Lbz0;)V
    .registers 2

    iget-boolean p0, p0, Lgkj;->n:Z

    invoke-virtual {p1, p0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-void
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 3

    iget-object p0, p0, Lgkj;->e:Lekj;

    if-eqz p0, :cond_7

    invoke-interface {p0, p2}, Lekj;->b(Lhjm;)V

    :cond_7
    return-void
.end method

.method public final onFinished(Lhjm;)V
    .registers 3

    invoke-super {p0, p1}, Ld63;->onFinished(Lhjm;)V

    iget-object v0, p0, Lgkj;->f:Lfkj;

    if-eqz v0, :cond_a

    invoke-interface {v0, p0, p1}, Lfkj;->e(Lgkj;Lhjm;)V

    :cond_a
    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 2

    iget-object p0, p0, Lgkj;->i:Ldkj;

    if-eqz p0, :cond_7

    invoke-interface {p0}, Ldkj;->a()V

    :cond_7
    return-void
.end method

.method public final onNeutralButtonClicked(Lbz0;)V
    .registers 2

    iget-object p0, p0, Lgkj;->j:Lql;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Lql;->a()V

    :cond_7
    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 2

    iget-object p0, p0, Lgkj;->h:Ldkj;

    if-eqz p0, :cond_7

    invoke-interface {p0}, Ldkj;->a()V

    :cond_7
    return-void
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 3

    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    iget-object p0, p0, Lgkj;->g:Lqp2;

    if-eqz p0, :cond_1d

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, -0x1

    invoke-virtual {p1, p0}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p0

    if-eqz p0, :cond_1d

    new-instance p1, Lhz0;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Lhz0;-><init>(B)V

    invoke-static {p0, p1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p1, p0}, Lhz0;->a(Landroid/view/View;)V

    :cond_1d
    return-void
.end method
