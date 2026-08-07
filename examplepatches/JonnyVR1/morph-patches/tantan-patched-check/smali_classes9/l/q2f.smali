.class public Ll/q2f;
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

.method public static a(Landroid/content/Intent;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const-string v0, "LIVE_AUDIENCE_START_DATA"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    instance-of v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    check-cast p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 21
    .line 22
    invoke-static {p0, v1}, Ll/q2f;->b(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;Z)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public static b(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;Z)Z
    .locals 4

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const-string v3, "EnterRoomChecker"

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    const-string p0, "livingRoomBridge is null"

    .line 16
    .line 17
    invoke-static {v3, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return v2

    .line 21
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 32
    .line 33
    const v1, 0x186a1

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1, p0, p1}, Ll/wrv;->z(ILjava/lang/String;Z)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 42
    .line 43
    const v0, 0x186a2

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0, p1}, Ll/wrv;->A(IZ)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    :goto_0
    const-string p1, "isInterceptAudienceEnterRooms"

    .line 51
    .line 52
    invoke-static {v3, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const-string p1, "allow"

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    xor-int/2addr p0, v2

    .line 62
    return p0

    .line 63
    :cond_3
    :goto_1
    const/4 p0, 0x0

    .line 64
    return p0
.end method

.method public static c()Z
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    const v1, 0x186b2

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {v0, v1, v2}, Ll/wrv;->A(IZ)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "EnterRoomChecker"

    .line 12
    .line 13
    const-string v2, "isInterceptStartVideoLives"

    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string v1, "allow"

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    xor-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    return v0
.end method
