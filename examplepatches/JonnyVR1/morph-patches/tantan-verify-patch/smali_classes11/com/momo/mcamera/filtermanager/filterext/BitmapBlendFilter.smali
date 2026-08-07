.class public Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;
.super Ll/hs10;
.source "SourceFile"


# static fields
.field private static final BLEND_KEY_ADD:Ljava/lang/String; = "Add"

.field private static final BLEND_KEY_COLOR:Ljava/lang/String; = "Color"

.field private static final BLEND_KEY_COLOR_BURN:Ljava/lang/String; = "ColorBurn"

.field private static final BLEND_KEY_COLOR_DODGE:Ljava/lang/String; = "ColorDodge"

.field private static final BLEND_KEY_DARKEN:Ljava/lang/String; = "Darken"

.field private static final BLEND_KEY_DIFFERENCE:Ljava/lang/String; = "Difference"

.field private static final BLEND_KEY_DIVIDE:Ljava/lang/String; = "Divide"

.field private static final BLEND_KEY_EXCLUSION:Ljava/lang/String; = "Exclusion"

.field private static final BLEND_KEY_HARDLIGHT:Ljava/lang/String; = "HardLight"

.field private static final BLEND_KEY_HUE:Ljava/lang/String; = "Hue"

.field private static final BLEND_KEY_LIGHTEN:Ljava/lang/String; = "Lighten"

.field private static final BLEND_KEY_LINEARBURN:Ljava/lang/String; = "LinearBurn"

.field private static final BLEND_KEY_LUMINOSITY:Ljava/lang/String; = "Luminosity"

.field private static final BLEND_KEY_MASK:Ljava/lang/String; = "Mask"

.field private static final BLEND_KEY_MULTIPLY:Ljava/lang/String; = "Multiply"

.field private static final BLEND_KEY_NORMAL:Ljava/lang/String; = "Normal"

.field private static final BLEND_KEY_OVERLAY:Ljava/lang/String; = "Overlay"

.field private static final BLEND_KEY_SATURATION:Ljava/lang/String; = "Saturation"

.field private static final BLEND_KEY_SCREEN_BLEND:Ljava/lang/String; = "Screen"

.field private static final BLEND_KEY_SOFT_LIGHT:Ljava/lang/String; = "SoftLight"

.field private static final BLEND_KEY_SOURCE_OVER:Ljava/lang/String; = "SourceOver"

.field private static final BLEND_KEY_SUBTRACT:Ljava/lang/String; = "Subtract"


# instance fields
.field private bitMapChanged:Z

.field private blendFragmentShaderMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public blendType:Ljava/lang/String;

.field private maskBitmap:Landroid/graphics/Bitmap;

