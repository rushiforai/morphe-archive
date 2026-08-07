.class public Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VDraweeView;

.field public i:Lv/VText;

.field public j:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->k0(Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ldv;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k0(Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Landroid/view/View;)V
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
    const-string v4, "audio_pay_guide_relationship_pop"

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
    new-instance v9, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog$a;

    .line 115
    .line 116
    move-object/from16 v0, p0

    .line 117
    .line 118
    invoke-direct {v9, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;)V

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

.method public l0(Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Ll/x20;)V
    .locals 4
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
    invoke-virtual {p1}, Ll/vp20;->p()Z

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
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftId()J

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
    const-string v2, "module"

    .line 27
    .line 28
    const-string v3, "audio_pay_guide_relationship_pop"

    .line 29
    .line 30
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "e_gift"

    .line 39
    .line 40
    invoke-static {v2, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

    .line 44
    .line 45
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;

    .line 46
    .line 47
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v2, "context_single_room"

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sget v3, Ll/qa00;->Q:I

    .line 57
    .line 58
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;->e(I)Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;->a()Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->setMaskAvatarData(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;)V

    .line 79
    .line 80
    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v1, "\u5411\u559c\u6b22\u7684\u4eba"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const/4 v3, 0x3

    .line 100
    invoke-static {v1, v3}, Ll/xau;->p(Ljava/lang/String;I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v1, "\u9001\u793c"

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->e:Lv/VText;

    .line 113
    .line 114
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->f:Lv/VText;

    .line 118
    .line 119
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getSubTitle()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->h:Lv/VDraweeView;

    .line 127
    .line 128
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftIcon()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    sget v3, Ll/qa00;->v:I

    .line 133
    .line 134
    invoke-static {v2, v0, v1, v3}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->i:Lv/VText;

    .line 138
    .line 139
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getButtonTitle()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->g:Landroid/widget/LinearLayout;

    .line 147
    .line 148
    new-instance v1, Ll/jdv;

    .line 149
    .line 150
    invoke-direct {v1, p0, p1, p2, p3}, Ll/jdv;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->j:Lv/VText;

    .line 157
    .line 158
    new-instance p1, Ll/kdv;

    .line 159
    .line 160
    invoke-direct {p1, p4}, Ll/kdv;-><init>(Ll/x20;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
