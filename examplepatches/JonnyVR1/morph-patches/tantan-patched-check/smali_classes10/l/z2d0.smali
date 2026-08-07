.class public Ll/z2d0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "TT;>;"
        }
    .end annotation
.end field

.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "TT;>;"
        }
    .end annotation
.end field

.field public d:Ll/x20;

.field public e:Ll/x20;

.field public f:Ll/byd0;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/z2d0;->a:Ljava/lang/Object;

    .line 5
    .line 6
    new-instance p1, Ll/byd0;

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p1, p2, v0}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/z2d0;->f:Ll/byd0;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Ll/z2d0;Ljava/lang/Object;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z2d0;->j(Ljava/lang/Object;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b(Ll/z2d0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z2d0;->i(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic c(Ll/z2d0;Ljava/lang/String;Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z2d0;->k(Ljava/lang/String;Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/z2d0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z2d0;->m(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic e(Ll/z2d0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z2d0;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/z2d0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z2d0;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/wrv;->v0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method


# virtual methods
.method public final h(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/nti;->a(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->front()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/w2d0;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/w2d0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/x2d0;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/x2d0;-><init>(Ll/z2d0;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic i(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/z2d0;->b:Ll/y20;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Ll/z2d0;->c:Ll/y20;

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic j(Ljava/lang/Object;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/z2d0;->b:Ll/y20;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance p2, Ll/y2d0;

    .line 20
    .line 21
    invoke-direct {p2, p0, p1}, Ll/y2d0;-><init>(Ll/z2d0;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 25
    .line 26
    const-wide/16 v0, 0x7d0

    .line 27
    .line 28
    invoke-static {p0, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic k(Ljava/lang/String;Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p2, p1, v0}, Ll/z2d0;->r(Lcom/p1/mobile/android/app/Act$r;Ljava/lang/String;Z)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/z2d0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z2d0;->h(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/z2d0;->d:Ll/x20;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/z2d0;->d:Ll/x20;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic m(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/z2d0;->c:Ll/y20;

    .line 2
    .line 3
    iget-object p0, p0, Ll/z2d0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/z2d0;->c:Ll/y20;

    .line 2
    .line 3
    iget-object p0, p0, Ll/z2d0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o(Ljava/lang/String;ZZZ)Z
    .locals 7

    .line 1
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/z2d0;->b:Ll/y20;

    .line 15
    .line 16
    iget-object p0, p0, Ll/z2d0;->a:Ljava/lang/Object;

    .line 17
    .line 18
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return v1

    .line 22
    :cond_0
    const/4 v2, 0x0

    .line 23
    if-nez p2, :cond_1

    .line 24
    .line 25
    return v2

    .line 26
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    iget-object p2, p0, Ll/z2d0;->f:Ll/byd0;

    .line 31
    .line 32
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    check-cast p2, Ljava/lang/Long;

    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 39
    .line 40
    .line 41
    move-result-wide v5

    .line 42
    sub-long/2addr v3, v5

    .line 43
    const-wide/32 v5, 0x240c8400

    .line 44
    .line 45
    .line 46
    cmp-long p2, v3, v5

    .line 47
    .line 48
    if-gez p2, :cond_3

    .line 49
    .line 50
    if-eqz p3, :cond_2

    .line 51
    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    iget-object p1, p0, Ll/z2d0;->c:Ll/y20;

    .line 55
    .line 56
    iget-object p0, p0, Ll/z2d0;->a:Ljava/lang/Object;

    .line 57
    .line 58
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    return v2

    .line 62
    :cond_3
    if-eqz p3, :cond_4

    .line 63
    .line 64
    if-eqz p4, :cond_4

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p0, p2, p1, p4}, Ll/z2d0;->r(Lcom/p1/mobile/android/app/Act$r;Ljava/lang/String;Z)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    return p0

    .line 75
    :cond_4
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    new-instance p3, Ll/s2d0;

    .line 80
    .line 81
    invoke-direct {p3, p0, p1}, Ll/s2d0;-><init>(Ll/z2d0;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2, p3}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    return v1
.end method

.method public p(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/z2d0;->c:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public q(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/z2d0;->b:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public final r(Lcom/p1/mobile/android/app/Act$r;Ljava/lang/String;Z)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_1

    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p3, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    invoke-virtual {p3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    instance-of p3, p3, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 13
    .line 14
    if-eqz p3, :cond_1

    .line 15
    .line 16
    :cond_0
    return v0

    .line 17
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Landroid/app/Activity;

    .line 24
    .line 25
    if-nez p1, :cond_2

    .line 26
    .line 27
    return v0

    .line 28
    :cond_2
    new-instance p3, Ll/th0$a;

    .line 29
    .line 30
    invoke-direct {p3, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 34
    .line 35
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->W9:I

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p3, p1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1, p2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const/4 p2, 0x1

    .line 50
    invoke-virtual {p1, p2}, Ll/th0$a;->b(Z)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    sget-object p3, Ll/zrv;->e:Landroid/app/Application;

    .line 59
    .line 60
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ha:I

    .line 61
    .line 62
    invoke-virtual {p3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    invoke-virtual {p1, p3}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    new-instance p3, Ll/t2d0;

    .line 71
    .line 72
    invoke-direct {p3, p0}, Ll/t2d0;-><init>(Ll/z2d0;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, p3}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    sget-object p3, Ll/zrv;->e:Landroid/app/Application;

    .line 80
    .line 81
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->C6:I

    .line 82
    .line 83
    invoke-virtual {p3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    invoke-virtual {p1, p3}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance p3, Ll/u2d0;

    .line 92
    .line 93
    invoke-direct {p3, p0}, Ll/u2d0;-><init>(Ll/z2d0;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, p3}, Ll/th0$a;->l(Landroid/content/DialogInterface$OnCancelListener;)Ll/th0$a;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    new-instance p3, Ll/v2d0;

    .line 101
    .line 102
    invoke-direct {p3, p0}, Ll/v2d0;-><init>(Ll/z2d0;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, p3}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1}, Ll/th0$a;->a()Ll/th0;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/z2d0;->e:Ll/x20;

    .line 117
    .line 118
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_3

    .line 123
    .line 124
    iget-object p1, p0, Ll/z2d0;->e:Ll/x20;

    .line 125
    .line 126
    invoke-interface {p1}, Ll/x20;->call()V

    .line 127
    .line 128
    .line 129
    :cond_3
    iget-object p0, p0, Ll/z2d0;->f:Ll/byd0;

    .line 130
    .line 131
    invoke-static {}, Ll/pzi0;->o()J

    .line 132
    .line 133
    .line 134
    move-result-wide v0

    .line 135
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    return p2
.end method