.field private mask_texture:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 11
    .line 12
    const-string v1, "Add"

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getAddBlendFragmentShader()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 22
    .line 23
    const-string v1, "Color"

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getColorFragmentShader()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 33
    .line 34
    const-string v1, "ColorBurn"

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getColorBurnFragmentShader()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 44
    .line 45
    const-string v1, "ColorDodge"

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getColorDodgeFragmentShader()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 55
    .line 56
    const-string v1, "Darken"

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getDarkenFragmentShader()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 66
    .line 67
    const-string v1, "Difference"

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getDifferenceFragmentShader()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 77
    .line 78
    const-string v1, "Divide"

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getDivideFragmentShader()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 88
    .line 89
    const-string v1, "Exclusion"

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getExclusionFragmentShader()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 99
    .line 100
    const-string v1, "HardLight"

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getHardLightFragmentShader()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 110
    .line 111
    const-string v1, "Hue"

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getHueFragmentShader()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 121
    .line 122
    const-string v1, "Lighten"

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getLightenFragmentShader()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 132
    .line 133
    const-string v1, "LinearBurn"

    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getLinearBurnFragmentShader()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 143
    .line 144
    const-string v1, "Luminosity"

    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getLuminosityFragmentShader()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 154
    .line 155
    const-string v1, "Mask"

    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getMaskFragmentShader()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 165
    .line 166
    const-string v1, "Multiply"

    .line 167
    .line 168
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getMultiplyFragmentShader()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 176
    .line 177
    const-string v1, "Normal"

    .line 178
    .line 179
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getNormalFragmentShader()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 187
    .line 188
    const-string v1, "Overlay"

    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getOverlayFragmentShader()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 198
    .line 199
    const-string v1, "Saturation"

    .line 200
    .line 201
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getSaturationFragmentShader()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 209
    .line 210
    const-string v1, "Screen"

    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getScreenFragmentShader()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 220
    .line 221
    const-string v1, "SoftLight"

    .line 222
    .line 223
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getSoftLightFragmentShader()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 231
    .line 232
    const-string v1, "SourceOver"

    .line 233
    .line 234
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getSourceoverFragmentShader()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 242
    .line 243
    const-string v1, "Subtract"

    .line 244
    .line 245
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->getSubtractFragmentShader()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/hs10;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->mask_texture:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->mask_texture:I

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->maskBitmap:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->maskBitmap:Landroid/graphics/Bitmap;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->maskBitmap:Landroid/graphics/Bitmap;

    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public getAddBlendFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   float r;\n   if (color2.r * color1.a + color1.r * color2.a >= color2.a * color1.a) {\n     r = color2.a * color1.a + color2.r * (1.0 - color1.a) + color1.r * (1.0 - color2.a);\n   } else {\n     r = color2.r + color1.r;\n   }\n   float g;\n   if (color2.g * color1.a + color1.g * color2.a >= color2.a * color1.a) {\n     g = color2.a * color1.a + color2.g * (1.0 - color1.a) + color1.g * (1.0 - color2.a);\n   } else {\n     g = color2.g + color1.g;\n   }\n   float b;\n   if (color2.b * color1.a + color1.b * color2.a >= color2.a * color1.a) {\n     b = color2.a * color1.a + color2.b * (1.0 - color1.a) + color1.b * (1.0 - color2.a);\n   } else {\n     b = color2.b + color1.b;\n   }\n   float a  = color2.a + color1.a - color2.a * color1.a;\n   gl_FragColor = vec4(r, g, b, a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getBlendType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getColorBurnFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   vec4 whiteColor = vec4(1.0);\n   gl_FragColor = whiteColor - (whiteColor - color1) / color2;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getColorDodgeFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   vec3 baseOverlayAlphaProduct = vec3(color2.a * color1.a);\n   vec3 rightHandProduct = color2.rgb * (1.0 - color1.a) + color1.rgb * (1.0 - color2.a);\n   vec3 firstBlendColor = baseOverlayAlphaProduct + rightHandProduct;\n   vec3 overlayRGB = clamp((color2.rgb / clamp(color2.a, 0.01, 1.0)) * step(0.0, color2.a), 0.0, 0.99);\n   vec3 secondBlendColor = (color1.rgb * color2.a) / (1.0 - overlayRGB) + rightHandProduct;\n   vec3 colorChoice = step((color2.rgb * color1.a + color1.rgb * color2.a), baseOverlayAlphaProduct);\n   gl_FragColor = vec4(mix(firstBlendColor, secondBlendColor, colorChoice), 1.0);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getColorFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nhighp float lum(lowp vec3 c) {\n  return dot(c, vec3(0.3, 0.59, 0.11));\n}\nvec3 setlum(lowp vec3 c, highp float l2) {\n  float d = l2 - lum(c);\n  c = c + vec3(d);\n  float l = lum(c);\n  float n = min(min(c.r, c.g), c.b);\n  float x = max(max(c.r, c.g), c.b);\n  if (n < 0.0) {\n    c.r = l + ((c.r - l) * l) / (l - n);\n    c.g = l + ((c.g - l) * l) / (l - n);\n    c.b = l + ((c.b - l) * l) / (l - n);\n  }\n  if (x > 1.0) {\n    c.r = l + ((c.r - l) * (1.0 - l)) / (x - l);\n    c.g = l + ((c.g - l) * (1.0 - l)) / (x - l);\n    c.b = l + ((c.b - l) * (1.0 - l)) / (x - l);\n  }\n  return c;\n}\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = vec4(color1.rgb * (1.0 - color2.a) + setlum(color2.rgb, lum(color1.rgb)) * color2.a, color1.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getDarkenFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = vec4(min(color2.rgb * color1.a, color1.rgb * color2.a) + color2.rgb * (1.0 - color1.a) + color1.rgb * (1.0 - color2.a), 1.0);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getDifferenceFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = vec4(abs(color2.rgb - color1.rgb), color1.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getDivideFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   float r;\n   if (color2.r == 0.0 || ((color1.r / color2.r) > (color1.a / color2.a))) {\n     r = color2.a * color1.a + color2.r * (1.0 - color1.a) + color1.r * (1.0 - color2.a);\n   } else {\n     r = (color1.r * color2.a * color2.a) / color2.r + color2.r * (1.0 - color1.a) + color1.r * (1.0 - color2.a);\n   }\n   float g;\n   if (color2.g == 0.0 || ((color1.g / color2.g) > (color1.a / color2.a))) {\n     g = color2.a * color1.a + color2.g * (1.0 - color1.a) + color1.g * (1.0 - color2.a);\n   } else {\n     g = (color1.g * color2.a * color2.a) / color2.g + color2.g * (1.0 - color1.a) + color1.g * (1.0 - color2.a);\n   }\n   float b;\n   if (color2.b == 0.0 || ((color1.b / color2.b) > (color1.a / color2.a))) {\n     b = color2.a * color1.a + color2.b * (1.0 - color1.a) + color1.b * (1.0 - color2.a);\n   } else {\n     b = (color1.b * color2.a * color2.a) / color2.b + color2.b * (1.0 - color1.a) + color1.b * (1.0 - color2.a);\n   }\n   float a  = color2.a + color1.a - color2.a * color1.a;\n   gl_FragColor = vec4(r, g, b, a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getExclusionFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = vec4((color2.rgb * color1.a + color1.rgb * color2.a - 2.0 * color2.rgb * color1.rgb) + color2.rgb * (1.0 - color1.a) + color1.rgb * (1.0 - color2.a), color1.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendType:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendType:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/String;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n  vec2 textCood = textureCoordinate;  vec2 textCanvas = vec2(textCood.x,1.0 - textCood.y);   vec4 color2 = texture2D(inputImageTexture0,textCood);\n   vec4 color1 = texture2D(inputImageTexture1,textCanvas);\n   vec4 outputColor;\n   if (color1.a > 0.0) {color1.rgb = color1.rgb/color1.a;}   float a = color1.a + color2.a * (1.0 - color1.a);\n   a = a + step(a,0.0);\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = a;\n   gl_FragColor = outputColor;\n}\n"

    .line 28
    .line 29
    :cond_1
    return-object p0
.end method

.method public getHardLightFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   float r;\n   if (2.0 * color2.r < color2.a) {\n     r = 2.0 * color2.r * color1.r + color2.r * (1.0 - color1.a) + color1.r * (1.0 - color2.a);\n   } else {\n     r = color2.a * color1.a - 2.0 * (color1.a - color1.r) * (color2.a - color2.r) + color2.r * (1.0 - color1.a) + color1.r * (1.0 - color2.a);\n   }\n   float g;\n   if (2.0 * color2.g < color2.a) {\n     g = 2.0 * color2.g * color1.g + color2.g * (1.0 - color1.a) + color1.g * (1.0 - color2.a);\n   } else {\n     g = color2.a * color1.a - 2.0 * (color1.a - color1.g) * (color2.a - color2.g) + color2.g * (1.0 - color1.a) + color1.g * (1.0 - color2.a);\n   }\n   float b;\n   if (2.0 * color2.b < color2.a) {\n     b = 2.0 * color2.b * color1.b + color2.b * (1.0 - color1.a) + color1.b * (1.0 - color2.a);\n   } else {\n     b = color2.a * color1.a - 2.0 * (color1.a - color1.b) * (color2.a - color2.b) + color2.b * (1.0 - color1.a) + color1.b * (1.0 - color2.a);\n   }\n   gl_FragColor = vec4(r, g, b, 1.0);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getHueFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nhighp float lum(lowp vec3 c) {\n  return dot(c, vec3(0.3, 0.59, 0.11));\n}\nlowp vec3 setlum(lowp vec3 c, highp float l2) {\n  float d = l2 - lum(c);\n  c = c + vec3(d);\n  float l = lum(c);\n  float n = min(min(c.r, c.g), c.b);\n  float x = max(max(c.r, c.g), c.b);\n  if (n < 0.0) {\n    c.r = l + ((c.r - l) * l) / (l - n);\n    c.g = l + ((c.g - l) * l) / (l - n);\n    c.b = l + ((c.b - l) * l) / (l - n);\n  }\n  if (x > 1.0) {\n    c.r = l + ((c.r - l) * (1.0 - l)) / (x - l);\n    c.g = l + ((c.g - l) * (1.0 - l)) / (x - l);\n    c.b = l + ((c.b - l) * (1.0 - l)) / (x - l);\n  }\n  return c;\n}\nhighp float sat(lowp vec3 c) {\n     lowp float n = min(min(c.r, c.g), c.b);\n     lowp float x = max(max(c.r, c.g), c.b);\n     return x - n;\n}\nlowp float mid(lowp float cmin, lowp float cmid, lowp float cmax, highp float s) {\n     return ((cmid - cmin) * s) / (cmax - cmin);\n}\nlowp vec3 setsat(lowp vec3 c, highp float s) {\n     if (c.r > c.g) {\n         if (c.r > c.b) {\n             if (c.g > c.b) {\n                 c.g = mid(c.b, c.g, c.r, s);\n                 c.b = 0.0;\n             } else {\n                 c.b = mid(c.g, c.b, c.r, s);\n                 c.g = 0.0;\n             }\n             c.r = s;\n        } else {\n             c.r = mid(c.g, c.r, c.b, s);\n             c.b = s;\n             c.g = 0.0;\n         }\n     } else if (c.r > c.b) {\n         c.r = mid(c.b, c.r, c.g, s);\n         c.g = s;\n         c.b = 0.0;\n     } else if (c.g > c.b) {\n         c.b = mid(c.r, c.b, c.g, s);\n         c.g = s;\n         c.r = 0.0;\n     } else if (c.b > c.g) {\n         c.g = mid(c.r, c.g, c.b, s);\n         c.b = s;\n         c.r = 0.0;\n     } else {\n         c = vec3(0.0);\n     }\n     return c;\n}\nvoid main(){\n   highp vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   highp vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = vec4(color1.rgb * (1.0 - color2.a) + setlum(setsat(color2.rgb, sat(color1.rgb)), lum(color1.rgb)) * color2.a, color1.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getLightenFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = max(color1, color2);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getLinearBurnFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = vec4(clamp(color1.rgb + color2.rgb - vec3(1.0), vec3(0.0), vec3(1.0)), color1.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getLuminosityFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nhighp float lum(lowp vec3 c) {\n  return dot(c, vec3(0.3, 0.59, 0.11));\n}\nvec3 setlum(lowp vec3 c, highp float l2) {\n  float d = l2 - lum(c);\n  c = c + vec3(d);\n  float l = lum(c);\n  float n = min(min(c.r, c.g), c.b);\n  float x = max(max(c.r, c.g), c.b);\n  if (n < 0.0) {\n    c.r = l + ((c.r - l) * l) / (l - n);\n    c.g = l + ((c.g - l) * l) / (l - n);\n    c.b = l + ((c.b - l) * l) / (l - n);\n  }\n  if (x > 1.0) {\n    c.r = l + ((c.r - l) * (1.0 - l)) / (x - l);\n    c.g = l + ((c.g - l) * (1.0 - l)) / (x - l);\n    c.b = l + ((c.b - l) * (1.0 - l)) / (x - l);\n  }\n  return c;\n}\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = vec4(color1.rgb * (1.0 - color2.a) + setlum(color1.rgb, lum(color2.rgb)) * color2.a, color1.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaskFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   float newAlpha = dot(color2.rgb, vec3(.33333334, .33333334, .33333334)) * color2.a;\n   gl_FragColor = vec4(color1.xyz, newAlpha);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getMultiplyFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = color2 * color1 + color2 * (1.0 - color1.a) + color1 * (1.0 - color2.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getNormalFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = color2 * color1 + color2 * (1.0 - color1.a) + color1 * (1.0 - color2.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getOverlayFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   float r;\n   if (color1.a > 0.0) {color1.rgb = color1.rgb/color1.a;}   if (2.0 * color1.r < color1.a) {\n     r = 2.0 * color2.r * color1.r + color2.r * (1.0 - color1.a) + color1.r * (1.0 - color2.a);\n   } else {\n     r = color2.a * color1.a - 2.0 * (color1.a - color1.r) * (color2.a - color2.r) + color2.r * (1.0 - color1.a) + color1.r * (1.0 - color2.a);\n   }\n   float g;\n   if (2.0 * color1.g < color1.a) {\n     g = 2.0 * color2.g * color1.g + color2.g * (1.0 - color1.a) + color1.g * (1.0 - color2.a);\n   } else {\n     g = color2.a * color1.a - 2.0 * (color1.a - color1.g) * (color2.a - color2.g) + color2.g * (1.0 - color1.a) + color1.g * (1.0 - color2.a);\n   }\n   float b;\n   if (2.0 * color1.b < color1.a) {\n     b = 2.0 * color2.b * color1.b + color2.b * (1.0 - color1.a) + color1.b * (1.0 - color2.a);\n   } else {\n     b = color2.a * color1.a - 2.0 * (color1.a - color1.b) * (color2.a - color2.b) + color2.b * (1.0 - color1.a) + color1.b * (1.0 - color2.a);\n   }\n   gl_FragColor = vec4(r, g, b, 1.0);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getSaturationFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nhighp float lum(lowp vec3 c) {\n  return dot(c, vec3(0.3, 0.59, 0.11));\n}\nlowp vec3 setlum(lowp vec3 c, highp float l2) {\n  float d = l2 - lum(c);\n  c = c + vec3(d);\n  float l = lum(c);\n  float n = min(min(c.r, c.g), c.b);\n  float x = max(max(c.r, c.g), c.b);\n  if (n < 0.0) {\n    c.r = l + ((c.r - l) * l) / (l - n);\n    c.g = l + ((c.g - l) * l) / (l - n);\n    c.b = l + ((c.b - l) * l) / (l - n);\n  }\n  if (x > 1.0) {\n    c.r = l + ((c.r - l) * (1.0 - l)) / (x - l);\n    c.g = l + ((c.g - l) * (1.0 - l)) / (x - l);\n    c.b = l + ((c.b - l) * (1.0 - l)) / (x - l);\n  }\n  return c;\n}\nhighp float sat(lowp vec3 c) {\n     lowp float n = min(min(c.r, c.g), c.b);\n     lowp float x = max(max(c.r, c.g), c.b);\n     return x - n;\n}\nlowp float mid(lowp float cmin, lowp float cmid, lowp float cmax, highp float s) {\n     return ((cmid - cmin) * s) / (cmax - cmin);\n}\nlowp vec3 setsat(lowp vec3 c, highp float s) {\n     if (c.r > c.g) {\n         if (c.r > c.b) {\n             if (c.g > c.b) {\n                 c.g = mid(c.b, c.g, c.r, s);\n                 c.b = 0.0;\n             } else {\n                 c.b = mid(c.g, c.b, c.r, s);\n                 c.g = 0.0;\n             }\n             c.r = s;\n        } else {\n             c.r = mid(c.g, c.r, c.b, s);\n             c.b = s;\n             c.g = 0.0;\n         }\n     } else if (c.r > c.b) {\n         c.r = mid(c.b, c.r, c.g, s);\n         c.g = s;\n         c.b = 0.0;\n     } else if (c.g > c.b) {\n         c.b = mid(c.r, c.b, c.g, s);\n         c.g = s;\n         c.r = 0.0;\n     } else if (c.b > c.g) {\n         c.g = mid(c.r, c.g, c.b, s);\n         c.b = s;\n         c.r = 0.0;\n     } else {\n         c = vec3(0.0);\n     }\n     return c;\n}\nvoid main(){\n   highp vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   highp vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = vec4(color1.rgb * (1.0 - color2.a) + setlum(setsat(color1.rgb, sat(color1.rgb)), lum(color2.rgb)) * color2.a, color1.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getScreenFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   vec4 whiteColor = vec4(1.0);\n   gl_FragColor = whiteColor - ((whiteColor - color2) * (whiteColor - color1));\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getSoftLightFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = color1 * (color2.a * (color1 / color1.a) + (2.0 * color2 * (1.0 - (color1 / color1.a)))) + color2 * (1.0 - color1.a) + color1 * (1.0 - color2.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getSourceoverFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = mix(color1, color2, color2.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubtractFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n   gl_FragColor = vec4(color1.rgb - color2.rgb, color1.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    const/4 v2, 0x1

    .line 9
    const/4 v3, 0x0

    .line 10
    if-lt v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Ll/hs10;->clearRegisteredFilterLocations()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p2, v3}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p0, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->mask_texture:I

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->bitMapChanged:Z

    .line 38
    .line 39
    if-eqz v1, :cond_4

    .line 40
    .line 41
    :cond_2
    if-eqz v0, :cond_3

    .line 42
    .line 43
    filled-new-array {v0}, [I

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 48
    .line 49
    .line 50
    iput v3, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->mask_texture:I

    .line 51
    .line 52
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->maskBitmap:Landroid/graphics/Bitmap;

    .line 53
    .line 54
    invoke-static {v0}, Ll/oim;->a(Landroid/graphics/Bitmap;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->mask_texture:I

    .line 59
    .line 60
    iput-boolean v3, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->bitMapChanged:Z

    .line 61
    .line 62
    :cond_4
    iget v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->mask_texture:I

    .line 63
    .line 64
    invoke-super {p0, v0, p0, p3}, Ll/hs10;->newTextureReady(ILl/gfj;Z)V

    .line 65
    .line 66
    .line 67
    invoke-super {p0, p1, p2, p3}, Ll/hs10;->newTextureReady(ILl/gfj;Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->mask_texture:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->mask_texture:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public setBlendBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->maskBitmap:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->bitMapChanged:Z

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public setBlendType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/filterext/BitmapBlendFilter;->blendType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
