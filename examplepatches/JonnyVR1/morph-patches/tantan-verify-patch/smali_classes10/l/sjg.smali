.class public Ll/sjg;
.super Ll/qrm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/sjg$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qrm0<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;",
        ">;"
    }
.end annotation


# instance fields
.field public r:Ll/kcg0;

.field public s:Ll/kcg0;

.field public t:Ll/kcg0;

.field public u:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/qrm0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private A4(D)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ll/xpj;

    .line 2
    .line 3
    const/16 v1, 0x320

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/xpj;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ll/xpj;->e(D)Ll/xpj;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method private synthetic D4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sjg;->z4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o4(Ll/sjg;Ll/xxj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sjg;->C4(Ll/xxj;)V

    return-void
.end method

.method public static synthetic p4(Ll/sjg;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sjg;->D4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic q4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r4(Ll/coj;Ll/l6o0;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Ll/l6o0;->c:Z

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/coj;->a:Z

    .line 4
    .line 5
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 6
    .line 7
    iput-object p1, p0, Ll/coj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic s4(Ll/sjg;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sjg;->E4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic t4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u4(Ll/sjg;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sjg;->B4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method


# virtual methods
.method public final synthetic B4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public C1(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->BOTTOM:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final synthetic C4(Ll/xxj;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/xxj;->d()Ll/zxj;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/zxj;->f()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/cpj;->t(Ljava/util/List;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/sjg;->u:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/sjg;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic E4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

    .line 6
    .line 7
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->k0(I)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/q4f;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "e_quickgift"

    .line 18
    .line 19
    iput-object v1, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 26
    .line 27
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->BIZ_PAY:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 28
    .line 29
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ll/rwn0;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-static {p1, p2, v0, v1, p0}, Ll/qzj;->q(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ljava/lang/String;ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public F4(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->F3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/sjg;->u:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    invoke-virtual {p0}, Ll/sjg;->G4()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, p1, v0}, Ll/sjg;->L4(Landroid/view/View;Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public G4()Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/coj;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/rwn0;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/hrk0;->s()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :cond_0
    const/4 v2, 0x0

    .line 28
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-ge v2, v3, :cond_2

    .line 33
    .line 34
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 39
    .line 40
    new-instance v4, Ll/h64;

    .line 41
    .line 42
    iget-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v6, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v7, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct {v4, v5, v6, v7}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 52
    .line 53
    const-string v6, ""

    .line 54
    .line 55
    iget v7, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 56
    .line 57
    invoke-static {v5, v6, v7}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-static {v4, v5}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    check-cast v6, Ll/rwn0;

    .line 70
    .line 71
    invoke-virtual {v6}, Ll/rwn0;->P2()Ll/hrk0;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    iget-object v7, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v6, v7}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    invoke-static {v6}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 82
    .line 83
    .line 84
    move-result-object v6

    .line 85
    new-instance v7, Ll/qjg;

    .line 86
    .line 87
    invoke-direct {v7, v4}, Ll/qjg;-><init>(Ll/coj;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v6, v7}, Ll/l6o0;->a(Ll/y20;)V

    .line 91
    .line 92
    .line 93
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    check-cast v6, Ll/rwn0;

    .line 100
    .line 101
    invoke-virtual {v6}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {v3, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eqz v3, :cond_1

    .line 112
    .line 113
    const-string v3, "voiceLiveMain"

    .line 114
    .line 115
    iput-object v3, v4, Ll/coj;->g:Ljava/lang/String;

    .line 116
    .line 117
    const-string v3, "gift-audience-none-voiceLiveMain"

    .line 118
    .line 119
    iput-object v3, v5, Ll/p54;->b:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_1
    const-string v3, "voiceLiveVice"

    .line 123
    .line 124
    iput-object v3, v4, Ll/coj;->g:Ljava/lang/String;

    .line 125
    .line 126
    const-string v3, "gift-audience-none-voiceLiveVice"

    .line 127
    .line 128
    iput-object v3, v5, Ll/p54;->b:Ljava/lang/String;

    .line 129
    .line 130
    :goto_1
    iput-object v5, v4, Ll/coj;->f:Ll/p54;

    .line 131
    .line 132
    const/4 v3, 0x1

    .line 133
    iput-boolean v3, v4, Ll/coj;->c:Z

    .line 134
    .line 135
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    add-int/lit8 v2, v2, 0x1

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_2
    :goto_2
    return-object v0
.end method

.method public final H4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "voiceLiveQuickGift"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->m0()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public I4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/sjg;->J4(Ll/coj;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public J4(Ll/coj;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/sjg;->u:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    long-to-double v1, v1

    .line 11
    invoke-direct {p0, v1, v2}, Ll/sjg;->A4(D)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Ll/rwn0;

    .line 24
    .line 25
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    invoke-static {v0, v1, v2, v4, v3}, Ll/qzj;->i(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/sjg;->u:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 36
    .line 37
    invoke-virtual {p0, v0, p1}, Ll/sjg;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/coj;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final K4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/coj;)V
    .locals 11
    .param p2    # Ll/coj;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/hne0$a;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/hne0$a;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v5, Ll/jjg;

    .line 17
    .line 18
    invoke-direct {v5, p0, p1}, Ll/jjg;-><init>(Ll/sjg;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 19
    .line 20
    .line 21
    new-instance v6, Ll/kjg;

    .line 22
    .line 23
    invoke-direct {v6}, Ll/kjg;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v7, Ll/ljg;

    .line 27
    .line 28
    invoke-direct {v7}, Ll/ljg;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string p0, "quickgift"

    .line 32
    .line 33
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v2, ""

    .line 38
    .line 39
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    const-string v3, "extra_type_lian_mai"

    .line 44
    .line 45
    const/4 v8, 0x1

    .line 46
    const/4 v9, 0x1

    .line 47
    move-object v4, p1

    .line 48
    move-object v2, p2

    .line 49
    invoke-virtual/range {v1 .. v10}, Ll/hne0$a;->x(Ll/coj;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final L4(Landroid/view/View;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/yec0;->X0:I

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/high16 v1, 0x42200000    # 40.0f

    .line 24
    .line 25
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    mul-int/2addr v1, v2

    .line 34
    const/high16 v2, 0x43340000    # 180.0f

    .line 35
    .line 36
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/high16 v2, 0x42180000    # 38.0f

    .line 45
    .line 46
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    add-int/2addr v1, v2

    .line 51
    new-instance v2, Landroid/widget/PopupWindow;

    .line 52
    .line 53
    const/high16 v3, 0x42fc0000    # 126.0f

    .line 54
    .line 55
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    const/4 v4, 0x1

    .line 60
    invoke-direct {v2, v0, v3, v1, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 61
    .line 62
    .line 63
    sget v3, Ll/jgc0;->e:I

    .line 64
    .line 65
    invoke-virtual {v2, v3}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 66
    .line 67
    .line 68
    sget v3, Ll/mdc0;->X4:I

    .line 69
    .line 70
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 75
    .line 76
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-direct {v3, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v4}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 92
    .line 93
    .line 94
    new-instance v3, Ll/sjg$a;

    .line 95
    .line 96
    invoke-direct {v3, v2, p0}, Ll/sjg$a;-><init>(Landroid/widget/PopupWindow;Ll/sjg;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3, p2}, Ll/sjg$a;->I(Ljava/util/List;)V

    .line 103
    .line 104
    .line 105
    const/high16 p0, 0x427c0000    # 63.0f

    .line 106
    .line 107
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    neg-int p0, p0

    .line 112
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    neg-int p2, p2

    .line 117
    sub-int/2addr p2, v1

    .line 118
    const/high16 v0, 0x41000000    # 8.0f

    .line 119
    .line 120
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    sub-int/2addr p2, v0

    .line 125
    invoke-virtual {v2, p1, p0, p2}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->z1()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/mjg;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/mjg;-><init>(Ll/sjg;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Ll/sjg;->r:Ll/kcg0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/rwn0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/oo2;->P0()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/njg;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/njg;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/ojg;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/ojg;-><init>(Ll/sjg;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Ll/sjg;->s:Ll/kcg0;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->hideFastGiftPrice()Ll/v3f$c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lrx/c;

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/pjg;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/pjg;-><init>(Ll/sjg;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Ll/sjg;->t:Ll/kcg0;

    .line 105
    .line 106
    return-void
.end method

.method public bridge synthetic T3(IZ)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sjg;->v4(IZ)Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Y3()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public b4()I
    .locals 0

    .line 1
    sget p0, Ll/obc0;->a3:I

    .line 2
    .line 3
    return p0
.end method

.method public c4()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public d4()Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/sjg;->y4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->f:Lv/VDraweeView;

    .line 16
    .line 17
    return-object p0
.end method

.method public m4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sjg;->I4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "voiceLiveQuickGift"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/sjg;->r:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/sjg;->s:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/sjg;->t:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public n4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->f:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/sjg;->F4(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "voiceLiveQuickGift"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-super {p0, p1, p2, p3}, Ll/qrm0;->n4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public v4(IZ)Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;
    .locals 3

    .line 1
    iget-object p2, p0, Ll/qrm0;->l:Ll/dum;

    .line 2
    .line 3
    iget-object p2, p2, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget v0, Ll/yec0;->C8:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

    .line 17
    .line 18
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 19
    .line 20
    const/high16 v1, 0x42200000    # 40.0f

    .line 21
    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/high16 v2, 0x42700000    # 60.0f

    .line 27
    .line 28
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 39
    .line 40
    iget-object v1, p0, Ll/qrm0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 41
    .line 42
    invoke-virtual {p0, v0, v1}, Ll/qrm0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->o0()V

    .line 47
    .line 48
    .line 49
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->setIcon(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->setIcon(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :goto_0
    const/4 p0, 0x1

    .line 63
    invoke-static {p2, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    return-object p2
.end method

.method public w4(Ll/coj;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sjg;->u:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Ll/sjg;->J4(Ll/coj;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final x4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/coj;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/sjg;->K4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/coj;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public y4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sjg;->u:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public z4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
