.class public Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;
.super Landroid/widget/HorizontalScrollView;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/HorizontalScrollView;",
        "Ll/iam<",
        "Ll/u0m0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Ll/u0m0;

.field public c:Landroid/widget/LinearLayout$LayoutParams;

.field public d:Landroid/view/LayoutInflater;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;",
            ">;"
        }
    .end annotation
.end field

.field public f:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->e:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->e:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->e:Ljava/util/List;

    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lv/VText;Ljava/lang/String;Lv/VText;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    invoke-static {p2, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->type:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lv/VText;Lv/VText;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    const/high16 v0, 0x41400000    # 12.0f

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/a1m0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Ll/u0m0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->b:Ll/u0m0;

    .line 2
    .line 3
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 4
    .line 5
    const/4 v0, -0x2

    .line 6
    const/4 v1, -0x1

    .line 7
    invoke-direct {p1, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->c:Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    sget v0, Ll/qa00;->j:I

    .line 13
    .line 14
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->d:Landroid/view/LayoutInflater;

    .line 25
    .line 26
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/u0m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->i(Ll/u0m0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final j(Landroid/view/LayoutInflater;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;)Landroid/view/View;
    .locals 3

    .line 1
    sget v0, Ll/yec0;->E6:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget v0, Ll/mdc0;->N:I

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lv/VDraweeView;

    .line 15
    .line 16
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->icon:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "context_livingAct"

    .line 19
    .line 20
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget v0, Ll/mdc0;->O:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lv/VText;

    .line 30
    .line 31
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->title:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/x0m0;

    .line 37
    .line 38
    invoke-direct {v0, p0, p2}, Ll/x0m0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    return-object p1
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->b:Ll/u0m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u0m0;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final l(Lv/VText;Lv/VText;Ll/x20;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/16 v1, 0x1f4

    .line 4
    .line 5
    invoke-static {v1}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x2

    .line 10
    new-array v10, v2, [F

    .line 11
    .line 12
    fill-array-data v10, :array_0

    .line 13
    .line 14
    .line 15
    sget-object v12, Landroid/widget/HorizontalScrollView;->TRANSLATION_Y:Landroid/util/Property;

    .line 16
    .line 17
    const-wide/16 v5, 0x0

    .line 18
    .line 19
    const-wide/16 v17, 0x1f4

    .line 20
    .line 21
    const/4 v9, 0x0

    .line 22
    move-object/from16 v3, p1

    .line 23
    .line 24
    move-object v4, v12

    .line 25
    move-wide/from16 v7, v17

    .line 26
    .line 27
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    new-array v3, v2, [F

    .line 32
    .line 33
    fill-array-data v3, :array_1

    .line 34
    .line 35
    .line 36
    sget-object v14, Landroid/widget/HorizontalScrollView;->ALPHA:Landroid/util/Property;

    .line 37
    .line 38
    const-wide/16 v15, 0x0

    .line 39
    .line 40
    const/16 v19, 0x0

    .line 41
    .line 42
    move-object/from16 v13, p1

    .line 43
    .line 44
    move-object/from16 v20, v3

    .line 45
    .line 46
    invoke-static/range {v13 .. v20}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    move-object v4, v14

    .line 51
    new-array v6, v2, [F

    .line 52
    .line 53
    fill-array-data v6, :array_2

    .line 54
    .line 55
    .line 56
    const-wide/16 v13, 0xc8

    .line 57
    .line 58
    move-wide/from16 v15, v17

    .line 59
    .line 60
    const/16 v17, 0x0

    .line 61
    .line 62
    move-object/from16 v11, p2

    .line 63
    .line 64
    move-object/from16 v18, v6

    .line 65
    .line 66
    invoke-static/range {v11 .. v18}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    move-wide/from16 v17, v15

    .line 71
    .line 72
    new-array v2, v2, [F

    .line 73
    .line 74
    fill-array-data v2, :array_3

    .line 75
    .line 76
    .line 77
    const-wide/16 v15, 0xc8

    .line 78
    .line 79
    move-object/from16 v13, p2

    .line 80
    .line 81
    move-object/from16 v20, v2

    .line 82
    .line 83
    move-object v14, v4

    .line 84
    invoke-static/range {v13 .. v20}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    new-instance v4, Ll/y0m0;

    .line 89
    .line 90
    move-object/from16 v13, p1

    .line 91
    .line 92
    invoke-direct {v4, v13, v11}, Ll/y0m0;-><init>(Lv/VText;Lv/VText;)V

    .line 93
    .line 94
    .line 95
    new-instance v7, Ll/z0m0;

    .line 96
    .line 97
    invoke-direct {v7}, Ll/z0m0;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-static {v3, v4, v7}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 104
    .line 105
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 106
    .line 107
    .line 108
    iput-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->f:Landroid/animation/AnimatorSet;

    .line 109
    .line 110
    filled-new-array {v5, v3, v6, v2}, [Landroid/animation/Animator;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    filled-new-array {v1, v2}, [Landroid/animation/Animator;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v4, v1}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 123
    .line 124
    .line 125
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->f:Landroid/animation/AnimatorSet;

    .line 126
    .line 127
    invoke-static/range {p3 .. p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    new-instance v2, Ll/bri0;

    .line 131
    .line 132
    move-object/from16 v3, p3

    .line 133
    .line 134
    invoke-direct {v2, v3}, Ll/bri0;-><init>(Ll/x20;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 138
    .line 139
    .line 140
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->f:Landroid/animation/AnimatorSet;

    .line 141
    .line 142
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    nop

    .line 147
    :array_0
    .array-data 4
        0x0
        -0x3ec00000    # -12.0f
    .end array-data

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    :array_2
    .array-data 4
        0x41400000    # 12.0f
        0x0
    .end array-data

    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final m(Lv/VText;Lv/VText;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    new-instance p3, Ll/w0m0;

    .line 11
    .line 12
    invoke-direct {p3, p1, p4, p2}, Ll/w0m0;-><init>(Lv/VText;Ljava/lang/String;Lv/VText;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->l(Lv/VText;Lv/VText;Ll/x20;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public n(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->e:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v0, v2

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    move v0, v1

    .line 21
    :goto_1
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->e:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->e:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eq v0, v3, :cond_2

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_2
    move v1, v2

    .line 46
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->e:Ljava/util/List;

    .line 47
    .line 48
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_5

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    goto :goto_4

    .line 57
    :cond_3
    :goto_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-ge v2, v0, :cond_6

    .line 62
    .line 63
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->e:Ljava/util/List;

    .line 70
    .line 71
    new-instance v3, Ll/v0m0;

    .line 72
    .line 73
    invoke-direct {v3, v0}, Ll/v0m0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;

    .line 81
    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->a:Lv/VLinear;

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    if-eqz v1, :cond_4

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->a:Lv/VLinear;

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    sget v3, Ll/mdc0;->O:I

    .line 99
    .line 100
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    check-cast v1, Lv/VText;

    .line 105
    .line 106
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->a:Lv/VLinear;

    .line 107
    .line 108
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    sget v4, Ll/mdc0;->P:I

    .line 113
    .line 114
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    check-cast v3, Lv/VText;

    .line 119
    .line 120
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->title:Ljava/lang/String;

    .line 121
    .line 122
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;

    .line 127
    .line 128
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->title:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {p0, v1, v3, v0, v4}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->m(Lv/VText;Lv/VText;Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_5
    :goto_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->a:Lv/VLinear;

    .line 137
    .line 138
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 139
    .line 140
    .line 141
    :goto_5
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-ge v2, v0, :cond_6

    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->a:Lv/VLinear;

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->d:Landroid/view/LayoutInflater;

    .line 150
    .line 151
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;

    .line 156
    .line 157
    invoke-virtual {p0, v1, v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->j(Landroid/view/LayoutInflater;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->c:Landroid/widget/LinearLayout$LayoutParams;

    .line 162
    .line 163
    invoke-virtual {v0, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 164
    .line 165
    .line 166
    add-int/lit8 v2, v2, 0x1

    .line 167
    .line 168
    goto :goto_5

    .line 169
    :cond_6
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->e:Ljava/util/List;

    .line 170
    .line 171
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->f:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->f:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->f:Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
