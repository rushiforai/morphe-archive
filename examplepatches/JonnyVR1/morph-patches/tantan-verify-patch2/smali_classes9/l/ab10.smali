.class public Ll/ab10;
.super Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
.source "SourceFile"


# instance fields
.field public final h:Ll/wa10;

.field public i:Ll/lr10;

.field public final j:Lcom/google/gson/Gson;

.field public k:Ll/tm10;

.field public final l:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/wa10;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tm10;

    .line 5
    .line 6
    const-string v1, "2x2"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/tm10;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/ab10;->k:Ll/tm10;

    .line 12
    .line 13
    new-instance v0, Ll/ya10;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/ya10;-><init>(Ll/ab10;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/ab10;->l:Ll/y20;

    .line 19
    .line 20
    iput-object p1, p0, Ll/ab10;->h:Ll/wa10;

    .line 21
    .line 22
    new-instance p1, Lcom/google/gson/Gson;

    .line 23
    .line 24
    invoke-direct {p1}, Lcom/google/gson/Gson;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/ab10;->j:Lcom/google/gson/Gson;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic p1(Ll/ab10;Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ab10;->v1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;)V

    return-void
.end method

.method public static synthetic q1(Ljava/util/concurrent/ConcurrentHashMap;Ll/td1;)V
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

.method public static synthetic r1(Ll/ab10;Ljava/lang/Long;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ab10;->w1(Ljava/lang/Long;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method private s1()Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
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
    iget-object v1, p0, Ll/ab10;->h:Ll/wa10;

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
    iget-object p0, p0, Ll/ab10;->h:Ll/wa10;

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

.method public static t1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

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
    new-instance v0, Ll/ab10;

    .line 12
    .line 13
    check-cast p0, Ll/wa10;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/ab10;-><init>(Ll/wa10;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private u1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->c:Ll/b210;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ab10;->l:Ll/y20;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/b210;->u1(Ll/y20;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 11
    .line 12
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 13
    .line 14
    invoke-direct {p0}, Ll/ab10;->s1()Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleBroadcaster:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->U0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    new-instance v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 26
    .line 27
    invoke-direct {v3}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1, v2, v3}, Ll/p410;->U0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 34
    .line 35
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 36
    .line 37
    const/16 v1, 0x3e8

    .line 38
    .line 39
    const/4 v2, 0x3

    .line 40
    invoke-virtual {v0, v1, v2}, Ll/p410;->T0(II)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/ab10;->h:Ll/wa10;

    .line 44
    .line 45
    iget v0, v0, Ll/wa10;->n:I

    .line 46
    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 50
    .line 51
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/p410;->j1(I)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method


# virtual methods
.method public A1(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/p410;->j1(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public B0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/eas;->B0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v1}, Ll/x84;->a(I)Ll/x84;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Ll/ab10;->h:Ll/wa10;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, p0}, Ll/x84;->n(Ljava/lang/String;)Ll/x84;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v0, p0}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 22
    .line 23
    .line 24
    :cond_0
    const-string p0, "onTokenPrivilegeWillExpire"

    .line 25
    .line 26
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p3, "onLocalLeaveChannel "

    .line 7
    .line 8
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    const/4 p2, 0x5

    .line 26
    invoke-static {p2}, Ll/x84;->a(I)Ll/x84;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-interface {p1, p2}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Ll/ab10;->i:Ll/lr10;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/lr10;->b()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x3f3

    .line 5
    .line 6
    if-ne p3, p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 10
    .line 11
    const/16 p2, 0x6d

    .line 12
    .line 13
    if-ne p3, p2, :cond_1

    .line 14
    .line 15
    const/4 p2, 0x1

    .line 16
    invoke-static {p2}, Ll/x84;->a(I)Ll/x84;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iget-object p0, p0, Ll/ab10;->h:Ll/wa10;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Ll/x84;->n(Ljava/lang/String;)Ll/x84;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p1, p0}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const/4 p0, 0x7

    .line 33
    invoke-static {p0}, Ll/x84;->a(I)Ll/x84;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p1, p0}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 38
    .line 39
    .line 40
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

.method public a()V
    .locals 1

    .line 1
    const-string v0, "stopPreview"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

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
    iget-object v0, p0, Ll/ab10;->i:Ll/lr10;

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
    iget-object v0, p0, Ll/ab10;->i:Ll/lr10;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/lr10;->j()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a1()V

    .line 15
    .line 16
    .line 17
    const-string v0, "goToEnd"

    .line 18
    .line 19
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->Y0()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ab10;->a()V

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
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p3, "onVideoChannelRemove,uid:"

    .line 7
    .line 8
    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
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
    invoke-static {p1}, Ll/ir10;->a(Ljava/lang/String;)V

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
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p4, "onMemberJoinChannel "

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
    invoke-static {p1}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/16 p1, 0xa

    .line 26
    .line 27
    invoke-static {p1}, Ll/x84;->a(I)Ll/x84;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p0, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 32
    .line 33
    .line 34
    :cond_0
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
    goto :goto_0

    .line 18
    :cond_0
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/xa10;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Ll/xa10;-><init>(Ljava/util/concurrent/ConcurrentHashMap;)V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    const/16 v0, 0x8

    .line 43
    .line 44
    invoke-static {v0}, Ll/x84;->a(I)Ll/x84;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, p1}, Ll/x84;->s(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)Ll/x84;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {p0, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
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
    invoke-static {p3}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 22
    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    const/16 p4, 0x9

    .line 26
    .line 27
    invoke-static {p4}, Ll/x84;->a(I)Ll/x84;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    invoke-interface {p3, p4}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p3, p0, Ll/ab10;->i:Ll/lr10;

    .line 35
    .line 36
    invoke-virtual {p3, p1, p2}, Ll/lr10;->k(J)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/ab10;->i:Ll/lr10;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/lr10;->b()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public o1()I
    .locals 4

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
    iget-object v1, p0, Ll/ab10;->j:Lcom/google/gson/Gson;

    .line 12
    .line 13
    iget-object v2, p0, Ll/ab10;->h:Ll/wa10;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 30
    .line 31
    iget-object v0, v0, Ll/u1f;->h:Ll/r510;

    .line 32
    .line 33
    iget-object v1, p0, Ll/ab10;->h:Ll/wa10;

    .line 34
    .line 35
    iget-object v1, v1, Ll/wa10;->l:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/r510;->b(Landroid/widget/FrameLayout;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 41
    .line 42
    iget-object v0, v0, Ll/u1f;->h:Ll/r510;

    .line 43
    .line 44
    iget-object v1, p0, Ll/ab10;->h:Ll/wa10;

    .line 45
    .line 46
    iget-object v1, v1, Ll/wa10;->m:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/r510;->c(Landroid/widget/FrameLayout;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/tm10;

    .line 52
    .line 53
    iget-object v1, p0, Ll/ab10;->h:Ll/wa10;

    .line 54
    .line 55
    iget-object v1, v1, Ll/wa10;->j:Ljava/lang/String;

    .line 56
    .line 57
    invoke-direct {v0, v1}, Ll/tm10;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Ll/ab10;->k:Ll/tm10;

    .line 61
    .line 62
    new-instance v1, Ll/lr10;

    .line 63
    .line 64
    new-instance v2, Ll/za10;

    .line 65
    .line 66
    invoke-direct {v2, p0}, Ll/za10;-><init>(Ll/ab10;)V

    .line 67
    .line 68
    .line 69
    const/4 v3, 0x0

    .line 70
    invoke-direct {v1, v3, v0, v2}, Ll/lr10;-><init>(ZLl/tm10;Ll/qcj;)V

    .line 71
    .line 72
    .line 73
    iput-object v1, p0, Ll/ab10;->i:Ll/lr10;

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 76
    .line 77
    iget-object v0, v0, Ll/u1f;->h:Ll/r510;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ll/r510;->d(Ll/o510;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 83
    .line 84
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->W0()Ll/cgu;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Ll/p410;->i1(Ll/cgu;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/ab10;->h:Ll/wa10;

    .line 94
    .line 95
    iget-boolean v0, v0, Ll/wa10;->k:Z

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 98
    .line 99
    if-eqz v0, :cond_0

    .line 100
    .line 101
    iget-object v0, v1, Ll/u1f;->d:Ll/p410;

    .line 102
    .line 103
    invoke-virtual {v0, v3}, Ll/p410;->N(Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 107
    .line 108
    iget-object v0, v0, Ll/u1f;->c:Ll/b210;

    .line 109
    .line 110
    iget-object v1, p0, Ll/ab10;->l:Ll/y20;

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ll/b210;->l1(Ll/y20;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 116
    .line 117
    iget-object v1, v0, Ll/u1f;->c:Ll/b210;

    .line 118
    .line 119
    iget-object v0, v0, Ll/u1f;->a:Landroid/content/Context;

    .line 120
    .line 121
    invoke-virtual {v1, v0}, Ll/b210;->m0(Landroid/content/Context;)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 125
    .line 126
    iget-object p0, p0, Ll/u1f;->h:Ll/r510;

    .line 127
    .line 128
    invoke-virtual {p0}, Ll/r510;->a()V

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_0
    iget-object v0, v1, Ll/u1f;->d:Ll/p410;

    .line 133
    .line 134
    const/4 v1, 0x1

    .line 135
    invoke-virtual {v0, v1}, Ll/p410;->N(Z)V

    .line 136
    .line 137
    .line 138
    invoke-direct {p0}, Ll/ab10;->u1()V

    .line 139
    .line 140
    .line 141
    :goto_0
    return v3
.end method

.method public final synthetic v1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;->ACTION_AFTER_PREVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/ab10;->u1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic w1(Ljava/lang/Long;)Ljava/lang/Integer;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x4

    .line 6
    invoke-static {v0}, Ll/x84;->a(I)Ll/x84;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p1}, Ll/x84;->p(Ljava/lang/Long;)Ll/x84;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p0, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/x84;->h()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public x1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ab10;->i:Ll/lr10;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lr10;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public y1(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/tm10;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/tm10;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/ab10;->k:Ll/tm10;

    .line 7
    .line 8
    iget-object p1, p0, Ll/ab10;->i:Ll/lr10;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/lr10;->l(Ll/tm10;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/ab10;->i:Ll/lr10;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/lr10;->b()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public z0(JLandroid/view/SurfaceView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->z0(JLandroid/view/SurfaceView;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "onVideoChannelAdded "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ab10;->i:Ll/lr10;

    .line 22
    .line 23
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {v0, p1, p3}, Ll/lr10;->g(Ljava/lang/Long;Landroid/view/SurfaceView;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/ab10;->i:Ll/lr10;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/lr10;->b()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public z1()V
    .locals 2

    .line 1
    const-string v0, "switch to video mode"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 7
    .line 8
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Ll/p410;->N(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 15
    .line 16
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {v0, v1}, Ll/p410;->e1(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 23
    .line 24
    iget-object v1, v0, Ll/u1f;->c:Ll/b210;

    .line 25
    .line 26
    iget-object v0, v0, Ll/u1f;->a:Landroid/content/Context;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ll/b210;->m0(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 32
    .line 33
    iget-object p0, p0, Ll/u1f;->h:Ll/r510;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/r510;->a()V

    .line 36
    .line 37
    .line 38
    return-void
.end method
