.class public Ll/gzl0;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/zod;)V
    .locals 5

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isErrorMessage:Z

    .line 4
    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {p1}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1}, Ll/zod;->e()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 23
    .line 24
    const-string v2, "anchorId"

    .line 25
    .line 26
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "liveId"

    .line 31
    .line 32
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isLiving()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    const-string v0, "on"

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const-string v0, "off"

    .line 48
    .line 49
    :goto_0
    const-string v3, "liveStatus"

    .line 50
    .line 51
    invoke-static {v3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 56
    .line 57
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followUserId:Ljava/lang/String;

    .line 58
    .line 59
    const-string v4, "receiver_user_id"

    .line 60
    .line 61
    invoke-static {v4, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->getVoiceFollowSource()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-static {p0}, Ll/afu;->p(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string v4, "liveFollow_from"

    .line 74
    .line 75
    invoke-static {v4, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    filled-new-array {v1, v2, v0, v3, p0}, [Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string v0, "e_audio_anonymous_follow"

    .line 84
    .line 85
    invoke-static {v0, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    :cond_2
    :goto_1
    return-void
.end method
