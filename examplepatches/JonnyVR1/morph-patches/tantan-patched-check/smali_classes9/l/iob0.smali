.class public Ll/iob0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/a4m;

.field public j:I

.field public k:Lcom/p1/mobile/android/app/Dialog;

.field public l:I

.field public m:I

.field public n:J


# direct methods
.method public constructor <init>(Ll/dum;Ll/a4m;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/iob0;->j:I

    .line 6
    .line 7
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vwt;->d5()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/iob0;->l:I

    .line 16
    .line 17
    iput p1, p0, Ll/iob0;->m:I

    .line 18
    .line 19
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    iput-wide v0, p0, Ll/iob0;->n:J

    .line 22
    .line 23
    iput-object p2, p0, Ll/iob0;->i:Ll/a4m;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

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

.method public static synthetic K3(Ll/iob0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/iob0;->N3()V

    return-void
.end method

.method public static synthetic L3(Ll/iob0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iob0;->O3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic M3(Ll/iob0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/iob0;->P3()V

    return-void
.end method

.method private S3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->recoverLive()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    const-string p0, "live_stream_push_popup_button_type"

    .line 15
    .line 16
    const-string v0, "retry"

    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "e_live_stream_push_popup_button"

    .line 27
    .line 28
    const-string v1, "p_live_stream_push_popup"

    .line 29
    .line 30
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    sget-object p0, Ll/v2t;->b:Ljava/lang/String;

    .line 34
    .line 35
    const-string v0, "retry dialog:reconnect"

    .line 36
    .line 37
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final N3()V
    .locals 2

    .line 1
    const-string p0, "live_stream_push_popup_button_type"

    .line 2
    .line 3
    const-string v0, "end"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_live_stream_push_popup_button"

    .line 14
    .line 15
    const-string v1, "p_live_stream_push_popup"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Ll/v2t;->b:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "retry dialog:stop live"

    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic O3(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/iob0;->k:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Ll/v2t;->b:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "retry dialog dismiss"

    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/iob0;->k:Lcom/p1/mobile/android/app/Dialog;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic P3()V
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/iob0;->n:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Ll/vwt;->a5()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    cmp-long v0, v0, v2

    .line 17
    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput v0, p0, Ll/iob0;->m:I

    .line 22
    .line 23
    :cond_0
    iget v0, p0, Ll/iob0;->m:I

    .line 24
    .line 25
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/vwt;->c5()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, 0x0

    .line 34
    if-ge v0, v1, :cond_1

    .line 35
    .line 36
    invoke-static {}, Ll/pzi0;->o()J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    iput-wide v0, p0, Ll/iob0;->n:J

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->g6:I

    .line 44
    .line 45
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 46
    .line 47
    .line 48
    const-string v0, "anchor_pusher_retry_frequent"

    .line 49
    .line 50
    invoke-static {p0, v0, v2}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    iget v0, p0, Ll/iob0;->m:I

    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    add-int/2addr v0, v1

    .line 57
    iput v0, p0, Ll/iob0;->m:I

    .line 58
    .line 59
    iput v1, p0, Ll/iob0;->l:I

    .line 60
    .line 61
    invoke-direct {p0}, Ll/iob0;->S3()V

    .line 62
    .line 63
    .line 64
    const-string v0, "anchor_pusher_retry"

    .line 65
    .line 66
    invoke-static {p0, v0, v2}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public R3(I)V
    .locals 3

    .line 1
    iget v0, p0, Ll/iob0;->j:I

    .line 2
    .line 3
    iget v1, p0, Ll/iob0;->l:I

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iput v0, p0, Ll/iob0;->j:I

    .line 10
    .line 11
    sget-object v0, Ll/v2t;->b:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "retry connect. retryCount:"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v2, p0, Ll/iob0;->j:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/iob0;->i:Ll/a4m;

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;->AutoRetry:Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;

    .line 35
    .line 36
    invoke-interface {p0, v0, p1}, Ll/a4m;->q1(Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p1, p0, Ll/iob0;->k:Lcom/p1/mobile/android/app/Dialog;

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->suspendLive()Ll/v3f$d;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/iob0;->i:Ll/a4m;

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-interface {p1, v0}, Ll/a4m;->d(Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/iob0;->U3()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/eob0;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/eob0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/fob0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/fob0;-><init>(Ll/iob0;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public T3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/iob0;->j:I

    .line 3
    .line 4
    iget-object p0, p0, Ll/iob0;->k:Lcom/p1/mobile/android/app/Dialog;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final U3()V
    .locals 3

    .line 1
    sget-object v0, Ll/v2t;->b:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "retry dialog show"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 17
    .line 18
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->g6:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->q(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 39
    .line 40
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Z2:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/gob0;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/gob0;-><init>(Ll/iob0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 56
    .line 57
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->h6:I

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    new-instance v2, Ll/hob0;

    .line 64
    .line 65
    invoke-direct {v2, p0}, Ll/hob0;-><init>(Ll/iob0;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Ll/iob0;->k:Lcom/p1/mobile/android/app/Dialog;

    .line 77
    .line 78
    new-instance p0, Ll/l4g0;

    .line 79
    .line 80
    const-class v0, Ll/cpb0;

    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const-string v1, "p_live_stream_push_popup"

    .line 87
    .line 88
    invoke-direct {p0, v1, v0}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    new-instance v0, Lorg/json/JSONObject;

    .line 92
    .line 93
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 94
    .line 95
    .line 96
    :try_start_0
    const-string v1, "live_stream_push_type"

    .line 97
    .line 98
    const-string v2, "failed"

    .line 99
    .line 100
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :catch_0
    move-exception v1

    .line 105
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    :goto_0
    invoke-virtual {p0, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 115
    .line 116
    .line 117
    return-void
.end method
