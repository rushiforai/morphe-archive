.class public Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Landroid/app/Dialog;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->k2(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->n2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;ILjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->l2(ILjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->q2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->o2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->m2(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->p2(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method private h2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->c:Landroid/app/Dialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->c:Landroid/app/Dialog;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final g2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->d:Ljava/lang/String;

    .line 11
    .line 12
    const-string v2, "ffmpeg_so_type"

    .line 13
    .line 14
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    sget-object v1, Ll/iit;->Companion:Ll/iit$a;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/iit$a;->N()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget-object v1, Ll/iit;->Companion:Ll/iit$a;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/iit$a;->S()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    :goto_0
    invoke-static {}, Ll/elt;->u()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->i2()V

    .line 40
    .line 41
    .line 42
    new-instance v2, Ll/v4s;

    .line 43
    .line 44
    invoke-direct {v2, p0, v0}, Ll/v4s;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/w4s;

    .line 48
    .line 49
    invoke-direct {v0, p0, v1}, Ll/w4s;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;I)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, p0, v2, v0}, Ll/wgt;->t(ILcom/p1/mobile/android/app/Act;Ll/x20;Ll/y20;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final i2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "ffmpeg_so_type"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->S2:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->gj:I

    .line 15
    .line 16
    :goto_0
    const/4 v1, 0x1

    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->c:Landroid/app/Dialog;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->c:Landroid/app/Dialog;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->c:Landroid/app/Dialog;

    .line 32
    .line 33
    new-instance v1, Ll/x4s;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/x4s;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic k2(Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/elt;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    const-string p1, "[live][sdk_download]"

    .line 11
    .line 12
    const-string v0, "sdk download  success   start voice act "

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->h2()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic l2(ILjava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Ll/iit;->Companion:Ll/iit$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/iit$a;->M(I)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->J9:I

    .line 10
    .line 11
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v0, "sdk download error  : "

    .line 17
    .line 18
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string p2, "[live][sdk_download]"

    .line 33
    .line 34
    invoke-static {p2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->h2()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic m2(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic n2(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->g2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->h2()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic p2(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->h2()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "download_type"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->d:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Ll/q4s;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/q4s;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/r4s;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/r4s;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/s4s;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/s4s;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance v0, Ll/t4s;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/t4s;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;)V

    .line 61
    .line 62
    .line 63
    new-instance v1, Ll/u4s;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/u4s;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic q2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;->h2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
