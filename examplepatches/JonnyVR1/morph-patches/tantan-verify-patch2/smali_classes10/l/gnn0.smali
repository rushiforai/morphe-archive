.class public Ll/gnn0;
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


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "change data error "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "[voiceInfoRefresh]"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic K3(Ll/gnn0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gnn0;->P3(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic L3(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

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

.method public static synthetic M3(Ll/gnn0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gnn0;->R3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/gnn0;Ll/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gnn0;->O3(Ll/ugd0;)V

    return-void
.end method


# virtual methods
.method public final synthetic O3(Ll/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/rwn0;->S(Ll/ugd0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic P3(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gnn0;->S3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final R3()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/i6t;->k3()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v1, Ll/fnn0;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/fnn0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {v0, p0}, Lrx/c;->merge(Lrx/c;Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final S3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getLiveInfo(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/dnn0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/dnn0;-><init>(Ll/gnn0;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/enn0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/enn0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bnn0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/bnn0;-><init>(Ll/gnn0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Ll/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/cnn0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/cnn0;-><init>(Ll/gnn0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method
