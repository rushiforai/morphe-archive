.class public Ll/yoh0;
.super Ll/pf2;
.source "SourceFile"


# instance fields
.field public c:Ll/zoh0;

.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;


# direct methods
.method public constructor <init>(Ll/zoh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pf2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public i()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zoh0;->c()Landroid/text/SpannableStringBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l()Landroid/text/SpannableStringBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zoh0;->i()Landroid/text/SpannableStringBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m()J
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zoh0;->h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getDisplayDuration()J

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
    invoke-super {p0}, Ll/pf2;->m()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    return-wide v0
.end method

.method public o()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zoh0;->h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

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
    if-nez v0, :cond_2

    .line 16
    .line 17
    new-instance v0, Ll/zit;

    .line 18
    .line 19
    iget-object v1, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/zoh0;->h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Ll/zit;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/zoh0;->h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getType()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v1, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/zoh0;->h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {p0}, Ll/pf2;->g()Ll/oo2;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    iget-object v1, p0, Ll/pf2;->b:Ll/ki3;

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    iget-object v1, v0, Ll/hyr;->a:Ljava/lang/String;

    .line 63
    .line 64
    const-string v6, "jumpRoom"

    .line 65
    .line 66
    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    const-string v7, ""

    .line 71
    .line 72
    if-eqz v1, :cond_0

    .line 73
    .line 74
    const-string v1, "roomId"

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    goto :goto_0

    .line 81
    :cond_0
    move-object v1, v7

    .line 82
    :goto_0
    iget-object v8, v0, Ll/hyr;->a:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    if-eqz v6, :cond_1

    .line 89
    .line 90
    const-string v6, "liveId"

    .line 91
    .line 92
    invoke-virtual {v0, v6}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    :cond_1
    move-object v6, v1

    .line 97
    invoke-static/range {v2 .. v7}, Ll/ni3;->c(Ljava/lang/String;Ljava/lang/String;Ll/oo2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/pf2;->b:Ll/ki3;

    .line 101
    .line 102
    iget-object p0, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/zoh0;->h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const/16 v1, 0xe10

    .line 113
    .line 114
    invoke-virtual {v0, v1, p0}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :cond_2
    return-void
.end method

.method public r(Landroid/view/ViewGroup;Ll/si3;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zoh0;->m()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p2, p1}, Ll/si3;->b(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p2, p0, Ll/yoh0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

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
    iget-object v1, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/zoh0;->a()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Alignment;

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
    iget-object v1, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/zoh0;->a()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Alignment;

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
    iget-object v0, p0, Ll/yoh0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 79
    .line 80
    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    .line 82
    .line 83
    iget-object p2, p0, Ll/yoh0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;

    .line 84
    .line 85
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/yoh0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/pf2;->e(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/yoh0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;

    .line 94
    .line 95
    iget-object p2, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 96
    .line 97
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;->s(Ll/zoh0;)V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->DEFAULT_BULLET_STYLE:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 102
    .line 103
    invoke-virtual {p2, v0, p1}, Ll/si3;->a(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 111
    .line 112
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;->i0(Ll/zoh0;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p2}, Ll/pf2;->d(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;)V

    .line 116
    .line 117
    .line 118
    :goto_1
    new-instance p1, Ll/zit;

    .line 119
    .line 120
    iget-object p2, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 121
    .line 122
    invoke-virtual {p2}, Ll/zoh0;->h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-direct {p1, p2}, Ll/zit;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    iget-object p2, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 134
    .line 135
    invoke-virtual {p2}, Ll/zoh0;->h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getType()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iget-object p2, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 144
    .line 145
    invoke-virtual {p2}, Ll/zoh0;->h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getId()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {p0}, Ll/pf2;->g()Ll/oo2;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    iget-object p0, p0, Ll/pf2;->b:Ll/ki3;

    .line 158
    .line 159
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    iget-object p0, p1, Ll/hyr;->a:Ljava/lang/String;

    .line 164
    .line 165
    const-string p2, "jumpRoom"

    .line 166
    .line 167
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    const-string v4, ""

    .line 172
    .line 173
    if-eqz p0, :cond_3

    .line 174
    .line 175
    const-string p0, "roomId"

    .line 176
    .line 177
    invoke-virtual {p1, p0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    goto :goto_2

    .line 182
    :cond_3
    move-object p0, v4

    .line 183
    :goto_2
    iget-object v5, p1, Ll/hyr;->a:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result p2

    .line 189
    if-eqz p2, :cond_4

    .line 190
    .line 191
    const-string p2, "liveId"

    .line 192
    .line 193
    invoke-virtual {p1, p2}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    :cond_4
    move-object v5, v4

    .line 198
    move-object v4, p0

    .line 199
    invoke-static/range {v0 .. v5}, Ll/ni3;->d(Ljava/lang/String;Ljava/lang/String;Ll/oo2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public s()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zoh0;->d()Ljava/lang/String;

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
    iget-object v0, p0, Ll/yoh0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Ll/yoh0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    new-array v3, v2, [Landroid/view/View;

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    aput-object v1, v3, v4

    .line 33
    .line 34
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/yoh0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/zoh0;->d()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, -0x1

    .line 58
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object p0, p0, Ll/yoh0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    :goto_0
    return-void
.end method

.method public t()Ll/zoh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yoh0;->c:Ll/zoh0;

    .line 2
    .line 3
    return-object p0
.end method
