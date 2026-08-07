.class public Ll/i71;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/kcg0;

.field public j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/b71;


# direct methods
.method public constructor <init>(Ll/dum;Lrx/subjects/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum;",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/i71;->j:Lrx/subjects/a;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/i71;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i71;->O3(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic K3(Ll/i71;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i71;->P3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic L3(Ll/i71;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i71;->S3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;)V

    return-void
.end method

.method public static synthetic M3(Ll/i71;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i71;->X3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic N3(Ll/i71;Lcom/p1/mobile/putong/data/Meta;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i71;->R3(Lcom/p1/mobile/putong/data/Meta;)V

    return-void
.end method


# virtual methods
.method public final synthetic O3(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/i71;->T3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic P3(Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    cmp-long p1, v0, v2

    .line 8
    .line 9
    if-ltz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/i71;->T3()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/putong/data/Meta;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;->refreshAuction()Ll/v3f$c;

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

.method public final synthetic S3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->getAuctionId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/i71;->j:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->getPledgeAName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->getPledgeBName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, v0, p1}, Ll/i71;->U3(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final T3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/i71;->W3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/i71;->k:Ll/b71;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public U3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i71;->k:Ll/b71;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/b71;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/b71;-><init>(Ll/xzs;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/i71;->k:Ll/b71;

    .line 11
    .line 12
    new-instance v1, Ll/e71;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/e71;-><init>(Ll/i71;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/i71;->k:Ll/b71;

    .line 21
    .line 22
    new-instance v1, Ll/f71;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/f71;-><init>(Ll/i71;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1, p2, v1}, Ll/b71;->u0(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/i71;->V3()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public V3()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/i71;->W3()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x1

    .line 5
    .line 6
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/h71;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/h71;-><init>(Ll/i71;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/i71;->i:Ll/kcg0;

    .line 40
    .line 41
    return-void
.end method

.method public W3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i71;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final X3(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/i71;->T3()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/gson/JsonObject;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/google/gson/JsonObject;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "a"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "b"

    .line 19
    .line 20
    :goto_0
    const-string v1, "choose"

    .line 21
    .line 22
    invoke-virtual {v0, v1, p1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object v1, p0, Ll/i71;->j:Lrx/subjects/a;

    .line 36
    .line 37
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->id:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "choosePledge"

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {p1, v1, v2, v0}, Ll/w61;->P(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance v0, Ll/g71;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/g71;-><init>(Ll/i71;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    iget-object v0, v0, Ll/oo2;->z:Ll/p1w;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/p1w;->r()Ll/aj1;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Ll/aj1;->h2:Lrx/subjects/b;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/d71;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/d71;-><init>(Ll/i71;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method
