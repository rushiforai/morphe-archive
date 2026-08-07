.class public Ll/h5o0;
.super Ll/iun0;
.source "SourceFile"


# instance fields
.field public b:Ll/i5o0;

.field public c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;


# direct methods
.method public constructor <init>(Ll/i5o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/iun0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i5o0;->c()Landroid/text/SpannableStringBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h()J
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/i5o0;->h()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getDisplayDuration()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v2, v0, v2

    .line 14
    .line 15
    if-lez v2, :cond_0

    .line 16
    .line 17
    return-wide v0

    .line 18
    :cond_0
    invoke-super {p0}, Ll/iun0;->h()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    return-wide v0
.end method

.method public j()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/i5o0;->h()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    new-instance v0, Ll/zit;

    .line 18
    .line 19
    iget-object v1, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/i5o0;->h()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Ll/zit;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, v0, Ll/hyr;->a:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, "jumpRoom"

    .line 35
    .line 36
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iget-object v1, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/i5o0;->h()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ll/zit;->h(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/h5o0;->m(Ll/zit;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    iget-object v0, p0, Ll/iun0;->a:Ll/yun0;

    .line 63
    .line 64
    iget-object p0, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/i5o0;->h()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const/16 v1, 0x1b5c

    .line 75
    .line 76
    invoke-virtual {v0, v1, p0}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public k(Landroid/view/ViewGroup;Ll/evn0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/i5o0;->l()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p2, p1}, Ll/evn0;->b(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p2, p0, Ll/h5o0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Alignment;->Left:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Alignment;

    .line 24
    .line 25
    iget-object v1, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/i5o0;->a()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/16 v0, 0x10

    .line 38
    .line 39
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 40
    .line 41
    const/high16 v0, 0x41000000    # 8.0f

    .line 42
    .line 43
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Alignment;->Center:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Alignment;

    .line 51
    .line 52
    iget-object v1, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/i5o0;->a()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    const/16 v0, 0x11

    .line 65
    .line 66
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 67
    .line 68
    const/high16 v0, 0x41200000    # 10.0f

    .line 69
    .line 70
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 75
    .line 76
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/h5o0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 79
    .line 80
    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    .line 82
    .line 83
    iget-object p2, p0, Ll/h5o0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;

    .line 84
    .line 85
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/h5o0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/iun0;->b(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/h5o0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;

    .line 94
    .line 95
    iget-object p0, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 96
    .line 97
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->s(Ll/i5o0;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletType;->DEFAULT_BULLET_STYLE:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletType;

    .line 102
    .line 103
    invoke-virtual {p2, v0, p1}, Ll/evn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletType;Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 111
    .line 112
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;->i0(Ll/i5o0;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p2}, Ll/iun0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public l()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/i5o0;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/h5o0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Ll/h5o0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->h:Lv/VDraweeView;

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    new-array v2, v2, [Landroid/view/View;

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    aput-object v1, v2, v3

    .line 33
    .line 34
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/r230$j;

    .line 38
    .line 39
    const-string v1, "context_livingAct"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ll/r230$j;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v3}, Ll/r230$j;->l(Z)Ll/r230$j;

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/i5o0;->d()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ll/r230$j;->b(Ljava/lang/String;)Ll/r230$f;

    .line 54
    .line 55
    .line 56
    new-instance v1, Ll/h5o0$a;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/h5o0$a;-><init>(Ll/h5o0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ll/r230$j;->n(Ll/fn2;)Ll/r230$j;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ll/r230$j;->k()Ll/r230;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object p0, p0, Ll/h5o0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->h:Lv/VDraweeView;

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Ll/r230;->E(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    :goto_0
    return-void
.end method

.method public final m(Ll/zit;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/iun0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 8
    .line 9
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->L0:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/i5o0;->h()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getType()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "hour_leaderboard_comments_msg"

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-static {}, Ll/v1n0;->m()V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p0}, Ll/iun0;->d()Ll/oo2;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    instance-of v0, v0, Ll/rwn0;

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/iun0;->d()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ll/rwn0;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 65
    .line 66
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Th:I

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    invoke-virtual {p0}, Ll/iun0;->d()Ll/oo2;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const-string v1, "roomId"

    .line 85
    .line 86
    invoke-virtual {p1, v1}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_3

    .line 95
    .line 96
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 97
    .line 98
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->b3:I

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_3
    iget-object v0, p0, Ll/iun0;->a:Ll/yun0;

    .line 109
    .line 110
    const-string v1, "liveId"

    .line 111
    .line 112
    invoke-virtual {p1, v1}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iget-object p0, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 117
    .line 118
    invoke-virtual {p0}, Ll/i5o0;->h()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {v0, p1, p0}, Ll/yun0;->Z3(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public n()Ll/i5o0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h5o0;->b:Ll/i5o0;

    .line 2
    .line 3
    return-object p0
.end method
