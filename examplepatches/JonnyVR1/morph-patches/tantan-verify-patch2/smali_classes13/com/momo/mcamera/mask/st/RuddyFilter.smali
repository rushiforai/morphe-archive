.class public Lcom/momo/mcamera/mask/st/RuddyFilter;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field protected final BEAUTY_VALUE:Ljava/lang/String;

.field protected final RUDDY_VALUE:Ljava/lang/String;

.field protected final TEXTURE_RUDDY:Ljava/lang/String;

.field protected final TEXTURE_WHITEN:Ljava/lang/String;

.field private contextWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private reddenUniform:I

.field private ruddyTableUniform:I

.field private ruddyTextureId:I

.field protected ruddyValue:F

.field private whitenTableUniform:I

.field private whitenTextureId:I

.field private whitenUniform:I

.field protected whitenValue:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "whitenValue"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->BEAUTY_VALUE:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "ruddyValue"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->RUDDY_VALUE:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "whitenTexture"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->TEXTURE_WHITEN:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "ruddyTexture"

    .line 17
    .line 18
    iput-object v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->TEXTURE_RUDDY:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->ruddyTextureId:I

    .line 22
    .line 23
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenTextureId:I

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput v1, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->ruddyValue:F

    .line 27
    .line 28
    iput v1, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenValue:F

    .line 29
    .line 30
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->ruddyTableUniform:I

    .line 31
    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenTableUniform:I

    .line 33
    .line 34
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->reddenUniform:I

    .line 35
    .line 36
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenUniform:I

    .line 37
    .line 38
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 39
    .line 40
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->contextWeakReference:Ljava/lang/ref/WeakReference;

    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\n varying vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform sampler2D ruddyTexture;\n uniform sampler2D whitenTexture;\n uniform float whitenValue;\n uniform float ruddyValue;\n vec3 filterColor(vec3 src, sampler2D table, float factor){\n    highp float blue = src.b * 63.0;\n    highp vec2 q1;\n    float fb = floor(blue);\n    q1.y = floor(fb * 0.125);\n    q1.x = fb - (q1.y * 8.0);\n    highp vec2 q2;\n    float cb = ceil(blue);\n    q2.y = floor(cb * 0.125);\n    q2.x = cb - (q2.y * 8.0);\n    vec2 t = 0.123 * src.rg + vec2(0.000976563);\n    vec2 t1 = q1 * 0.125 + t;\n    vec3 p1 = texture2D(table, t1).rgb;\n    vec2 t2 = q2 * 0.125 + t;\n    vec3 p2 = texture2D(table, t2).rgb;\n    vec3 filtered = mix(p1, p2, fract(blue));\n    return mix(src, filtered, factor);\n}\n void main() {\n    vec4 src = texture2D(inputImageTexture0, textureCoordinate);\n    vec3 whitenResult = filterColor(src.rgb, whitenTexture, whitenValue);\n    vec3 reddenResult = filterColor(whitenResult, ruddyTexture, ruddyValue);\n    gl_FragColor = vec4(reddenResult, src.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getRuddyPic()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "ruddy.png"

    .line 2
    .line 3
    return-object p0
.end method

.method public getWhitePic()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "white.png"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "whitenValue"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenUniform:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "ruddyValue"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->reddenUniform:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "whitenTexture"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenTableUniform:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "ruddyTexture"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->ruddyTableUniform:I

    .line 43
    .line 44
    iget-object v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->contextWeakReference:Ljava/lang/ref/WeakReference;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Landroid/content/Context;

    .line 51
    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/st/RuddyFilter;->getWhitePic()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 68
    .line 69
    .line 70
    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 71
    :try_start_1
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/st/RuddyFilter;->getRuddyPic()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v0, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 84
    .line 85
    .line 86
    move-result-object v1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 87
    goto :goto_1

    .line 88
    :catch_0
    move-exception v0

    .line 89
    goto :goto_0

    .line 90
    :catch_1
    move-exception v0

    .line 91
    move-object v2, v1

    .line 92
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 93
    .line 94
    .line 95
    :goto_1
    invoke-static {v2}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenTextureId:I

    .line 100
    .line 101
    invoke-static {v1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iput v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->ruddyTextureId:I

    .line 106
    .line 107
    :cond_0
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    const v0, 0x84c3

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenTextureId:I

    .line 11
    .line 12
    const/16 v1, 0xde1

    .line 13
    .line 14
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 15
    .line 16
    .line 17
    iget v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenTableUniform:I

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 21
    .line 22
    .line 23
    const v0, 0x84c4

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->ruddyTextureId:I

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->ruddyTableUniform:I

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 38
    .line 39
    .line 40
    iget v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenUniform:I

    .line 41
    .line 42
    iget v1, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenValue:F

    .line 43
    .line 44
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 45
    .line 46
    .line 47
    iget v0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->reddenUniform:I

    .line 48
    .line 49
    iget p0, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->ruddyValue:F

    .line 50
    .line 51
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public setRuddyValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->ruddyValue:F

    .line 2
    .line 3
    return-void
.end method
