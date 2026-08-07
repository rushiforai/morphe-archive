.class public Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
.super Ll/eas;
.source "SourceFile"


# instance fields
.field public a:Ll/x84$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;

.field public c:Z

.field public d:I

.field public e:Ll/u1f;

.field public f:Ljava/lang/Runnable;

.field public final g:Lcom/google/gson/Gson;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/eas;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->d:I

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;

    .line 10
    .line 11
    new-instance p1, Lcom/google/gson/Gson;

    .line 12
    .line 13
    invoke-direct {p1}, Lcom/google/gson/Gson;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->g:Lcom/google/gson/Gson;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->f1()V

    return-void
.end method

.method private synthetic f1()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "[live][motion]"

    .line 6
    .line 7
    const-string v1, " \u6267\u884c\u5ef6\u8fdf\u5341\u79d2\u7684end \u4efb\u52a1"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->X0()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method public T0(Ljava/lang/Class;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    return-object p0
.end method

.method public U0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->role:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->n1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;)V

    .line 11
    .line 12
    .line 13
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->h:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channel:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->f:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->confId:Ljava/lang/String;

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->g:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channelKey:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->i:Ljava/lang/String;

    .line 36
    .line 37
    iput-object p0, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userSig:Ljava/lang/String;

    .line 38
    .line 39
    iput-boolean p2, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->isHost:Z

    .line 40
    .line 41
    return-object v0
.end method

.method public V0(Ljava/lang/String;FFFF)Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 7
    .line 8
    iput p2, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 9
    .line 10
    iput p3, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 11
    .line 12
    iput p4, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->x:F

    .line 13
    .line 14
    iput p5, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->y:F

    .line 15
    .line 16
    return-object p0
.end method

.method public W0()Ll/cgu;
    .locals 2

    .line 1
    new-instance v0, Ll/cgu;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cgu;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/vwt;->O4()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Ll/cgu;->a:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->c:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Ll/cgu;->e:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->b:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Ll/cgu;->d:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->a:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p0, v0, Ll/cgu;->c:Ljava/lang/String;

    .line 29
    .line 30
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Ll/xau;->y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iput-object p0, v0, Ll/cgu;->b:Ljava/lang/String;

    .line 41
    .line 42
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "userConfig config.appid:"

    .line 45
    .line 46
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, v0, Ll/cgu;->a:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, ",config.businessType:"

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-object v1, v0, Ll/cgu;->e:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v1, ",config.provider:"

    .line 65
    .line 66
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget-object v1, v0, Ll/cgu;->d:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v1, "config.roomid:"

    .line 75
    .line 76
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget-object v1, v0, Ll/cgu;->c:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v1, "config.userid:"

    .line 85
    .line 86
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-object v1, v0, Ll/cgu;->b:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const-string v1, "LivePkConstant"

    .line 99
    .line 100
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-object v0
.end method

.method public X0()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->d:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->d:I

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 10
    .line 11
    iget-object v0, v0, Ll/u1f;->g:Ll/r610;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ll/r610;->h(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 17
    .line 18
    iget-object v0, v0, Ll/u1f;->f:Ll/n210;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/n210;->a(Ll/w6m;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->f:Ljava/lang/Runnable;

    .line 24
    .line 25
    const-string v1, "[live][motion]"

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string v0, "end \u5b8c\u6210 \u79fb\u9664\u5ef6\u8fdf10\u79d2\u7684\u4efb\u52a1"

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->f:Ljava/lang/Runnable;

    .line 35
    .line 36
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c:Z

    .line 41
    .line 42
    const-string p0, "goToEndFlag = false "

    .line 43
    .line 44
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public Y0()V
    .locals 3

    .line 1
    const-string v0, " \u5f00\u59cb\u6267\u884c endPushByType"

    .line 2
    .line 3
    const-string v1, "[live][motion]"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->d1()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->i1()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->RTMP:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 19
    .line 20
    if-ne v0, v2, :cond_0

    .line 21
    .line 22
    const-string v0, " stopPush "

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 28
    .line 29
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/p410;->n1()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e1()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->i1()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p0, " \uff0c \u590d\u7528rtc\u9891\u9053 \uff0c \u8df3\u8fc7 leave room "

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v0, "intl_rtc_up"

    .line 63
    .line 64
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const-string v0, " leaveRoom "

    .line 69
    .line 70
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 74
    .line 75
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/p410;->X0()V

    .line 78
    .line 79
    .line 80
    :goto_0
    const-string p0, "PusherMotionInstance"

    .line 81
    .line 82
    const-string v0, "PusherMotion end and pushEngine leaveRoom"

    .line 83
    .line 84
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    const-string p0, " leaveRoom or stopPush \u5931\u8d25"

    .line 89
    .line 90
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public Z0()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a1()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->d:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 v0, 0x2

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->d:I

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 11
    .line 12
    iget-object v0, v0, Ll/u1f;->g:Ll/r610;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ll/r610;->i(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;)V

    .line 15
    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c:Z

    .line 18
    .line 19
    new-instance v0, Ll/pob0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/pob0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->f:Ljava/lang/Runnable;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 27
    .line 28
    iget-object p0, p0, Ll/u1f;->a:Landroid/content/Context;

    .line 29
    .line 30
    const-wide/16 v1, 0x2710

    .line 31
    .line 32
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public b1(Ll/u1f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 2
    .line 3
    iget-object p1, p1, Ll/u1f;->f:Ll/n210;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/n210;->b(Ll/w6m;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->Z0()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public d1()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->g:Ll/r610;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/r610;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->i1()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->j1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 18
    .line 19
    iget-object v1, v1, Ll/u1f;->g:Ll/r610;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/r610;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x0

    .line 26
    const/4 v3, 0x1

    .line 27
    if-ne v1, p0, :cond_0

    .line 28
    .line 29
    move p0, v3

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move p0, v2

    .line 32
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v4, " is TYPE_START_PUSH "

    .line 35
    .line 36
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v4, "\uff0cisCurrentPusherMotionThis  "

    .line 43
    .line 44
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const-string v4, "[live][motion]"

    .line 55
    .line 56
    invoke-static {v4, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    return v2

    .line 65
    :cond_2
    :goto_1
    return v3
.end method

.method public e1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public g0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/eas;->g0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->X0()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public g1()V
    .locals 0

    .line 1
    return-void
.end method

.method public h1()V
    .locals 0

    .line 1
    return-void
.end method

.method public i1()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->RTMP:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 2
    .line 3
    return-object p0
.end method

.method public j1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->i1()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public k1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->e:Z

    .line 5
    .line 6
    return-void
.end method

.method public l1(Ll/x84$a;)V
    .locals 0
    .param p1    # Ll/x84$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 2
    .line 3
    return-void
.end method

.method public m1(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public n1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "momo"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfMM:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 12
    .line 13
    iput-object p0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "agora"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 27
    .line 28
    iput-object p0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 32
    .line 33
    const-string v0, "tencent"

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfTX:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 42
    .line 43
    iput-object p0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 47
    .line 48
    const-string p1, "volcengine"

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_3

    .line 55
    .line 56
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfVolc:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 57
    .line 58
    iput-object p0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 59
    .line 60
    :cond_3
    return-void
.end method

.method public o1()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->d:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->d:I

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0
.end method
