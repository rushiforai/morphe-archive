.class public Ll/rvo0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/qct<",
        "TD;>;"
    }
.end annotation


# instance fields
.field public i:Landroid/widget/FrameLayout;

.field public j:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

.field public k:Ljava/lang/String;

.field public l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/rvo0;->k:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "undercover"

    .line 9
    .line 10
    iput-object p1, p0, Ll/rvo0;->m:Ljava/lang/String;

    .line 11
    .line 12
    const-string p1, "intl_sing"

    .line 13
    .line 14
    iput-object p1, p0, Ll/rvo0;->n:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p2, p0, Ll/rvo0;->i:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "end"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic K3(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L3(Ll/rvo0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rvo0;->R3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;)V

    return-void
.end method

.method public static synthetic M3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic O3(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P3(Ll/rvo0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rvo0;->S3(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic S3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const-string v0, "undercover"

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "intl_sing"

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0, p1}, Ll/rvo0;->T3(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const/4 p1, 0x3

    .line 28
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_2

    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    invoke-virtual {p0, p1}, Ll/rvo0;->Z3(Z)V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method


# virtual methods
.method public final R3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;)V
    .locals 3

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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;->liveMode:Lcom/p1/mobile/putong/live/base/data/VoiceLiveMode;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;->liveMode:Lcom/p1/mobile/putong/live/base/data/VoiceLiveMode;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, p0, Ll/rvo0;->k:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;->liveMode:Lcom/p1/mobile/putong/live/base/data/VoiceLiveMode;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/rwn0;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ll/rwn0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;->liveMode:Lcom/p1/mobile/putong/live/base/data/VoiceLiveMode;

    .line 51
    .line 52
    const-string v1, "auction"

    .line 53
    .line 54
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->voice_auction:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ll/rvo0;->W3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;->liveMode:Lcom/p1/mobile/putong/live/base/data/VoiceLiveMode;

    .line 67
    .line 68
    const-string v0, "normal"

    .line 69
    .line 70
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->voice_call_normal:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ll/rvo0;->W3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method public T3(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "undercover"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/rwn0;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Ll/nuj0;->l(Ljava/lang/String;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/ovo0;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/ovo0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/pvo0;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/pvo0;-><init>(Ll/rvo0;)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Ll/qvo0;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/qvo0;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public U3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_EIGHT_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getType()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getType()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    :cond_0
    return-void

    .line 46
    :cond_1
    const/4 v0, 0x0

    .line 47
    iget-object v1, p0, Ll/rvo0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-virtual {p0, v2, v0, v1}, Ll/rvo0;->Y3(ZLl/sam;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Ll/rwn0;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 64
    .line 65
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->EIGHT_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_EIGHT_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getStrategy(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 83
    .line 84
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_3

    .line 91
    .line 92
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getStrategy(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 102
    .line 103
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getStrategy(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getStrategy(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 127
    .line 128
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->voice_call_normal:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 129
    .line 130
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    check-cast v1, Ll/rwn0;

    .line 135
    .line 136
    iget-object v2, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 137
    .line 138
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getDeputyCount()I

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    invoke-virtual {v1, v2}, Ll/rwn0;->K3(I)V

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 146
    .line 147
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getPlayStrategyView()Ll/sam;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    const/4 v2, 0x1

    .line 152
    invoke-virtual {p0, v2, v1, v0}, Ll/rvo0;->Y3(ZLl/sam;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public V3()V
    .locals 3

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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "auction"

    .line 12
    .line 13
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->voice_auction:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 22
    .line 23
    iput-object v1, p0, Ll/rvo0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->AUCTION_STRATEGY:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getStrategy(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getStrategy(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 41
    .line 42
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->voice_call_normal:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 43
    .line 44
    iput-object v1, p0, Ll/rvo0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 45
    .line 46
    :goto_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v0, p0, Ll/rvo0;->k:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ll/rwn0;

    .line 55
    .line 56
    iget-object v1, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getDeputyCount()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {v0, v1}, Ll/rwn0;->K3(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getPlayStrategyView()Ll/sam;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/4 v1, 0x1

    .line 72
    iget-object v2, p0, Ll/rvo0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 73
    .line 74
    invoke-virtual {p0, v1, v0, v2}, Ll/rvo0;->Y3(ZLl/sam;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public W3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Ll/rvo0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {p0, v2, v0, v1}, Ll/rvo0;->Y3(ZLl/sam;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/rvo0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->voice_auction:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->AUCTION_STRATEGY:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getStrategy(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ll/rwn0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getStrategy(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;->refreshVoiceBg()Ll/v3f$d;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v0, ""

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Ll/rwn0;

    .line 61
    .line 62
    iget-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getDeputyCount()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p1, v0}, Ll/rwn0;->K3(I)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getPlayStrategyView()Ll/sam;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const/4 v0, 0x1

    .line 78
    iget-object v1, p0, Ll/rvo0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 79
    .line 80
    invoke-virtual {p0, v0, p1, v1}, Ll/rvo0;->Y3(ZLl/sam;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public X3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->THREE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getType()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->FIVE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getType()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_EIGHT_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getType()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_0

    .line 58
    .line 59
    iget-object v0, p0, Ll/rvo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->getType()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    :cond_0
    const/4 v0, 0x0

    .line 74
    iget-object v1, p0, Ll/rvo0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 75
    .line 76
    const/4 v2, 0x0

    .line 77
    invoke-virtual {p0, v2, v0, v1}, Ll/rvo0;->Y3(ZLl/sam;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Ll/rwn0;

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/jsv;->c()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_1

    .line 95
    .line 96
    invoke-virtual {p0}, Ll/rvo0;->V3()V

    .line 97
    .line 98
    .line 99
    :cond_1
    return-void
.end method

.method public Y3(ZLl/sam;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V
    .locals 1

    .line 1
    new-instance v0, Ll/abo0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p3}, Ll/abo0;-><init>(ZLcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-object p1, p0, Ll/xzs;->e:Ll/dum;

    .line 9
    .line 10
    iget-object p1, p1, Ll/dum;->m:Ll/w3o0;

    .line 11
    .line 12
    invoke-virtual {p1, p3}, Ll/w3o0;->M3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    new-instance p1, Ll/f8o0;

    .line 19
    .line 20
    iget-object p3, p0, Ll/rvo0;->i:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-direct {p1, p3, p2}, Ll/f8o0;-><init>(Landroid/widget/FrameLayout;Ll/sam;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ll/abo0;->b(Ll/ram;)Ll/abo0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance p2, Ll/jvo0;

    .line 30
    .line 31
    invoke-direct {p2}, Ll/jvo0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ll/abo0;->a(Ll/z20;)Ll/abo0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceMotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;->motionSwitch()Ll/v3f$d;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void

    .line 51
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceMotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;->motionSwitch()Ll/v3f$d;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public Z3(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rvo0;->X3()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/rvo0;->U3()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public n()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/rvo0;->k:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iget-object v1, p0, Ll/rvo0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {p0, v2, v0, v1}, Ll/rvo0;->Y3(ZLl/sam;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/rvo0;->V3()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/aj1;->Q0()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/kvo0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/kvo0;-><init>(Ll/rvo0;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/rwn0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/rwn0;->O2()Ll/szn0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/szn0;->d()Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/lvo0;

    .line 56
    .line 57
    invoke-direct {v1}, Ll/lvo0;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/mvo0;

    .line 69
    .line 70
    invoke-direct {v1}, Ll/mvo0;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/nvo0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/nvo0;-><init>(Ll/rvo0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method
