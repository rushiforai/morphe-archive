.class public final Lcom/tantan/library/svga/utils/SVGAScaleInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/utils/SVGAScaleInfo$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0011\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J.\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u00042\u0006\u0010\u001e\u001a\u00020\u00042\u0006\u0010\u001f\u001a\u00020\u00042\u0006\u0010 \u001a\u00020\u00042\u0006\u0010!\u001a\u00020\"J\u0008\u0010#\u001a\u00020\u001cH\u0002R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008R\u001a\u0010\t\u001a\u00020\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u000eR\u001a\u0010\u000f\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\u0006\"\u0004\u0008\u0011\u0010\u0008R\u001a\u0010\u0012\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0013\u0010\u0006\"\u0004\u0008\u0014\u0010\u0008R\u001a\u0010\u0015\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0016\u0010\u0006\"\u0004\u0008\u0017\u0010\u0008R\u001a\u0010\u0018\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0019\u0010\u0006\"\u0004\u0008\u001a\u0010\u0008\u00a8\u0006$"
    }
    d2 = {
        "Lcom/tantan/library/svga/utils/SVGAScaleInfo;",
        "",
        "()V",
        "ratio",
        "",
        "getRatio",
        "()F",
        "setRatio",
        "(F)V",
        "ratioX",
        "",
        "getRatioX",
        "()Z",
        "setRatioX",
        "(Z)V",
        "scaleFx",
        "getScaleFx",
        "setScaleFx",
        "scaleFy",
        "getScaleFy",
        "setScaleFy",
        "tranFx",
        "getTranFx",
        "setTranFx",
        "tranFy",
        "getTranFy",
        "setTranFy",
        "performScaleType",
        "",
        "canvasWidth",
        "canvasHeight",
        "videoWidth",
        "videoHeight",
        "scaleType",
        "Landroid/widget/ImageView$ScaleType;",
        "resetVar",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private ratio:F

.field private ratioX:Z

.field private scaleFx:F

.field private scaleFy:F

.field private tranFx:F

.field private tranFy:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 7
    .line 8
    iput v0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 9
    .line 10
    iput v0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 11
    .line 12
    return-void
.end method

.method private final resetVar()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFx:F

    .line 3
    .line 4
    iput v0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFy:F

    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    iput v0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 9
    .line 10
    iput v0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 11
    .line 12
    iput v0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final getRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 2
    .line 3
    return p0
.end method

.method public final getRatioX()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getScaleFx()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 2
    .line 3
    return p0
.end method

.method public final getScaleFy()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 2
    .line 3
    return p0
.end method

.method public final getTranFx()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFx:F

    .line 2
    .line 3
    return p0
.end method

.method public final getTranFy()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFy:F

    .line 2
    .line 3
    return p0
.end method

.method public final performScaleType(FFFFLandroid/widget/ImageView$ScaleType;)V
    .locals 9
    .param p5    # Landroid/widget/ImageView$ScaleType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    cmpg-float v1, p1, v0

    .line 6
    .line 7
    if-lez v1, :cond_8

    .line 8
    .line 9
    cmpg-float v1, p2, v0

    .line 10
    .line 11
    if-lez v1, :cond_8

    .line 12
    .line 13
    cmpg-float v1, p3, v0

    .line 14
    .line 15
    if-lez v1, :cond_8

    .line 16
    .line 17
    cmpg-float v0, p4, v0

    .line 18
    .line 19
    if-gtz v0, :cond_0

    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_0
    invoke-direct {p0}, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->resetVar()V

    .line 24
    .line 25
    .line 26
    sub-float v0, p1, p3

    .line 27
    .line 28
    const/high16 v1, 0x40000000    # 2.0f

    .line 29
    .line 30
    div-float/2addr v0, v1

    .line 31
    sub-float v2, p2, p4

    .line 32
    .line 33
    div-float/2addr v2, v1

    .line 34
    div-float v3, p3, p4

    .line 35
    .line 36
    div-float v4, p1, p2

    .line 37
    .line 38
    div-float v5, p2, p4

    .line 39
    .line 40
    div-float v6, p1, p3

    .line 41
    .line 42
    sget-object v7, Lcom/tantan/library/svga/utils/SVGAScaleInfo$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 43
    .line 44
    invoke-virtual {p5}, Ljava/lang/Enum;->ordinal()I

    .line 45
    .line 46
    .line 47
    move-result p5

    .line 48
    aget p5, v7, p5

    .line 49
    .line 50
    const/4 v7, 0x0

    .line 51
    const/4 v8, 0x1

    .line 52
    packed-switch p5, :pswitch_data_0

    .line 53
    .line 54
    .line 55
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 56
    .line 57
    iput-boolean v8, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 58
    .line 59
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 60
    .line 61
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 62
    .line 63
    return-void

    .line 64
    :pswitch_0
    invoke-static {v6, v5}, Ljava/lang/Math;->max(FF)F

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 69
    .line 70
    cmpl-float p1, v6, v5

    .line 71
    .line 72
    if-lez p1, :cond_1

    .line 73
    .line 74
    move v7, v8

    .line 75
    :cond_1
    iput-boolean v7, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 76
    .line 77
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 78
    .line 79
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 80
    .line 81
    return-void

    .line 82
    :pswitch_1
    cmpl-float p5, v3, v4

    .line 83
    .line 84
    if-lez p5, :cond_2

    .line 85
    .line 86
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 87
    .line 88
    iput-boolean v8, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 89
    .line 90
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 91
    .line 92
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 93
    .line 94
    mul-float/2addr p4, v6

    .line 95
    sub-float/2addr p2, p4

    .line 96
    iput p2, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFy:F

    .line 97
    .line 98
    return-void

    .line 99
    :cond_2
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 100
    .line 101
    iput-boolean v7, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 102
    .line 103
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 104
    .line 105
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 106
    .line 107
    mul-float/2addr p3, v5

    .line 108
    sub-float/2addr p1, p3

    .line 109
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFx:F

    .line 110
    .line 111
    return-void

    .line 112
    :pswitch_2
    cmpl-float p1, v3, v4

    .line 113
    .line 114
    if-lez p1, :cond_3

    .line 115
    .line 116
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 117
    .line 118
    iput-boolean v8, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 119
    .line 120
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 121
    .line 122
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 123
    .line 124
    return-void

    .line 125
    :cond_3
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 126
    .line 127
    iput-boolean v7, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 128
    .line 129
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 130
    .line 131
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 132
    .line 133
    return-void

    .line 134
    :pswitch_3
    cmpl-float p5, v3, v4

    .line 135
    .line 136
    if-lez p5, :cond_4

    .line 137
    .line 138
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 139
    .line 140
    iput-boolean v8, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 141
    .line 142
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 143
    .line 144
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 145
    .line 146
    mul-float/2addr p4, v6

    .line 147
    sub-float/2addr p2, p4

    .line 148
    div-float/2addr p2, v1

    .line 149
    iput p2, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFy:F

    .line 150
    .line 151
    return-void

    .line 152
    :cond_4
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 153
    .line 154
    iput-boolean v7, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 155
    .line 156
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 157
    .line 158
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 159
    .line 160
    mul-float/2addr p3, v5

    .line 161
    sub-float/2addr p1, p3

    .line 162
    div-float/2addr p1, v1

    .line 163
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFx:F

    .line 164
    .line 165
    return-void

    .line 166
    :pswitch_4
    cmpg-float p5, p3, p1

    .line 167
    .line 168
    if-gez p5, :cond_5

    .line 169
    .line 170
    cmpg-float p5, p4, p2

    .line 171
    .line 172
    if-gez p5, :cond_5

    .line 173
    .line 174
    iput v0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFx:F

    .line 175
    .line 176
    iput v2, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFy:F

    .line 177
    .line 178
    return-void

    .line 179
    :cond_5
    cmpl-float p5, v3, v4

    .line 180
    .line 181
    if-lez p5, :cond_6

    .line 182
    .line 183
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 184
    .line 185
    iput-boolean v8, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 186
    .line 187
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 188
    .line 189
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 190
    .line 191
    mul-float/2addr p4, v6

    .line 192
    sub-float/2addr p2, p4

    .line 193
    div-float/2addr p2, v1

    .line 194
    iput p2, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFy:F

    .line 195
    .line 196
    return-void

    .line 197
    :cond_6
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 198
    .line 199
    iput-boolean v7, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 200
    .line 201
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 202
    .line 203
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 204
    .line 205
    mul-float/2addr p3, v5

    .line 206
    sub-float/2addr p1, p3

    .line 207
    div-float/2addr p1, v1

    .line 208
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFx:F

    .line 209
    .line 210
    return-void

    .line 211
    :pswitch_5
    cmpl-float p5, v3, v4

    .line 212
    .line 213
    if-lez p5, :cond_7

    .line 214
    .line 215
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 216
    .line 217
    iput-boolean v7, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 218
    .line 219
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 220
    .line 221
    iput v5, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 222
    .line 223
    mul-float/2addr p3, v5

    .line 224
    sub-float/2addr p1, p3

    .line 225
    div-float/2addr p1, v1

    .line 226
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFx:F

    .line 227
    .line 228
    return-void

    .line 229
    :cond_7
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 230
    .line 231
    iput-boolean v8, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 232
    .line 233
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 234
    .line 235
    iput v6, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 236
    .line 237
    mul-float/2addr p4, v6

    .line 238
    sub-float/2addr p2, p4

    .line 239
    div-float/2addr p2, v1

    .line 240
    iput p2, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFy:F

    .line 241
    .line 242
    return-void

    .line 243
    :pswitch_6
    iput v0, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFx:F

    .line 244
    .line 245
    iput v2, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFy:F

    .line 246
    .line 247
    :cond_8
    :goto_0
    return-void

    .line 248
    nop

    .line 249
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final setRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratio:F

    .line 2
    .line 3
    return-void
.end method

.method public final setRatioX(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->ratioX:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setScaleFx(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFx:F

    .line 2
    .line 3
    return-void
.end method

.method public final setScaleFy(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->scaleFy:F

    .line 2
    .line 3
    return-void
.end method

.method public final setTranFx(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFx:F

    .line 2
    .line 3
    return-void
.end method

.method public final setTranFy(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->tranFy:F

    .line 2
    .line 3
    return-void
.end method
