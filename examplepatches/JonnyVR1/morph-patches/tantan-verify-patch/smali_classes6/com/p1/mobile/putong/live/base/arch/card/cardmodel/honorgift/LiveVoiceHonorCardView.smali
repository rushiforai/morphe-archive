.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field private animator:Landroid/animation/Animator;

.field private bgImage:Lv/VDraweeView;

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

.field private titleImage:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->currentIconPos:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->currentIconPos:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->currentIconPos:I

    return-void
.end method

.method public static synthetic a(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;)V
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

.method public static synthetic b(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;)V
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


# virtual methods
.method public final c()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon1:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon2:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 57
    .line 58
    const/4 v1, 0x1

    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon1:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon2:Lv/VDraweeView;

    .line 83
    .line 84
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon1:Lv/VDraweeView;

    .line 88
    .line 89
    const/high16 v1, 0x3f800000    # 1.0f

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon2:Lv/VDraweeView;

    .line 95
    .line 96
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->animator:Landroid/animation/Animator;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->animator:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->animator:Landroid/animation/Animator;

    .line 15
    .line 16
    invoke-static {p0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final e(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Ll/xys;)V
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
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->animator:Landroid/animation/Animator;

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
    iput-object v7, v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->animator:Landroid/animation/Animator;

    .line 159
    .line 160
    new-instance v8, Ll/s6v;

    .line 161
    .line 162
    invoke-direct {v8, v1, v2, v5}, Ll/s6v;-><init>(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;)V

    .line 163
    .line 164
    .line 165
    new-instance v1, Ll/t6v;

    .line 166
    .line 167
    invoke-direct {v1, v3, v4, v6}, Ll/t6v;-><init>(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;)V

    .line 168
    .line 169
    .line 170
    invoke-static {v7, v8, v1}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 171
    .line 172
    .line 173
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->animator:Landroid/animation/Animator;

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

.method public f(Ll/xys;)V
    .locals 14

    .line 1
    iget-boolean v0, p1, Ll/xys;->isFromLongLink:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->c()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->currentIconPos:I

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->content:Landroid/widget/TextView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserName:Landroid/widget/TextView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserName:Landroid/widget/TextView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->bgImage:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/xys;->a()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v2, "context_square"

    .line 53
    .line 54
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->titleImage:Lv/VDraweeView;

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/xys;->i()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->currentIconPos:I

    .line 67
    .line 68
    const/4 v1, 0x2

    .line 69
    const/4 v2, 0x1

    .line 70
    if-ne v0, v2, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 75
    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 77
    .line 78
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 79
    .line 80
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon2:Lv/VDraweeView;

    .line 81
    .line 82
    iget-object v6, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon1:Lv/VDraweeView;

    .line 83
    .line 84
    iput v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->currentIconPos:I

    .line 85
    .line 86
    move-object v13, p1

    .line 87
    move-object v7, v0

    .line 88
    move-object v8, v2

    .line 89
    move-object v9, v3

    .line 90
    :goto_0
    move-object v10, v4

    .line 91
    move-object v11, v5

    .line 92
    move-object v12, v6

    .line 93
    move-object v6, p0

    .line 94
    goto :goto_1

    .line 95
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 96
    .line 97
    if-ne v0, v1, :cond_2

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 102
    .line 103
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 104
    .line 105
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon1:Lv/VDraweeView;

    .line 106
    .line 107
    iget-object v6, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon2:Lv/VDraweeView;

    .line 108
    .line 109
    iput v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->currentIconPos:I

    .line 110
    .line 111
    move-object v13, p1

    .line 112
    move-object v8, v0

    .line 113
    move-object v9, v1

    .line 114
    move-object v7, v3

    .line 115
    goto :goto_0

    .line 116
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 117
    .line 118
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon1:Lv/VDraweeView;

    .line 119
    .line 120
    iput v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->currentIconPos:I

    .line 121
    .line 122
    const/4 v1, 0x0

    .line 123
    move-object v6, p0

    .line 124
    move-object v13, p1

    .line 125
    move-object v8, v0

    .line 126
    move-object v9, v1

    .line 127
    move-object v10, v9

    .line 128
    move-object v12, v10

    .line 129
    move-object v7, v3

    .line 130
    move-object v11, v5

    .line 131
    :goto_1
    invoke-virtual/range {v6 .. v13}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->e(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Ll/xys;)V

    .line 132
    .line 133
    .line 134
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
    sget v1, Ll/qa00;->m:I

    .line 9
    .line 10
    sub-int/2addr v0, v1

    .line 11
    mul-int/lit8 v1, v0, 0x52

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    const v2, 0x43b38000    # 359.0f

    .line 15
    .line 16
    .line 17
    div-float/2addr v1, v2

    .line 18
    float-to-int v1, v1

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 24
    .line 25
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    sget v0, Ll/qa00;->i:I

    .line 31
    .line 32
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 33
    .line 34
    .line 35
    sget v0, Ll/jdc0;->z:I

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/widget/TextView;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->content:Landroid/widget/TextView;

    .line 44
    .line 45
    sget v0, Ll/jdc0;->b0:I

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lv/VDraweeView;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon1:Lv/VDraweeView;

    .line 54
    .line 55
    sget v0, Ll/jdc0;->c0:I

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lv/VDraweeView;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserIcon2:Lv/VDraweeView;

    .line 64
    .line 65
    sget v0, Ll/jdc0;->d0:I

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Landroid/widget/TextView;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->leftUserName:Landroid/widget/TextView;

    .line 74
    .line 75
    sget v0, Ll/jdc0;->C0:I

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lv/VDraweeView;

    .line 82
    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon1:Lv/VDraweeView;

    .line 84
    .line 85
    sget v0, Ll/jdc0;->D0:I

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lv/VDraweeView;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserIcon2:Lv/VDraweeView;

    .line 94
    .line 95
    sget v0, Ll/jdc0;->E0:I

    .line 96
    .line 97
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Landroid/widget/TextView;

    .line 102
    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->rightUserName:Landroid/widget/TextView;

    .line 104
    .line 105
    sget v0, Ll/jdc0;->P:I

    .line 106
    .line 107
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Lv/VDraweeView;

    .line 112
    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon1:Lv/VDraweeView;

    .line 114
    .line 115
    sget v0, Ll/jdc0;->Q:I

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Lv/VDraweeView;

    .line 122
    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->giftIcon2:Lv/VDraweeView;

    .line 124
    .line 125
    sget v0, Ll/jdc0;->q:I

    .line 126
    .line 127
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Lv/VDraweeView;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->bgImage:Lv/VDraweeView;

    .line 134
    .line 135
    sget v0, Ll/jdc0;->a1:I

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Lv/VDraweeView;

    .line 142
    .line 143
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->titleImage:Lv/VDraweeView;

    .line 144
    .line 145
    return-void
.end method
