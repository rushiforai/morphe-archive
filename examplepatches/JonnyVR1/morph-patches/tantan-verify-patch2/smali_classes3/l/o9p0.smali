.class public Ll/o9p0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/o9p0$a;
    }
.end annotation


# instance fields
.field public a:Ll/o9p0$a;

.field public b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Ll/o9p0$a;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o9p0;->a:Ll/o9p0$a;

    .line 5
    .line 6
    iput-object p2, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/o9p0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o9p0;->C()V

    return-void
.end method

.method public static synthetic b(Ll/o9p0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o9p0;->A(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic c(Ll/o9p0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o9p0;->B()V

    return-void
.end method

.method public static synthetic d(Ll/o9p0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o9p0;->t()V

    return-void
.end method

.method public static synthetic e(Ll/o9p0;Ljava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o9p0;->z(Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f(Ll/o9p0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o9p0;->y(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic g(Ll/o9p0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o9p0;->w()V

    return-void
.end method

.method public static synthetic h()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Ll/o9p0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o9p0;->v(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic k(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic l(Ll/o9p0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o9p0;->x(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic m(Ll/o9p0;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o9p0;->u(Landroid/util/Pair;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o9p0;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final B()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o9p0;->a:Ll/o9p0$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/o9p0$a;->X0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final C()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o9p0;->r()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/d9p0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/d9p0;-><init>(Ll/o9p0;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/r5k;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final D(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->xh:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->wh:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 20
    .line 21
    new-instance v1, Ll/b9p0;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/b9p0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->nh:I

    .line 31
    .line 32
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 p1, 0x0

    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final E(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ki:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ji:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 20
    .line 21
    new-instance v1, Ll/e9p0;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/e9p0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ni:I

    .line 31
    .line 32
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 p1, 0x0

    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Ll/htd0;->d:Ll/htd0;

    .line 4
    .line 5
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/urv;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/urv;->c()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/a9p0;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/a9p0;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/f9p0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/f9p0;-><init>(Ll/o9p0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public G()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o9p0;->s()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/j9p0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/j9p0;-><init>(Ll/o9p0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/k9p0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/k9p0;-><init>(Ll/o9p0;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/r5k;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o9p0;->s()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/g9p0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/g9p0;-><init>(Ll/o9p0;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/r5k;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final o()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->N5()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->v7()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-instance v3, Ll/h9p0;

    .line 12
    .line 13
    invoke-direct {v3}, Ll/h9p0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v1, v2, v3}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/i9p0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/i9p0;-><init>(Ll/o9p0;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/r5k;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->m6()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "mobile"

    .line 10
    .line 11
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/o9p0;->n()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string v1, "realName"

    .line 22
    .line 23
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/o9p0;->o()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final q()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->C6()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final r()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->B6()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final s()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->v7()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final t()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v0, Ll/efv;->o:Ljava/lang/String;

    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->n:I

    .line 6
    .line 7
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->e2(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final u(Landroid/util/Pair;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/o9p0;->B()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    new-instance p1, Ll/n9p0;

    .line 36
    .line 37
    invoke-direct {p1, p0}, Ll/n9p0;-><init>(Ll/o9p0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/o9p0;->D(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast p1, Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/o9p0;->C()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    new-instance p1, Ll/n9p0;

    .line 59
    .line 60
    invoke-direct {p1, p0}, Ll/n9p0;-><init>(Ll/o9p0;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/o9p0;->E(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final v(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/sz2;->e()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/o9p0;->B()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ll/sz2;->e()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    new-instance p1, Ll/l9p0;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Ll/l9p0;-><init>(Ll/o9p0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/o9p0;->D(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    invoke-static {}, Ll/sz2;->e()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    iget-object p1, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    new-instance v0, Ll/m9p0;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/m9p0;-><init>(Ll/o9p0;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1, v0}, Ll/sz2;->c(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    invoke-virtual {p0}, Ll/o9p0;->C()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic w()V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    iget-object v1, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    new-instance v2, Ll/c9p0;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/c9p0;-><init>(Ll/o9p0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/wrv;->n0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic x(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o9p0;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o9p0;->G()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(Ljava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p1, p0, Ll/o9p0;->b:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/o9p0;->q()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method
