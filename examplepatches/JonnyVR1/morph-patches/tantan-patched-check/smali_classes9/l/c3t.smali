.class public Ll/c3t;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMagic;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 1
    new-instance v0, Ll/pkq;

    .line 2
    .line 3
    new-instance v1, Ll/vod;

    .line 4
    .line 5
    const-string v2, "_v3"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const-string v4, "live_magic_gesture"

    .line 9
    .line 10
    invoke-direct {v1, v4, v2, v3}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveMagic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v3, Ll/x2t;

    .line 16
    .line 17
    invoke-direct {v3}, Ll/x2t;-><init>()V

    .line 18
    .line 19
    .line 20
    const/4 v5, -0x1

    .line 21
    invoke-direct {v0, v1, v5, v2, v3}, Ll/pkq;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/JsonAdapter;Ll/pcj;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/y2t;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/y2t;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, v4, v0, v1}, Ll/mof0;-><init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/z2t;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/z2t;-><init>(Ll/c3t;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic B()Lcom/p1/mobile/putong/live/base/data/BLiveMagic;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveMagic;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->liveMagics:Lcom/p1/mobile/putong/live/base/data/BLiveMagic;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic D()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/a3t;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/a3t;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/e9t;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/b3t;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/b3t;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static synthetic E()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/live_magic_gesture"

    .line 8
    .line 9
    invoke-static {v1}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method
