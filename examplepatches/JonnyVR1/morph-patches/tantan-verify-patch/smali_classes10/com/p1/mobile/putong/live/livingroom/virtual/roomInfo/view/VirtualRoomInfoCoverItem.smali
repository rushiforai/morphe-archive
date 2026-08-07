.class public Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Ll/kip0;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->identity:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2}, Ll/udp0;->a(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->identity:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p2}, Ll/udp0;->b(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverStatus:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isStatePending(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    const-string p0, "\u8d44\u6599\u6b63\u5728\u5ba1\u6838\u4e2d"

    .line 34
    .line 35
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    invoke-virtual {p1}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomId:Ljava/lang/String;

    .line 50
    .line 51
    const-string v0, "from_voice"

    .line 52
    .line 53
    invoke-static {p2, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->c2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n3m0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Ll/kip0;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/kip0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;->b:Lv/VDraweeView;

    .line 2
    .line 3
    new-instance v1, Ll/m3m0;

    .line 4
    .line 5
    invoke-direct {v1, p1, p2}, Ll/m3m0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Ll/kip0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;->b:Lv/VDraweeView;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

    .line 16
    .line 17
    sget v2, Ll/qa00;->R:I

    .line 18
    .line 19
    const-string v3, "context_livingAct"

    .line 20
    .line 21
    invoke-static {v3, v0, v1, v2, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p2, v0}, Ll/kip0;->i0(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v1, 0x0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Ll/kip0;->d0(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;->d:Lv/VText;

    .line 51
    .line 52
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;->c:Landroid/widget/ImageView;

    .line 56
    .line 57
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverStatus:Ljava/lang/String;

    .line 64
    .line 65
    const-string p2, "pending"

    .line 66
    .line 67
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;->d:Lv/VText;

    .line 72
    .line 73
    const/4 v0, 0x1

    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;->c:Landroid/widget/ImageView;

    .line 80
    .line 81
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;->d:Lv/VText;

    .line 85
    .line 86
    const-string p1, "\u5ba1\u6838\u4e2d"

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;->c:Landroid/widget/ImageView;

    .line 96
    .line 97
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
