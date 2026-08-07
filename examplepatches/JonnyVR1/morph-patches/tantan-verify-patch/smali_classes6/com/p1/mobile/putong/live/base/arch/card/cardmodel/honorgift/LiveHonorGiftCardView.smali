.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field private animator:Landroid/animation/Animator;

.field private bg:Lv/VDraweeView;

.field private content:Landroid/widget/TextView;

.field private currentIconPos:I

.field private giftIcon1:Lv/VDraweeView;

.field private giftIcon2:Lv/VDraweeView;

.field private leftUserIcon1:Lv/VDraweeView;

.field private leftUserIcon2:Lv/VDraweeView;

.field private leftUserName:Landroid/widget/TextView;

.field private rightUserIcon1:Lv/VDraweeView;

.field private rightUserIcon2:Lv/VDraweeView;

.field private rightUserName:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->currentIconPos:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->currentIconPos:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->currentIconPos:I

    return-void
.end method

.method public static synthetic h0(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic i0(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private j0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->k0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon1:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon2:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 57
    .line 58
    const/4 v2, 0x1

    .line 59
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 63
    .line 64
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 68
    .line 69
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon1:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon2:Lv/VDraweeView;

    .line 83
    .line 84
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon1:Lv/VDraweeView;

    .line 88
    .line 89
    const/high16 v2, 0x3f800000    # 1.0f

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon2:Lv/VDraweeView;

    .line 95
    .line 96
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->bg:Lv/VDraweeView;

    .line 100
    .line 101
    invoke-virtual {p0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method


# virtual methods
.method public final k0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->animator:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->animator:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->animator:Landroid/animation/Animator;

    .line 15
    .line 16
    invoke-static {p0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final l0(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Ll/xys;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    move-object/from16 v4, p4

    .line 10
    .line 11
    move-object/from16 v5, p5

    .line 12
    .line 13
    move-object/from16 v6, p6

    .line 14
    .line 15
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->animator:Landroid/animation/Animator;

    .line 16
    .line 17
    invoke-static {v7}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual/range {p7 .. p7}, Ll/xys;->b()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v7

    .line 24
    const-string v8, "context_square"

    .line 25
    .line 26
    invoke-static {v8, v5, v7}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual/range {p7 .. p7}, Ll/xys;->d()Ll/xys$a;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    invoke-virtual {v7}, Ll/xys$a;->a()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v7

    .line 37
    invoke-static {v8, v2, v7}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual/range {p7 .. p7}, Ll/xys;->e()Ll/xys$a;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    invoke-virtual {v7}, Ll/xys$a;->a()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    invoke-static {v8, v1, v7}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    if-nez v6, :cond_0

    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    int-to-float v7, v7

    .line 59
    const/4 v8, 0x2

    .line 60
    new-array v9, v8, [F

    .line 61
    .line 62
    const/4 v10, 0x0

    .line 63
    aput v7, v9, v10

    .line 64
    .line 65
    const/4 v7, 0x1

    .line 66
    const/4 v11, 0x0

    .line 67
    aput v11, v9, v7

    .line 68
    .line 69
    sget-object v12, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 70
    .line 71
    invoke-static {v1, v12, v9}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    move-result-object v13

    .line 75
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 76
    .line 77
    .line 78
    move-result v9

    .line 79
    int-to-float v9, v9

    .line 80
    new-array v14, v8, [F

    .line 81
    .line 82
    aput v9, v14, v10

    .line 83
    .line 84
    aput v11, v14, v7

    .line 85
    .line 86
    invoke-static {v2, v12, v14}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object v14

    .line 90
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    neg-int v9, v9

    .line 95
    int-to-float v9, v9

    .line 96
    new-array v15, v8, [F

    .line 97
    .line 98
    aput v11, v15, v10

    .line 99
    .line 100
    aput v9, v15, v7

    .line 101
    .line 102
    invoke-static {v3, v12, v15}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 103
    .line 104
    .line 105
    move-result-object v15

    .line 106
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 107
    .line 108
    .line 109
    move-result v9

    .line 110
    neg-int v9, v9

    .line 111
    int-to-float v9, v9

    .line 112
    move/from16 p7, v7

    .line 113
    .line 114
    new-array v7, v8, [F

    .line 115
    .line 116
    aput v11, v7, v10

    .line 117
    .line 118
    aput v9, v7, p7

    .line 119
    .line 120
    invoke-static {v4, v12, v7}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 121
    .line 122
    .line 123
    move-result-object v16

    .line 124
    new-array v7, v8, [F

    .line 125
    .line 126
    fill-array-data v7, :array_0

    .line 127
    .line 128
    .line 129
    sget-object v9, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 130
    .line 131
    invoke-static {v5, v9, v7}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 132
    .line 133
    .line 134
    move-result-object v17

    .line 135
    new-array v7, v8, [F

    .line 136
    .line 137
    fill-array-data v7, :array_1

    .line 138
    .line 139
    .line 140
    invoke-static {v6, v9, v7}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 141
    .line 142
    .line 143
    move-result-object v18

    .line 144
    filled-new-array/range {v13 .. v18}, [Landroid/animation/Animator;

    .line 145
    .line 146
    .line 147
    move-result-object v7

    .line 148
    invoke-static {v7}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 149
    .line 150
    .line 151
    move-result-object v7

    .line 152
    const-wide/16 v8, 0x12c

    .line 153
    .line 154
    invoke-virtual {v7, v8, v9}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 155
    .line 156
    .line 157
    move-result-object v7

    .line 158
    iput-object v7, v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->animator:Landroid/animation/Animator;

    .line 159
    .line 160
    new-instance v8, Ll/yys;

    .line 161
    .line 162
    invoke-direct {v8, v1, v2, v5}, Ll/yys;-><init>(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;)V

    .line 163
    .line 164
    .line 165
    new-instance v1, Ll/zys;

    .line 166
    .line 167
    invoke-direct {v1, v3, v4, v6}, Ll/zys;-><init>(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;)V

    .line 168
    .line 169
    .line 170
    invoke-static {v7, v8, v1}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 171
    .line 172
    .line 173
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->animator:Landroid/animation/Animator;

    .line 174
    .line 175
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public m0(Ll/xys;)V
    .locals 14

    .line 1
    iget-boolean v0, p1, Ll/xys;->isFromLongLink:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->j0()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->currentIconPos:I

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->content:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/xys;->f()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserName:Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/xys;->e()Ll/xys$a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/xys$a;->b()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserName:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/xys;->d()Ll/xys$a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ll/xys$a;->b()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->currentIconPos:I

    .line 47
    .line 48
    const/4 v1, 0x2

    .line 49
    const/4 v2, 0x1

    .line 50
    if-ne v0, v2, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 55
    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 57
    .line 58
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 59
    .line 60
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon2:Lv/VDraweeView;

    .line 61
    .line 62
    iget-object v6, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon1:Lv/VDraweeView;

    .line 63
    .line 64
    iput v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->currentIconPos:I

    .line 65
    .line 66
    move-object v13, p1

    .line 67
    move-object v7, v0

    .line 68
    move-object v8, v2

    .line 69
    move-object v9, v3

    .line 70
    :goto_0
    move-object v10, v4

    .line 71
    move-object v11, v5

    .line 72
    move-object v12, v6

    .line 73
    move-object v6, p0

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 76
    .line 77
    if-ne v0, v1, :cond_2

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 82
    .line 83
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 84
    .line 85
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon1:Lv/VDraweeView;

    .line 86
    .line 87
    iget-object v6, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon2:Lv/VDraweeView;

    .line 88
    .line 89
    iput v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->currentIconPos:I

    .line 90
    .line 91
    move-object v13, p1

    .line 92
    move-object v8, v0

    .line 93
    move-object v9, v1

    .line 94
    move-object v7, v3

    .line 95
    goto :goto_0

    .line 96
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 97
    .line 98
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon1:Lv/VDraweeView;

    .line 99
    .line 100
    iput v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->currentIconPos:I

    .line 101
    .line 102
    const/4 v1, 0x0

    .line 103
    move-object v6, p0

    .line 104
    move-object v13, p1

    .line 105
    move-object v8, v0

    .line 106
    move-object v9, v1

    .line 107
    move-object v10, v9

    .line 108
    move-object v12, v10

    .line 109
    move-object v7, v3

    .line 110
    move-object v11, v5

    .line 111
    :goto_1
    invoke-virtual/range {v6 .. v13}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->l0(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Ll/xys;)V

    .line 112
    .line 113
    .line 114
    iget-object p0, v6, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->bg:Lv/VDraweeView;

    .line 115
    .line 116
    sget-object p1, Ll/zft;->m:Ljava/lang/String;

    .line 117
    .line 118
    const-string v0, "context_square"

    .line 119
    .line 120
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bnl0;->y0()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sget v1, Ll/qa00;->q:I

    .line 9
    .line 10
    sub-int/2addr v0, v1

    .line 11
    div-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    int-to-float v1, v0

    .line 14
    const/high16 v2, 0x43080000    # 136.0f

    .line 15
    .line 16
    mul-float/2addr v1, v2

    .line 17
    const/high16 v2, 0x43300000    # 176.0f

    .line 18
    .line 19
    div-float/2addr v1, v2

    .line 20
    float-to-int v1, v1

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 26
    .line 27
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 28
    .line 29
    invoke-virtual {p0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    sget v0, Ll/qa00;->i:I

    .line 33
    .line 34
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    sget v0, Ll/jdc0;->z:I

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Landroid/widget/TextView;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->content:Landroid/widget/TextView;

    .line 46
    .line 47
    sget v0, Ll/jdc0;->b0:I

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lv/VDraweeView;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 56
    .line 57
    sget v0, Ll/jdc0;->c0:I

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lv/VDraweeView;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 66
    .line 67
    sget v0, Ll/jdc0;->d0:I

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Landroid/widget/TextView;

    .line 74
    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->leftUserName:Landroid/widget/TextView;

    .line 76
    .line 77
    sget v0, Ll/jdc0;->C0:I

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lv/VDraweeView;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 86
    .line 87
    sget v0, Ll/jdc0;->D0:I

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lv/VDraweeView;

    .line 94
    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 96
    .line 97
    sget v0, Ll/jdc0;->E0:I

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Landroid/widget/TextView;

    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->rightUserName:Landroid/widget/TextView;

    .line 106
    .line 107
    sget v0, Ll/jdc0;->P:I

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Lv/VDraweeView;

    .line 114
    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon1:Lv/VDraweeView;

    .line 116
    .line 117
    sget v0, Ll/jdc0;->Q:I

    .line 118
    .line 119
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Lv/VDraweeView;

    .line 124
    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->giftIcon2:Lv/VDraweeView;

    .line 126
    .line 127
    sget v0, Ll/jdc0;->q:I

    .line 128
    .line 129
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Lv/VDraweeView;

    .line 134
    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveHonorGiftCardView;->bg:Lv/VDraweeView;

    .line 136
    .line 137
    return-void
.end method
