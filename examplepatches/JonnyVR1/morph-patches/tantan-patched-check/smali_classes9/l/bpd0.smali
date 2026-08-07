.class public Ll/bpd0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
.source "SourceFile"


# instance fields
.field public final h:Ll/cpd0;

.field public i:Ll/epd0;

.field public j:I


# direct methods
.method public constructor <init>(Ll/cpd0;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/bpd0;->j:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/bpd0;->h:Ll/cpd0;

    .line 8
    .line 9
    return-void
.end method

.method private q1()Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/bpd0;->h:Ll/cpd0;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->c:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 15
    .line 16
    iget-object p0, p0, Ll/bpd0;->h:Ll/cpd0;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 25
    .line 26
    return-object v0
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
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_AUDIENCE_RTC:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

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
    new-instance v0, Ll/bpd0;

    .line 12
    .line 13
    check-cast p0, Ll/cpd0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/bpd0;-><init>(Ll/cpd0;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private s1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/bpd0;->q1()Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleAudience:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->U0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    new-instance v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 17
    .line 18
    invoke-direct {v3}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1, v2, v3}, Ll/p410;->U0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 25
    .line 26
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 27
    .line 28
    const/16 v0, 0x3e8

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-virtual {p0, v0, v1}, Ll/p410;->T0(II)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public A0(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/eas;->A0(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->mid:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->mid:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Ll/bpd0;->h:Ll/cpd0;

    .line 15
    .line 16
    iget-object v1, v1, Ll/cpd0;->l:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget v0, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 25
    .line 26
    iget v1, p0, Ll/bpd0;->j:I

    .line 27
    .line 28
    if-eq v0, v1, :cond_0

    .line 29
    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "onRecvUserInfo seiInfo="

    .line 33
    .line 34
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v1}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iput v0, p0, Ll/bpd0;->j:I

    .line 52
    .line 53
    iget-object v1, p0, Ll/bpd0;->i:Ll/epd0;

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Ll/epd0;->h(I)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 59
    .line 60
    if-eqz p0, :cond_1

    .line 61
    .line 62
    const/16 v0, 0xe

    .line 63
    .line 64
    invoke-static {v0}, Ll/x84;->a(I)Ll/x84;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, p1}, Ll/x84;->l(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)Ll/x84;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p0, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public B0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/eas;->B0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {v0}, Ll/x84;->a(I)Ll/x84;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, v0}, Ll/x84;->o(Z)Ll/x84;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p0, v0}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 18
    .line 19
    .line 20
    :cond_0
    const-string p0, "onTokenPrivilegeWillExpire"

    .line 21
    .line 22
    invoke-static {p0}, Ll/iod0;->a(Ljava/lang/String;)V

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
    return-void
.end method

.method public S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/16 v0, 0x10

    .line 9
    .line 10
    invoke-static {v0}, Ll/x84;->a(I)Ll/x84;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p2}, Ll/x84;->t(I)Ll/x84;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p3}, Ll/x84;->k(I)Ll/x84;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {p0, v0}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 23
    .line 24
    .line 25
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v0, "onEngineError : rtcType:"

    .line 28
    .line 29
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p1, ",what:"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p1, ",extra:"

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public X0()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->X0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bpd0;->i:Ll/epd0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/bpd0;->i:Ll/epd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/epd0;->c()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a1()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->Y0()V

    .line 18
    .line 19
    .line 20
    const/4 v0, -0x1

    .line 21
    iput v0, p0, Ll/bpd0;->j:I

    .line 22
    .line 23
    const-string p0, "goToEnd"

    .line 24
    .line 25
    invoke-static {p0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public b(JI)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->b(JI)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Ll/bpd0;->i:Ll/epd0;

    .line 5
    .line 6
    invoke-virtual {p3, p1, p2}, Ll/epd0;->m(J)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/bpd0;->i:Ll/epd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/epd0;->b()V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string p3, "onVideoChannelRemove,uid:"

    .line 17
    .line 18
    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p4, "onLocalJoinChannel "

    .line 7
    .line 8
    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x6

    .line 26
    invoke-static {p1}, Ll/x84;->a(I)Ll/x84;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p0, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public e0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->e0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
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

.method public o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o1()I
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->o1()I

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 5
    .line 6
    iget-object v0, v0, Ll/u1f;->h:Ll/r510;

    .line 7
    .line 8
    iget-object v1, p0, Ll/bpd0;->h:Ll/cpd0;

    .line 9
    .line 10
    iget-object v1, v1, Ll/cpd0;->j:Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/r510;->b(Landroid/widget/FrameLayout;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 16
    .line 17
    iget-object v0, v0, Ll/u1f;->h:Ll/r510;

    .line 18
    .line 19
    iget-object v1, p0, Ll/bpd0;->h:Ll/cpd0;

    .line 20
    .line 21
    iget-object v1, v1, Ll/cpd0;->k:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/r510;->c(Landroid/widget/FrameLayout;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/epd0;

    .line 27
    .line 28
    iget-object v1, p0, Ll/bpd0;->h:Ll/cpd0;

    .line 29
    .line 30
    iget-object v1, v1, Ll/cpd0;->l:Ljava/lang/String;

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ll/epd0;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/bpd0;->i:Ll/epd0;

    .line 36
    .line 37
    iget-object v0, p0, Ll/bpd0;->h:Ll/cpd0;

    .line 38
    .line 39
    iget-object v0, v0, Ll/cpd0;->m:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->ongoingId:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_0

    .line 51
    .line 52
    iput v1, p0, Ll/bpd0;->j:I

    .line 53
    .line 54
    iget-object v0, p0, Ll/bpd0;->i:Ll/epd0;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/epd0;->h(I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 60
    .line 61
    iget-object v0, v0, Ll/u1f;->h:Ll/r510;

    .line 62
    .line 63
    iget-object v2, p0, Ll/bpd0;->i:Ll/epd0;

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ll/r510;->d(Ll/o510;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 69
    .line 70
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->W0()Ll/cgu;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v0, v2}, Ll/p410;->i1(Ll/cgu;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 80
    .line 81
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ll/p410;->N(Z)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 87
    .line 88
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ll/p410;->e1(Z)V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0}, Ll/bpd0;->s1()V

    .line 94
    .line 95
    .line 96
    const/4 p0, 0x0

    .line 97
    return p0
.end method

.method public onRequestChannelKey()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/eas;->onRequestChannelKey()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {v0}, Ll/x84;->a(I)Ll/x84;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Ll/x84;->o(Z)Ll/x84;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {p0, v0}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 19
    .line 20
    .line 21
    :cond_0
    const-string p0, "onRequestChannelKey"

    .line 22
    .line 23
    invoke-static {p0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public p1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bpd0;->i:Ll/epd0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/epd0;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Ll/bpd0;->j:I

    .line 10
    .line 11
    return-void
.end method

.method public x0(JII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->x0(JII)V

    .line 2
    .line 3
    .line 4
    const-string p1, "onReceivedFirstVideoFrame "

    .line 5
    .line 6
    invoke-static {p1}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/16 p1, 0xd

    .line 14
    .line 15
    invoke-static {p1}, Ll/x84;->a(I)Ll/x84;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public z0(JLandroid/view/SurfaceView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->z0(JLandroid/view/SurfaceView;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/bpd0;->i:Ll/epd0;

    .line 5
    .line 6
    invoke-virtual {v0, p1, p2, p3}, Ll/epd0;->g(JLandroid/view/SurfaceView;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/bpd0;->i:Ll/epd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/epd0;->b()V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string p3, "onVideoChannelAdded,uid:"

    .line 17
    .line 18
    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
