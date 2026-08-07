.class public Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VDraweeView;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/kcg0;

.field public final d:[F

.field public e:Landroid/animation/Animator;

.field public f:F

.field public g:Ljava/lang/String;

.field public h:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 17
    .line 18
    const/4 p1, 0x3

    .line 19
    new-array p1, p1, [F

    .line 20
    .line 21
    fill-array-data p1, :array_0

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->d:[F

    .line 25
    .line 26
    new-instance p1, Landroid/graphics/Path;

    .line 27
    .line 28
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->h:Landroid/graphics/Path;

    .line 32
    .line 33
    return-void

    .line 34
    nop

    .line 35
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
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

    .line 35
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->a:Ljava/util/List;

    .line 37
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    const/4 p1, 0x3

    .line 38
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->d:[F

    .line 39
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->h:Landroid/graphics/Path;

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
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

    .line 40
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->a:Ljava/util/List;

    .line 42
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    const/4 p1, 0x3

    .line 43
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->d:[F

    .line 44
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->h:Landroid/graphics/Path;

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->g(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->f(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->a:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic f(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->g:Ljava/lang/String;

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->f:F

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->j(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method public final synthetic g(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget v1, Ll/qa00;->a:I

    .line 4
    .line 5
    new-instance v8, Ll/xjg;

    .line 6
    .line 7
    invoke-direct {v8}, Ll/xjg;-><init>()V

    .line 8
    .line 9
    .line 10
    sget v1, Ll/qa00;->B:I

    .line 11
    .line 12
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 13
    .line 14
    const/4 v10, 0x0

    .line 15
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroid/view/View;

    .line 20
    .line 21
    const/high16 v3, 0x41f00000    # 30.0f

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Landroid/view/View;->setZ(F)V

    .line 24
    .line 25
    .line 26
    sget v11, Ll/qa00;->d:I

    .line 27
    .line 28
    int-to-float v3, v11

    .line 29
    const/4 v12, 0x2

    .line 30
    new-array v9, v12, [F

    .line 31
    .line 32
    const/4 v13, 0x0

    .line 33
    aput v13, v9, v10

    .line 34
    .line 35
    const/4 v14, 0x1

    .line 36
    aput v3, v9, v14

    .line 37
    .line 38
    const-string v3, "translationX"

    .line 39
    .line 40
    const-wide/16 v4, 0x0

    .line 41
    .line 42
    const-wide/16 v6, 0xfa

    .line 43
    .line 44
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object v15

    .line 48
    int-to-float v3, v11

    .line 49
    new-array v9, v12, [F

    .line 50
    .line 51
    aput v13, v9, v10

    .line 52
    .line 53
    aput v3, v9, v14

    .line 54
    .line 55
    const-string v3, "translationY"

    .line 56
    .line 57
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    new-array v9, v12, [F

    .line 62
    .line 63
    fill-array-data v9, :array_0

    .line 64
    .line 65
    .line 66
    move-object v4, v3

    .line 67
    const-string v3, "alpha"

    .line 68
    .line 69
    move-object v6, v4

    .line 70
    const-wide/16 v4, 0x0

    .line 71
    .line 72
    move-object/from16 v16, v6

    .line 73
    .line 74
    const-wide/16 v6, 0xfa

    .line 75
    .line 76
    move/from16 v17, v10

    .line 77
    .line 78
    move-object/from16 v10, v16

    .line 79
    .line 80
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    filled-new-array {v15, v10, v2}, [Landroid/animation/Animator;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object v10

    .line 92
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v2, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    check-cast v2, Landroid/view/View;

    .line 99
    .line 100
    const/high16 v3, 0x41a00000    # 20.0f

    .line 101
    .line 102
    invoke-virtual {v2, v3}, Landroid/view/View;->setZ(F)V

    .line 103
    .line 104
    .line 105
    neg-int v3, v11

    .line 106
    int-to-float v3, v3

    .line 107
    new-array v9, v12, [F

    .line 108
    .line 109
    aput v3, v9, v17

    .line 110
    .line 111
    aput v13, v9, v14

    .line 112
    .line 113
    const-string v3, "translationX"

    .line 114
    .line 115
    const-wide/16 v6, 0x1f4

    .line 116
    .line 117
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 118
    .line 119
    .line 120
    move-result-object v15

    .line 121
    neg-int v3, v11

    .line 122
    int-to-float v3, v3

    .line 123
    new-array v9, v12, [F

    .line 124
    .line 125
    aput v3, v9, v17

    .line 126
    .line 127
    aput v13, v9, v14

    .line 128
    .line 129
    const-string v3, "translationY"

    .line 130
    .line 131
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    filled-new-array {v15, v2}, [Landroid/animation/Animator;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 140
    .line 141
    .line 142
    move-result-object v13

    .line 143
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 144
    .line 145
    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    check-cast v2, Landroid/view/View;

    .line 150
    .line 151
    const/high16 v3, 0x41200000    # 10.0f

    .line 152
    .line 153
    invoke-virtual {v2, v3}, Landroid/view/View;->setZ(F)V

    .line 154
    .line 155
    .line 156
    sget v15, Ll/qa00;->g:I

    .line 157
    .line 158
    neg-int v3, v15

    .line 159
    int-to-float v3, v3

    .line 160
    neg-int v4, v11

    .line 161
    int-to-float v4, v4

    .line 162
    new-array v9, v12, [F

    .line 163
    .line 164
    aput v3, v9, v17

    .line 165
    .line 166
    aput v4, v9, v14

    .line 167
    .line 168
    const-string v3, "translationX"

    .line 169
    .line 170
    const-wide/16 v4, 0xfa

    .line 171
    .line 172
    const-wide/16 v6, 0xfa

    .line 173
    .line 174
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    neg-int v4, v15

    .line 179
    int-to-float v4, v4

    .line 180
    neg-int v5, v11

    .line 181
    int-to-float v5, v5

    .line 182
    new-array v9, v12, [F

    .line 183
    .line 184
    aput v4, v9, v17

    .line 185
    .line 186
    aput v5, v9, v14

    .line 187
    .line 188
    move-object v4, v3

    .line 189
    const-string v3, "translationY"

    .line 190
    .line 191
    move-object v6, v4

    .line 192
    const-wide/16 v4, 0xfa

    .line 193
    .line 194
    move-object v11, v6

    .line 195
    const-wide/16 v6, 0xfa

    .line 196
    .line 197
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 198
    .line 199
    .line 200
    move-result-object v14

    .line 201
    new-array v9, v12, [F

    .line 202
    .line 203
    fill-array-data v9, :array_1

    .line 204
    .line 205
    .line 206
    const-string v3, "alpha"

    .line 207
    .line 208
    const-wide/16 v4, 0x64

    .line 209
    .line 210
    const-wide/16 v6, 0x190

    .line 211
    .line 212
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    filled-new-array {v11, v14, v2}, [Landroid/animation/Animator;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->e:Landroid/animation/Animator;

    .line 225
    .line 226
    invoke-static {v3}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 227
    .line 228
    .line 229
    filled-new-array {v10, v13, v2}, [Landroid/animation/Animator;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    iput-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->e:Landroid/animation/Animator;

    .line 238
    .line 239
    new-instance v3, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;

    .line 240
    .line 241
    invoke-direct {v3, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;I)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v2, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 245
    .line 246
    .line 247
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->e:Landroid/animation/Animator;

    .line 248
    .line 249
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public i()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->c:Ll/kcg0;

    .line 6
    .line 7
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->e:Landroid/animation/Animator;

    .line 11
    .line 12
    invoke-static {v1}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lv/VDraweeView;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lv/VDraweeView;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lv/VDraweeView;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->d:[F

    .line 47
    .line 48
    aget v0, v2, v0

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VDraweeView;

    .line 61
    .line 62
    sget v2, Ll/qa00;->d:I

    .line 63
    .line 64
    neg-int v3, v2

    .line 65
    int-to-float v3, v3

    .line 66
    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lv/VDraweeView;

    .line 76
    .line 77
    neg-int v2, v2

    .line 78
    int-to-float v2, v2

    .line 79
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Lv/VDraweeView;

    .line 89
    .line 90
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->d:[F

    .line 91
    .line 92
    aget v1, v2, v1

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 98
    .line 99
    const/4 v1, 0x2

    .line 100
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Lv/VDraweeView;

    .line 105
    .line 106
    sget v2, Ll/qa00;->g:I

    .line 107
    .line 108
    neg-int v3, v2

    .line 109
    int-to-float v3, v3

    .line 110
    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lv/VDraweeView;

    .line 120
    .line 121
    neg-int v2, v2

    .line 122
    int-to-float v2, v2

    .line 123
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Lv/VDraweeView;

    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->d:[F

    .line 135
    .line 136
    aget p0, p0, v1

    .line 137
    .line 138
    invoke-virtual {v0, p0}, Landroid/view/View;->setAlpha(F)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public j(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;F)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "F)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_1

    .line 4
    .line 5
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto/16 :goto_1

    .line 20
    .line 21
    :cond_1
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->g:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->i()V

    .line 24
    .line 25
    .line 26
    const/4 p3, 0x1

    .line 27
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iput p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->f:F

    .line 31
    .line 32
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->a:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {p4}, Ljava/util/List;->clear()V

    .line 35
    .line 36
    .line 37
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->a:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p4, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    sget p4, Ll/qa00;->B:I

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->a:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const-string v1, "context_single_room"

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    if-ne v0, p3, :cond_2

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lv/VDraweeView;

    .line 62
    .line 63
    const/4 p2, 0x4

    .line 64
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 68
    .line 69
    const/4 p3, 0x2

    .line 70
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lv/VDraweeView;

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Lv/VDraweeView;

    .line 86
    .line 87
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->a:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    check-cast p0, Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v1, p1, p0, p4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_2
    if-lez v0, :cond_4

    .line 111
    .line 112
    move p3, v2

    .line 113
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-ge p3, v0, :cond_3

    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 122
    .line 123
    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Lv/VDraweeView;

    .line 128
    .line 129
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 130
    .line 131
    .line 132
    rsub-int/lit8 v3, p3, 0x64

    .line 133
    .line 134
    int-to-float v3, v3

    .line 135
    invoke-virtual {v0, v3}, Landroid/view/View;->setZ(F)V

    .line 136
    .line 137
    .line 138
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->a:Ljava/util/List;

    .line 139
    .line 140
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    rem-int v4, p3, v4

    .line 145
    .line 146
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    check-cast v3, Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {v1, v0, v3, p4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 153
    .line 154
    .line 155
    add-int/lit8 p3, p3, 0x1

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_3
    sget-object p3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 159
    .line 160
    const-wide/16 v0, 0x3

    .line 161
    .line 162
    invoke-static {v0, v1, v0, v1, p3}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object p3

    .line 166
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 167
    .line 168
    .line 169
    move-result-object p3

    .line 170
    invoke-virtual {p3}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 171
    .line 172
    .line 173
    move-result-object p3

    .line 174
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 175
    .line 176
    .line 177
    move-result-object p4

    .line 178
    invoke-virtual {p3, p4}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 179
    .line 180
    .line 181
    move-result-object p3

    .line 182
    new-instance p4, Ll/gom0;

    .line 183
    .line 184
    invoke-direct {p4, p0, p1, p2}, Ll/gom0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p3, p4}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    new-instance p2, Ll/hom0;

    .line 192
    .line 193
    invoke-direct {p2, p0}, Ll/hom0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)V

    .line 194
    .line 195
    .line 196
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 197
    .line 198
    .line 199
    move-result-object p2

    .line 200
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->c:Ll/kcg0;

    .line 205
    .line 206
    :cond_4
    :goto_1
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->c:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->e:Landroid/animation/Animator;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->f:F

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    cmpl-float v0, v0, v1

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->h:Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    sget v2, Ll/qa00;->d:I

    .line 18
    .line 19
    sub-int/2addr v1, v2

    .line 20
    int-to-float v1, v1

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    div-int/lit8 v3, v3, 0x4

    .line 30
    .line 31
    sub-int/2addr v2, v3

    .line 32
    int-to-float v2, v2

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    div-int/lit8 v3, v3, 0x4

    .line 38
    .line 39
    int-to-float v3, v3

    .line 40
    sget-object v4, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->h:Landroid/graphics/Path;

    .line 46
    .line 47
    sget-object v0, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    .line 48
    .line 49
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 14
    .line 15
    sget v1, Ll/mdc0;->w:I

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lv/VDraweeView;

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 27
    .line 28
    sget v1, Ll/mdc0;->x:I

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lv/VDraweeView;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->b:Ljava/util/List;

    .line 40
    .line 41
    sget v1, Ll/mdc0;->y:I

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lv/VDraweeView;

    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->i()V

    .line 53
    .line 54
    .line 55
    return-void
.end method
