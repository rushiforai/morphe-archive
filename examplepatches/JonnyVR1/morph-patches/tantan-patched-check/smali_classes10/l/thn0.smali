.class public Ll/thn0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/oam;

.field public final j:Ll/pa1;

.field public k:Z

.field public l:Z


# direct methods
.method public constructor <init>(Ll/dum;Ll/oam;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/thn0;->k:Z

    .line 6
    .line 7
    iput-object p2, p0, Ll/thn0;->i:Ll/oam;

    .line 8
    .line 9
    new-instance p1, Ll/pa1;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {p2}, Ll/oo2;->H0()Ll/c0m;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-direct {p1, p2}, Ll/pa1;-><init>(Ll/c0m;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/thn0;->j:Ll/pa1;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic J3(Ll/thn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/thn0;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    return-void
.end method

.method public static synthetic K3(Ll/thn0;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/thn0;->Y3(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic L3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M3(Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/hrk0$a;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic N3(Ll/thn0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/thn0;->c4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    return-void
.end method

.method public static synthetic O3(Ll/thn0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/thn0;->X3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic P3(Ll/thn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/thn0;->V3()V

    return-void
.end method

.method public static synthetic R3(Ll/thn0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/thn0;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static Z3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->getStaticUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->getDynamicUrl()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->getSmallDynamicUrl()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->getMediumDynamicUrl()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->getTotalSec()J

    .line 30
    .line 31
    .line 32
    move-result-wide v1

    .line 33
    long-to-int v1, v1

    .line 34
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->totalSec:I

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->getRemainingSec()J

    .line 37
    .line 38
    .line 39
    move-result-wide v1

    .line 40
    long-to-int v1, v1

    .line 41
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->remainingSec:I

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->getChangeVoiceNo()J

    .line 44
    .line 45
    .line 46
    move-result-wide v1

    .line 47
    long-to-int v1, v1

    .line 48
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->changeVoiceNo:I

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->getEndMill()J

    .line 51
    .line 52
    .line 53
    move-result-wide v1

    .line 54
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->endMill:J

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->getFunnyUrl()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

    .line 61
    .line 62
    return-object v0
.end method


# virtual methods
.method public final S3(Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "changeAudioEffect:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->changeVoiceNo:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "voice_effect_gift"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-boolean v0, p0, Ll/thn0;->k:Z

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/thn0;->j:Ll/pa1;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ll/pa1;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/thn0;->j:Ll/pa1;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->getFixedRemainingSec()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    long-to-int p1, v0

    .line 45
    invoke-virtual {p0, p1}, Ll/pa1;->i(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-virtual {p0}, Ll/thn0;->a4()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 9
    .line 10
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput-boolean p1, p0, Ll/thn0;->k:Z

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 24
    iput-boolean p1, p0, Ll/thn0;->k:Z

    .line 25
    .line 26
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v0, "checkIsKtvSinger:"

    .line 29
    .line 30
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-boolean v0, p0, Ll/thn0;->k:Z

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v0, "voice_effect_gift"

    .line 43
    .line 44
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-boolean p1, p0, Ll/thn0;->k:Z

    .line 48
    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Ll/thn0;->j:Ll/pa1;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/pa1;->d()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    iget-object p1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    new-instance v0, Ll/rhn0;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/rhn0;-><init>(Ll/thn0;)V

    .line 62
    .line 63
    .line 64
    const-wide/16 v1, 0xc8

    .line 65
    .line 66
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public U3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "photoSticker:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "voice_effect_gift"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getFrameConfig()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/thn0;->Z3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ll/rwn0;

    .line 37
    .line 38
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getUserId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v1, v2}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v3, v2, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 55
    .line 56
    if-eqz v3, :cond_0

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->hasFrameConfig()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_0

    .line 63
    .line 64
    iget-object v2, v2, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 67
    .line 68
    iput-object v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 69
    .line 70
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Ll/rwn0;

    .line 75
    .line 76
    invoke-virtual {v2}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v2}, Ll/y6s;->c(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    iget-object v3, p0, Ll/thn0;->i:Ll/oam;

    .line 87
    .line 88
    if-eqz v2, :cond_1

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getUserId()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-interface {v3, v1, v0}, Ll/oam;->I0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    invoke-interface {v3, v1}, Ll/oam;->V1(Ll/nsv;)V

    .line 99
    .line 100
    .line 101
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getUserId()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 106
    .line 107
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_2

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Ll/thn0;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V

    .line 118
    .line 119
    .line 120
    :cond_2
    return-void
.end method

.method public final synthetic V3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/thn0;->b4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W3(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Float;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const v0, 0x3ca3d70a    # 0.02f

    .line 18
    .line 19
    .line 20
    cmpl-float p1, p1, v0

    .line 21
    .line 22
    if-ltz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p2, p1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    iget-object p0, p0, Ll/thn0;->i:Ll/oam;

    .line 49
    .line 50
    invoke-interface {p0, p3}, Ll/oam;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final synthetic X3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/thn0;->b4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Y3(Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/thn0;->b4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final a4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/thn0;->j:Ll/pa1;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/pa1;->e()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/thn0;->j:Ll/pa1;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pa1;->d()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final b4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/rwn0;

    .line 22
    .line 23
    iget-boolean v0, v0, Ll/rwn0;->Q:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-boolean v0, p0, Ll/thn0;->l:Z

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ll/rwn0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Ll/rqn0;->h(Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/lhn0;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/lhn0;-><init>(Ll/thn0;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    const/4 v0, 0x1

    .line 62
    iput-boolean v0, p0, Ll/thn0;->l:Z

    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Ll/rwn0;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 76
    .line 77
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v0}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    if-eqz v0, :cond_1

    .line 90
    .line 91
    iget-object v0, v0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 92
    .line 93
    if-eqz v0, :cond_1

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Ll/thn0;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_1
    invoke-virtual {p0}, Ll/thn0;->a4()V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Ll/rwn0;

    .line 112
    .line 113
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v0}, Ll/guk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_3

    .line 122
    .line 123
    invoke-virtual {p0}, Ll/thn0;->a4()V

    .line 124
    .line 125
    .line 126
    :cond_3
    return-void
.end method

.method public final c4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/thn0;->i:Ll/oam;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/hrk0;->p()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v2, Ll/shn0;

    .line 23
    .line 24
    invoke-direct {v2, p0, p1, v0}, Ll/shn0;-><init>(Ll/thn0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Ll/hrk0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/thn0;->j:Ll/pa1;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/pa1;->d()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->memberVolume()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lrx/c;->onBackpressureDrop()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/khn0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/khn0;-><init>(Ll/thn0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ll/rwn0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/aj1;->B0()Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v2, Ll/lhn0;

    .line 60
    .line 61
    invoke-direct {v2, p0}, Ll/lhn0;-><init>(Ll/thn0;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Ll/rwn0;

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Ll/aj1;->y0()Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/ppo0;

    .line 90
    .line 91
    invoke-direct {v1}, Ll/ppo0;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/mhn0;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/mhn0;-><init>(Ll/thn0;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Ll/rwn0;

    .line 115
    .line 116
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/nhn0;

    .line 125
    .line 126
    invoke-direct {v1}, Ll/nhn0;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v1, Ll/ohn0;

    .line 138
    .line 139
    invoke-direct {v1, p0}, Ll/ohn0;-><init>(Ll/thn0;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    check-cast v0, Ll/rwn0;

    .line 154
    .line 155
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    new-instance v1, Ll/phn0;

    .line 164
    .line 165
    invoke-direct {v1}, Ll/phn0;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    new-instance v1, Ll/qhn0;

    .line 173
    .line 174
    invoke-direct {v1, p0}, Ll/qhn0;-><init>(Ll/thn0;)V

    .line 175
    .line 176
    .line 177
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 182
    .line 183
    .line 184
    return-void
.end method
