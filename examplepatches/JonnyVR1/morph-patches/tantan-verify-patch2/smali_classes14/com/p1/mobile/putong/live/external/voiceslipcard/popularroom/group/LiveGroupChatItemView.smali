.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/graphics/drawable/GradientDrawable;

.field public i:Landroid/graphics/drawable/GradientDrawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private m0(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/16 v0, 0x3e8

    .line 10
    .line 11
    if-lt p0, v0, :cond_0

    .line 12
    .line 13
    const-string p0, "+999"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    return-object p1
.end method


# virtual methods
.method public getVoiceCardBg()Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 8
    .line 9
    .line 10
    const/high16 v0, 0x41a00000    # 20.0f

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v0, v0

    .line 17
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TR_BL:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pss;->a(Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i0(II)V
    .locals 6

    .line 1
    new-instance v0, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v2, -0x2

    .line 13
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->g:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v4, 0x0

    .line 23
    if-lez v3, :cond_0

    .line 24
    .line 25
    const/high16 v3, 0x41100000    # 9.0f

    .line 26
    .line 27
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    neg-int v3, v3

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move v3, v4

    .line 34
    :goto_0
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Landroid/widget/TextView;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-direct {v1, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    const/4 v3, -0x1

    .line 49
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    const/16 v3, 0x11

    .line 53
    .line 54
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 55
    .line 56
    .line 57
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 58
    .line 59
    sget v5, Ll/qa00;->t:I

    .line 60
    .line 61
    invoke-direct {v3, v2, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 62
    .line 63
    .line 64
    sget v2, Ll/qa00;->d:I

    .line 65
    .line 66
    invoke-virtual {v3, v2, v2, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 67
    .line 68
    .line 69
    sget v2, Ll/qa00;->h:I

    .line 70
    .line 71
    invoke-virtual {v1, v2, v4, v2, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 72
    .line 73
    .line 74
    const/4 v2, 0x1

    .line 75
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    const/high16 v2, 0x41300000    # 11.0f

    .line 82
    .line 83
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 84
    .line 85
    .line 86
    sget v2, Lcom/p1/mobile/putong/live/external/R$string;->r0:I

    .line 87
    .line 88
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 96
    .line 97
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->g:Landroid/widget/LinearLayout;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    sget p0, Ll/qa00;->n:I

    .line 109
    .line 110
    int-to-float p0, p0

    .line 111
    invoke-static {p1, p0, v4}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 116
    .line 117
    .line 118
    invoke-static {p2}, Ll/f4n0;->d(I)I

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    sget p1, Ll/qa00;->l:I

    .line 123
    .line 124
    int-to-float p1, p1

    .line 125
    invoke-static {p0, p1, v4}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public final j0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;I)V
    .locals 7

    .line 1
    new-instance v0, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v2, -0x2

    .line 13
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->g:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v4, 0x0

    .line 23
    if-lez v3, :cond_0

    .line 24
    .line 25
    const/high16 v3, 0x41100000    # 9.0f

    .line 26
    .line 27
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    neg-int v3, v3

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move v3, v4

    .line 34
    :goto_0
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Landroid/widget/TextView;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-direct {v1, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    const/4 v3, -0x1

    .line 49
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    const/16 v3, 0x11

    .line 53
    .line 54
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 55
    .line 56
    .line 57
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 58
    .line 59
    sget v5, Ll/qa00;->t:I

    .line 60
    .line 61
    invoke-direct {v3, v2, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 62
    .line 63
    .line 64
    sget v2, Ll/qa00;->d:I

    .line 65
    .line 66
    invoke-virtual {v3, v2, v2, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 70
    .line 71
    .line 72
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    const/16 v5, 0x64

    .line 79
    .line 80
    const/4 v6, 0x1

    .line 81
    if-lt v2, v5, :cond_1

    .line 82
    .line 83
    move v2, v6

    .line 84
    goto :goto_1

    .line 85
    :cond_1
    move v2, v4

    .line 86
    :goto_1
    if-eqz v2, :cond_2

    .line 87
    .line 88
    sget v5, Ll/qa00;->h:I

    .line 89
    .line 90
    invoke-virtual {v1, v5, v4, v5, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_2
    invoke-virtual {v1, v4, v4, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 95
    .line 96
    .line 97
    :goto_2
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    .line 102
    .line 103
    const/high16 v3, 0x41300000    # 11.0f

    .line 104
    .line 105
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 106
    .line 107
    .line 108
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 109
    .line 110
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->m0(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 118
    .line 119
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->g:Landroid/widget/LinearLayout;

    .line 126
    .line 127
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 128
    .line 129
    .line 130
    if-eqz v2, :cond_3

    .line 131
    .line 132
    sget p0, Ll/qa00;->n:I

    .line 133
    .line 134
    int-to-float p0, p0

    .line 135
    invoke-static {p1, p0, v4}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    goto :goto_3

    .line 140
    :cond_3
    invoke-static {p1}, Ll/fc2;->h(I)Landroid/graphics/drawable/GradientDrawable;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    :goto_3
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 145
    .line 146
    .line 147
    if-eqz v2, :cond_4

    .line 148
    .line 149
    invoke-static {p3}, Ll/f4n0;->d(I)I

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    sget p1, Ll/qa00;->l:I

    .line 154
    .line 155
    int-to-float p1, p1

    .line 156
    invoke-static {p0, p1, v4}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    goto :goto_4

    .line 161
    :cond_4
    invoke-static {p3}, Ll/f4n0;->d(I)I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    invoke-static {p0}, Ll/fc2;->h(I)Landroid/graphics/drawable/GradientDrawable;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    :goto_4
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method public final k0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 7
    .line 8
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 9
    .line 10
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;->isfollowingAnchor:Z

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2, v2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->l0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->g:Landroid/widget/LinearLayout;

    .line 32
    .line 33
    invoke-virtual {v0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->i0(II)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    const/4 v1, 0x3

    .line 41
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    move v3, v2

    .line 50
    :goto_0
    if-ge v3, v1, :cond_4

    .line 51
    .line 52
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;

    .line 57
    .line 58
    iget-boolean v5, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->isOnCall:Z

    .line 59
    .line 60
    if-nez v5, :cond_2

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    if-nez v3, :cond_3

    .line 64
    .line 65
    move v5, v2

    .line 66
    goto :goto_1

    .line 67
    :cond_3
    const/high16 v5, 0x41100000    # 9.0f

    .line 68
    .line 69
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    neg-int v5, v5

    .line 74
    :goto_1
    invoke-virtual {p0, p1, v4, v5}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->l0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->g:Landroid/widget/LinearLayout;

    .line 79
    .line 80
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->j0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;I)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final l0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;I)Landroid/view/View;
    .locals 4

    .line 1
    new-instance v0, Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/xlj;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-direct {v1, v2}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ll/xlj;->a()Ll/wlj;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {}, Lcom/facebook/drawee/generic/RoundingParams;->a()Lcom/facebook/drawee/generic/RoundingParams;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, v2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 28
    .line 29
    .line 30
    sget v2, Ll/nbc0;->R0:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ll/wlj;->z(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 39
    .line 40
    sget v2, Ll/qa00;->t:I

    .line 41
    .line 42
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->color:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_0

    .line 55
    .line 56
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->color:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-static {v1}, Ll/fc2;->h(I)Landroid/graphics/drawable/GradientDrawable;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    new-instance v1, Landroid/widget/FrameLayout;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 76
    .line 77
    .line 78
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 79
    .line 80
    const/4 v3, -0x2

    .line 81
    invoke-direct {p0, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 91
    .line 92
    .line 93
    sget p0, Ll/qa00;->d:I

    .line 94
    .line 95
    invoke-virtual {v1, p0, p0, p0, p0}, Landroid/view/View;->setPadding(IIII)V

    .line 96
    .line 97
    .line 98
    invoke-static {p1}, Ll/fc2;->h(I)Landroid/graphics/drawable/GradientDrawable;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 103
    .line 104
    .line 105
    const-string p0, "context_common"

    .line 106
    .line 107
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->avatar:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {p0, v0, p1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 110
    .line 111
    .line 112
    return-object v1
.end method

.method public final n0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->getVoiceCardBg()Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->h:Landroid/graphics/drawable/GradientDrawable;

    .line 6
    .line 7
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->i:Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    const/high16 p0, 0x41b80000    # 23.0f

    .line 15
    .line 16
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    int-to-float p0, p0

    .line 21
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTitle:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {v0}, Ll/f4n0;->c(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p0, v1, p1, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->k0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;I)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->h:Landroid/graphics/drawable/GradientDrawable;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->g:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->i:Landroid/graphics/drawable/GradientDrawable;

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/f4n0;->b(I)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->h:Landroid/graphics/drawable/GradientDrawable;

    .line 38
    .line 39
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v2, Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast p1, Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    filled-new-array {v2, p1}, [I

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->i:Landroid/graphics/drawable/GradientDrawable;

    .line 63
    .line 64
    invoke-static {v0}, Ll/f4n0;->c(I)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->n0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final p0(Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_3

    .line 4
    .line 5
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->topTags:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->d:Landroid/widget/TextView;

    .line 12
    .line 13
    xor-int/lit8 v2, v0, 0x1

    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez v0, :cond_5

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->topTags:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;

    .line 28
    .line 29
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->topTags:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const/4 v3, 0x1

    .line 36
    if-le v2, v3, :cond_2

    .line 37
    .line 38
    move v2, v1

    .line 39
    :goto_0
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->topTags:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-ge v2, v3, :cond_2

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->topTags:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->type:Ljava/lang/String;

    .line 56
    .line 57
    const-string v4, "hourLeaderboardLabel"

    .line 58
    .line 59
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_1

    .line 64
    .line 65
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->topTags:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;

    .line 72
    .line 73
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->d:Landroid/widget/TextView;

    .line 77
    .line 78
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->text:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->startColor:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_3

    .line 90
    .line 91
    const/16 v2, -0x2dad

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->startColor:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    :goto_1
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->endColor:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-eqz v3, :cond_4

    .line 107
    .line 108
    const/16 v0, -0x1d63

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->endColor:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    :goto_2
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->d:Landroid/widget/TextView;

    .line 118
    .line 119
    filled-new-array {v2, v0}, [I

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 124
    .line 125
    sget v4, Ll/qa00;->g:I

    .line 126
    .line 127
    int-to-float v4, v4

    .line 128
    invoke-static {v0, v2, v4, v1}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v3, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 133
    .line 134
    .line 135
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->bottomTags:Ljava/util/List;

    .line 136
    .line 137
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->f:Landroid/widget/TextView;

    .line 142
    .line 143
    xor-int/lit8 v3, v0, 0x1

    .line 144
    .line 145
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    if-nez v0, :cond_6

    .line 149
    .line 150
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->bottomTags:Ljava/util/List;

    .line 151
    .line 152
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;

    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->f:Landroid/widget/TextView;

    .line 159
    .line 160
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->text:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->f:Landroid/widget/TextView;

    .line 166
    .line 167
    sget p1, Ll/qa00;->g:I

    .line 168
    .line 169
    int-to-float p1, p1

    .line 170
    const/4 v0, -0x1

    .line 171
    invoke-static {v0, p1, v1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 176
    .line 177
    .line 178
    :cond_6
    :goto_3
    return-void
.end method
