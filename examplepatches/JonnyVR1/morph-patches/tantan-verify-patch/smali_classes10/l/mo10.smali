.class public Ll/mo10;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/qct<",
        "TD;>;"
    }
.end annotation


# instance fields
.field public final i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/mo10;->i:Lrx/subjects/a;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic J3(Ll/mo10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mo10;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bf10;->W(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public L3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mo10;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public M3()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mo10;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 8
    .line 9
    return-object p0
.end method

.method public N3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mo10;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public O3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mo10;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final P3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bf10;->W(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/mo10;->M3()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isAway:Z

    .line 37
    .line 38
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isAway:Z

    .line 39
    .line 40
    if-ne v1, v0, :cond_1

    .line 41
    .line 42
    :goto_0
    return-void

    .line 43
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v1, "send self call state: id:"

    .line 46
    .line 47
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v1, ", state:"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/mo10;->i:Lrx/subjects/a;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public R3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mo10;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S3(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/lo10;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lo10;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/mo10;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/mo10;->M3()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    sget-object p1, Ll/cd10;->I:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/mo10;->M3()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    sget-object p1, Ll/cd10;->o:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/mo10;->M3()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0}, Ll/mo10;->M3()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    sget-object v0, Ll/cd10;->p:Ljava/lang/String;

    .line 61
    .line 62
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/mo10;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 65
    .line 66
    .line 67
    :cond_2
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->updateSelfCall()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/ko10;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/ko10;-><init>(Ll/mo10;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
