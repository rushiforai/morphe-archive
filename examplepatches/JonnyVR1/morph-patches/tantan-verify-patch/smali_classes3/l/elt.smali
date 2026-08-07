.class public Ll/elt;
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

.method public static A(Lrx/subjects/a;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/a<",
            "Ll/iit;",
            ">;)",
            "Lrx/c<",
            "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/skt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/skt;-><init>(Lrx/subjects/a;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static B()Lrx/c;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/iit;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "lib_live_ffmpeg"

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    new-array v1, v4, [Ll/iit;

    .line 20
    .line 21
    sget-object v2, Ll/guf;->INSTANCE:Ll/guf;

    .line 22
    .line 23
    aput-object v2, v1, v3

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/elt;->s(Lrx/subjects/a;[Ll/iit;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    return-object v0

    .line 33
    :cond_0
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1, v2}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    new-array v1, v4, [Ll/iit;

    .line 44
    .line 45
    sget-object v2, Ll/guf;->INSTANCE:Ll/guf;

    .line 46
    .line 47
    aput-object v2, v1, v3

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/elt;->s(Lrx/subjects/a;[Ll/iit;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    new-instance v1, Ll/blt;

    .line 54
    .line 55
    invoke-direct {v1, v0}, Ll/blt;-><init>(Lrx/subjects/a;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, Ll/clt;

    .line 63
    .line 64
    invoke-direct {v2}, Ll/clt;-><init>()V

    .line 65
    .line 66
    .line 67
    new-instance v3, Ll/dlt;

    .line 68
    .line 69
    invoke-direct {v3}, Ll/dlt;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v2, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    :goto_0
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    return-object v0
.end method

.method public static C()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "lib_sud"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->u(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/wkt;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/wkt;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v2, Ll/xkt;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/xkt;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static D()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "b_live"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->u(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/lkt;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/lkt;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v2, Ll/vkt;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/vkt;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static E()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "b_live"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    return v0
.end method

.method public static F(Z)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ll/iit;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "b_live"

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x3

    .line 16
    const/4 v3, 0x2

    .line 17
    const/4 v4, 0x1

    .line 18
    const/4 v5, 0x0

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x4

    .line 22
    new-array p0, p0, [Ll/iit;

    .line 23
    .line 24
    sget-object v1, Ll/bae;->INSTANCE:Ll/bae;

    .line 25
    .line 26
    aput-object v1, p0, v5

    .line 27
    .line 28
    sget-object v1, Ll/zwm;->INSTANCE:Ll/zwm;

    .line 29
    .line 30
    aput-object v1, p0, v4

    .line 31
    .line 32
    sget-object v1, Ll/qtv;->INSTANCE:Ll/qtv;

    .line 33
    .line 34
    aput-object v1, p0, v3

    .line 35
    .line 36
    sget-object v1, Ll/rtv;->INSTANCE:Ll/rtv;

    .line 37
    .line 38
    aput-object v1, p0, v2

    .line 39
    .line 40
    invoke-static {v0, p0}, Ll/elt;->s(Lrx/subjects/a;[Ll/iit;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_0
    if-eqz p0, :cond_1

    .line 49
    .line 50
    invoke-static {v0}, Ll/elt;->z(Lrx/subjects/a;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string v1, "b_liveVoice"

    .line 59
    .line 60
    invoke-virtual {p0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_2

    .line 65
    .line 66
    new-array p0, v2, [Ll/iit;

    .line 67
    .line 68
    sget-object v1, Ll/bae;->INSTANCE:Ll/bae;

    .line 69
    .line 70
    aput-object v1, p0, v5

    .line 71
    .line 72
    sget-object v1, Ll/zwm;->INSTANCE:Ll/zwm;

    .line 73
    .line 74
    aput-object v1, p0, v4

    .line 75
    .line 76
    sget-object v1, Ll/rtv;->INSTANCE:Ll/rtv;

    .line 77
    .line 78
    aput-object v1, p0, v3

    .line 79
    .line 80
    invoke-static {v0, p0}, Ll/elt;->s(Lrx/subjects/a;[Ll/iit;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    new-instance p0, Ll/ykt;

    .line 85
    .line 86
    invoke-direct {p0, v0}, Ll/ykt;-><init>(Lrx/subjects/a;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    new-instance v1, Ll/zkt;

    .line 94
    .line 95
    invoke-direct {v1}, Ll/zkt;-><init>()V

    .line 96
    .line 97
    .line 98
    new-instance v2, Ll/alt;

    .line 99
    .line 100
    invoke-direct {v2}, Ll/alt;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    :goto_0
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0
.end method

.method public static synthetic a(Ll/gcg0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lrx/subjects/a;Ll/gcg0;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "b_liveVoice"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->u(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/okt;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/okt;-><init>(Lrx/subjects/a;Ll/gcg0;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/pkt;

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ll/pkt;-><init>(Ll/gcg0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic c(Lrx/subjects/a;Ll/gcg0;Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 3

    .line 1
    invoke-static {p2}, Ll/elt;->x(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "live_sdk"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "live  libtxffmpeg and libcosmosffmpeg  so download success"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {p2}, Ll/elt;->y(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const-string v0, "live  libtxffmpeg and libcosmosffmpeg  so isUnzip success"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    invoke-virtual {p2}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    new-array v0, v0, [Ll/iit;

    .line 34
    .line 35
    sget-object v1, Ll/guf;->INSTANCE:Ll/guf;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    aput-object v1, v0, v2

    .line 39
    .line 40
    invoke-static {p0, v0}, Ll/elt;->s(Lrx/subjects/a;[Ll/iit;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {p1, p2}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "live so download error:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "live_sdk"

    .line 23
    .line 24
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Ll/v2t;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "loadNormalAudience failed"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "live voice so download error:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "live_sdk"

    .line 23
    .line 24
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic g(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "intl_sud_sdk"

    .line 8
    .line 9
    const-string v0, "all so loaded for intl sud sdk"

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "live libtxffmpeg and libcosmosffmpeg so download error:"

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
    const-string v0, "live_sdk"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic i(Ljava/lang/Object;)V
    .locals 1

    .line 1
    const-string p0, "live_sdk"

    .line 2
    .line 3
    const-string v0, "live  libtxffmpeg and libcosmosffmpeg  so load success"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic j(Ll/gcg0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lrx/subjects/a;Ll/gcg0;Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 4

    .line 1
    invoke-static {p2}, Ll/elt;->x(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-array v0, v2, [Ll/iit;

    .line 10
    .line 11
    sget-object v2, Ll/bae;->INSTANCE:Ll/bae;

    .line 12
    .line 13
    aput-object v2, v0, v1

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/elt;->s(Lrx/subjects/a;[Ll/iit;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {p2}, Ll/elt;->y(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    new-array v0, v0, [Ll/iit;

    .line 27
    .line 28
    sget-object v3, Ll/zwm;->INSTANCE:Ll/zwm;

    .line 29
    .line 30
    aput-object v3, v0, v1

    .line 31
    .line 32
    sget-object v1, Ll/rtv;->INSTANCE:Ll/rtv;

    .line 33
    .line 34
    aput-object v1, v0, v2

    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/elt;->s(Lrx/subjects/a;[Ll/iit;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    invoke-virtual {p2}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    invoke-interface {p1, p2}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public static synthetic l(Lrx/subjects/a;Ll/gcg0;Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 0

    .line 1
    invoke-static {p0, p2}, Ll/elt;->t(Lrx/subjects/a;Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1, p2}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic m(Ljava/lang/Object;)V
    .locals 1

    .line 1
    const-string p0, "live_sdk"

    .line 2
    .line 3
    const-string v0, "live voice so load success"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic n(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/v2t;->d:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "all so loaded for normal Audience"

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic o(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 1

    .line 1
    const-string p0, "live_sdk"

    .line 2
    .line 3
    const-string v0, "live so load success"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic p(Lrx/subjects/a;Ll/gcg0;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "lib_live_ffmpeg"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->u(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/qkt;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/qkt;-><init>(Lrx/subjects/a;Ll/gcg0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    new-instance p0, Ll/rkt;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ll/rkt;-><init>(Ll/gcg0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic q(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string p0, "intl_sud_sdk"

    .line 2
    .line 3
    const-string v0, "load intl sud sdk failed"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic r(Lrx/subjects/a;Ll/gcg0;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "b_live"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->u(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/tkt;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/tkt;-><init>(Lrx/subjects/a;Ll/gcg0;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/ukt;

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ll/ukt;-><init>(Ll/gcg0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static varargs s(Lrx/subjects/a;[Ll/iit;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/a<",
            "Ll/iit;",
            ">;[",
            "Ll/iit;",
            ")V"
        }
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_0

    .line 4
    .line 5
    aget-object v2, p1, v1

    .line 6
    .line 7
    sget-object v3, Ll/iit;->Companion:Ll/iit$a;

    .line 8
    .line 9
    invoke-virtual {v3, v2}, Ll/iit$a;->K(Ll/iit;)Ll/iit;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void
.end method

.method public static t(Lrx/subjects/a;Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/a<",
            "Ll/iit;",
            ">;",
            "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/elt;->x(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-array p1, v2, [Ll/iit;

    .line 10
    .line 11
    sget-object v0, Ll/bae;->INSTANCE:Ll/bae;

    .line 12
    .line 13
    aput-object v0, p1, v1

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/elt;->s(Lrx/subjects/a;[Ll/iit;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {p1}, Ll/elt;->y(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    const/4 p1, 0x3

    .line 26
    new-array p1, p1, [Ll/iit;

    .line 27
    .line 28
    sget-object v0, Ll/zwm;->INSTANCE:Ll/zwm;

    .line 29
    .line 30
    aput-object v0, p1, v1

    .line 31
    .line 32
    sget-object v0, Ll/qtv;->INSTANCE:Ll/qtv;

    .line 33
    .line 34
    aput-object v0, p1, v2

    .line 35
    .line 36
    sget-object v0, Ll/rtv;->INSTANCE:Ll/rtv;

    .line 37
    .line 38
    const/4 v1, 0x2

    .line 39
    aput-object v0, p1, v1

    .line 40
    .line 41
    invoke-static {p0, p1}, Ll/elt;->s(Lrx/subjects/a;[Ll/iit;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public static u()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "lib_live_ffmpeg"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    return v0
.end method

.method public static v()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "lib_sud"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    return v0
.end method

.method public static w()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "lib_sud"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->u(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static x(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->b()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;->Download:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->a()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;->Success:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static y(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->b()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;->Unzip:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->a()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;->Success:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static z(Lrx/subjects/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/a<",
            "Ll/iit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/elt;->A(Lrx/subjects/a;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/mkt;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/mkt;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/nkt;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/nkt;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method
