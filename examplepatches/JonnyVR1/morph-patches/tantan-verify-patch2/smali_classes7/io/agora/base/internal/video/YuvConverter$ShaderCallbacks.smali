.class Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/video/GlGenericDrawer$ShaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/YuvConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ShaderCallbacks"
.end annotation


# static fields
.field private static final U_BT2020_FULL:[F

.field private static final U_COEFFS_BIT601_FULL:[F

.field private static final U_COEFFS_BIT601_LIMIT:[F

.field private static final U_COEFFS_BIT709_FULL:[F

.field private static final U_COEFFS_BIT709_LIMIT:[F

.field private static final V_BT2020_FULL:[F

.field private static final V_COEFFS_BIT601_FULL:[F

.field private static final V_COEFFS_BIT601_LIMIT:[F

.field private static final V_COEFFS_BIT709_FULL:[F

.field private static final V_COEFFS_BIT709_LIMIT:[F

.field private static final Y_BT2020_FULL:[F

.field private static final Y_COEFFS_BIT601_FULL:[F

.field private static final Y_COEFFS_BIT601_LIMIT:[F

.field private static final Y_COEFFS_BIT709_FULL:[F

.field private static final Y_COEFFS_BIT709_LIMIT:[F


# instance fields
.field private coeffs:[F

.field private coeffsLoc:I

.field private colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

.field private stepSize:F

.field private xUnitLoc:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->Y_COEFFS_BIT601_LIMIT:[F

    .line 8
    .line 9
    new-array v1, v0, [F

    .line 10
    .line 11
    fill-array-data v1, :array_1

    .line 12
    .line 13
    .line 14
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->U_COEFFS_BIT601_LIMIT:[F

    .line 15
    .line 16
    new-array v1, v0, [F

    .line 17
    .line 18
    fill-array-data v1, :array_2

    .line 19
    .line 20
    .line 21
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->V_COEFFS_BIT601_LIMIT:[F

    .line 22
    .line 23
    new-array v1, v0, [F

    .line 24
    .line 25
    fill-array-data v1, :array_3

    .line 26
    .line 27
    .line 28
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->Y_COEFFS_BIT601_FULL:[F

    .line 29
    .line 30
    new-array v1, v0, [F

    .line 31
    .line 32
    fill-array-data v1, :array_4

    .line 33
    .line 34
    .line 35
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->U_COEFFS_BIT601_FULL:[F

    .line 36
    .line 37
    new-array v1, v0, [F

    .line 38
    .line 39
    fill-array-data v1, :array_5

    .line 40
    .line 41
    .line 42
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->V_COEFFS_BIT601_FULL:[F

    .line 43
    .line 44
    new-array v1, v0, [F

    .line 45
    .line 46
    fill-array-data v1, :array_6

    .line 47
    .line 48
    .line 49
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->Y_COEFFS_BIT709_LIMIT:[F

    .line 50
    .line 51
    new-array v1, v0, [F

    .line 52
    .line 53
    fill-array-data v1, :array_7

    .line 54
    .line 55
    .line 56
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->U_COEFFS_BIT709_LIMIT:[F

    .line 57
    .line 58
    new-array v1, v0, [F

    .line 59
    .line 60
    fill-array-data v1, :array_8

    .line 61
    .line 62
    .line 63
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->V_COEFFS_BIT709_LIMIT:[F

    .line 64
    .line 65
    new-array v1, v0, [F

    .line 66
    .line 67
    fill-array-data v1, :array_9

    .line 68
    .line 69
    .line 70
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->Y_COEFFS_BIT709_FULL:[F

    .line 71
    .line 72
    new-array v1, v0, [F

    .line 73
    .line 74
    fill-array-data v1, :array_a

    .line 75
    .line 76
    .line 77
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->U_COEFFS_BIT709_FULL:[F

    .line 78
    .line 79
    new-array v1, v0, [F

    .line 80
    .line 81
    fill-array-data v1, :array_b

    .line 82
    .line 83
    .line 84
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->V_COEFFS_BIT709_FULL:[F

    .line 85
    .line 86
    new-array v1, v0, [F

    .line 87
    .line 88
    fill-array-data v1, :array_c

    .line 89
    .line 90
    .line 91
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->Y_BT2020_FULL:[F

    .line 92
    .line 93
    new-array v1, v0, [F

    .line 94
    .line 95
    fill-array-data v1, :array_d

    .line 96
    .line 97
    .line 98
    sput-object v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->U_BT2020_FULL:[F

    .line 99
    .line 100
    new-array v0, v0, [F

    .line 101
    .line 102
    fill-array-data v0, :array_e

    .line 103
    .line 104
    .line 105
    sput-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->V_BT2020_FULL:[F

    .line 106
    .line 107
    return-void

    .line 108
    nop

    .line 109
    :array_0
    .array-data 4
        0x3e8379b7
        0x3f010e99
        0x3dc882e3
        0x3d808081
    .end array-data

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    :array_1
    .array-data 4
        -0x41e8383b
        -0x416b02f7
        0x3ee0e0eb
        0x3f008084
    .end array-data

    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    :array_2
    .array-data 4
        0x3ee0e0eb
        -0x4143b14b
        -0x426db779
        0x3f008084
    .end array-data

    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    :array_3
    .array-data 4
        0x3e991687    # 0.299f
        0x3f1645a2    # 0.587f
        0x3de978d5    # 0.114f
        0x0
    .end array-data

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    :array_4
    .array-data 4
        -0x41d336df
        -0x41566491
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
    .end array-data

    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    :array_5
    .array-data 4
        0x3f000000    # 0.5f
        -0x4129a1ba    # -0.418688f
        -0x425978e2
        0x3f000000    # 0.5f
    .end array-data

    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    :array_6
    .array-data 4
        0x3e3b645a    # 0.183f
        0x3f1d2f1b    # 0.614f
        0x3d7df3b6    # 0.062f
        0x3d808081
    .end array-data

    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    :array_7
    .array-data 4
        -0x423126e9    # -0.101f
        -0x41526e98    # -0.339f
        0x3ee0c49c    # 0.439f
        0x3f000000    # 0.5f
    .end array-data

    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    :array_8
    .array-data 4
        0x3ee0c49c    # 0.439f
        -0x4133b646    # -0.399f
        -0x42dc28f6    # -0.04f
        0x3f000000    # 0.5f
    .end array-data

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    :array_9
    .array-data 4
        0x3e59b3d0    # 0.2126f
        0x3f372474    # 0.7154f
        0x3d9374bc    # 0.072f
        0x0
    .end array-data

    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    :array_a
    .array-data 4
        -0x42158106    # -0.1145f
        -0x413a9fbe    # -0.3855f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
    .end array-data

    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    :array_b
    .array-data 4
        0x3f000000    # 0.5f
        -0x411765fe    # -0.4543f
        -0x42c4d014    # -0.0457f
        0x3f000000    # 0.5f
    .end array-data

    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    :array_c
    .array-data 4
        0x3e86809d    # 0.2627f
        0x3f2d9168    # 0.678f
        0x3d72e48f    # 0.0593f
        0x0
    .end array-data

    :array_d
    .array-data 4
        -0x41f10cb3    # -0.1396f
        -0x414779a7    # -0.3604f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
    .end array-data

    :array_e
    .array-data 4
        0x3f000000    # 0.5f
        -0x41149518    # -0.4598f
        -0x42db573f    # -0.0402f
        0x3f000000    # 0.5f
    .end array-data
.end method

.method private constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lio/agora/base/internal/video/WrappedNativeColorSpace;

    .line 5
    .line 6
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Range;->Full:Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 7
    .line 8
    invoke-virtual {v1}, Lio/agora/base/VideoFrame$ColorSpace$Range;->getRange()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sget-object v2, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->SMPTE170M:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 13
    .line 14
    invoke-virtual {v2}, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->getMatrix()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    sget-object v3, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->SMPTE170M:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 19
    .line 20
    invoke-virtual {v3}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->getTransfer()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    sget-object v4, Lio/agora/base/VideoFrame$ColorSpace$Primary;->kSMPTE170M:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 25
    .line 26
    invoke-virtual {v4}, Lio/agora/base/VideoFrame$ColorSpace$Primary;->getPrimary()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    invoke-direct {v0, v1, v2, v3, v4}, Lio/agora/base/internal/video/WrappedNativeColorSpace;-><init>(IIII)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 34
    .line 35
    return-void
.end method

.method public synthetic constructor <init>(Lio/agora/base/internal/video/YuvConverter$1;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;-><init>()V

    return-void
.end method


# virtual methods
.method public onNewShader(Lio/agora/base/internal/video/GlShader;)V
    .locals 1

    .line 1
    const-string v0, "xUnit"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lio/agora/base/internal/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->xUnitLoc:I

    .line 8
    .line 9
    const-string v0, "coeffs"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lio/agora/base/internal/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffsLoc:I

    .line 16
    .line 17
    return-void
.end method

.method public onPrepareShader(Lio/agora/base/internal/video/GlShader;[FIIII)V
    .locals 0

    .line 1
    iget p1, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffsLoc:I

    .line 2
    .line 3
    iget-object p4, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffs:[F

    .line 4
    .line 5
    const/4 p5, 0x1

    .line 6
    const/4 p6, 0x0

    .line 7
    invoke-static {p1, p5, p4, p6}, Landroid/opengl/GLES20;->glUniform4fv(II[FI)V

    .line 8
    .line 9
    .line 10
    iget p1, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->xUnitLoc:I

    .line 11
    .line 12
    iget p0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->stepSize:F

    .line 13
    .line 14
    aget p4, p2, p6

    .line 15
    .line 16
    mul-float/2addr p4, p0

    .line 17
    int-to-float p3, p3

    .line 18
    div-float/2addr p4, p3

    .line 19
    aget p2, p2, p5

    .line 20
    .line 21
    mul-float/2addr p0, p2

    .line 22
    div-float/2addr p0, p3

    .line 23
    invoke-static {p1, p4, p0}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setColorSpace(Lio/agora/base/VideoFrame$ColorSpace;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public setPlaneU()V
    .locals 3

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    iput v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->stepSize:F

    .line 4
    .line 5
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 6
    .line 7
    invoke-interface {v0}, Lio/agora/base/VideoFrame$ColorSpace;->getTransfer()Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->BT2020_10:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->U_BT2020_FULL:[F

    .line 16
    .line 17
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffs:[F

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 21
    .line 22
    invoke-interface {v0}, Lio/agora/base/VideoFrame$ColorSpace;->getRange()Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Range;->Full:Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 27
    .line 28
    iget-object v2, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 29
    .line 30
    if-ne v0, v1, :cond_2

    .line 31
    .line 32
    invoke-interface {v2}, Lio/agora/base/VideoFrame$ColorSpace;->getMatrix()Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->BT709:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 37
    .line 38
    if-ne v0, v1, :cond_1

    .line 39
    .line 40
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->U_COEFFS_BIT709_FULL:[F

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->U_COEFFS_BIT601_FULL:[F

    .line 44
    .line 45
    :goto_0
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffs:[F

    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    invoke-interface {v2}, Lio/agora/base/VideoFrame$ColorSpace;->getMatrix()Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->BT709:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 53
    .line 54
    if-ne v0, v1, :cond_3

    .line 55
    .line 56
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->U_COEFFS_BIT709_LIMIT:[F

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->U_COEFFS_BIT601_LIMIT:[F

    .line 60
    .line 61
    :goto_1
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffs:[F

    .line 62
    .line 63
    return-void
.end method

.method public setPlaneV()V
    .locals 3

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    iput v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->stepSize:F

    .line 4
    .line 5
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 6
    .line 7
    invoke-interface {v0}, Lio/agora/base/VideoFrame$ColorSpace;->getTransfer()Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->BT2020_10:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->V_BT2020_FULL:[F

    .line 16
    .line 17
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffs:[F

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 21
    .line 22
    invoke-interface {v0}, Lio/agora/base/VideoFrame$ColorSpace;->getRange()Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Range;->Full:Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 27
    .line 28
    iget-object v2, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 29
    .line 30
    if-ne v0, v1, :cond_2

    .line 31
    .line 32
    invoke-interface {v2}, Lio/agora/base/VideoFrame$ColorSpace;->getMatrix()Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->BT709:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 37
    .line 38
    if-ne v0, v1, :cond_1

    .line 39
    .line 40
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->V_COEFFS_BIT709_FULL:[F

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->V_COEFFS_BIT601_FULL:[F

    .line 44
    .line 45
    :goto_0
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffs:[F

    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    invoke-interface {v2}, Lio/agora/base/VideoFrame$ColorSpace;->getMatrix()Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->BT709:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 53
    .line 54
    if-ne v0, v1, :cond_3

    .line 55
    .line 56
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->V_COEFFS_BIT709_LIMIT:[F

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->V_COEFFS_BIT601_LIMIT:[F

    .line 60
    .line 61
    :goto_1
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffs:[F

    .line 62
    .line 63
    return-void
.end method

.method public setPlaneY()V
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    iput v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->stepSize:F

    .line 4
    .line 5
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 6
    .line 7
    invoke-interface {v0}, Lio/agora/base/VideoFrame$ColorSpace;->getTransfer()Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->BT2020_10:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->Y_BT2020_FULL:[F

    .line 16
    .line 17
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffs:[F

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 21
    .line 22
    invoke-interface {v0}, Lio/agora/base/VideoFrame$ColorSpace;->getRange()Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Range;->Full:Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 27
    .line 28
    iget-object v2, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 29
    .line 30
    if-ne v0, v1, :cond_2

    .line 31
    .line 32
    invoke-interface {v2}, Lio/agora/base/VideoFrame$ColorSpace;->getMatrix()Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->BT709:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 37
    .line 38
    if-ne v0, v1, :cond_1

    .line 39
    .line 40
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->Y_COEFFS_BIT709_FULL:[F

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->Y_COEFFS_BIT601_FULL:[F

    .line 44
    .line 45
    :goto_0
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffs:[F

    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    invoke-interface {v2}, Lio/agora/base/VideoFrame$ColorSpace;->getMatrix()Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget-object v1, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->BT709:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 53
    .line 54
    if-ne v0, v1, :cond_3

    .line 55
    .line 56
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->Y_COEFFS_BIT709_LIMIT:[F

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->Y_COEFFS_BIT601_LIMIT:[F

    .line 60
    .line 61
    :goto_1
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->coeffs:[F

    .line 62
    .line 63
    return-void
.end method
