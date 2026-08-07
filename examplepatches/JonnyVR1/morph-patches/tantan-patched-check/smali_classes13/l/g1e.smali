.class public Ll/g1e;
.super Landroidx/appcompat/app/a;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Ll/j1e$b;
.implements Ll/s1e;


# instance fields
.field public b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field public c:I

.field public d:J

.field public e:Landroid/content/DialogInterface$OnShowListener;

.field public f:Landroid/content/DialogInterface$OnDismissListener;

.field public g:Ll/r1e;

.field public final h:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;ZI)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_1

    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    sget p3, Ll/tgc0;->k:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move p3, v0

    .line 10
    :cond_1
    :goto_0
    invoke-direct {p0, p1, p3}, Landroidx/appcompat/app/a;-><init>(Landroid/content/Context;I)V

    .line 11
    .line 12
    .line 13
    iput v0, p0, Ll/g1e;->c:I

    .line 14
    .line 15
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iput-object p2, p0, Ll/g1e;->h:Lrx/subjects/b;

    .line 20
    .line 21
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iput-object p2, p0, Ll/g1e;->i:Lrx/subjects/b;

    .line 26
    .line 27
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 28
    .line 29
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iput-object p2, p0, Ll/g1e;->b:Ljava/lang/ref/WeakReference;

    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/g1e;->b:Ljava/lang/ref/WeakReference;

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Landroid/content/Context;

    .line 45
    .line 46
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    instance-of p2, p1, Ll/r1e;

    .line 51
    .line 52
    if-eqz p2, :cond_2

    .line 53
    .line 54
    check-cast p1, Ll/r1e;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/g1e;->D(Ll/r1e;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method public static synthetic t(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic u(IIIILandroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 1

    .line 1
    invoke-static {}, Ll/dgq0$l;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p5, v0}, Ll/dgq0;->f(I)Ll/svm;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Ll/svm;->d:I

    .line 10
    .line 11
    add-int/2addr p3, v0

    .line 12
    invoke-virtual {p4, p0, p1, p2, p3}, Landroid/view/View;->setPadding(IIII)V

    .line 13
    .line 14
    .line 15
    return-object p5
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    const v0, 0x7ffffc17

    .line 2
    .line 3
    .line 4
    iput v0, p0, Ll/g1e;->c:I

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/g1e;->C()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final C()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g1e;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/p1/mobile/android/app/DialogAct;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g1e;->p()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Ll/g1e;->d:J

    .line 20
    .line 21
    invoke-static {}, Ll/u11;->c()V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/j1e;->i()Ll/j1e;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/g1e;->b:Ljava/lang/ref/WeakReference;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Landroid/content/Context;

    .line 35
    .line 36
    invoke-virtual {v0, v1, p0}, Ll/j1e;->d(Landroid/content/Context;Ll/j1e$b;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public D(Ll/r1e;)V
    .locals 0
    .param p1    # Ll/r1e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/g1e;->g:Ll/r1e;

    .line 2
    .line 3
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/g1e;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget v0, p0, Ll/g1e;->c:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {}, Ll/u11;->c()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-static {}, Ll/j1e;->i()Ll/j1e;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Ll/g1e;->b:Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/content/Context;

    .line 33
    .line 34
    invoke-virtual {v0, v1, p0}, Ll/j1e;->j(Landroid/content/Context;Ll/j1e$b;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final duringCreated(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TV;>;)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/g1e;->w(Lrx/c;Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public getPriority()I
    .locals 0

    .line 1
    iget p0, p0, Ll/g1e;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/g1e;->g:Ll/r1e;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0, p0}, Ll/r1e;->onDialogAttachToWindow(Landroid/app/Dialog;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/g1e;->g:Ll/r1e;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0, p0}, Ll/r1e;->onDialogDetachFromWindow(Landroid/app/Dialog;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/g1e;->h:Lrx/subjects/b;

    .line 12
    .line 13
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/g1e;->i:Lrx/subjects/b;

    .line 19
    .line 20
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g1e;->f:Landroid/content/DialogInterface$OnDismissListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Ll/g1e;->i:Lrx/subjects/b;

    .line 9
    .line 10
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget p1, p0, Ll/g1e;->c:I

    .line 16
    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object p1, p0, Ll/g1e;->b:Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    instance-of p1, p1, Lcom/p1/mobile/android/app/DialogAct;

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :cond_2
    invoke-static {}, Ll/j1e;->i()Ll/j1e;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p0, p0, Ll/g1e;->b:Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Landroid/content/Context;

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    invoke-virtual {p1, p0, v0}, Ll/j1e;->l(Landroid/content/Context;Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onShow(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g1e;->i:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/g1e;->e:Landroid/content/DialogInterface$OnShowListener;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnShowListener;->onShow(Landroid/content/DialogInterface;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    :try_start_0
    invoke-super {p0}, Landroid/app/Dialog;->show()V
    :try_end_0
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g1e;->f:Landroid/content/DialogInterface$OnDismissListener;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g1e;->e:Landroid/content/DialogInterface$OnShowListener;

    .line 2
    .line 3
    return-void
.end method

.method public show()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lcom/p1/mobile/android/ui/UIModeHelper;->d(Landroid/app/Dialog;Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Ll/g1e;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public v(Landroid/view/View;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    new-instance v3, Ll/e1e;

    .line 21
    .line 22
    invoke-direct {v3, p0, v0, v1, v2}, Ll/e1e;-><init>(IIII)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v3}, Ll/kkl0;->y0(Landroid/view/View;Ll/il50;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Ll/kkl0;->g0(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final w(Lrx/c;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TV;>;Z)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/g1e;->g:Ll/r1e;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/r1e;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/psd0;->E()Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/g1e;->h:Lrx/subjects/b;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ll/f1e;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/f1e;-><init>(Lrx/c;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, p0, p2}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final x()V
    .locals 0

    .line 1
    invoke-super {p0, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final y()V
    .locals 0

    .line 1
    invoke-super {p0, p0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/a;->s(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
