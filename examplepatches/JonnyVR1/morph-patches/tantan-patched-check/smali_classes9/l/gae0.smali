.class public Ll/gae0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/o2e0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/gae0;->i:Ljava/util/Map;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/archi/liveschema/SchemeActionType;->values()[Lcom/p1/mobile/putong/live/livingroom/archi/liveschema/SchemeActionType;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/cae0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/cae0;-><init>(Ll/gae0;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/jyb;->A([Ljava/lang/Object;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic J3(Ll/gae0;Ll/bae0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gae0;->O3(Ll/bae0;)V

    return-void
.end method

.method public static synthetic K3(Ll/gae0;Lcom/p1/mobile/putong/live/livingroom/archi/liveschema/SchemeActionType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gae0;->S3(Lcom/p1/mobile/putong/live/livingroom/archi/liveschema/SchemeActionType;)V

    return-void
.end method

.method public static synthetic L3(Ll/gae0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gae0;->P3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;)V

    return-void
.end method

.method public static synthetic M3(Ll/gae0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gae0;->R3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;)V

    return-void
.end method


# virtual methods
.method public N3(Ljava/lang/String;Ll/bae0$b;)V
    .locals 4

    .line 1
    new-instance v0, Ll/zit;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/zit;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/gae0;->i:Ljava/util/Map;

    .line 7
    .line 8
    iget-object v2, v0, Ll/hyr;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Ll/o2e0;

    .line 15
    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v3, "liveRoomScheme action:"

    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v3, v0, Ll/hyr;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v3, ", str="

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v2, "[live][schema]"

    .line 41
    .line 42
    invoke-static {v2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ke:I

    .line 48
    .line 49
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v3, "liveRoomScheme:"

    .line 56
    .line 57
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v3, v0, Ll/hyr;->b:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {v2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, v0, p0, p2}, Ll/o2e0;->a(Ll/hyr;Ll/gae0;Ll/bae0$b;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic O3(Ll/bae0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bae0;->d:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Ll/bae0;->e:Ll/bae0$b;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/gae0;->N3(Ljava/lang/String;Ll/bae0$b;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic P3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;->getScheme()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/gae0;->N3(Ljava/lang/String;Ll/bae0$b;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;->getDelay()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;->getDelay()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    new-instance v2, Ll/fae0;

    .line 16
    .line 17
    invoke-direct {v2, p0, p1}, Ll/fae0;-><init>(Ll/gae0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;)V

    .line 18
    .line 19
    .line 20
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1, p1, v2}, Ll/i6t;->B3(JLjava/util/concurrent/TimeUnit;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;->getScheme()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-virtual {p0, p1, v0}, Ll/gae0;->N3(Ljava/lang/String;Ll/bae0$b;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic S3(Lcom/p1/mobile/putong/live/livingroom/archi/liveschema/SchemeActionType;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gae0;->i:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/liveschema/SchemeActionType;->getAction()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/liveschema/SchemeActionType;->getSchemaAction()Ll/o2e0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/dae0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/dae0;-><init>(Ll/gae0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/aj1;->a0()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/eae0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/eae0;-><init>(Ll/gae0;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method
