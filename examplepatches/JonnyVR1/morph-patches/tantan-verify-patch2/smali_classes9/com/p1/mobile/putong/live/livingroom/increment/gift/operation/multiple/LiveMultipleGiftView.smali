.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

.field public h:Ll/jjs;

.field public i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

.field public j:I

.field public k:Landroid/animation/AnimatorSet;

.field public l:Landroid/animation/AnimatorSet;

.field public m:Z

.field public n:Landroid/view/ViewGroup$MarginLayoutParams;

.field public o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;


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
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->m:Z

    .line 6
    .line 7
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

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->m:Z

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->p0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->q0()V

    return-void
.end method

.method private k0(I[I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    div-int/2addr v0, v1

    .line 9
    rem-int/lit8 p1, p1, 0x4

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    aget p0, p2, v2

    .line 15
    .line 16
    add-int/2addr p0, v0

    .line 17
    const/high16 p1, 0x42580000    # 54.0f

    .line 18
    .line 19
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    :goto_0
    sub-int/2addr p0, p1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 v3, 0x1

    .line 26
    const/high16 v4, 0x43120000    # 146.0f

    .line 27
    .line 28
    if-ne p1, v3, :cond_2

    .line 29
    .line 30
    aget p1, p2, v2

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    div-int/2addr p0, v1

    .line 39
    add-int/2addr p1, p0

    .line 40
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    sub-int/2addr p1, p0

    .line 45
    if-gez p1, :cond_1

    .line 46
    .line 47
    return v2

    .line 48
    :cond_1
    return p1

    .line 49
    :cond_2
    if-ne p1, v1, :cond_4

    .line 50
    .line 51
    aget p1, p2, v2

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    div-int/2addr p0, v1

    .line 60
    add-int/2addr p1, p0

    .line 61
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    sub-int/2addr p1, p0

    .line 66
    const/high16 p0, 0x43920000    # 292.0f

    .line 67
    .line 68
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    add-int/2addr p0, p1

    .line 73
    invoke-static {}, Ll/bnl0;->y0()I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-le p0, p2, :cond_3

    .line 78
    .line 79
    sub-int/2addr p0, p2

    .line 80
    sub-int/2addr p1, p0

    .line 81
    :cond_3
    return p1

    .line 82
    :cond_4
    const/4 p0, 0x3

    .line 83
    if-ne p1, p0, :cond_5

    .line 84
    .line 85
    aget p0, p2, v2

    .line 86
    .line 87
    add-int/2addr p0, v0

    .line 88
    const/high16 p1, 0x436e0000    # 238.0f

    .line 89
    .line 90
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    goto :goto_0

    .line 95
    :cond_5
    return v2
.end method

.method private l0(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->h:Ll/jjs;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->click:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->combosGears:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-ltz p1, :cond_1

    .line 29
    .line 30
    if-ge p1, v0, :cond_1

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method private m0(Landroid/view/View;)Landroid/animation/AnimatorSet;
    .locals 8

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array v0, p0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 8
    .line 9
    invoke-static {p1, v1, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-wide/16 v1, 0xb4

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v0, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 20
    .line 21
    .line 22
    sget-object v4, Ll/gt0;->i:Landroid/util/Property;

    .line 23
    .line 24
    new-array v5, p0, [F

    .line 25
    .line 26
    fill-array-data v5, :array_1

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v4, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v4, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v4, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 37
    .line 38
    .line 39
    const/high16 v5, 0x42700000    # 60.0f

    .line 40
    .line 41
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    int-to-float v5, v5

    .line 46
    new-array p0, p0, [F

    .line 47
    .line 48
    const/4 v6, 0x0

    .line 49
    const/4 v7, 0x0

    .line 50
    aput v6, p0, v7

    .line 51
    .line 52
    const/4 v6, 0x1

    .line 53
    aput v5, p0, v6

    .line 54
    .line 55
    sget-object v5, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 56
    .line 57
    invoke-static {p1, v5, p0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 65
    .line 66
    .line 67
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 68
    .line 69
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 70
    .line 71
    .line 72
    filled-new-array {v0, v4, p0}, [Landroid/animation/Animator;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 77
    .line 78
    .line 79
    return-object p1

    .line 80
    nop

    .line 81
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private n0(Landroid/view/View;I)Landroid/animation/AnimatorSet;
    .locals 12

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array v0, p0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 8
    .line 9
    invoke-static {p1, v1, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-wide/16 v1, 0xe6

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 20
    .line 21
    .line 22
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 23
    .line 24
    new-array v3, p0, [F

    .line 25
    .line 26
    fill-array-data v3, :array_1

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v2, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-wide/16 v3, 0xb4

    .line 34
    .line 35
    invoke-virtual {v2, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 39
    .line 40
    .line 41
    sget-object v5, Ll/gt0;->i:Landroid/util/Property;

    .line 42
    .line 43
    new-array v6, p0, [F

    .line 44
    .line 45
    fill-array-data v6, :array_2

    .line 46
    .line 47
    .line 48
    invoke-static {p1, v5, v6}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    const-wide/16 v6, 0x78

    .line 53
    .line 54
    invoke-virtual {v5, v6, v7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v5, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 58
    .line 59
    .line 60
    new-instance v8, Landroid/animation/AnimatorSet;

    .line 61
    .line 62
    invoke-direct {v8}, Landroid/animation/AnimatorSet;-><init>()V

    .line 63
    .line 64
    .line 65
    filled-new-array {v2, v5}, [Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v8, v2}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 70
    .line 71
    .line 72
    const/high16 v2, 0x42700000    # 60.0f

    .line 73
    .line 74
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    int-to-float v2, v2

    .line 79
    const/high16 v5, 0x41200000    # 10.0f

    .line 80
    .line 81
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result v9

    .line 85
    neg-int v9, v9

    .line 86
    int-to-float v9, v9

    .line 87
    new-array v10, p0, [F

    .line 88
    .line 89
    const/4 v11, 0x0

    .line 90
    aput v2, v10, v11

    .line 91
    .line 92
    const/4 v2, 0x1

    .line 93
    aput v9, v10, v2

    .line 94
    .line 95
    sget-object v9, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 96
    .line 97
    invoke-static {p1, v9, v10}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 98
    .line 99
    .line 100
    move-result-object v10

    .line 101
    invoke-virtual {v10, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v10, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    neg-int v3, v3

    .line 112
    int-to-float v3, v3

    .line 113
    new-array p0, p0, [F

    .line 114
    .line 115
    aput v3, p0, v11

    .line 116
    .line 117
    const/4 v3, 0x0

    .line 118
    aput v3, p0, v2

    .line 119
    .line 120
    invoke-static {p1, v9, p0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0, v6, v7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 128
    .line 129
    .line 130
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 131
    .line 132
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 133
    .line 134
    .line 135
    filled-new-array {v10, p0}, [Landroid/animation/Animator;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 140
    .line 141
    .line 142
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 143
    .line 144
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-static {p2}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    int-to-long v2, p2

    .line 152
    invoke-virtual {p0, v2, v3}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    invoke-virtual {p2, v8}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    invoke-virtual {p2, p1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {p1, v1}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 168
    .line 169
    .line 170
    return-object p0

    .line 171
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    :array_1
    .array-data 4
        0x0
        0x3f8ccccd    # 1.1f
    .end array-data

    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    :array_2
    .array-data 4
        0x3f8ccccd    # 1.1f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private o0(Ll/jjs;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->h:Ll/jjs;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/jjs;->q(Ll/jjs;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private synthetic q0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->v0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->v0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->v0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$ContinueType2;->SMALL:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$ContinueType2;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;->m0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$ContinueType2;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$ContinueType2;->MIDDLE:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$ContinueType2;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;->m0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$ContinueType2;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 34
    .line 35
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$ContinueType2;->LARGE:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$ContinueType2;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;->m0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$ContinueType2;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->n:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method private s0(Ll/jjs;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->l0(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;Ll/jjs;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->l0(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;Ll/jjs;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->l0(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;Ll/jjs;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private u0(I)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 5
    .line 6
    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->n:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 10
    .line 11
    invoke-direct {p0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->k0(I[I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->n:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    aget v1, v1, v2

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    div-int/2addr v2, v0

    .line 29
    sub-int/2addr v1, v2

    .line 30
    const/high16 v0, 0x41e00000    # 28.0f

    .line 31
    .line 32
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    sub-int/2addr v1, v0

    .line 37
    sget v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;->i:I

    .line 38
    .line 39
    sub-int/2addr v1, v0

    .line 40
    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->n:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private y0()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->k:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 23
    .line 24
    const/16 v2, 0x64

    .line 25
    .line 26
    invoke-direct {p0, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->n0(Landroid/view/View;I)Landroid/animation/AnimatorSet;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 31
    .line 32
    const/16 v3, 0x8c

    .line 33
    .line 34
    invoke-direct {p0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->n0(Landroid/view/View;I)Landroid/animation/AnimatorSet;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 39
    .line 40
    const/16 v4, 0xb4

    .line 41
    .line 42
    invoke-direct {p0, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->n0(Landroid/view/View;I)Landroid/animation/AnimatorSet;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 47
    .line 48
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->k:Landroid/animation/AnimatorSet;

    .line 52
    .line 53
    const/4 v5, 0x3

    .line 54
    new-array v5, v5, [Landroid/animation/Animator;

    .line 55
    .line 56
    const/4 v6, 0x0

    .line 57
    aput-object v0, v5, v6

    .line 58
    .line 59
    aput-object v2, v5, v1

    .line 60
    .line 61
    const/4 v0, 0x2

    .line 62
    aput-object v3, v5, v0

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->k:Landroid/animation/AnimatorSet;

    .line 68
    .line 69
    new-instance v2, Ll/e8t;

    .line 70
    .line 71
    invoke-direct {v2, p0}, Ll/e8t;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->k:Landroid/animation/AnimatorSet;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 80
    .line 81
    .line 82
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->m:Z

    .line 83
    .line 84
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f8t;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;ILandroid/view/View;)V
    .locals 8

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;->getGears()Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;->combosHitNum:J

    .line 10
    .line 11
    long-to-int v7, v0

    .line 12
    new-instance v2, Ll/jne0;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->h:Ll/jjs;

    .line 15
    .line 16
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 17
    .line 18
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->j:I

    .line 19
    .line 20
    move v5, p2

    .line 21
    invoke-direct/range {v2 .. v7}, Ll/jne0;-><init>(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;III)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;

    .line 25
    .line 26
    invoke-interface {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;->a(Ll/jne0;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public r0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->k:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->l:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->h:Ll/jjs;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->m:Z

    .line 16
    .line 17
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->m:Z

    .line 15
    .line 16
    return-void
.end method

.method public t0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->l:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->o0(Ll/jjs;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->m:Z

    .line 14
    .line 15
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 16
    .line 17
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->h:Ll/jjs;

    .line 18
    .line 19
    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;

    .line 20
    .line 21
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->j:I

    .line 22
    .line 23
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->s0(Ll/jjs;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->u0(I)V

    .line 27
    .line 28
    .line 29
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->m:Z

    .line 30
    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->y0()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    const/4 p1, 0x1

    .line 38
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final v0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/d8t;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/d8t;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public w0(Ll/x20;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->l:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->l:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->m0(Landroid/view/View;)Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 18
    .line 19
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->m0(Landroid/view/View;)Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 24
    .line 25
    invoke-direct {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->m0(Landroid/view/View;)Landroid/animation/AnimatorSet;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->l:Landroid/animation/AnimatorSet;

    .line 35
    .line 36
    const/4 v5, 0x3

    .line 37
    new-array v5, v5, [Landroid/animation/Animator;

    .line 38
    .line 39
    aput-object v0, v5, v1

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    aput-object v2, v5, v0

    .line 43
    .line 44
    const/4 v0, 0x2

    .line 45
    aput-object v3, v5, v0

    .line 46
    .line 47
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->l:Landroid/animation/AnimatorSet;

    .line 51
    .line 52
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    new-instance v2, Ll/bri0;

    .line 56
    .line 57
    invoke-direct {v2, p1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->l:Landroid/animation/AnimatorSet;

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 66
    .line 67
    .line 68
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView;->m:Z

    .line 69
    .line 70
    return-void
.end method
