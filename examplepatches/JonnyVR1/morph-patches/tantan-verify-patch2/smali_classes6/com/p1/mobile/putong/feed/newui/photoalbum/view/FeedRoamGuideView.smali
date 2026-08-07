.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VText;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lv/VDraweeView;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:Landroid/animation/Animator;

.field public q:Lv/VDraweeView;

.field public r:Lv/VDraweeView;

.field public s:Lv/VDraweeView;

.field public t:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->j:Ljava/util/List;

    .line 17
    .line 18
    const/high16 p1, 0x41d00000    # 26.0f

    .line 19
    .line 20
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->k:I

    .line 25
    .line 26
    const/high16 p1, 0x41500000    # 13.0f

    .line 27
    .line 28
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->l:I

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->m:I

    .line 36
    .line 37
    const/high16 p1, 0x40e00000    # 7.0f

    .line 38
    .line 39
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->n:I

    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 47
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 48
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->j:Ljava/util/List;

    const/high16 p1, 0x41d00000    # 26.0f

    .line 49
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->k:I

    const/high16 p1, 0x41500000    # 13.0f

    .line 50
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->l:I

    const/4 p1, 0x0

    .line 51
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->m:I

    const/high16 p1, 0x40e00000    # 7.0f

    .line 52
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->n:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 53
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 55
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->j:Ljava/util/List;

    const/high16 p1, 0x41d00000    # 26.0f

    .line 56
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->k:I

    const/high16 p1, 0x41500000    # 13.0f

    .line 57
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->l:I

    const/4 p1, 0x0

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->m:I

    const/high16 p1, 0x40e00000    # 7.0f

    .line 59
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->n:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->h()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i()V

    return-void
.end method

