.class public Ll/v14;
.super Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
.source "SourceFile"


# instance fields
.field public h:Ljava/lang/String;

.field public final i:Ll/x14;

.field public j:Ll/b24;


# direct methods
.method public constructor <init>(Ll/x14;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "[live]CallAudienceMotion"

    .line 5
    .line 6
    iput-object v0, p0, Ll/v14;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/v14;->i:Ll/x14;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic p1(Ljava/util/concurrent/ConcurrentHashMap;Ll/td1;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/td1;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Ll/td1;->b()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static r1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_CALL_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, Ll/v14;

    .line 12
    .line 13
    check-cast p0, Ll/x14;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/v14;-><init>(Ll/x14;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public B0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/eas;->B0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/v14;->i:Ll/x14;

    .line 5
    .line 6
    iget-object v0, v0, Ll/x14;->k:Ll/rcj;

    .line 7
    .line 8
    const/4 v1, 0x4

    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Ll/v14;->i:Ll/x14;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {v0, v1, p0}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const-string p0, "onTokenPrivilegeWillExpire"

    .line 21
    .line 22
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p2, "onLocalLeaveChannel "

    .line 7
    .line 8
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public I(JZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->I(JZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X0()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->Y0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    const-string v0, "stopPreview"

    .line 2
    .line 3
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 7
    .line 8
    iget-object p0, p0, Ll/u1f;->b:Ll/v6m;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/v6m;->a()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public a1()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a1()V

    .line 2
    .line 3
    .line 4
    const-string v0, "goToEnd"

    .line 5
    .line 6
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/v14;->j:Ll/b24;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/b24;->c()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/v14;->a()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b(JI)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->b(JI)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "onVideoChannelRemove "

    .line 7
    .line 8
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {p3}, Ll/g64;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p3, p0, Ll/v14;->i:Ll/x14;

    .line 22
    .line 23
    iget-object p3, p3, Ll/x14;->k:Ll/rcj;

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-interface {p3, v1, v2}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    check-cast p3, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    const/4 v1, 0x1

    .line 45
    if-ne p3, v1, :cond_0

    .line 46
    .line 47
    iget-object p3, p0, Ll/v14;->j:Ll/b24;

    .line 48
    .line 49
    invoke-virtual {p3, p1, p2}, Ll/b24;->l(J)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    if-ne p3, v0, :cond_1

    .line 54
    .line 55
    iget-object p3, p0, Ll/v14;->j:Ll/b24;

    .line 56
    .line 57
    invoke-virtual {p3, p1, p2}, Ll/b24;->l(J)V

    .line 58
    .line 59
    .line 60
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/v14;->j:Ll/b24;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/b24;->b()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p1, "onLocalJoinChannel "

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public e(JZ)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->e(JZ)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "onMemberVideoMuted "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/v14;->i:Ll/x14;

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    const/4 v2, 0x1

    .line 25
    const/4 v3, 0x0

    .line 26
    if-eqz p3, :cond_1

    .line 27
    .line 28
    iget-object p3, v0, Ll/x14;->k:Ll/rcj;

    .line 29
    .line 30
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-interface {p3, v0, v4}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    check-cast p3, Ljava/lang/Integer;

    .line 43
    .line 44
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    if-ne p3, v2, :cond_0

    .line 49
    .line 50
    iget-object p3, p0, Ll/v14;->j:Ll/b24;

    .line 51
    .line 52
    invoke-virtual {p3, p1, p2, v3}, Ll/b24;->s(JZ)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    if-ne p3, v1, :cond_3

    .line 58
    .line 59
    iget-object p3, p0, Ll/v14;->j:Ll/b24;

    .line 60
    .line 61
    invoke-virtual {p3, p1, p2, v3}, Ll/b24;->s(JZ)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    iget-object p3, v0, Ll/x14;->k:Ll/rcj;

    .line 67
    .line 68
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-interface {p3, v0, v4}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    check-cast p3, Ljava/lang/Integer;

    .line 81
    .line 82
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result p3

    .line 86
    if-ne p3, v2, :cond_2

    .line 87
    .line 88
    iget-object p3, p0, Ll/v14;->j:Ll/b24;

    .line 89
    .line 90
    invoke-virtual {p3, p1, p2, v2}, Ll/b24;->s(JZ)Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    goto :goto_0

    .line 95
    :cond_2
    if-ne p3, v1, :cond_3

    .line 96
    .line 97
    iget-object p3, p0, Ll/v14;->j:Ll/b24;

    .line 98
    .line 99
    invoke-virtual {p3, p1, p2, v2}, Ll/b24;->s(JZ)Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    :cond_3
    :goto_0
    if-eqz v3, :cond_4

    .line 104
    .line 105
    iget-object p0, p0, Ll/v14;->j:Ll/b24;

    .line 106
    .line 107
    invoke-virtual {p0}, Ll/b24;->b()V

    .line 108
    .line 109
    .line 110
    :cond_4
    return-void
.end method

.method public e0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->e0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p1, "onMemberJoinChannel "

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public i1()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->RTC:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 2
    .line 3
    return-object p0
.end method

.method public l0([Ll/td1;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/eas;->l0([Ll/td1;)V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    aget-object v0, p1, v0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/td1;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/u14;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Ll/u14;-><init>(Ljava/util/concurrent/ConcurrentHashMap;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, v1}, Ll/jyb;->A([Ljava/lang/Object;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    new-instance p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 32
    .line 33
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 37
    .line 38
    iget-object p0, p0, Ll/v14;->i:Ll/x14;

    .line 39
    .line 40
    iget-object p0, p0, Ll/x14;->k:Ll/rcj;

    .line 41
    .line 42
    const/4 v0, 0x3

    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {p0, v0, p1}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    new-instance p0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v0, "onAudioVolumeIndication"

    .line 53
    .line 54
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->toJson()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p4, "onMemberLeaveChannel "

    .line 7
    .line 8
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {p3}, Ll/g64;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p3, p0, Ll/v14;->j:Ll/b24;

    .line 22
    .line 23
    invoke-virtual {p3, p1, p2}, Ll/b24;->l(J)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/v14;->j:Ll/b24;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/b24;->b()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public o1()I
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->o1()I

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "audience motion start params:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/v14;->i:Ll/x14;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/x14;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 28
    .line 29
    iget-object v0, v0, Ll/u1f;->h:Ll/r510;

    .line 30
    .line 31
    iget-object v1, p0, Ll/v14;->i:Ll/x14;

    .line 32
    .line 33
    iget-object v1, v1, Ll/x14;->j:Landroid/widget/FrameLayout;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/r510;->c(Landroid/widget/FrameLayout;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 39
    .line 40
    iget-object v0, v0, Ll/u1f;->h:Ll/r510;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/r510;->a()V

    .line 43
    .line 44
    .line 45
    new-instance v0, Ll/b24;

    .line 46
    .line 47
    invoke-direct {v0}, Ll/b24;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Ll/v14;->j:Ll/b24;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 53
    .line 54
    iget-object v1, v1, Ll/u1f;->h:Ll/r510;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Ll/r510;->d(Ll/o510;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/v14;->j:Ll/b24;

    .line 60
    .line 61
    const/4 v1, 0x2

    .line 62
    invoke-virtual {v0, v1}, Ll/b24;->p(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 66
    .line 67
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->W0()Ll/cgu;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Ll/p410;->i1(Ll/cgu;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 77
    .line 78
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 79
    .line 80
    const/4 v1, 0x1

    .line 81
    invoke-virtual {v0, v1}, Ll/p410;->N(Z)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 85
    .line 86
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/v14;->q1()Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleBroadcaster:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 93
    .line 94
    const/4 v3, 0x0

    .line 95
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->U0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    new-instance v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 100
    .line 101
    invoke-direct {v4}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1, v2, v4}, Ll/p410;->U0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 108
    .line 109
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 110
    .line 111
    const/16 v0, 0x3e8

    .line 112
    .line 113
    const/4 v1, 0x3

    .line 114
    invoke-virtual {p0, v0, v1}, Ll/p410;->T0(II)V

    .line 115
    .line 116
    .line 117
    return v3
.end method

.method public final q1()Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    const v1, 0xfa00

    .line 7
    .line 8
    .line 9
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioBitrate:I

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 13
    .line 14
    const v1, 0xac44

    .line 15
    .line 16
    .line 17
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 18
    .line 19
    const/16 v1, 0x14

    .line 20
    .line 21
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 22
    .line 23
    const/16 v1, 0x21c

    .line 24
    .line 25
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 26
    .line 27
    const/16 v1, 0x324

    .line 28
    .line 29
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 30
    .line 31
    const v1, 0x124f80

    .line 32
    .line 33
    .line 34
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 35
    .line 36
    iget-object v1, p0, Ll/v14;->i:Ll/x14;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->c:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 45
    .line 46
    iget-object p0, p0, Ll/v14;->i:Ll/x14;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->b:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 55
    .line 56
    return-object v0
.end method

.method public s1(Lcom/p1/mobile/android/app/Act;ZLandroid/widget/FrameLayout;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enableVideo :"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 19
    .line 20
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 21
    .line 22
    xor-int/lit8 v1, p2, 0x1

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/p410;->N(Z)V

    .line 25
    .line 26
    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 30
    .line 31
    iget-object p2, p2, Ll/u1f;->c:Ll/b210;

    .line 32
    .line 33
    invoke-virtual {p2, p1}, Ll/b210;->m0(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 37
    .line 38
    iget-object p1, p1, Ll/u1f;->h:Ll/r510;

    .line 39
    .line 40
    invoke-virtual {p1, p3}, Ll/r510;->b(Landroid/widget/FrameLayout;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 44
    .line 45
    iget-object p1, p1, Ll/u1f;->h:Ll/r510;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/r510;->a()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/v14;->j:Ll/b24;

    .line 51
    .line 52
    const/4 p2, 0x3

    .line 53
    invoke-virtual {p1, p2}, Ll/b24;->p(I)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 57
    .line 58
    iget-object p0, p0, Ll/u1f;->h:Ll/r510;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/r510;->h()Landroid/view/SurfaceView;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/4 v4, 0x0

    .line 65
    const/4 v5, 0x0

    .line 66
    const/4 v1, 0x0

    .line 67
    const/4 v2, 0x0

    .line 68
    const/4 v3, 0x0

    .line 69
    invoke-static/range {v0 .. v5}, Ll/ynp0;->l(Landroid/view/View;IIIII)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    invoke-virtual {p0}, Ll/v14;->a()V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Ll/v14;->j:Ll/b24;

    .line 77
    .line 78
    const/4 p1, 0x2

    .line 79
    invoke-virtual {p0, p1}, Ll/b24;->p(I)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public t1(Lcom/p1/mobile/android/app/Act;Landroid/widget/FrameLayout;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->c:Ll/b210;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/b210;->m0(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 9
    .line 10
    iget-object p1, p1, Ll/u1f;->c:Ll/b210;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/b210;->n1()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/v14;->j:Ll/b24;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p1, v0}, Ll/b24;->p(I)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 22
    .line 23
    iget-object p1, p1, Ll/u1f;->h:Ll/r510;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Ll/r510;->b(Landroid/widget/FrameLayout;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 29
    .line 30
    iget-object p1, p1, Ll/u1f;->h:Ll/r510;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/r510;->a()V

    .line 33
    .line 34
    .line 35
    const/high16 p1, 0x41200000    # 10.0f

    .line 36
    .line 37
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 42
    .line 43
    iget-object p0, p0, Ll/u1f;->h:Ll/r510;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/r510;->h()Landroid/view/SurfaceView;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v3, 0x0

    .line 50
    const/4 v4, 0x0

    .line 51
    const/4 v1, 0x0

    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-static/range {v0 .. v5}, Ll/ynp0;->l(Landroid/view/View;IIIII)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public u1(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v14;->j:Ll/b24;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1, p2}, Ll/b24;->v(Ljava/lang/Long;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public z0(JLandroid/view/SurfaceView;)V
    .locals 9

    .line 1
    invoke-super/range {p0 .. p3}, Ll/eas;->z0(JLandroid/view/SurfaceView;)V

    .line 2
    .line 3
    .line 4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v2, "onVideoChannelAdded "

    .line 7
    .line 8
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Ll/g64;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/v14;->i:Ll/x14;

    .line 22
    .line 23
    iget-object v1, v1, Ll/x14;->k:Ll/rcj;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    invoke-interface {v1, v3, v6}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-ne v1, v2, :cond_0

    .line 45
    .line 46
    iget-object v3, p0, Ll/v14;->j:Ll/b24;

    .line 47
    .line 48
    const/4 v7, 0x1

    .line 49
    const/4 v8, 0x1

    .line 50
    move-wide v4, p1

    .line 51
    move-object v6, p3

    .line 52
    invoke-virtual/range {v3 .. v8}, Ll/b24;->i(JLandroid/view/SurfaceView;ZZ)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    iget-object v3, p0, Ll/v14;->j:Ll/b24;

    .line 57
    .line 58
    const/4 v2, 0x2

    .line 59
    if-ne v1, v2, :cond_1

    .line 60
    .line 61
    const/4 v7, 0x0

    .line 62
    const/4 v8, 0x1

    .line 63
    move-wide v4, p1

    .line 64
    move-object v6, p3

    .line 65
    invoke-virtual/range {v3 .. v8}, Ll/b24;->i(JLandroid/view/SurfaceView;ZZ)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    const/4 v7, 0x0

    .line 70
    const/4 v8, 0x0

    .line 71
    move-wide v4, p1

    .line 72
    move-object v6, p3

    .line 73
    invoke-virtual/range {v3 .. v8}, Ll/b24;->i(JLandroid/view/SurfaceView;ZZ)V

    .line 74
    .line 75
    .line 76
    :goto_0
    iget-object v0, p0, Ll/v14;->j:Ll/b24;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/b24;->b()V

    .line 79
    .line 80
    .line 81
    return-void
.end method
