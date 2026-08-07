.class public Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroidx/legacy/widget/Space;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "audio_pay_guide_cp_avatar_frame"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->m:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    const-string p1, "audio_pay_guide_cp_avatar_frame"

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->m:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    const-string p1, "audio_pay_guide_cp_avatar_frame"

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->m:Ljava/lang/String;

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

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->k0(Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;Ll/y20;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/odv;->a(Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k0(Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;Ll/y20;Landroid/view/View;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Ll/vp20;->p()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    const-string p4, "p_anchor_audio_room"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p4, "p_user_audio_room"

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getGiftId()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "giftId"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getGiftId()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    long-to-int v1, v1

    .line 31
    invoke-virtual {p1, v1}, Ll/oo2;->w0(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 36
    .line 37
    .line 38
    move-result-wide v1

    .line 39
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v1, "giftUnitPrice"

    .line 44
    .line 45
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v1, "module"

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->m:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const-string v2, "giftCombos"

    .line 58
    .line 59
    const-string v3, ""

    .line 60
    .line 61
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    const-string v4, "gift_receiver_id"

    .line 74
    .line 75
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    filled-new-array {v0, p1, v1, v2, v3}, [Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const-string v0, "e_gift"

    .line 84
    .line 85
    invoke-static {v0, p4, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    new-instance v1, Ll/hne0$a;

    .line 89
    .line 90
    invoke-direct {v1}, Ll/hne0$a;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getGiftId()J

    .line 94
    .line 95
    .line 96
    move-result-wide v2

    .line 97
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    new-instance v3, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog$a;

    .line 102
    .line 103
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getGiftCount()J

    .line 107
    .line 108
    .line 109
    move-result-wide v4

    .line 110
    long-to-int v4, v4

    .line 111
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->m:Ljava/lang/String;

    .line 112
    .line 113
    const-string p0, "audio_pay_guide_relationship_pop"

    .line 114
    .line 115
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 120
    .line 121
    .line 122
    move-result-object v7

    .line 123
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    const-string v9, "source_voice_gift_guide"

    .line 132
    .line 133
    move-object v6, v5

    .line 134
    invoke-virtual/range {v1 .. v9}, Ll/hne0$a;->v(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Ljava/lang/String;Ljava/lang/String;)Ll/hne0$a;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {p0}, Ll/hne0$a;->t()Ll/hne0;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public l0(Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;Ll/y20;Ll/x20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/oo2;",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;",
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
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getGiftId()J

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
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->m:Ljava/lang/String;

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
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getFromUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 52
    .line 53
    sget v3, Ll/qa00;->S:I

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getStaticUrl()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDynamicUrl()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v2, v3, v4, v5, v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->q0(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getStaticUrl()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDynamicUrl()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v3, v2, v4, v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->q0(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->g:Lv/VText;

    .line 120
    .line 121
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getTitle()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->h:Lv/VText;

    .line 129
    .line 130
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getSubTitle()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->j:Lv/VText;

    .line 138
    .line 139
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getButtonTitle()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;->getButtonSubTitle()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    new-instance v1, Landroid/text/SpannableString;

    .line 151
    .line 152
    invoke-direct {v1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 153
    .line 154
    .line 155
    new-instance v2, Landroid/text/style/StrikethroughSpan;

    .line 156
    .line 157
    invoke-direct {v2}, Landroid/text/style/StrikethroughSpan;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    const/16 v3, 0x21

    .line 165
    .line 166
    const/4 v4, 0x0

    .line 167
    invoke-virtual {v1, v2, v4, v0, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->k:Lv/VText;

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->i:Landroid/widget/LinearLayout;

    .line 176
    .line 177
    new-instance v1, Ll/mdv;

    .line 178
    .line 179
    invoke-direct {v1, p0, p1, p2, p3}, Ll/mdv;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceAvatarFramePayGuidePopUp;Ll/y20;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    .line 184
    .line 185
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->l:Lv/VText;

    .line 186
    .line 187
    new-instance p1, Ll/ndv;

    .line 188
    .line 189
    invoke-direct {p1, p4}, Ll/ndv;-><init>(Ll/x20;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/member/LiveVoiceVirtualSendGiftGuideDialog;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
