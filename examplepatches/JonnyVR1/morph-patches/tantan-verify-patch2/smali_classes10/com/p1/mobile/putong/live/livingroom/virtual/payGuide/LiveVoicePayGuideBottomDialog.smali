.class public Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->e(Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pbv;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e(Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Landroid/view/View;)V
    .locals 16

    .line 1
    invoke-virtual/range {p1 .. p1}, Ll/vp20;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "p_anchor_audio_room"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "p_user_audio_room"

    .line 11
    .line 12
    :goto_0
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftId()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "giftId"

    .line 21
    .line 22
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftId()J

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    long-to-int v2, v2

    .line 31
    move-object/from16 v3, p1

    .line 32
    .line 33
    invoke-virtual {v3, v2}, Ll/oo2;->w0(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const-string v3, "giftUnitPrice"

    .line 46
    .line 47
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    const-string v3, "module"

    .line 52
    .line 53
    const-string v4, "audio_pay_guide_key_pop"

    .line 54
    .line 55
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    const-string v5, "giftCombos"

    .line 60
    .line 61
    const-string v6, ""

    .line 62
    .line 63
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    invoke-virtual {v7}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    const-string v8, "gift_receiver_id"

    .line 76
    .line 77
    invoke-static {v8, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    filled-new-array {v1, v2, v3, v5, v7}, [Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const-string v2, "e_gift"

    .line 86
    .line 87
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 88
    .line 89
    .line 90
    new-instance v7, Ll/hne0$a;

    .line 91
    .line 92
    invoke-direct {v7}, Ll/hne0$a;-><init>()V

    .line 93
    .line 94
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftId()J

    .line 101
    .line 102
    .line 103
    move-result-wide v1

    .line 104
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v8

    .line 114
    new-instance v9, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog$a;

    .line 115
    .line 116
    move-object/from16 v0, p0

    .line 117
    .line 118
    invoke-direct {v9, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftCount()J

    .line 122
    .line 123
    .line 124
    move-result-wide v0

    .line 125
    long-to-int v10, v0

    .line 126
    invoke-static {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 131
    .line 132
    .line 133
    move-result-object v13

    .line 134
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v14

    .line 142
    const-string v15, "source_voice_gift_guide"

    .line 143
    .line 144
    const-string v11, "audio_pay_guide_bubble"

    .line 145
    .line 146
    const-string v12, "audio_pay_guide_bubble"

    .line 147
    .line 148
    invoke-virtual/range {v7 .. v15}, Ll/hne0$a;->v(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Ljava/lang/String;Ljava/lang/String;)Ll/hne0$a;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v0}, Ll/hne0$a;->t()Ll/hne0;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    move-object/from16 v1, p3

    .line 157
    .line 158
    invoke-interface {v1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Landroid/view/View;)V
    .locals 9

    .line 1
    new-instance v0, Ll/hne0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p3, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftId()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-virtual {p3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, ""

    .line 19
    .line 20
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog$b;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftCount()J

    .line 33
    .line 34
    .line 35
    move-result-wide v3

    .line 36
    long-to-int v3, v3

    .line 37
    const-string p0, "audio_pay_guide_nearby_pop"

    .line 38
    .line 39
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    const-string v8, "source_voice_gift_guide"

    .line 56
    .line 57
    const-string v4, "audio_pay_guide_bubble"

    .line 58
    .line 59
    const-string v5, "audio_pay_guide_bubble"

    .line 60
    .line 61
    invoke-virtual/range {v0 .. v8}, Ll/hne0$a;->v(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Ljava/lang/String;Ljava/lang/String;)Ll/hne0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/hne0$a;->t()Ll/hne0;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public g(Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Ll/x20;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/oo2;",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;",
            "Ll/y20<",
            "Ll/hne0;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/mbv;

    .line 4
    .line 5
    invoke-direct {v1, p4}, Ll/mbv;-><init>(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGuideTypeValue()I

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    const-string v0, "context_single_room"

    .line 16
    .line 17
    const-string v1, "module"

    .line 18
    .line 19
    const-string v2, "giftId"

    .line 20
    .line 21
    const-string v3, "p_user_audio_room"

    .line 22
    .line 23
    const-string v4, "p_anchor_audio_room"

    .line 24
    .line 25
    const-string v5, "e_gift"

    .line 26
    .line 27
    const/4 v6, 0x0

    .line 28
    const/4 v7, 0x1

    .line 29
    if-ne p4, v7, :cond_2

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/vp20;->p()Z

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    if-eqz p4, :cond_0

    .line 36
    .line 37
    move-object v3, v4

    .line 38
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftId()J

    .line 39
    .line 40
    .line 41
    move-result-wide v8

    .line 42
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 43
    .line 44
    .line 45
    move-result-object p4

    .line 46
    invoke-static {v2, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p4

    .line 50
    const-string v2, "audio_pay_guide_key_pop"

    .line 51
    .line 52
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    filled-new-array {p4, v1}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p4

    .line 60
    invoke-static {v5, v3, p4}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->c:Lv/VDraweeView;

    .line 64
    .line 65
    invoke-static {p4, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

    .line 69
    .line 70
    invoke-static {p4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftIcon()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p4

    .line 77
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result p4

    .line 81
    if-nez p4, :cond_1

    .line 82
    .line 83
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->c:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftIcon()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    sget v2, Ll/qa00;->D:I

    .line 90
    .line 91
    invoke-static {v0, p4, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 92
    .line 93
    .line 94
    :cond_1
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->e:Lv/VText;

    .line 95
    .line 96
    invoke-static {p4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->f:Lv/VText;

    .line 100
    .line 101
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getTitle()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->g:Lv/VText;

    .line 109
    .line 110
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getSubTitle()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->h:Lv/VText;

    .line 118
    .line 119
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getButtonTitle()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->h:Lv/VText;

    .line 127
    .line 128
    new-instance v0, Ll/nbv;

    .line 129
    .line 130
    invoke-direct {v0, p0, p1, p2, p3}, Ll/nbv;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p4, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_2
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->c:Lv/VDraweeView;

    .line 138
    .line 139
    invoke-static {p4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

    .line 143
    .line 144
    invoke-static {p4, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p1}, Ll/vp20;->p()Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-eqz p1, :cond_3

    .line 152
    .line 153
    move-object v3, v4

    .line 154
    :cond_3
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftId()J

    .line 155
    .line 156
    .line 157
    move-result-wide v8

    .line 158
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    const-string p4, "audio_pay_guide_nearby_pop"

    .line 167
    .line 168
    invoke-static {v1, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object p4

    .line 172
    filled-new-array {p1, p4}, [Ll/pf60;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-static {v5, v3, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->e:Lv/VText;

    .line 180
    .line 181
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getUserTag()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p4

    .line 185
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 186
    .line 187
    .line 188
    move-result p4

    .line 189
    xor-int/2addr p4, v7

    .line 190
    invoke-static {p1, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 191
    .line 192
    .line 193
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->e:Lv/VText;

    .line 194
    .line 195
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getUserTag()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p4

    .line 199
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    .line 201
    .line 202
    new-instance p1, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 208
    .line 209
    .line 210
    move-result-object p4

    .line 211
    invoke-virtual {p4}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p4

    .line 215
    const/16 v1, 0x8

    .line 216
    .line 217
    invoke-static {p4, v1}, Ll/xau;->p(Ljava/lang/String;I)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p4

    .line 221
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    const-string p4, "\u5728\u4f60\u9644\u8fd1"

    .line 225
    .line 226
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->f:Lv/VText;

    .line 230
    .line 231
    invoke-virtual {p4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->g:Lv/VText;

    .line 235
    .line 236
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getSubTitle()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p4

    .line 240
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->h:Lv/VText;

    .line 244
    .line 245
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getButtonTitle()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p4

    .line 249
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    if-nez p1, :cond_4

    .line 265
    .line 266
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

    .line 267
    .line 268
    new-instance p4, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;

    .line 269
    .line 270
    invoke-direct {p4}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;-><init>()V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;

    .line 274
    .line 275
    .line 276
    move-result-object p4

    .line 277
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;

    .line 286
    .line 287
    .line 288
    move-result-object p4

    .line 289
    sget v0, Ll/qa00;->D:I

    .line 290
    .line 291
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;->e(I)Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;

    .line 292
    .line 293
    .line 294
    move-result-object p4

    .line 295
    invoke-virtual {p4}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;->a()Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 296
    .line 297
    .line 298
    move-result-object p4

    .line 299
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->setMaskAvatarData(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;)V

    .line 300
    .line 301
    .line 302
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->h:Lv/VText;

    .line 303
    .line 304
    new-instance p4, Ll/obv;

    .line 305
    .line 306
    invoke-direct {p4, p0, p2, p3}, Ll/obv;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 310
    .line 311
    .line 312
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
