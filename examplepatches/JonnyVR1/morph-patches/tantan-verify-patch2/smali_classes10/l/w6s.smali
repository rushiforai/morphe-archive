.class public Ll/w6s;
.super Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendData;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth;-><init>(Ljava/lang/Object;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public g(Ll/eh3;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendData;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendData;->toJson()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Ll/yc60;->d([B)V

    .line 12
    .line 13
    .line 14
    const-string p0, "connect"

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/yc60;->f(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public j()Ll/yc60;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth$AuthException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/a;->h()Ll/yc60;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth$AuthException;

    .line 7
    .line 8
    const-string v0, "auth connect step get ack null"

    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth$AuthException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method
