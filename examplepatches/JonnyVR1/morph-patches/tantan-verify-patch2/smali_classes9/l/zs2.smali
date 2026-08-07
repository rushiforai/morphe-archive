.class public Ll/zs2;
.super Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
.source "SourceFile"


# instance fields
.field public h:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

.field public j:Ll/at2;

.field public k:J


# direct methods
.method public constructor <init>(Ll/at2;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zs2;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/zs2;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 17
    .line 18
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    iput-wide v0, p0, Ll/zs2;->k:J

    .line 21
    .line 22
    iput-object p1, p0, Ll/zs2;->j:Ll/at2;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic p1(Ll/zs2;Ll/td1;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zs2;->w1(Ll/td1;)V

    return-void
.end method

.method public static synthetic q1(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V
    .locals 1

    .line 1
    const/16 v0, 0x21c

    .line 2
    .line 3
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 4
    .line 5
    const/16 v0, 0x3c0

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic r1(Ll/zs2;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zs2;->x1()V

    return-void
.end method

.method public static synthetic s1(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V
    .locals 1

    .line 1
    const/16 v0, 0x1e0

    .line 2
    .line 3
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 4
    .line 5
    const/16 v0, 0x280

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 8
    .line 9
    return-void
.end method

.method private t1()Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
    .locals 3

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
    const v1, 0xbb80

    .line 15
    .line 16
    .line 17
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 18
    .line 19
    iget-object v1, p0, Ll/zs2;->j:Ll/at2;

    .line 20
    .line 21
    iget-object v1, v1, Ll/at2;->m:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->url:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    const v1, 0x124f80

    .line 33
    .line 34
    .line 35
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 36
    .line 37
    new-instance v1, Ll/xs2;

    .line 38
    .line 39
    invoke-direct {v1, v0}, Ll/xs2;-><init>(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Ll/ys2;

    .line 43
    .line 44
    invoke-direct {v2, v0}, Ll/ys2;-><init>(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/l210;->a(Ll/x20;Ll/x20;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object v1, p0, Ll/zs2;->j:Ll/at2;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->c:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 59
    .line 60
    iget-object p0, p0, Ll/zs2;->j:Ll/at2;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->b:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 69
    .line 70
    return-object v0
.end method

.method public static v1()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, "preset"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    return-object v0
.end method


# virtual methods
.method public A0(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/eas;->A0(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public B0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/eas;->B0()V

    .line 2
    .line 3
    .line 4
    const-string v0, "[voice][call]"

    .line 5
    .line 6
    const-string v1, "onTokenPrivilegeWillExpire:"

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/zs2;->j:Ll/at2;

    .line 12
    .line 13
    iget-object v0, v0, Ll/at2;->l:Ll/z20;

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object p0, p0, Ll/zs2;->j:Ll/at2;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {v0, v1, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
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
    const-string p2, "onLocalLeaveChannel uid:"

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
    const-string p1, "[voice][call]"

    .line 19
    .line 20
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "onEngineError LivePushType "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, ", error id "

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p1, ", extra "

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string p2, "[voice][call]"

    .line 35
    .line 36
    invoke-static {p2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const/16 p1, 0x3f3

    .line 40
    .line 41
    if-ne p3, p1, :cond_0

    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p1, p0, Ll/zs2;->j:Ll/at2;

    .line 45
    .line 46
    const/16 p2, 0x6d

    .line 47
    .line 48
    if-ne p3, p2, :cond_1

    .line 49
    .line 50
    iget-object p1, p1, Ll/at2;->l:Ll/z20;

    .line 51
    .line 52
    const/4 p2, 0x2

    .line 53
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    iget-object p0, p0, Ll/zs2;->j:Ll/at2;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 60
    .line 61
    invoke-interface {p1, p2, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    iget-object p0, p1, Ll/at2;->l:Ll/z20;

    .line 66
    .line 67
    const/4 p1, 0x4

    .line 68
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance p2, Ljava/lang/Object;

    .line 73
    .line 74
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
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

.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/eas;->Z()V

    .line 2
    .line 3
    .line 4
    const-string p0, "[live][voice][sing-together]"

    .line 5
    .line 6
    const-string v0, " song start, call back is  null"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b(JI)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->b(JI)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "onVideoChannelRemove uid"

    .line 7
    .line 8
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, " reason:"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "[voice][call]"

    .line 27
    .line 28
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/zs2;->j:Ll/at2;

    .line 5
    .line 6
    iget-object p1, p1, Ll/at2;->l:Ll/z20;

    .line 7
    .line 8
    const/4 p4, 0x3

    .line 9
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-interface {p1, v0, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    const-string p1, "[voice][call]"

    .line 21
    .line 22
    const-string p2, "onLocalJoinChannel"

    .line 23
    .line 24
    invoke-static {p1, p2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p4}, Ll/wft;->b(I)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/4 p3, 0x0

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    iget-wide v2, p0, Ll/zs2;->k:J

    .line 39
    .line 40
    sub-long/2addr v0, v2

    .line 41
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string p4, "voice"

    .line 46
    .line 47
    instance-of p0, p0, Ll/klm0;

    .line 48
    .line 49
    const-string v0, "enterRoomUntilLocalSuccess"

    .line 50
    .line 51
    invoke-static {p1, v0, p4, p0, p3}, Ll/j5t;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 56
    .line 57
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 58
    .line 59
    invoke-virtual {p0, p3}, Ll/p410;->c1(Z)V

    .line 60
    .line 61
    .line 62
    :goto_0
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 63
    .line 64
    const-string p1, "voice_anchor_call"

    .line 65
    .line 66
    invoke-virtual {p0, p1, p2}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public e(JZ)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->e(JZ)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "onMemberVideoMuted\uff0cuid:"

    .line 7
    .line 8
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, "\uff0cmuted\uff1a"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "[voice][call]"

    .line 27
    .line 28
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
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
    iget-object v0, p0, Ll/zs2;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ll/vs2;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/vs2;-><init>(Ll/zs2;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, v0}, Ll/jyb;->A([Ljava/lang/Object;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/zs2;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 32
    .line 33
    iget-object v0, p0, Ll/zs2;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 34
    .line 35
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 36
    .line 37
    iget-object p1, p0, Ll/zs2;->j:Ll/at2;

    .line 38
    .line 39
    iget-object p1, p1, Ll/at2;->l:Ll/z20;

    .line 40
    .line 41
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Ll/zs2;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 46
    .line 47
    invoke-interface {p1, v0, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
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
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->m1(Ll/z20;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/zs2;->j:Ll/at2;

    .line 7
    .line 8
    iput-object p1, p0, Ll/at2;->l:Ll/z20;

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p3, "onMemberLeaveChannel uid:"

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
    const-string p1, "[voice][call]"

    .line 19
    .line 20
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public o1()I
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->o1()I

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 5
    .line 6
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Ll/p410;->N(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 13
    .line 14
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/p410;->e1(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 20
    .line 21
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->W0()Ll/cgu;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/p410;->i1(Ll/cgu;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/zs2;->j:Ll/at2;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, "volcengine"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/zs2;->y1()V

    .line 43
    .line 44
    .line 45
    :cond_0
    const/4 v0, 0x3

    .line 46
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/4 v2, 0x0

    .line 51
    if-nez v1, :cond_1

    .line 52
    .line 53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 54
    .line 55
    .line 56
    move-result-wide v3

    .line 57
    iput-wide v3, p0, Ll/zs2;->k:J

    .line 58
    .line 59
    new-instance v1, Ll/ws2;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/ws2;-><init>(Ll/zs2;)V

    .line 62
    .line 63
    .line 64
    const-string v3, "voice"

    .line 65
    .line 66
    instance-of v4, p0, Ll/klm0;

    .line 67
    .line 68
    const-string v5, "enterRoom"

    .line 69
    .line 70
    invoke-static {v1, v5, v3, v4, v2}, Ll/j5t;->a(Ll/x20;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 75
    .line 76
    iget-object v1, v1, Ll/u1f;->d:Ll/p410;

    .line 77
    .line 78
    invoke-direct {p0}, Ll/zs2;->t1()Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    iget-object v4, p0, Ll/zs2;->j:Ll/at2;

    .line 83
    .line 84
    iget-boolean v4, v4, Ll/at2;->n:Z

    .line 85
    .line 86
    invoke-virtual {p0, v4}, Ll/zs2;->u1(Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-virtual {p0, v4, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->U0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    new-instance v5, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 95
    .line 96
    invoke-direct {v5}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v3, v4, v5}, Ll/p410;->U0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 100
    .line 101
    .line 102
    :goto_0
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 107
    .line 108
    if-nez v1, :cond_2

    .line 109
    .line 110
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 111
    .line 112
    const/16 v1, 0x3e8

    .line 113
    .line 114
    invoke-virtual {p0, v1, v0}, Ll/p410;->T0(II)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_2
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 119
    .line 120
    const/16 v1, 0x190

    .line 121
    .line 122
    invoke-virtual {p0, v1, v0}, Ll/p410;->T0(II)V

    .line 123
    .line 124
    .line 125
    :goto_1
    return v2
.end method

.method public u1(Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleBroadcaster:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleAudience:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 7
    .line 8
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v0, "getRole"

    .line 11
    .line 12
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "[voice][call]"

    .line 27
    .line 28
    invoke-static {v0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method public final synthetic w1(Ll/td1;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zs2;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/td1;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Ll/td1;->b()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public x0(JII)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->x0(JII)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "onReceivedFirstVideoFrame,uid:"

    .line 7
    .line 8
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, "width:"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p1, ",height:"

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "[voice][call]"

    .line 35
    .line 36
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic x1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/zs2;->t1()Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/zs2;->j:Ll/at2;

    .line 10
    .line 11
    iget-boolean v2, v2, Ll/at2;->n:Z

    .line 12
    .line 13
    invoke-virtual {p0, v2}, Ll/zs2;->u1(Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->U0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v2, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 23
    .line 24
    invoke-direct {v2}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1, p0, v2}, Ll/p410;->U0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final y1()V
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Ll/zs2;->v1()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Lorg/json/JSONObject;

    .line 11
    .line 12
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v2, "rtc.sami_app_key"

    .line 16
    .line 17
    iget-object v3, p0, Ll/zs2;->j:Ll/at2;

    .line 18
    .line 19
    iget-object v3, v3, Ll/at2;->j:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const-string v2, "rtc.sami_token"

    .line 25
    .line 26
    iget-object v3, p0, Ll/zs2;->j:Ll/at2;

    .line 27
    .line 28
    iget-object v3, v3, Ll/at2;->k:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 38
    .line 39
    .line 40
    const-string v0, "rtc.sami_resource_path"

    .line 41
    .line 42
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 46
    .line 47
    iget-object p0, p0, Ll/u1f;->e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;

    .line 48
    .line 49
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->d1(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    :catch_0
    return-void
.end method

.method public z0(JLandroid/view/SurfaceView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->z0(JLandroid/view/SurfaceView;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p3, "onVideoChannelAdded,width:uid:"

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
    const-string p1, "[voice][call]"

    .line 19
    .line 20
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public z1(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/zs2;->u1(Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/p410;->d1(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
