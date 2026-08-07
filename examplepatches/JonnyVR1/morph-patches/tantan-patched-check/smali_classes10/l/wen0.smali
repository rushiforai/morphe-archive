.class public Ll/wen0;
.super Ll/ten0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ten0<",
        "Ll/jqm0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/jqm0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ten0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f4(Ll/wen0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wen0;->h4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic g4(Ll/wen0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wen0;->i4(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic h4(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ten0;->reset()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/jqm0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/jqm0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/jqm0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, v0, p0}, Ll/oo2;->M1(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic i4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ten0;->reset()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/jqm0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/jqm0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/jqm0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, v0, p0}, Ll/oo2;->M1(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public init()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ten0;->init()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/jqm0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->u()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/uen0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/uen0;-><init>(Ll/wen0;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/ven0;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/ven0;-><init>(Ll/wen0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method
