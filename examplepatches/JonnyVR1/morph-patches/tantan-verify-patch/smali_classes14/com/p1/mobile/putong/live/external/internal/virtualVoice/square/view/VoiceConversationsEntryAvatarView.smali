.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;
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
            "Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/kcg0;

.field public final d:[F

.field public e:Landroid/animation/Animator;

.field public f:I

.field public g:I

.field public h:Landroid/graphics/Path;

.field public i:Landroid/graphics/Path;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->d:[F

    .line 25
    .line 26
    new-instance p1, Landroid/graphics/Path;

    .line 27
    .line 28
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->h:Landroid/graphics/Path;

    .line 32
    .line 33
    new-instance p1, Landroid/graphics/Path;

    .line 34
    .line 35
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->i:Landroid/graphics/Path;

    .line 39
    .line 40
    return-void

    .line 41
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

    .line 41
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->a:Ljava/util/List;

    .line 43
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    const/4 p1, 0x3

    .line 44
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->d:[F

    .line 45
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->h:Landroid/graphics/Path;

    .line 46
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->i:Landroid/graphics/Path;

    return-void

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

    .line 47
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->a:Ljava/util/List;

    .line 49
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    const/4 p1, 0x3

    .line 50
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->d:[F

    .line 51
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->h:Landroid/graphics/Path;

    .line 52
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->i:Landroid/graphics/Path;

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->g(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->f(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->a:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public final synthetic f(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->l(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public final synthetic g(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final i()V
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
    sget v1, Ll/qa00;->t:I

    .line 11
    .line 12
    new-instance v10, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v2, v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 18
    .line 19
    const/4 v11, 0x0

    .line 20
    invoke-interface {v2, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Landroid/view/View;

    .line 25
    .line 26
    const/high16 v3, 0x41f00000    # 30.0f

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Landroid/view/View;->setZ(F)V

    .line 29
    .line 30
    .line 31
    sget v12, Ll/qa00;->e:I

    .line 32
    .line 33
    neg-int v3, v12

    .line 34
    int-to-float v3, v3

    .line 35
    const/4 v13, 0x2

    .line 36
    new-array v9, v13, [F

    .line 37
    .line 38
    const/4 v14, 0x0

    .line 39
    aput v14, v9, v11

    .line 40
    .line 41
    const/4 v15, 0x1

    .line 42
    aput v3, v9, v15

    .line 43
    .line 44
    const-string v3, "translationX"

    .line 45
    .line 46
    const-wide/16 v4, 0x0

    .line 47
    .line 48
    const-wide/16 v6, 0xfa

    .line 49
    .line 50
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    int-to-float v4, v12

    .line 55
    new-array v9, v13, [F

    .line 56
    .line 57
    aput v14, v9, v11

    .line 58
    .line 59
    aput v4, v9, v15

    .line 60
    .line 61
    move-object v4, v3

    .line 62
    const-string v3, "translationY"

    .line 63
    .line 64
    move-object v6, v4

    .line 65
    const-wide/16 v4, 0x0

    .line 66
    .line 67
    move-object v12, v6

    .line 68
    const-wide/16 v6, 0xfa

    .line 69
    .line 70
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    new-array v9, v13, [F

    .line 75
    .line 76
    fill-array-data v9, :array_0

    .line 77
    .line 78
    .line 79
    move-object v4, v3

    .line 80
    const-string v3, "alpha"

    .line 81
    .line 82
    move-object v6, v4

    .line 83
    const-wide/16 v4, 0x0

    .line 84
    .line 85
    move-object/from16 v16, v6

    .line 86
    .line 87
    const-wide/16 v6, 0xfa

    .line 88
    .line 89
    move/from16 v17, v11

    .line 90
    .line 91
    move-object/from16 v11, v16

    .line 92
    .line 93
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    filled-new-array {v12, v11, v2}, [Landroid/animation/Animator;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 102
    .line 103
    .line 104
    move-result-object v11

    .line 105
    iget-object v2, v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {v2, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    check-cast v2, Landroid/view/View;

    .line 112
    .line 113
    const/high16 v3, 0x41a00000    # 20.0f

    .line 114
    .line 115
    invoke-virtual {v2, v3}, Landroid/view/View;->setZ(F)V

    .line 116
    .line 117
    .line 118
    sget v12, Ll/qa00;->j:I

    .line 119
    .line 120
    int-to-float v3, v12

    .line 121
    new-array v9, v13, [F

    .line 122
    .line 123
    aput v3, v9, v17

    .line 124
    .line 125
    aput v14, v9, v15

    .line 126
    .line 127
    const-string v3, "translationX"

    .line 128
    .line 129
    const-wide/16 v6, 0x1f4

    .line 130
    .line 131
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    neg-int v4, v12

    .line 136
    int-to-float v4, v4

    .line 137
    new-array v9, v13, [F

    .line 138
    .line 139
    aput v4, v9, v17

    .line 140
    .line 141
    aput v14, v9, v15

    .line 142
    .line 143
    move-object v4, v3

    .line 144
    const-string v3, "translationY"

    .line 145
    .line 146
    move-object v6, v4

    .line 147
    const-wide/16 v4, 0x0

    .line 148
    .line 149
    move-object v14, v6

    .line 150
    const-wide/16 v6, 0x1f4

    .line 151
    .line 152
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    filled-new-array {v14, v2}, [Landroid/animation/Animator;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-interface {v10, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    iget-object v2, v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 168
    .line 169
    invoke-interface {v2, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    check-cast v2, Landroid/view/View;

    .line 174
    .line 175
    const/high16 v3, 0x41200000    # 10.0f

    .line 176
    .line 177
    invoke-virtual {v2, v3}, Landroid/view/View;->setZ(F)V

    .line 178
    .line 179
    .line 180
    sget v14, Ll/qa00;->m:I

    .line 181
    .line 182
    int-to-float v3, v14

    .line 183
    int-to-float v4, v12

    .line 184
    new-array v9, v13, [F

    .line 185
    .line 186
    aput v3, v9, v17

    .line 187
    .line 188
    aput v4, v9, v15

    .line 189
    .line 190
    const-string v3, "translationX"

    .line 191
    .line 192
    const-wide/16 v4, 0xfa

    .line 193
    .line 194
    const-wide/16 v6, 0xfa

    .line 195
    .line 196
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    neg-int v4, v14

    .line 201
    int-to-float v4, v4

    .line 202
    neg-int v5, v12

    .line 203
    int-to-float v5, v5

    .line 204
    new-array v9, v13, [F

    .line 205
    .line 206
    aput v4, v9, v17

    .line 207
    .line 208
    aput v5, v9, v15

    .line 209
    .line 210
    move-object v4, v3

    .line 211
    const-string v3, "translationY"

    .line 212
    .line 213
    move-object v6, v4

    .line 214
    const-wide/16 v4, 0xfa

    .line 215
    .line 216
    move-object v12, v6

    .line 217
    const-wide/16 v6, 0xfa

    .line 218
    .line 219
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 220
    .line 221
    .line 222
    move-result-object v14

    .line 223
    new-array v9, v13, [F

    .line 224
    .line 225
    fill-array-data v9, :array_1

    .line 226
    .line 227
    .line 228
    const-string v3, "alpha"

    .line 229
    .line 230
    const-wide/16 v4, 0x64

    .line 231
    .line 232
    const-wide/16 v6, 0x190

    .line 233
    .line 234
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    filled-new-array {v12, v14, v2}, [Landroid/animation/Animator;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    invoke-interface {v10, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    const/4 v2, 0x3

    .line 253
    new-array v2, v2, [Landroid/animation/Animator;

    .line 254
    .line 255
    invoke-interface {v10, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    iget-object v3, v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->e:Landroid/animation/Animator;

    .line 259
    .line 260
    if-eqz v3, :cond_0

    .line 261
    .line 262
    invoke-virtual {v3}, Landroid/animation/Animator;->removeAllListeners()V

    .line 263
    .line 264
    .line 265
    iget-object v3, v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->e:Landroid/animation/Animator;

    .line 266
    .line 267
    invoke-virtual {v3}, Landroid/animation/Animator;->cancel()V

    .line 268
    .line 269
    .line 270
    :cond_0
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 271
    .line 272
    .line 273
    move-result-object v2

    .line 274
    iput-object v2, v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->e:Landroid/animation/Animator;

    .line 275
    .line 276
    new-instance v3, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;

    .line 277
    .line 278
    invoke-direct {v3, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;I)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {v2, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 282
    .line 283
    .line 284
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->e:Landroid/animation/Animator;

    .line 285
    .line 286
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 287
    .line 288
    .line 289
    return-void

    .line 290
    nop

    .line 291
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public j()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->c:Ll/kcg0;

    .line 6
    .line 7
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->e:Landroid/animation/Animator;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->e:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 52
    .line 53
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->d:[F

    .line 54
    .line 55
    aget v0, v2, v0

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 68
    .line 69
    sget v2, Ll/qa00;->j:I

    .line 70
    .line 71
    int-to-float v3, v2

    .line 72
    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 82
    .line 83
    neg-int v2, v2

    .line 84
    int-to-float v2, v2

    .line 85
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 95
    .line 96
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->d:[F

    .line 97
    .line 98
    aget v1, v2, v1

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 104
    .line 105
    const/4 v1, 0x2

    .line 106
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 111
    .line 112
    sget v2, Ll/qa00;->m:I

    .line 113
    .line 114
    int-to-float v3, v2

    .line 115
    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 119
    .line 120
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 125
    .line 126
    neg-int v2, v2

    .line 127
    int-to-float v2, v2

    .line 128
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 132
    .line 133
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->d:[F

    .line 140
    .line 141
    aget p0, p0, v1

    .line 142
    .line 143
    invoke-virtual {v0, p0}, Landroid/view/View;->setAlpha(F)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public k(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->f:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->g:I

    .line 4
    .line 5
    return-void
.end method

.method public l(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 v0, 0x1

    .line 5
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    sget v0, Ll/qa00;->t:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-ge v1, v2, :cond_1

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 36
    .line 37
    iget v3, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->f:I

    .line 38
    .line 39
    iget v4, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->g:I

    .line 40
    .line 41
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;->u(II)V

    .line 42
    .line 43
    .line 44
    rsub-int/lit8 v3, v1, 0x64

    .line 45
    .line 46
    int-to-float v3, v3

    .line 47
    invoke-virtual {v2, v3}, Landroid/view/View;->setZ(F)V

    .line 48
    .line 49
    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->a:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    rem-int v4, v1, v4

    .line 57
    .line 58
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Ljava/lang/String;

    .line 63
    .line 64
    const-string v4, "context_common"

    .line 65
    .line 66
    invoke-static {v4, v2, v3, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    add-int/lit8 v1, v1, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    const-wide/16 v0, 0x5

    .line 73
    .line 74
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 75
    .line 76
    const-wide/16 v3, 0x3

    .line 77
    .line 78
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/van0;

    .line 99
    .line 100
    invoke-direct {v1, p0, p1, p2}, Ll/van0;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    new-instance p2, Ll/wan0;

    .line 108
    .line 109
    invoke-direct {p2, p0}, Ll/wan0;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)V

    .line 110
    .line 111
    .line 112
    new-instance v0, Ll/xan0;

    .line 113
    .line 114
    invoke-direct {v0}, Ll/xan0;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->c:Ll/kcg0;

    .line 126
    .line 127
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->c:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->e:Landroid/animation/Animator;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 14
    .line 15
    sget v1, Ll/ldc0;->t:I

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 27
    .line 28
    sget v1, Ll/ldc0;->u:I

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 40
    .line 41
    sget v1, Ll/ldc0;->v:I

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->j()V

    .line 53
    .line 54
    .line 55
    return-void
.end method
