.class public Ll/csq;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/bf10;->E(Ll/i6t;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/csq;->c(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    new-instance v1, Ll/x34;

    .line 23
    .line 24
    invoke-direct {v1, p3}, Ll/x34;-><init>(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ll/x34;->e(Ljava/lang/String;)Ll/x34;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-virtual {p0, p3}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    const-string p0, "callUser"

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_1
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    const-string p0, "anchor"

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_2
    const-string p0, "audience"

    .line 56
    .line 57
    return-object p0
.end method

.method public static b(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    instance-of v1, v1, Ll/rwn0;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/rwn0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p2}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-static {p0, p1, p2, p3}, Ll/hfv;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    const-string p0, "anchor"

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_1
    if-eqz p0, :cond_2

    .line 44
    .line 45
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    const-string p0, "callUser"

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_2
    const-string p0, "audience"

    .line 55
    .line 56
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/String;
    .locals 1
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Ll/fn10;->b(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "multiCallAnchor"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {p0}, Ll/fn10;->j(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const-string p0, "multiCallOwner"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    invoke-static {p0}, Ll/fn10;->f(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const-string p0, "multiCallAudience"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const-string p0, "audience"

    .line 29
    .line 30
    return-object p0
.end method

.method public static d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p2}, Ll/bf10;->E(Ll/i6t;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/csq;->c(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    const-string p0, "anchor"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    new-instance p1, Ll/x34;

    .line 26
    .line 27
    invoke-direct {p1, p3}, Ll/x34;-><init>(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p2}, Ll/x34;->e(Ljava/lang/String;)Ll/x34;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    const-string p0, "callUser"

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_2
    const-string p0, "audience"

    .line 44
    .line 45
    return-object p0
.end method

.method public static e(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/rwn0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/rwn0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p2}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {p0, p1, p2, p3}, Ll/hfv;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    const-string p0, "anchor"

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    if-eqz p0, :cond_2

    .line 38
    .line 39
    const-string p0, "callUser"

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_2
    const-string p0, "audience"

    .line 43
    .line 44
    return-object p0
.end method
