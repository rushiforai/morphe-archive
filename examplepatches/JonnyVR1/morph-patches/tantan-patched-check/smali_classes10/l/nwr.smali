.class public Ll/nwr;
.super Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;
.source "SourceFile"


# instance fields
.field public b:Ll/r3w;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Ll/smc0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth$AuthException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/smc0;->m()Ll/vzv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "start live connect"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/w6s;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/nwr;->d()Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendData;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-wide/16 v2, 0x7530

    .line 17
    .line 18
    invoke-direct {v0, v1, v2, v3}, Ll/w6s;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendData;J)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/smc0;->a(Ll/qy3;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ll/w6s;->j()Ll/yc60;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ll/smc0;->m()Ll/vzv;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "start live auth"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/mwr;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/nwr;->c()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-direct {v0, p0, v2, v3}, Ll/mwr;-><init>(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;J)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ll/smc0;->a(Ll/qy3;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ll/mwr;->j()Ll/yc60;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final c()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;->newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;

    move-result-object v0

    sget-object v1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;->CLIENT_SOURCE_ANDROID:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;

    .line 2
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;->setSource(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;

    move-result-object v0

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 3
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;->setSourceVersion(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;

    move-result-object v0

    sget-object v2, Ll/uqb0;->s:Ljava/lang/String;

    .line 4
    invoke-virtual {v0, v2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;->setAppVersion(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;

    move-result-object v0

    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 5
    invoke-static {v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;->setBrand(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;

    move-result-object v0

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 6
    invoke-static {v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;->setModel(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;

    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 8
    iget-object v2, p0, Ll/nwr;->b:Ll/r3w;

    iget-boolean v2, v2, Ll/r3w;->h:Z

    int-to-byte v2, v2

    const/4 v3, 0x2

    .line 9
    new-array v3, v3, [B

    const/4 v4, 0x0

    aput-byte v2, v3, v4

    const/4 v2, 0x1

    aput-byte v2, v3, v2

    .line 10
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v2

    .line 11
    invoke-virtual {p0}, Ll/nwr;->e()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setStaySide(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v2

    .line 12
    invoke-virtual {p0}, Ll/nwr;->f()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setLocale(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v2

    .line 13
    invoke-virtual {v2, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setSource(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v1

    .line 14
    invoke-virtual {v1, v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setUa(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v0

    iget-object v1, p0, Ll/nwr;->b:Ll/r3w;

    iget-object v1, v1, Ll/r3w;->d:Ljava/lang/String;

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setSessionId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v0

    iget-object v1, p0, Ll/nwr;->b:Ll/r3w;

    iget-object v1, v1, Ll/r3w;->e:Ljava/lang/String;

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v0

    iget-object v1, p0, Ll/nwr;->b:Ll/r3w;

    iget-object v1, v1, Ll/r3w;->f:Ljava/lang/String;

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setEnterSource(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v0

    iget-object v1, p0, Ll/nwr;->b:Ll/r3w;

    iget-object v1, v1, Ll/r3w;->a:Ljava/lang/String;

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v0

    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->getXttClientInfo()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setXTTClientInfo(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v0

    .line 20
    invoke-static {v3}, Lcom/google/protobuf/ByteString;->copyFrom([B)Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setFlag(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v0

    iget-object v1, p0, Ll/nwr;->b:Ll/r3w;

    iget-object v1, v1, Ll/r3w;->c:Ljava/lang/String;

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setLiveMode(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v0

    iget-object v1, p0, Ll/nwr;->b:Ll/r3w;

    iget-object v1, v1, Ll/r3w;->g:Ljava/lang/String;

    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setRoomType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v0

    .line 23
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    move-result-object v1

    invoke-virtual {v1}, Ll/p6s;->A0()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 24
    iget-object v1, p0, Ll/nwr;->b:Ll/r3w;

    iget v1, v1, Ll/r3w;->i:I

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setLinkState(I)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v1

    iget-object v2, p0, Ll/nwr;->b:Ll/r3w;

    iget-wide v2, v2, Ll/r3w;->j:J

    .line 26
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setFirstLinkTime(J)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v1

    iget-object v2, p0, Ll/nwr;->b:Ll/r3w;

    iget-wide v2, v2, Ll/r3w;->k:J

    .line 27
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setCurrentStartLinkTime(J)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v1

    iget-object v2, p0, Ll/nwr;->b:Ll/r3w;

    iget-wide v2, v2, Ll/r3w;->l:J

    .line 28
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setInterruptLinkTime(J)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v1

    iget-object v2, p0, Ll/nwr;->b:Ll/r3w;

    iget-object v2, v2, Ll/r3w;->n:Ljava/lang/String;

    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setIpHost(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v1

    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setCurrentTime(J)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    move-result-object v1

    iget-object p0, p0, Ll/nwr;->b:Ll/r3w;

    iget p0, p0, Ll/r3w;->o:I

    .line 31
    invoke-virtual {v1, p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setRetryCount(I)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    .line 32
    :cond_0
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 33
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;

    move-result-object v1

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->u()D

    move-result-wide v2

    double-to-float v2, v2

    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;->setLat(F)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;

    move-result-object v1

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->x()D

    move-result-wide v2

    double-to-float p0, v2

    invoke-virtual {v1, p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;->setLon(F)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;

    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 37
    invoke-virtual {v0, p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setLoc(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    .line 38
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->h()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->h()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setXTestingGroup(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    .line 40
    :cond_2
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_3

    .line 41
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;->setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    .line 42
    :cond_3
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    move-result-object p0

    const-string v1, "live.client.auth"

    .line 43
    invoke-virtual {p0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;->setMsgTypeName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    move-result-object p0

    .line 44
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-static {v0}, Ll/qq60;->a(Lcom/google/protobuf/q;)Lcom/google/protobuf/Any;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;->setData(Lcom/google/protobuf/Any;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    return-object p0
.end method

.method public final d()Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendData;
    .locals 3

    .line 1
    invoke-static {}, Ll/hiw;->e()Ll/hiw;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-static {v0}, Ll/hiw;->h(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendData;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendData;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendUa;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendUa;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v2, "android"

    .line 21
    .line 22
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendUa;->source:Ljava/lang/String;

    .line 23
    .line 24
    sget-object v2, Ll/uqb0;->s:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendUa;->appVersion:Ljava/lang/String;

    .line 27
    .line 28
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 29
    .line 30
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendUa;->sourceVersion:Ljava/lang/String;

    .line 35
    .line 36
    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendUa;->brand:Ljava/lang/String;

    .line 39
    .line 40
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendUa;->model:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/hiw;->f()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendData;->pubKey:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendData;->ua:Lcom/p1/mobile/putong/live/base/data/BLiveAuthSendUa;

    .line 51
    .line 52
    return-object v0
.end method

.method public final e()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;->APP_STAY_SIDE_BACKGROUND:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;->APP_STAY_SIDE_FOREGROUND:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;

    .line 11
    .line 12
    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->language()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "zh-Hant"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p0, "zh-TW"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string v0, "zh-Hans"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string p0, "zh-CN"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string v0, "en"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const-string v1, "en-US"

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    return-object v1

    .line 38
    :cond_2
    const-string v0, "ko"

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    const-string p0, "ko-KR"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_3
    const-string v0, "ja"

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_4

    .line 56
    .line 57
    const-string p0, "ja-JP"

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_4
    const-string v0, "id"

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_5

    .line 67
    .line 68
    const-string p0, "id-ID"

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_5
    return-object v1
.end method

.method public g(Ll/r3w;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nwr;->b:Ll/r3w;

    .line 2
    .line 3
    return-void
.end method
