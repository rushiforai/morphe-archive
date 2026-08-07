.class public Ll/fuk0;
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
.field public final i:Ll/ztk0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/ztk0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/fuk0;->i:Ll/ztk0;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/fuk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fuk0;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic K3(Ll/fuk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fuk0;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic L3(Ll/fuk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fuk0;->R3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public M3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 3

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    const-string v1, "addProcessCall "

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, ""

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->requestSdkToken(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/fuk0;->i:Ll/ztk0;

    .line 29
    .line 30
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    new-instance v2, Ll/auk0;

    .line 34
    .line 35
    invoke-direct {v2, v1}, Ll/auk0;-><init>(Ll/ztk0;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/buk0;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1}, Ll/buk0;-><init>(Ll/fuk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v2, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public final N3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->deputyGoBack(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/euk0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/euk0;-><init>(Ll/fuk0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/fuk0;->i:Ll/ztk0;

    .line 19
    .line 20
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/cuk0;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Ll/cuk0;-><init>(Ll/ztk0;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/fuk0;->i:Ll/ztk0;

    .line 29
    .line 30
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/utk0;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/utk0;-><init>(Ll/ztk0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final O3(Ljava/lang/Throwable;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/fuk0;->i:Ll/ztk0;

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ll/ztk0;->c4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/fuk0;->O3(Ljava/lang/Throwable;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/fuk0;->O3(Ljava/lang/Throwable;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S3(Ljava/lang/String;)V
    .locals 3

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
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ll/rwn0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->reportConnect(Ljava/lang/String;Z)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Ll/fuk0;->i:Ll/ztk0;

    .line 42
    .line 43
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/cuk0;

    .line 47
    .line 48
    invoke-direct {v2, v1}, Ll/cuk0;-><init>(Ll/ztk0;)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Ll/duk0;

    .line 52
    .line 53
    invoke-direct {v1, p0, p1}, Ll/duk0;-><init>(Ll/fuk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v2, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    invoke-static {p1}, Ll/guk0;->d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_2

    .line 75
    .line 76
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ll/fuk0;->N3(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    :goto_0
    return-void
.end method

.method public final T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 19
    :goto_1
    invoke-static {p1, p0}, Ll/bbo0;->a(ZLl/i6t;)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method
