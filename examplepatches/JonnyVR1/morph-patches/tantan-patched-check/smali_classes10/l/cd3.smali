.class public Ll/cd3;
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
.field public final i:Ll/ntm0;

.field public final j:Ll/b7c0;

.field public k:Ll/sve0;

.field public l:Ll/won0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ntm0;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/ntm0;-><init>(Ll/dum;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/ntm0;

    .line 14
    .line 15
    iput-object v0, p0, Ll/cd3;->i:Ll/ntm0;

    .line 16
    .line 17
    new-instance v0, Ll/b7c0;

    .line 18
    .line 19
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;->b:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

    .line 20
    .line 21
    invoke-direct {v0, p1, v1}, Ll/b7c0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ll/b7c0;

    .line 29
    .line 30
    iput-object v0, p0, Ll/cd3;->j:Ll/b7c0;

    .line 31
    .line 32
    const/4 v0, 0x3

    .line 33
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    new-instance v0, Ll/won0;

    .line 40
    .line 41
    invoke-direct {v0, p1}, Ll/won0;-><init>(Ll/dum;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ll/won0;

    .line 49
    .line 50
    iput-object v0, p0, Ll/cd3;->l:Ll/won0;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    new-instance v0, Ll/sve0;

    .line 54
    .line 55
    invoke-direct {v0, p1}, Ll/sve0;-><init>(Ll/dum;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Ll/sve0;

    .line 63
    .line 64
    iput-object v0, p0, Ll/cd3;->k:Ll/sve0;

    .line 65
    .line 66
    :goto_0
    new-instance v0, Ll/rb3;

    .line 67
    .line 68
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

    .line 69
    .line 70
    invoke-direct {v0, p1, p2}, Ll/rb3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vb3;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "voice bottom menu:"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const-string v1, "null"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->toJson()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "[live]bottom"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/vb3;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/vb3;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

.method public static synthetic L3(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic M3(Ll/cd3;Ll/vf3$b;)Ll/g4$a;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cd3;->c4(Ll/vf3$b;)Ll/g4$a;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/cd3;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cd3;->l4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic O3(Ll/cd3;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cd3;->f4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic P3(Ll/cd3;Ll/vb3;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cd3;->e4(Ll/vb3;)V

    return-void
.end method

.method public static synthetic R3(Ll/cd3;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cd3;->i4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic S3(Ll/cd3;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cd3;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic T3(Ll/cd3;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cd3;->h4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V

    return-void
.end method

.method public static synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V3(Ll/cd3;Ll/vb3;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;[ILjava/util/List;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/cd3;->d4(Ll/vb3;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;[ILjava/util/List;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic W3(Ll/cd3;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LiveBottomMenuUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cd3;->k4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LiveBottomMenuUpdate;)V

    return-void
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p0}, Ll/guk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic Y3(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic Z3(Ll/cd3;Lcom/p1/mobile/longlink/msg/liveroom/VoiceIntlCommonMsg$VoiceLiveBottomMenuRefresh;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cd3;->j4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceIntlCommonMsg$VoiceLiveBottomMenuRefresh;)V

    return-void
.end method

.method private synthetic c4(Ll/vf3$b;)Ll/g4$a;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cd3;->j:Ll/b7c0;

    .line 2
    .line 3
    iget v1, p1, Ll/vf3;->d:I

    .line 4
    .line 5
    iget-object v2, p1, Ll/vf3;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/b7c0;->N3(ILjava/lang/String;)Ll/g4$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Ll/cd3;->l:Ll/won0;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget p1, p1, Ll/vf3;->d:I

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ll/won0;->e4(I)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Ll/cd3;->j:Ll/b7c0;

    .line 33
    .line 34
    const-string p1, "settingButton"

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/b7c0;->P3(Ljava/lang/String;)Ll/g4$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_0
    return-object v0
.end method

.method private m4()V
    .locals 5

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/rwn0;->i3()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-static {p0}, Ll/i9o0;->i(Ll/i6t;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {p0}, Ll/i9o0;->g(Ll/i6t;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 v1, 0x0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    :cond_1
    move v0, v1

    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ll/rwn0;

    .line 54
    .line 55
    invoke-virtual {v1}, Ll/rwn0;->p()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Ll/rwn0;

    .line 64
    .line 65
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    check-cast v3, Ll/rwn0;

    .line 74
    .line 75
    invoke-virtual {v3}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Ll/rwn0;

    .line 86
    .line 87
    invoke-virtual {v4}, Ll/oo2;->j0()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-static {v2, v1, v0, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->requestBottomButtons(Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v1, Ll/nc3;

    .line 96
    .line 97
    invoke-direct {v1}, Ll/nc3;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/oc3;

    .line 105
    .line 106
    invoke-direct {v1}, Ll/oc3;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v1, Ll/pc3;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/pc3;-><init>(Ll/cd3;)V

    .line 120
    .line 121
    .line 122
    new-instance v2, Ll/qc3;

    .line 123
    .line 124
    invoke-direct {v2, p0}, Ll/qc3;-><init>(Ll/cd3;)V

    .line 125
    .line 126
    .line 127
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 132
    .line 133
    .line 134
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bd3;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/bd3;-><init>(Ll/cd3;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/vf3$b;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final a4(Ll/vb3;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vb3;",
            "Ljava/util/List<",
            "Ll/qrm0<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Ll/vb3;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;->name:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 12
    .line 13
    const-string v2, ""

    .line 14
    .line 15
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 19
    .line 20
    iget-object v2, p1, Ll/vb3;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;->icon:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    const-string v1, "more"

    .line 28
    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->type:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "settingButton"

    .line 32
    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->localType:Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 38
    .line 39
    const-string v1, "tantanapp://live/room/setting"

    .line 40
    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 42
    .line 43
    iget-object p0, p0, Ll/cd3;->i:Ll/ntm0;

    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->BOTTOM:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 46
    .line 47
    iget-object p1, p1, Ll/vb3;->g:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, v0, v1, p1}, Ll/ntm0;->L3(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;Ljava/lang/String;)Ll/qrm0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public final b4(Ll/vb3;Ljava/util/List;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vb3;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;",
            ")",
            "Ljava/util/List<",
            "Ll/qrm0<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v5, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    filled-new-array {v0}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    new-instance v0, Ll/rc3;

    .line 12
    .line 13
    move-object v1, p0

    .line 14
    move-object v2, p1

    .line 15
    move-object v3, p3

    .line 16
    invoke-direct/range {v0 .. v5}, Ll/rc3;-><init>(Ll/cd3;Ll/vb3;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;[ILjava/util/List;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-object v5
.end method

.method public final synthetic d4(Ll/vb3;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;[ILjava/util/List;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/vb3;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/sc3;

    .line 4
    .line 5
    invoke-direct {v1, p5}, Ll/sc3;-><init>(Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p5

    .line 12
    check-cast p5, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 13
    .line 14
    if-nez p5, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {p5}, Ll/ve3;->a(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/cd3;->i:Ll/ntm0;

    .line 21
    .line 22
    iget-object p1, p1, Ll/vb3;->g:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p5, p2, p1}, Ll/ntm0;->L3(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;Ljava/lang/String;)Ll/qrm0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    aget p2, p3, p1

    .line 32
    .line 33
    add-int/lit8 p2, p2, 0x1

    .line 34
    .line 35
    aput p2, p3, p1

    .line 36
    .line 37
    iput p2, p0, Ll/qrm0;->k:I

    .line 38
    .line 39
    invoke-interface {p4, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic e4(Ll/vb3;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cd3;->n4(Ll/vb3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f4(Ljava/lang/Throwable;)V
    .locals 1

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
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ll/vb3;->a(Z)Ll/vb3;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cd3;->n4(Ll/vb3;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v0, "voice bottom refresh error:"

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    const-string p1, "null"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "[live]bottom"

    .line 42
    .line 43
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cd3;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cd3;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic i4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cd3;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceIntlCommonMsg$VoiceLiveBottomMenuRefresh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cd3;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LiveBottomMenuUpdate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cd3;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cd3;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n4(Ll/vb3;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cd3;->i:Ll/ntm0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ntm0;->O3()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ll/vb3;->e:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->quickZone:Ljava/util/List;

    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->BOTTOM:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0, v1}, Ll/cd3;->b4(Ll/vb3;Ljava/util/List;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-boolean v1, p1, Ll/vb3;->j:Z

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p1, Ll/vb3;->e:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->settingZone:Ljava/util/List;

    .line 23
    .line 24
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->SETTING:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 25
    .line 26
    invoke-virtual {p0, p1, v1, v2}, Ll/cd3;->b4(Ll/vb3;Ljava/util/List;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0, p1, v0}, Ll/cd3;->a4(Ll/vb3;Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v1, 0x0

    .line 35
    :goto_0
    iget-object v2, p0, Ll/cd3;->i:Ll/ntm0;

    .line 36
    .line 37
    invoke-virtual {v2}, Ll/ntm0;->K3()V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Ll/cd3;->j:Ll/b7c0;

    .line 41
    .line 42
    invoke-virtual {v2, v0}, Ll/b7c0;->S3(Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    iget-boolean v0, p1, Ll/vb3;->j:Z

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    const/4 v0, 0x3

    .line 50
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    iget-object p0, p0, Ll/cd3;->l:Ll/won0;

    .line 57
    .line 58
    invoke-virtual {p0, p1, v1}, Ll/won0;->m4(Ll/vb3;Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    iget-object p0, p0, Ll/cd3;->k:Ll/sve0;

    .line 63
    .line 64
    invoke-virtual {p0, p1, v1}, Ll/sve0;->V3(Ll/vb3;Ljava/util/List;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/cd3;->m4()V

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
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/mc3;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/mc3;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/tc3;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/tc3;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/uc3;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/uc3;-><init>(Ll/cd3;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Ll/rwn0;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v0, v0, Ll/aj1;->c0:Lrx/subjects/b;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/vc3;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/vc3;-><init>(Ll/cd3;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->refreshAllButton()Ll/v3f$c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lrx/c;

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/wc3;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/wc3;-><init>(Ll/cd3;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Ll/rwn0;

    .line 124
    .line 125
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Ll/aj1;->K0()Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v1, Ll/xc3;

    .line 138
    .line 139
    invoke-direct {v1, p0}, Ll/xc3;-><init>(Ll/cd3;)V

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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0}, Ll/aj1;->v()Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    new-instance v1, Ll/yc3;

    .line 168
    .line 169
    invoke-direct {v1, p0}, Ll/yc3;-><init>(Ll/cd3;)V

    .line 170
    .line 171
    .line 172
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    new-instance v1, Ll/zc3;

    .line 188
    .line 189
    invoke-direct {v1}, Ll/zc3;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    new-instance v1, Ll/ad3;

    .line 197
    .line 198
    invoke-direct {v1, p0}, Ll/ad3;-><init>(Ll/cd3;)V

    .line 199
    .line 200
    .line 201
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 206
    .line 207
    .line 208
    return-void
.end method
