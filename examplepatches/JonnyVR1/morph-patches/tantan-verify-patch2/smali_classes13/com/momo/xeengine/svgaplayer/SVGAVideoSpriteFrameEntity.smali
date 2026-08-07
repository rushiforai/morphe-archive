.class public final Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0006\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u000f\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u001a\u0010\u0005\u001a\u00020\u0006X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\nR\u001a\u0010\u000b\u001a\u00020\u000cX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\r\u0010\u000e\"\u0004\u0008\u000f\u0010\u0010R\u001c\u0010\u0011\u001a\u0004\u0018\u00010\u0012X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014\"\u0004\u0008\u0015\u0010\u0016R \u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u0018X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001a\u0010\u001b\"\u0004\u0008\u001c\u0010\u001dR\u001a\u0010\u001e\u001a\u00020\u001fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008 \u0010!\"\u0004\u0008\"\u0010#\u00a8\u0006$"
    }
    d2 = {
        "Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;",
        "",
        "obj",
        "Lcom/momo/xeengine/svgaplayer/proto/FrameEntity;",
        "(Lcom/momo/xeengine/svgaplayer/proto/FrameEntity;)V",
        "alpha",
        "",
        "getAlpha",
        "()D",
        "setAlpha",
        "(D)V",
        "layout",
        "Lcom/momo/xeengine/svgaplayer/SVGARect;",
        "getLayout",
        "()Lcom/momo/xeengine/svgaplayer/SVGARect;",
        "setLayout",
        "(Lcom/momo/xeengine/svgaplayer/SVGARect;)V",
        "maskPath",
        "Lcom/momo/xeengine/svgaplayer/SVGAPath;",
        "getMaskPath",
        "()Lcom/momo/xeengine/svgaplayer/SVGAPath;",
        "setMaskPath",
        "(Lcom/momo/xeengine/svgaplayer/SVGAPath;)V",
        "shapes",
        "",
        "Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;",
        "getShapes",
        "()Ljava/util/List;",
        "setShapes",
        "(Ljava/util/List;)V",
        "transform",
        "Landroid/graphics/Matrix;",
        "getTransform",
        "()Landroid/graphics/Matrix;",
        "setTransform",
        "(Landroid/graphics/Matrix;)V",
        "gift_player_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# instance fields
.field private alpha:D

.field private layout:Lcom/momo/xeengine/svgaplayer/SVGARect;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private maskPath:Lcom/momo/xeengine/svgaplayer/SVGAPath;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private shapes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private transform:Landroid/graphics/Matrix;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/svgaplayer/proto/FrameEntity;)V
    .locals 11
    .param p1    # Lcom/momo/xeengine/svgaplayer/proto/FrameEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 8
    .line 9
    const-wide/16 v5, 0x0

    .line 10
    .line 11
    const-wide/16 v7, 0x0

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    const-wide/16 v3, 0x0

    .line 16
    .line 17
    invoke-direct/range {v0 .. v8}, Lcom/momo/xeengine/svgaplayer/SVGARect;-><init>(DDDD)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->layout:Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 21
    .line 22
    new-instance v0, Landroid/graphics/Matrix;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->transform:Landroid/graphics/Matrix;

    .line 28
    .line 29
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->shapes:Ljava/util/List;

    .line 34
    .line 35
    iget-object v0, p1, Lcom/momo/xeengine/svgaplayer/proto/FrameEntity;->alpha:Ljava/lang/Float;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move v0, v1

    .line 46
    :goto_0
    float-to-double v2, v0

    .line 47
    iput-wide v2, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->alpha:D

    .line 48
    .line 49
    iget-object v0, p1, Lcom/momo/xeengine/svgaplayer/proto/FrameEntity;->layout:Lcom/momo/xeengine/svgaplayer/proto/Layout;

    .line 50
    .line 51
    if-eqz v0, :cond_5

    .line 52
    .line 53
    new-instance v2, Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 54
    .line 55
    iget-object v3, v0, Lcom/momo/xeengine/svgaplayer/proto/Layout;->x:Ljava/lang/Float;

    .line 56
    .line 57
    if-eqz v3, :cond_1

    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    move v3, v1

    .line 65
    :goto_1
    float-to-double v3, v3

    .line 66
    iget-object v5, v0, Lcom/momo/xeengine/svgaplayer/proto/Layout;->y:Ljava/lang/Float;

    .line 67
    .line 68
    if-eqz v5, :cond_2

    .line 69
    .line 70
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    goto :goto_2

    .line 75
    :cond_2
    move v5, v1

    .line 76
    :goto_2
    float-to-double v5, v5

    .line 77
    iget-object v7, v0, Lcom/momo/xeengine/svgaplayer/proto/Layout;->width:Ljava/lang/Float;

    .line 78
    .line 79
    if-eqz v7, :cond_3

    .line 80
    .line 81
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    goto :goto_3

    .line 86
    :cond_3
    move v7, v1

    .line 87
    :goto_3
    float-to-double v7, v7

    .line 88
    iget-object v0, v0, Lcom/momo/xeengine/svgaplayer/proto/Layout;->height:Ljava/lang/Float;

    .line 89
    .line 90
    if-eqz v0, :cond_4

    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    goto :goto_4

    .line 97
    :cond_4
    move v0, v1

    .line 98
    :goto_4
    float-to-double v9, v0

    .line 99
    invoke-direct/range {v2 .. v10}, Lcom/momo/xeengine/svgaplayer/SVGARect;-><init>(DDDD)V

    .line 100
    .line 101
    .line 102
    iput-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->layout:Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 103
    .line 104
    :cond_5
    iget-object v0, p1, Lcom/momo/xeengine/svgaplayer/proto/FrameEntity;->transform:Lcom/momo/xeengine/svgaplayer/proto/Transform;

    .line 105
    .line 106
    if-eqz v0, :cond_c

    .line 107
    .line 108
    iget-object v2, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->a:Ljava/lang/Float;

    .line 109
    .line 110
    const/high16 v3, 0x3f800000    # 1.0f

    .line 111
    .line 112
    if-eqz v2, :cond_6

    .line 113
    .line 114
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    goto :goto_5

    .line 119
    :cond_6
    move v2, v3

    .line 120
    :goto_5
    iget-object v4, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->b:Ljava/lang/Float;

    .line 121
    .line 122
    if-eqz v4, :cond_7

    .line 123
    .line 124
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    goto :goto_6

    .line 129
    :cond_7
    move v4, v1

    .line 130
    :goto_6
    iget-object v5, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->c:Ljava/lang/Float;

    .line 131
    .line 132
    if-eqz v5, :cond_8

    .line 133
    .line 134
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    goto :goto_7

    .line 139
    :cond_8
    move v5, v1

    .line 140
    :goto_7
    iget-object v6, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->d:Ljava/lang/Float;

    .line 141
    .line 142
    if-eqz v6, :cond_9

    .line 143
    .line 144
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    goto :goto_8

    .line 149
    :cond_9
    move v6, v3

    .line 150
    :goto_8
    iget-object v7, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->tx:Ljava/lang/Float;

    .line 151
    .line 152
    if-eqz v7, :cond_a

    .line 153
    .line 154
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 155
    .line 156
    .line 157
    move-result v7

    .line 158
    goto :goto_9

    .line 159
    :cond_a
    move v7, v1

    .line 160
    :goto_9
    iget-object v0, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->ty:Ljava/lang/Float;

    .line 161
    .line 162
    if-eqz v0, :cond_b

    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    goto :goto_a

    .line 169
    :cond_b
    move v0, v1

    .line 170
    :goto_a
    const/16 v8, 0x9

    .line 171
    .line 172
    new-array v8, v8, [F

    .line 173
    .line 174
    const/4 v9, 0x0

    .line 175
    aput v2, v8, v9

    .line 176
    .line 177
    const/4 v2, 0x1

    .line 178
    aput v5, v8, v2

    .line 179
    .line 180
    const/4 v2, 0x2

    .line 181
    aput v7, v8, v2

    .line 182
    .line 183
    const/4 v2, 0x3

    .line 184
    aput v4, v8, v2

    .line 185
    .line 186
    const/4 v2, 0x4

    .line 187
    aput v6, v8, v2

    .line 188
    .line 189
    const/4 v2, 0x5

    .line 190
    aput v0, v8, v2

    .line 191
    .line 192
    const/4 v0, 0x6

    .line 193
    aput v1, v8, v0

    .line 194
    .line 195
    const/4 v0, 0x7

    .line 196
    aput v1, v8, v0

    .line 197
    .line 198
    const/16 v0, 0x8

    .line 199
    .line 200
    aput v3, v8, v0

    .line 201
    .line 202
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->transform:Landroid/graphics/Matrix;

    .line 203
    .line 204
    invoke-virtual {v0, v8}, Landroid/graphics/Matrix;->setValues([F)V

    .line 205
    .line 206
    .line 207
    :cond_c
    iget-object v0, p1, Lcom/momo/xeengine/svgaplayer/proto/FrameEntity;->clipPath:Ljava/lang/String;

    .line 208
    .line 209
    if-eqz v0, :cond_e

    .line 210
    .line 211
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    if-lez v1, :cond_d

    .line 216
    .line 217
    goto :goto_b

    .line 218
    :cond_d
    const/4 v0, 0x0

    .line 219
    :goto_b
    if-eqz v0, :cond_e

    .line 220
    .line 221
    new-instance v1, Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 222
    .line 223
    invoke-direct {v1, v0}, Lcom/momo/xeengine/svgaplayer/SVGAPath;-><init>(Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    iput-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->maskPath:Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 227
    .line 228
    :cond_e
    iget-object p1, p1, Lcom/momo/xeengine/svgaplayer/proto/FrameEntity;->shapes:Ljava/util/List;

    .line 229
    .line 230
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 231
    .line 232
    .line 233
    check-cast p1, Ljava/lang/Iterable;

    .line 234
    .line 235
    new-instance v0, Ljava/util/ArrayList;

    .line 236
    .line 237
    const/16 v1, 0xa

    .line 238
    .line 239
    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 244
    .line 245
    .line 246
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    :goto_c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    if-eqz v1, :cond_f

    .line 255
    .line 256
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    check-cast v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity;

    .line 261
    .line 262
    new-instance v2, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;

    .line 263
    .line 264
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 265
    .line 266
    .line 267
    invoke-direct {v2, v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;-><init>(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity;)V

    .line 268
    .line 269
    .line 270
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    goto :goto_c

    .line 274
    :cond_f
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->shapes:Ljava/util/List;

    .line 275
    .line 276
    return-void
.end method


# virtual methods
.method public final getAlpha()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->alpha:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public final getLayout()Lcom/momo/xeengine/svgaplayer/SVGARect;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->layout:Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMaskPath()Lcom/momo/xeengine/svgaplayer/SVGAPath;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->maskPath:Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getShapes()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->shapes:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTransform()Landroid/graphics/Matrix;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->transform:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setAlpha(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->alpha:D

    .line 2
    .line 3
    return-void
.end method

.method public final setLayout(Lcom/momo/xeengine/svgaplayer/SVGARect;)V
    .locals 0
    .param p1    # Lcom/momo/xeengine/svgaplayer/SVGARect;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->layout:Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 5
    .line 6
    return-void
.end method

.method public final setMaskPath(Lcom/momo/xeengine/svgaplayer/SVGAPath;)V
    .locals 0
    .param p1    # Lcom/momo/xeengine/svgaplayer/SVGAPath;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->maskPath:Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 2
    .line 3
    return-void
.end method

.method public final setShapes(Ljava/util/List;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->shapes:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method

.method public final setTransform(Landroid/graphics/Matrix;)V
    .locals 0
    .param p1    # Landroid/graphics/Matrix;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->transform:Landroid/graphics/Matrix;

    .line 5
    .line 6
    return-void
.end method