.method private getNextUserIconUrl()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->j:Ljava/util/List;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->o:I

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/String;

    .line 10
    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->o:I

    .line 12
    .line 13
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->o:I

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->j:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    rem-int/2addr v1, v2

    .line 24
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->o:I

    .line 25
    .line 26
    return-object v0
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/myh;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->h:Lv/VDraweeView;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->q:Lv/VDraweeView;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->g:Lv/VDraweeView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->r:Lv/VDraweeView;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->f:Lv/VDraweeView;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->s:Lv/VDraweeView;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->e:Lv/VDraweeView;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->t:Lv/VDraweeView;

    .line 20
    .line 21
    new-instance v0, Ll/kyh;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/kyh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final e()Landroid/animation/Animator;
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->q:Lv/VDraweeView;

    .line 4
    .line 5
    const/4 v9, 0x2

    .line 6
    new-array v8, v9, [F

    .line 7
    .line 8
    fill-array-data v8, :array_0

    .line 9
    .line 10
    .line 11
    sget-object v2, Landroid/widget/FrameLayout;->ALPHA:Landroid/util/Property;

    .line 12
    .line 13
    const-wide/16 v3, 0x0

    .line 14
    .line 15
    const-wide/16 v5, 0x258

    .line 16
    .line 17
    const/4 v7, 0x0

    .line 18
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v10, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->q:Lv/VDraweeView;

    .line 23
    .line 24
    new-array v3, v9, [F

    .line 25
    .line 26
    fill-array-data v3, :array_1

    .line 27
    .line 28
    .line 29
    sget-object v11, Landroid/widget/FrameLayout;->SCALE_X:Landroid/util/Property;

    .line 30
    .line 31
    const-wide/16 v12, 0x0

    .line 32
    .line 33
    const-wide/16 v14, 0x258

    .line 34
    .line 35
    const/16 v16, 0x0

    .line 36
    .line 37
    move-object/from16 v17, v3

    .line 38
    .line 39
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    move-object v4, v11

    .line 44
    iget-object v10, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->q:Lv/VDraweeView;

    .line 45
    .line 46
    new-array v5, v9, [F

    .line 47
    .line 48
    fill-array-data v5, :array_2

    .line 49
    .line 50
    .line 51
    sget-object v11, Landroid/widget/FrameLayout;->SCALE_Y:Landroid/util/Property;

    .line 52
    .line 53
    move-object/from16 v17, v5

    .line 54
    .line 55
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    move-object v6, v11

    .line 60
    iget-object v10, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->q:Lv/VDraweeView;

    .line 61
    .line 62
    invoke-virtual {v10}, Landroid/view/View;->getTranslationX()F

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    iget-object v8, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->q:Lv/VDraweeView;

    .line 67
    .line 68
    invoke-virtual {v8}, Landroid/view/View;->getTranslationX()F

    .line 69
    .line 70
    .line 71
    move-result v8

    .line 72
    iget v11, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->n:I

    .line 73
    .line 74
    int-to-float v11, v11

    .line 75
    sub-float/2addr v8, v11

    .line 76
    new-array v11, v9, [F

    .line 77
    .line 78
    const/16 v19, 0x0

    .line 79
    .line 80
    aput v7, v11, v19

    .line 81
    .line 82
    const/4 v7, 0x1

    .line 83
    aput v8, v11, v7

    .line 84
    .line 85
    sget-object v21, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 86
    .line 87
    move-object/from16 v17, v11

    .line 88
    .line 89
    move-object/from16 v11, v21

    .line 90
    .line 91
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    iget-object v10, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->r:Lv/VDraweeView;

    .line 96
    .line 97
    invoke-virtual {v10}, Landroid/view/View;->getTranslationX()F

    .line 98
    .line 99
    .line 100
    move-result v11

    .line 101
    iget-object v12, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->r:Lv/VDraweeView;

    .line 102
    .line 103
    invoke-virtual {v12}, Landroid/view/View;->getTranslationX()F

    .line 104
    .line 105
    .line 106
    move-result v12

    .line 107
    iget v13, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->l:I

    .line 108
    .line 109
    int-to-float v13, v13

    .line 110
    sub-float/2addr v12, v13

    .line 111
    new-array v13, v9, [F

    .line 112
    .line 113
    aput v11, v13, v19

    .line 114
    .line 115
    aput v12, v13, v7

    .line 116
    .line 117
    const-wide/16 v22, 0x64

    .line 118
    .line 119
    const-wide/16 v24, 0x258

    .line 120
    .line 121
    const/16 v26, 0x0

    .line 122
    .line 123
    move-object/from16 v20, v10

    .line 124
    .line 125
    move-object/from16 v27, v13

    .line 126
    .line 127
    invoke-static/range {v20 .. v27}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 128
    .line 129
    .line 130
    move-result-object v28

    .line 131
    iget-object v10, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->s:Lv/VDraweeView;

    .line 132
    .line 133
    invoke-virtual {v10}, Landroid/view/View;->getTranslationX()F

    .line 134
    .line 135
    .line 136
    move-result v11

    .line 137
    iget-object v12, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->s:Lv/VDraweeView;

    .line 138
    .line 139
    invoke-virtual {v12}, Landroid/view/View;->getTranslationX()F

    .line 140
    .line 141
    .line 142
    move-result v12

    .line 143
    iget v13, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->l:I

    .line 144
    .line 145
    int-to-float v13, v13

    .line 146
    sub-float/2addr v12, v13

    .line 147
    new-array v13, v9, [F

    .line 148
    .line 149
    aput v11, v13, v19

    .line 150
    .line 151
    aput v12, v13, v7

    .line 152
    .line 153
    move-object/from16 v20, v10

    .line 154
    .line 155
    move-object/from16 v27, v13

    .line 156
    .line 157
    invoke-static/range {v20 .. v27}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 158
    .line 159
    .line 160
    move-result-object v29

    .line 161
    iget-object v10, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->t:Lv/VDraweeView;

    .line 162
    .line 163
    new-array v11, v9, [F

    .line 164
    .line 165
    fill-array-data v11, :array_3

    .line 166
    .line 167
    .line 168
    const-wide/16 v12, 0x64

    .line 169
    .line 170
    move-object/from16 v17, v11

    .line 171
    .line 172
    move-object v11, v2

    .line 173
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    iget-object v11, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->t:Lv/VDraweeView;

    .line 178
    .line 179
    new-array v10, v9, [F

    .line 180
    .line 181
    fill-array-data v10, :array_4

    .line 182
    .line 183
    .line 184
    const-wide/16 v13, 0x64

    .line 185
    .line 186
    const-wide/16 v15, 0x258

    .line 187
    .line 188
    const/16 v17, 0x0

    .line 189
    .line 190
    move-object v12, v4

    .line 191
    move-object/from16 v18, v10

    .line 192
    .line 193
    invoke-static/range {v11 .. v18}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    iget-object v11, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->t:Lv/VDraweeView;

    .line 198
    .line 199
    new-array v10, v9, [F

    .line 200
    .line 201
    fill-array-data v10, :array_5

    .line 202
    .line 203
    .line 204
    move-object v12, v6

    .line 205
    move-object/from16 v18, v10

    .line 206
    .line 207
    invoke-static/range {v11 .. v18}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 208
    .line 209
    .line 210
    move-result-object v18

    .line 211
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->t:Lv/VDraweeView;

    .line 212
    .line 213
    iget v10, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->n:I

    .line 214
    .line 215
    int-to-float v10, v10

    .line 216
    iget v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->m:I

    .line 217
    .line 218
    int-to-float v0, v0

    .line 219
    new-array v9, v9, [F

    .line 220
    .line 221
    aput v10, v9, v19

    .line 222
    .line 223
    aput v0, v9, v7

    .line 224
    .line 225
    move-object/from16 v20, v6

    .line 226
    .line 227
    move-object/from16 v27, v9

    .line 228
    .line 229
    invoke-static/range {v20 .. v27}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 230
    .line 231
    .line 232
    move-result-object v19

    .line 233
    move-object v10, v1

    .line 234
    move-object/from16 v16, v2

    .line 235
    .line 236
    move-object v11, v3

    .line 237
    move-object/from16 v17, v4

    .line 238
    .line 239
    move-object v12, v5

    .line 240
    move-object v13, v8

    .line 241
    move-object/from16 v14, v28

    .line 242
    .line 243
    move-object/from16 v15, v29

    .line 244
    .line 245
    filled-new-array/range {v10 .. v19}, [Landroid/animation/Animator;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    return-object v0

    .line 254
    nop

    .line 255
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f666666    # 0.9f
    .end array-data

    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x3f666666    # 0.9f
    .end array-data

    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    :array_4
    .array-data 4
        0x3f666666    # 0.9f
        0x3f800000    # 1.0f
    .end array-data

    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    :array_5
    .array-data 4
        0x3f666666    # 0.9f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final f()V
    .locals 5

    .line 1
    invoke-static {}, Ll/ksg;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 6
    .line 7
    const-string v2, "/"

    .line 8
    .line 9
    const-string v3, "res://"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    sget v4, Ll/lbc0;->t4:I

    .line 33
    .line 34
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 45
    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    sget v4, Ll/lbc0;->u4:I

    .line 66
    .line 67
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 78
    .line 79
    new-instance v1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    sget v4, Ll/lbc0;->v4:I

    .line 99
    .line 100
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 111
    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    sget v4, Ll/lbc0;->w4:I

    .line 132
    .line 133
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 144
    .line 145
    new-instance v1, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    sget v4, Ll/lbc0;->x4:I

    .line 165
    .line 166
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 177
    .line 178
    new-instance v1, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    sget v4, Ll/lbc0;->y4:I

    .line 198
    .line 199
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 210
    .line 211
    new-instance v1, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 217
    .line 218
    .line 219
    move-result-object v4

    .line 220
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v4

    .line 224
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    sget v4, Ll/lbc0;->z4:I

    .line 231
    .line 232
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 243
    .line 244
    new-instance v1, Ljava/lang/StringBuilder;

    .line 245
    .line 246
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v4

    .line 257
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    sget v4, Ll/lbc0;->A4:I

    .line 264
    .line 265
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 276
    .line 277
    new-instance v1, Ljava/lang/StringBuilder;

    .line 278
    .line 279
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 283
    .line 284
    .line 285
    move-result-object v4

    .line 286
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v4

    .line 290
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    sget v4, Ll/lbc0;->B4:I

    .line 297
    .line 298
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 309
    .line 310
    new-instance v1, Ljava/lang/StringBuilder;

    .line 311
    .line 312
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    sget v2, Ll/lbc0;->C4:I

    .line 330
    .line 331
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    goto/16 :goto_0

    .line 342
    .line 343
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 344
    .line 345
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 349
    .line 350
    .line 351
    move-result-object v4

    .line 352
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v4

    .line 356
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    sget v4, Ll/lbc0;->D4:I

    .line 363
    .line 364
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 375
    .line 376
    new-instance v1, Ljava/lang/StringBuilder;

    .line 377
    .line 378
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 382
    .line 383
    .line 384
    move-result-object v4

    .line 385
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v4

    .line 389
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    sget v4, Ll/lbc0;->E4:I

    .line 396
    .line 397
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v1

    .line 404
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 405
    .line 406
    .line 407
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 408
    .line 409
    new-instance v1, Ljava/lang/StringBuilder;

    .line 410
    .line 411
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 412
    .line 413
    .line 414
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 415
    .line 416
    .line 417
    move-result-object v4

    .line 418
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object v4

    .line 422
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    .line 427
    .line 428
    sget v4, Ll/lbc0;->F4:I

    .line 429
    .line 430
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object v1

    .line 437
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 438
    .line 439
    .line 440
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 441
    .line 442
    new-instance v1, Ljava/lang/StringBuilder;

    .line 443
    .line 444
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 445
    .line 446
    .line 447
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 448
    .line 449
    .line 450
    move-result-object v4

    .line 451
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object v4

    .line 455
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    sget v4, Ll/lbc0;->G4:I

    .line 462
    .line 463
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v1

    .line 470
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 471
    .line 472
    .line 473
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 474
    .line 475
    new-instance v1, Ljava/lang/StringBuilder;

    .line 476
    .line 477
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 481
    .line 482
    .line 483
    move-result-object v4

    .line 484
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object v4

    .line 488
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 489
    .line 490
    .line 491
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    sget v4, Ll/lbc0;->H4:I

    .line 495
    .line 496
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 497
    .line 498
    .line 499
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v1

    .line 503
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 504
    .line 505
    .line 506
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 507
    .line 508
    new-instance v1, Ljava/lang/StringBuilder;

    .line 509
    .line 510
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 511
    .line 512
    .line 513
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 514
    .line 515
    .line 516
    move-result-object v4

    .line 517
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v4

    .line 521
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 522
    .line 523
    .line 524
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 525
    .line 526
    .line 527
    sget v4, Ll/lbc0;->I4:I

    .line 528
    .line 529
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object v1

    .line 536
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 537
    .line 538
    .line 539
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 540
    .line 541
    new-instance v1, Ljava/lang/StringBuilder;

    .line 542
    .line 543
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 544
    .line 545
    .line 546
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 547
    .line 548
    .line 549
    move-result-object v4

    .line 550
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 551
    .line 552
    .line 553
    move-result-object v4

    .line 554
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    .line 556
    .line 557
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 558
    .line 559
    .line 560
    sget v4, Ll/lbc0;->J4:I

    .line 561
    .line 562
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 563
    .line 564
    .line 565
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 566
    .line 567
    .line 568
    move-result-object v1

    .line 569
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 570
    .line 571
    .line 572
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 573
    .line 574
    new-instance v1, Ljava/lang/StringBuilder;

    .line 575
    .line 576
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 577
    .line 578
    .line 579
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 580
    .line 581
    .line 582
    move-result-object v4

    .line 583
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 584
    .line 585
    .line 586
    move-result-object v4

    .line 587
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 588
    .line 589
    .line 590
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 591
    .line 592
    .line 593
    sget v4, Ll/lbc0;->K4:I

    .line 594
    .line 595
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 596
    .line 597
    .line 598
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 599
    .line 600
    .line 601
    move-result-object v1

    .line 602
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 603
    .line 604
    .line 605
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 606
    .line 607
    new-instance v1, Ljava/lang/StringBuilder;

    .line 608
    .line 609
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 610
    .line 611
    .line 612
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 613
    .line 614
    .line 615
    move-result-object v4

    .line 616
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 617
    .line 618
    .line 619
    move-result-object v4

    .line 620
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 621
    .line 622
    .line 623
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 624
    .line 625
    .line 626
    sget v4, Ll/lbc0;->L4:I

    .line 627
    .line 628
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 629
    .line 630
    .line 631
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 632
    .line 633
    .line 634
    move-result-object v1

    .line 635
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 636
    .line 637
    .line 638
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 639
    .line 640
    new-instance v1, Ljava/lang/StringBuilder;

    .line 641
    .line 642
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 643
    .line 644
    .line 645
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 646
    .line 647
    .line 648
    move-result-object v3

    .line 649
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 650
    .line 651
    .line 652
    move-result-object v3

    .line 653
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 654
    .line 655
    .line 656
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 657
    .line 658
    .line 659
    sget v2, Ll/lbc0;->M4:I

    .line 660
    .line 661
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 662
    .line 663
    .line 664
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 665
    .line 666
    .line 667
    move-result-object v1

    .line 668
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 669
    .line 670
    .line 671
    :goto_0
    const/16 v0, 0xa

    .line 672
    .line 673
    :goto_1
    const/4 v1, 0x5

    .line 674
    if-le v0, v1, :cond_1

    .line 675
    .line 676
    new-instance v1, Ljava/util/Random;

    .line 677
    .line 678
    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 679
    .line 680
    .line 681
    invoke-virtual {v1, v0}, Ljava/util/Random;->nextInt(I)I

    .line 682
    .line 683
    .line 684
    move-result v1

    .line 685
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 686
    .line 687
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 688
    .line 689
    .line 690
    move-result-object v2

    .line 691
    check-cast v2, Ljava/lang/String;

    .line 692
    .line 693
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->i:Ljava/util/List;

    .line 694
    .line 695
    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 696
    .line 697
    .line 698
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->j:Ljava/util/List;

    .line 699
    .line 700
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 701
    .line 702
    .line 703
    add-int/lit8 v0, v0, -0x1

    .line 704
    .line 705
    goto :goto_1

    .line 706
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->g()V

    .line 707
    .line 708
    .line 709
    return-void
.end method

.method public final g()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->h:Lv/VDraweeView;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->k:I

    .line 4
    .line 5
    neg-int v1, v1

    .line 6
    int-to-float v1, v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->h:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->getNextUserIconUrl()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->g:Lv/VDraweeView;

    .line 22
    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->l:I

    .line 24
    .line 25
    neg-int v1, v1

    .line 26
    int-to-float v1, v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->g:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->getNextUserIconUrl()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->f:Lv/VDraweeView;

    .line 42
    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->m:I

    .line 44
    .line 45
    neg-int v1, v1

    .line 46
    int-to-float v1, v1

    .line 47
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 48
    .line 49
    .line 50
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->f:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->getNextUserIconUrl()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->e:Lv/VDraweeView;

    .line 62
    .line 63
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->m:I

    .line 64
    .line 65
    neg-int v1, v1

    .line 66
    int-to-float v1, v1

    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 68
    .line 69
    .line 70
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->e:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->getNextUserIconUrl()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->e:Lv/VDraweeView;

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->f:Lv/VDraweeView;

    .line 87
    .line 88
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->g:Lv/VDraweeView;

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->h:Lv/VDraweeView;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->bringToFront()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final synthetic h()V
    .locals 2

    .line 1
    const-wide/16 v0, 0xc8

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->k(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->q:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->r:Lv/VDraweeView;

    .line 4
    .line 5
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->q:Lv/VDraweeView;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->s:Lv/VDraweeView;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->r:Lv/VDraweeView;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->t:Lv/VDraweeView;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->s:Lv/VDraweeView;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->t:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->s:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/view/View;->bringToFront()V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->r:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/view/View;->bringToFront()V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->q:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/view/View;->bringToFront()V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->t:Lv/VDraweeView;

    .line 36
    .line 37
    const/high16 v2, 0x3f800000    # 1.0f

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/view/View;->setScaleX(F)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->t:Lv/VDraweeView;

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/view/View;->setScaleY(F)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->t:Lv/VDraweeView;

    .line 48
    .line 49
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->m:I

    .line 50
    .line 51
    int-to-float v3, v3

    .line 52
    invoke-virtual {v1, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->t:Lv/VDraweeView;

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 58
    .line 59
    .line 60
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->getNextUserIconUrl()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v1, v0, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    const-wide/16 v0, 0x7d0

    .line 76
    .line 77
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->k(J)V

    .line 78
    .line 79
    .line 80
    :cond_0
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_2

    .line 7
    .line 8
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v1, 0x4

    .line 26
    if-gt v0, v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p2, "\u2026"

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    :goto_0
    const-string p2, " \u00b7 \u5207\u6362\u5b9a\u4f4d\u63a2\u7d22\u5404\u5730\u52a8\u6001"

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    :goto_1
    const-string p2, "\u5207\u6362\u5b9a\u4f4d\u63a2\u7d22\u5404\u5730\u52a8\u6001"

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->c:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    const/4 v0, 0x1

    .line 63
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 64
    .line 65
    .line 66
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->c:Lv/VText;

    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->d()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final k(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->e()Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

    .line 27
    .line 28
    new-instance v1, Ll/lyh;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/lyh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

    .line 37
    .line 38
    invoke-virtual {v0, p1, p2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->p:Landroid/animation/Animator;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->g()V

    .line 26
    .line 27
    .line 28
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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->f()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
