.class public Ll/bro0;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/jqm0;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public i:Ll/woo0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/woo0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/bro0;->i:Ll/woo0;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/bro0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bro0;->T3()V

    return-void
.end method

.method public static synthetic K3(Ll/bro0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Ll/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bro0;->U3(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Ll/ugd0;)V

    return-void
.end method

.method public static synthetic L3(Ll/bro0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bro0;->Y3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic M3(Ll/bro0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bro0;->S3()V

    return-void
.end method

.method public static synthetic N3(Ll/bro0;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bro0;->R3(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic O3(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic R3(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bro0;->W3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic T3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bro0;->i:Ll/woo0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/woo0;->m(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private V3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->initRoomInfo()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private W3()V
    .locals 1

    .line 1
    const-string v0, "0"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/bro0;->X3(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private Y3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bro0;->i:Ll/woo0;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    const-string v0, "0"

    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Ll/woo0;->P0(ZLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Ll/ugd0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->changeRoomData()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, p2, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p1, 0x2

    .line 29
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ll/jqm0;

    .line 34
    .line 35
    iget-object p2, p2, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 36
    .line 37
    invoke-virtual {p0, p2, p1}, Ll/oo2;->W(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic S3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bro0;->i:Ll/woo0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Ll/woo0;->m(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/vqo0;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/vqo0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/wqo0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/wqo0;-><init>(Ll/bro0;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Ll/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bro0;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Ll/ugd0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X3(Ljava/lang/String;)V
    .locals 4

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
    invoke-virtual {v0}, Ll/rwn0;->O2()Ll/szn0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/szn0;->c()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-direct {p0}, Ll/bro0;->V3()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v1, p0, Ll/bro0;->i:Ll/woo0;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const-string v3, "0"

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Ll/woo0;->P0(ZLjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getLiveInfoForError(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v1, Ll/xqo0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/xqo0;-><init>(Ll/bro0;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v1, Ll/yqo0;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/yqo0;-><init>(Ll/bro0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v1}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v1, Ll/zqo0;

    .line 56
    .line 57
    invoke-direct {v1, p0, v0}, Ll/zqo0;-><init>(Ll/bro0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/aro0;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/aro0;-><init>(Ll/bro0;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
