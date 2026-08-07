.class public Ll/ark0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/jqm0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:I

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public k:Ljava/lang/String;

.field public l:Z

.field public m:I

.field public n:Ljava/lang/String;

.field public o:Ll/bzm0;

.field public p:Lcom/p1/mobile/android/app/Dialog;

.field public final q:Ljava/lang/Runnable;

.field public final r:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Ll/ark0;->i:I

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    iput-object p1, p0, Ll/ark0;->k:Ljava/lang/String;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/ark0;->l:Z

    .line 13
    .line 14
    iput p1, p0, Ll/ark0;->m:I

    .line 15
    .line 16
    const-string p1, "apply"

    .line 17
    .line 18
    iput-object p1, p0, Ll/ark0;->n:Ljava/lang/String;

    .line 19
    .line 20
    new-instance p1, Ll/iqk0;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Ll/iqk0;-><init>(Ll/ark0;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/ark0;->q:Ljava/lang/Runnable;

    .line 26
    .line 27
    new-instance p1, Ll/rqk0;

    .line 28
    .line 29
    invoke-direct {p1, p0}, Ll/rqk0;-><init>(Ll/ark0;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/ark0;->r:Ljava/lang/Runnable;

    .line 33
    .line 34
    return-void
.end method

.method private B4(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/lqk0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/lqk0;-><init>(Ll/ark0;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->H0:I

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Vc:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private C4(Ll/gvn0;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->kf:I

    .line 11
    .line 12
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ff:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/xqk0;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1}, Ll/xqk0;-><init>(Ll/ark0;Ll/gvn0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->gf:I

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p1, v0}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v0, Ll/yqk0;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/yqk0;-><init>(Ll/ark0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private D4(Ll/gvn0;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/gvn0;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qh:I

    .line 8
    .line 9
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->m7:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1}, Ll/gvn0;->i()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Hh:I

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ll/jqm0;

    .line 37
    .line 38
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->sf:I

    .line 61
    .line 62
    new-instance v2, Ll/mqk0;

    .line 63
    .line 64
    invoke-direct {v2, p0, p1}, Ll/mqk0;-><init>(Ll/ark0;Ll/gvn0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v0, Ll/nqk0;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/nqk0;-><init>(Ll/ark0;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->i0(Landroid/content/DialogInterface$OnKeyListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->wg:I

    .line 81
    .line 82
    iget-object v1, p0, Ll/ark0;->q:Ljava/lang/Runnable;

    .line 83
    .line 84
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Ll/ark0;->p:Lcom/p1/mobile/android/app/Dialog;

    .line 93
    .line 94
    const/4 v0, 0x0

    .line 95
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Ll/ark0;->p:Lcom/p1/mobile/android/app/Dialog;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public static synthetic J3(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic K3(Ll/ark0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ark0;->q4()V

    return-void
.end method

.method public static synthetic L3(Ll/ark0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ark0;->d4()V

    return-void
.end method

.method public static synthetic M3(Ll/ark0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ark0;->n4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N3(Ll/ark0;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ark0;->u4(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic O3(Ll/ark0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ark0;->p4()V

    return-void
.end method

.method public static synthetic P3(Ll/ark0;Ll/gvn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ark0;->s4(Ll/gvn0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R3(Ll/ark0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ark0;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic S3(Ll/ark0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ark0;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic T3(Ll/ark0;Ll/gvn0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ark0;->z4(Ll/gvn0;)V

    return-void
.end method

.method public static synthetic U3(Ll/ark0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ark0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic V3(Ll/ark0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ark0;->t4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W3(Ll/ark0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ark0;->r4(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic X3(Ll/ark0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ark0;->h4()V

    return-void
.end method

.method public static synthetic Y3(Ll/ark0;Ll/gvn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ark0;->v4(Ll/gvn0;)V

    return-void
.end method

.method public static synthetic Z3(Ll/ark0;Ll/bzm0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ark0;->x4(Ll/bzm0;)V

    return-void
.end method

.method public static synthetic a4(Ll/ark0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ark0;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    return-void
.end method

.method public static synthetic b4(Ll/ark0;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ark0;->w4(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method

.method private c4(Ll/bzm0;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/ark0;->o:Ll/bzm0;

    .line 2
    .line 3
    iget v0, p0, Ll/ark0;->i:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_2

    .line 7
    .line 8
    const-string v0, "invite"

    .line 9
    .line 10
    iget-object v1, p1, Ll/bzm0;->h:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget p1, p0, Ll/ark0;->i:I

    .line 20
    .line 21
    const/4 p2, 0x6

    .line 22
    if-ne p1, p2, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Ll/jqm0;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget-object p2, Ll/zrv;->a:Ll/wrv;

    .line 35
    .line 36
    invoke-virtual {p2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p1, p2}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_1

    .line 49
    .line 50
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p0, p2, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void

    .line 58
    :cond_2
    :goto_0
    iget v0, p1, Ll/bzm0;->c:I

    .line 59
    .line 60
    iput v0, p0, Ll/ark0;->m:I

    .line 61
    .line 62
    iget-object p1, p1, Ll/bzm0;->h:Ljava/lang/String;

    .line 63
    .line 64
    iput-object p1, p0, Ll/ark0;->n:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p0, p2, p3}, Ll/ark0;->E4(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private d4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/jqm0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/jqm0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Ll/ark0;->k:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v2, p0, Ll/ark0;->n:Ljava/lang/String;

    .line 43
    .line 44
    iget v3, p0, Ll/ark0;->m:I

    .line 45
    .line 46
    const-string v4, "player"

    .line 47
    .line 48
    invoke-static {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->newInstance(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-boolean v1, p0, Ll/ark0;->l:Z

    .line 53
    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    const-string v1, "simplechat-freeCall"

    .line 57
    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inAction:Ljava/lang/String;

    .line 59
    .line 60
    :cond_1
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->applyCallInvite(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/jqk0;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/jqk0;-><init>(Ll/ark0;)V

    .line 71
    .line 72
    .line 73
    new-instance v2, Ll/kqk0;

    .line 74
    .line 75
    invoke-direct {v2, p0}, Ll/kqk0;-><init>(Ll/ark0;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    :cond_2
    :goto_0
    return-void
.end method

.method private e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ark0;->o:Ll/bzm0;

    .line 2
    .line 3
    iget v0, v0, Ll/bzm0;->d:I

    .line 4
    .line 5
    const/16 v1, 0x5208

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;->dismissInviteSpanEvent()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iput-object p1, p0, Ll/ark0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 25
    .line 26
    const-string v0, ""

    .line 27
    .line 28
    iput-object v0, p0, Ll/ark0;->k:Ljava/lang/String;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    iput v0, p0, Ll/ark0;->m:I

    .line 32
    .line 33
    iget-boolean v0, p0, Ll/ark0;->l:Z

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    iput-boolean v0, p0, Ll/ark0;->l:Z

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const-string v0, "invite"

    .line 42
    .line 43
    iget-object v1, p0, Ll/ark0;->n:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    invoke-static {p1}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/jqm0;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->of:I

    .line 76
    .line 77
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ij:I

    .line 82
    .line 83
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 84
    .line 85
    .line 86
    :cond_3
    :goto_0
    invoke-static {p0, p1}, Ll/ydn0;->q(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method private f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/jqm0;->a4()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;->onVoiceCalls:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 v0, 0x6

    .line 22
    if-ge p1, v0, :cond_0

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    iput-boolean p1, p0, Ll/ark0;->l:Z

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    iget-object v0, p0, Ll/ark0;->r:Ljava/lang/Runnable;

    .line 29
    .line 30
    const-string v1, "apply"

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {p0, v1, v2, p1, v0}, Ll/ark0;->g4(Ljava/lang/String;ILjava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private h4()V
    .locals 2

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    const-string v1, "checkAndBindPhone"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/ark0;->m4()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-direct {p0, v0}, Ll/ark0;->B4(Lcom/p1/mobile/android/app/Act;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-direct {p0}, Ll/ark0;->d4()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private i4(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-string v0, "CallConstant"

    .line 2
    .line 3
    const-string v1, "checkAndRequestPermission"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "android.permission.RECORD_AUDIO"

    .line 13
    .line 14
    filled-new-array {v1}, [Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/ark0$c;

    .line 37
    .line 38
    invoke-direct {v1, p0, p1}, Ll/ark0$c;-><init>(Ll/ark0;Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->t(Ll/k6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/ark0$b;

    .line 46
    .line 47
    invoke-direct {v1, p0, p1}, Ll/ark0$b;-><init>(Ll/ark0;Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->v(Ll/l6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/ark0$a;

    .line 55
    .line 56
    invoke-direct {v1, p0, p1}, Ll/ark0$a;-><init>(Ll/ark0;Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->p(Ll/j6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v0, Ll/oqk0;

    .line 64
    .line 65
    invoke-direct {v0, p2}, Ll/oqk0;-><init>(Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method private j4(I)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    const-string p0, "DEFAULT"

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    const/4 p0, 0x2

    .line 8
    if-ne p1, p0, :cond_1

    .line 9
    .line 10
    const-string p0, "APPLY_HAS_SEND"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    const/4 p0, 0x3

    .line 14
    if-ne p1, p0, :cond_2

    .line 15
    .line 16
    const-string p0, "CALL_CONNECTING"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    const/4 p0, 0x4

    .line 20
    if-ne p1, p0, :cond_3

    .line 21
    .line 22
    const-string p0, "APPLY_FAIL"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_3
    const/4 p0, 0x5

    .line 26
    if-ne p1, p0, :cond_4

    .line 27
    .line 28
    const-string p0, "DOWNLOADING"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_4
    const/4 p0, 0x6

    .line 32
    if-ne p1, p0, :cond_5

    .line 33
    .line 34
    const-string p0, "SUCCESS"

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_5
    const-string p0, "NULL"

    .line 38
    .line 39
    return-object p0
.end method

.method private k4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ark0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x6

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {p1}, Ll/guk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const-string p1, ""

    .line 18
    .line 19
    iput-object p1, p0, Ll/ark0;->k:Ljava/lang/String;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-static {p1}, Ll/guk0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    const/4 p1, 0x2

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    invoke-static {p1}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    const/4 p1, 0x3

    .line 38
    goto :goto_0

    .line 39
    :cond_3
    const/4 p1, 0x0

    .line 40
    :goto_0
    iget v0, p0, Ll/ark0;->i:I

    .line 41
    .line 42
    if-eq v0, p1, :cond_4

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/ark0;->A4(I)V

    .line 45
    .line 46
    .line 47
    :cond_4
    return-void
.end method

.method private l4(Ljava/lang/Throwable;)Z
    .locals 3

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 4
    .line 5
    const v1, 0xa80e

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 36
    .line 37
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    :cond_0
    return v2
.end method

.method private m4()Z
    .locals 3

    .line 1
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p0, :cond_3

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 40
    .line 41
    const-string v2, "wechat"

    .line 42
    .line 43
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 50
    .line 51
    const-string v2, "qq"

    .line 52
    .line 53
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_1

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 60
    .line 61
    const-string v1, "network-security"

    .line 62
    .line 63
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_2

    .line 68
    .line 69
    :cond_1
    return v0

    .line 70
    :cond_2
    const/4 p0, 0x0

    .line 71
    return p0

    .line 72
    :cond_3
    :goto_0
    return v0
.end method

.method private synthetic n4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/ark0;->k:Ljava/lang/String;

    .line 4
    .line 5
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Ll/ark0;->l4(Ljava/lang/Throwable;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private synthetic o4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    iput-object p1, p0, Ll/ark0;->k:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method private synthetic p4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ark0;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/itv;->M(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/zqk0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/zqk0;-><init>(Ll/ark0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic w4(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ark0;->i4(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic x4(Ll/bzm0;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Ll/ark0;->r:Ljava/lang/Runnable;

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/ark0;->c4(Ll/bzm0;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private z4(Ll/gvn0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Ll/gvn0;->k(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/gvn0;->h()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/ark0;->k:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p0, Ll/ark0;->p:Lcom/p1/mobile/android/app/Dialog;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/ark0;->p:Lcom/p1/mobile/android/app/Dialog;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ll/jqm0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-direct {p0, p1}, Ll/ark0;->C4(Ll/gvn0;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-direct {p0, p1}, Ll/ark0;->D4(Ll/gvn0;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    const/4 v0, 0x1

    .line 56
    invoke-virtual {p1, v0}, Ll/gvn0;->k(I)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p0, p1}, Ll/ydn0;->q(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 67
    .line 68
    .line 69
    :cond_3
    return-void
.end method


# virtual methods
.method public A4(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setStatus: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1}, Ll/ark0;->j4(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "[voice][call]"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iput p1, p0, Ll/ark0;->i:I

    .line 25
    .line 26
    return-void
.end method

.method public E4(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    const-string v1, "start apply"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    sget-object v1, Ll/iit;->Companion:Ll/iit$a;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/iit$a;->S()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->gj:I

    .line 17
    .line 18
    new-instance v3, Ll/wqk0;

    .line 19
    .line 20
    invoke-direct {v3, p0, p1, p2}, Ll/wqk0;-><init>(Ll/ark0;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1, v2, v3}, Ll/wgt;->q(Lcom/p1/mobile/android/app/Act;IILl/x20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final g4(Ljava/lang/String;ILjava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    new-instance v0, Ll/bzm0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bzm0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/bzm0;->d(Ljava/lang/String;)Ll/bzm0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1, p2}, Ll/bzm0;->g(I)Ll/bzm0;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-direct {p0, p1, p3, p4}, Ll/ark0;->c4(Ll/bzm0;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic q4()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->nf:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/ark0;->r:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic r4(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    new-instance v1, Ll/pqk0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/pqk0;-><init>(Ll/ark0;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, p1, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showBindPhoneDialog(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic s4(Ll/gvn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ark0;->y4(Ll/gvn0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/sqk0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/sqk0;-><init>(Ll/ark0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/jqm0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/tqk0;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/tqk0;-><init>(Ll/ark0;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ll/jqm0;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/aj1;->x0()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/uqk0;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/uqk0;-><init>(Ll/ark0;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Ll/jqm0;

    .line 93
    .line 94
    invoke-virtual {v0}, Ll/rwn0;->O2()Ll/szn0;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Ll/szn0;->d()Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const/4 v1, 0x1

    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/vqk0;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/vqk0;-><init>(Ll/ark0;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final synthetic t4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ark0;->q:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u4(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x4

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Ll/ark0;->q:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 7
    .line 8
    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic v4(Ll/gvn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ark0;->y4(Ll/gvn0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final y4(Ll/gvn0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/jqm0;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Ll/v1n0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 31
    .line 32
    iget-object v0, p0, Ll/ark0;->q:Ljava/lang/Runnable;

    .line 33
    .line 34
    new-instance v1, Ll/qqk0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/qqk0;-><init>(Ll/ark0;)V

    .line 37
    .line 38
    .line 39
    const-string v2, "invite"

    .line 40
    .line 41
    invoke-virtual {p0, v2, p1, v0, v1}, Ll/ark0;->g4(Ljava/lang/String;ILjava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
