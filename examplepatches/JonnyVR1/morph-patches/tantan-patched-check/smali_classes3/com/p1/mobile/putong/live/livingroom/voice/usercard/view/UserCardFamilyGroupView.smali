.class public Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VMarqueeText;

.field public h:Lv/VMarqueeText;

.field public i:Landroid/animation/Animator;

.field public j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x42100000    # 36.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->j:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x42100000    # 36.0f

    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->j:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x42100000    # 36.0f

    .line 16
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->j:I

    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/k8k0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->i:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;)V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->i:Landroid/animation/Animator;

    .line 6
    .line 7
    invoke-static {v1}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->d:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->bgPic:Ljava/lang/String;

    .line 13
    .line 14
    const-string v3, "context_single_room"

    .line 15
    .line 16
    invoke-static {v3, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->g:Lv/VMarqueeText;

    .line 20
    .line 21
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->title:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->g:Lv/VMarqueeText;

    .line 27
    .line 28
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->titleColor:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->h:Lv/VMarqueeText;

    .line 38
    .line 39
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->subTitle:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->h:Lv/VMarqueeText;

    .line 45
    .line 46
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->subTitleColor:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->pic:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->e:Lv/VDraweeView;

    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    const/high16 v5, 0x3f800000    # 1.0f

    .line 65
    .line 66
    const/4 v6, 0x0

    .line 67
    if-nez v1, :cond_0

    .line 68
    .line 69
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->e:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-virtual {v1, v5}, Landroid/view/View;->setAlpha(F)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->e:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-virtual {v1, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->e:Lv/VDraweeView;

    .line 83
    .line 84
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->pic:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v3, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->familyPic:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->f:Lv/VDraweeView;

    .line 100
    .line 101
    if-nez v1, :cond_1

    .line 102
    .line 103
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->f:Lv/VDraweeView;

    .line 107
    .line 108
    invoke-virtual {v0, v5}, Landroid/view/View;->setAlpha(F)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->f:Lv/VDraweeView;

    .line 112
    .line 113
    invoke-virtual {v0, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->f:Lv/VDraweeView;

    .line 117
    .line 118
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->familyPic:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v3, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_1
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->pic:Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_2

    .line 134
    .line 135
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->familyPic:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-nez p1, :cond_2

    .line 142
    .line 143
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->f:Lv/VDraweeView;

    .line 144
    .line 145
    invoke-virtual {p1, v6}, Landroid/view/View;->setAlpha(F)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->f:Lv/VDraweeView;

    .line 149
    .line 150
    const/high16 v0, 0x42100000    # 36.0f

    .line 151
    .line 152
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    int-to-float v0, v0

    .line 157
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->k0()V

    .line 161
    .line 162
    .line 163
    :cond_2
    return-void
.end method

.method public final k0()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->i:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->e:Lv/VDraweeView;

    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->j:I

    .line 9
    .line 10
    neg-int v1, v1

    .line 11
    int-to-float v1, v1

    .line 12
    const/4 v2, 0x2

    .line 13
    new-array v3, v2, [F

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    const/4 v5, 0x0

    .line 17
    aput v5, v3, v4

    .line 18
    .line 19
    const/4 v6, 0x1

    .line 20
    aput v1, v3, v6

    .line 21
    .line 22
    sget-object v1, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 23
    .line 24
    invoke-static {v0, v1, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->e:Lv/VDraweeView;

    .line 29
    .line 30
    new-array v7, v2, [F

    .line 31
    .line 32
    fill-array-data v7, :array_0

    .line 33
    .line 34
    .line 35
    sget-object v8, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 36
    .line 37
    invoke-static {v3, v8, v7}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const-wide/16 v9, 0x12c

    .line 42
    .line 43
    invoke-virtual {v3, v9, v10}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->f:Lv/VDraweeView;

    .line 48
    .line 49
    iget v9, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->j:I

    .line 50
    .line 51
    int-to-float v9, v9

    .line 52
    new-array v10, v2, [F

    .line 53
    .line 54
    aput v9, v10, v4

    .line 55
    .line 56
    aput v5, v10, v6

    .line 57
    .line 58
    invoke-static {v7, v1, v10}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->f:Lv/VDraweeView;

    .line 63
    .line 64
    new-array v2, v2, [F

    .line 65
    .line 66
    fill-array-data v2, :array_1

    .line 67
    .line 68
    .line 69
    invoke-static {v4, v8, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    filled-new-array {v0, v1, v3, v2}, [Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->i:Landroid/animation/Animator;

    .line 82
    .line 83
    const-wide/16 v1, 0x9c4

    .line 84
    .line 85
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->i:Landroid/animation/Animator;

    .line 89
    .line 90
    const-wide/16 v1, 0x1f4

    .line 91
    .line 92
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->i:Landroid/animation/Animator;

    .line 96
    .line 97
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 98
    .line 99
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->i:Landroid/animation/Animator;

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/high16 v0, 0x41800000    # 16.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {p0, v0}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
