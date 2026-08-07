.class public Lcom/bytedance/realx/video/GlGenericDrawer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/RendererCommon$GlDrawer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/GlGenericDrawer$ShaderCallbacks;,
        Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;
    }
.end annotation


# static fields
.field private static final DEFAULT_VERTEX_SHADER_STRING:Ljava/lang/String; = "varying vec2 tc;\nattribute vec4 in_pos;\nattribute vec4 in_tc;\nuniform mat4 tex_mat;\nvoid main() {\n  gl_Position = in_pos;\n  tc = (tex_mat * in_tc).xy;\n}\n"

.field private static final FULL_RECTANGLE_BUFFER:Ljava/nio/FloatBuffer;

.field private static final FULL_RECTANGLE_TEXTURE_BUFFER:Ljava/nio/FloatBuffer;

.field private static final INPUT_TEXTURE_COORDINATE_NAME:Ljava/lang/String; = "in_tc"

.field private static final INPUT_VERTEX_COORDINATE_NAME:Ljava/lang/String; = "in_pos"

.field private static final ORI_TEX_SIZE_NAME:Ljava/lang/String; = "ori_tex_size"

.field private static final TAR_TEX_SIZE_NAME:Ljava/lang/String; = "tar_tex_size"

.field private static final TEXTURE_MATRIX_NAME:Ljava/lang/String; = "tex_mat"


# instance fields
.field private currentScaleFilter:Lcom/bytedance/realx/video/FilterType;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private currentShader:Lcom/bytedance/realx/video/GlShader;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private currentShaderType:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final genericFragmentSource:Ljava/lang/String;

.field private inPosLocation:I

.field private inTcLocation:I

.field private oriTexSizeLocation:I

.field private final shaderCallbacks:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderCallbacks;

.field private tarTexSizeLocation:I

.field private texMatrixLocation:I

.field private final vertexShader:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [F

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v1}, Lcom/bytedance/realx/video/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sput-object v1, Lcom/bytedance/realx/video/GlGenericDrawer;->FULL_RECTANGLE_BUFFER:Ljava/nio/FloatBuffer;

    .line 13
    .line 14
    new-array v0, v0, [F

    .line 15
    .line 16
    fill-array-data v0, :array_1

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Lcom/bytedance/realx/video/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lcom/bytedance/realx/video/GlGenericDrawer;->FULL_RECTANGLE_TEXTURE_BUFFER:Ljava/nio/FloatBuffer;

    .line 24
    .line 25
    return-void

    .line 26
    nop

    .line 27
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    :array_1
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/bytedance/realx/video/GlGenericDrawer$ShaderCallbacks;)V
    .locals 1

    .line 11
    const-string v0, "varying vec2 tc;\nattribute vec4 in_pos;\nattribute vec4 in_tc;\nuniform mat4 tex_mat;\nvoid main() {\n  gl_Position = in_pos;\n  tc = (tex_mat * in_tc).xy;\n}\n"

    invoke-direct {p0, v0, p1, p2}, Lcom/bytedance/realx/video/GlGenericDrawer;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/bytedance/realx/video/GlGenericDrawer$ShaderCallbacks;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/bytedance/realx/video/GlGenericDrawer$ShaderCallbacks;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bytedance/realx/video/GlGenericDrawer;->vertexShader:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/bytedance/realx/video/GlGenericDrawer;->genericFragmentSource:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/bytedance/realx/video/GlGenericDrawer;->shaderCallbacks:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderCallbacks;

    .line 9
    .line 10
    return-void
.end method

.method public static createFragmentShaderString(Ljava/lang/String;Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;Lcom/bytedance/realx/video/FilterType;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;->OES:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;

    .line 7
    .line 8
    if-ne p1, v1, :cond_0

    .line 9
    .line 10
    const-string v2, "#extension GL_OES_EGL_image_external : require\n"

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    :cond_0
    const-string v2, "precision mediump float;\nvarying vec2 tc;\n"

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    sget-object v2, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 21
    .line 22
    if-eq p2, v2, :cond_1

    .line 23
    .line 24
    const-string v2, "uniform vec2 tar_tex_size;\nuniform vec2 ori_tex_size;\n"

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    :cond_1
    sget-object v2, Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;->YUV:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;

    .line 30
    .line 31
    if-ne p1, v2, :cond_5

    .line 32
    .line 33
    const-string p1, "uniform sampler2D y_tex;\nuniform sampler2D u_tex;\nuniform sampler2D v_tex;\n"

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    sget-object p1, Lcom/bytedance/realx/video/FilterType;->Bilinear:Lcom/bytedance/realx/video/FilterType;

    .line 39
    .line 40
    if-ne p2, p1, :cond_2

    .line 41
    .line 42
    const-string p1, "float bilinearTextureSample(sampler2D tex, vec2 p) {\n        vec2 c_onePixel =  vec2(1.0 / ori_tex_size.y - tar_tex_size.x + tar_tex_size.x, 1.0 / ori_tex_size.y);\n    vec2 frac = vec2(0.5, 0.5);\n    float C11 = texture2D(tex, p - c_onePixel).r;\n    float C21 = texture2D(tex, p + vec2( c_onePixel.x , -c_onePixel.y)).r;\n    float C12 = texture2D(tex, p + vec2( -c_onePixel.x , c_onePixel.y)).r;\n    float C22 = texture2D(tex, p + c_onePixel).r;\n    float x1 = mix(C11, C21, frac.x);\n    float x2 = mix(C12, C22, frac.x);\n    return mix(x1, x2, frac.y);\n}\nvec4 sample(vec2 p) {\n  float y = bilinearTextureSample(y_tex, p) * 1.16438;\n  float u = bilinearTextureSample(u_tex, p);\n  float v = bilinearTextureSample(v_tex, p);\n  return vec4(y + 1.59603 * v - 0.874202,\n    y - 0.391762 * u - 0.812968 * v + 0.531668,\n    y + 2.01723 * u - 1.08563, 1);\n}\n"

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    sget-object p1, Lcom/bytedance/realx/video/FilterType;->Bicubic:Lcom/bytedance/realx/video/FilterType;

    .line 49
    .line 50
    if-ne p2, p1, :cond_3

    .line 51
    .line 52
    const-string p1, "vec3 cubic_hermite (vec3 A, vec3 B, vec3 C, vec3 D, float t) {\n\t  float t2 = t*t;\n    float t3 = t*t*t;\n    vec3 a = -A/2.0 + (3.0*B)/2.0 - (3.0*C)/2.0 + D/2.0;\n    vec3 b = A - (5.0*B)/2.0 + 2.0*C - D / 2.0;\n    vec3 c = -A/2.0 + C/2.0;\n   \tvec3 d = B;\n    return a*t3 + b*t2 + c*t + d;\n}\nvec4 bicubic_sample (sampler2D tex, , vec2 P) {\n    float c_onePixel_x = 1.0 / ori_tex_size.x - tar_tex_size.x + tar_tex_size.x;\n    float c_onePixel_y = 1.0 / ori_tex_size.y;\n    float c_twoPixels_x = 2.0 / ori_tex_size.x;\n    float c_twoPixels_y = 2.0 / ori_tex_size.y;\n    vec2 pixel = vec2(P.x * ori_tex_size.x, P.y * ori_tex_size.y) + 0.5;\n    vec2 frac = fract(pixel);\n    pixel = floor(pixel);\n    pixel = vec2(pixel.x / ori_tex_size.x, pixel.y / ori_tex_size.y) - vec2(c_onePixel_x, c_onePixel_y) / 2.0;\n    vec3 C00 = texture2D(tex, pixel + vec2(-c_onePixel_x ,-c_onePixel_y)).rgb;\n    vec3 C10 = texture2D(tex, pixel + vec2( 0.0        ,-c_onePixel_y)).rgb;\n    vec3 C20 = texture2D(tex, pixel + vec2( c_onePixel_x ,-c_onePixel_y)).rgb;\n    vec3 C30 = texture2D(tex, pixel + vec2( c_twoPixels_x,-c_onePixel_y)).rgb;\n    vec3 C01 = texture2D(tex, pixel + vec2(-c_onePixel_x , 0.0)).rgb;\n    vec3 C11 = texture2D(tex, pixel + vec2( 0.0        , 0.0)).rgb;\n    vec3 C21 = texture2D(tex, pixel + vec2( c_onePixel_x , 0.0)).rgb;\n    vec3 C31 = texture2D(tex, pixel + vec2( c_twoPixels_x, 0.0)).rgb;\n    vec3 C02 = texture2D(tex, pixel + vec2(-c_onePixel_x , c_onePixel_y)).rgb;\n    vec3 C12 = texture2D(tex, pixel + vec2( 0.0        , c_onePixel_y)).rgb;\n    vec3 C22 = texture2D(tex, pixel + vec2( c_onePixel_x , c_onePixel_y)).rgb;\n    vec3 C32 = texture2D(tex, pixel + vec2( c_twoPixels_x, c_onePixel_y)).rgb;\n    vec3 C03 = texture2D(tex, pixel + vec2(-c_onePixel_x , c_twoPixels_y)).rgb;\n    vec3 C13 = texture2D(tex, pixel + vec2( 0.0        , c_twoPixels_y)).rgb;\n    vec3 C23 = texture2D(tex, pixel + vec2( c_onePixel_x , c_twoPixels_y)).rgb;\n    vec3 C33 = texture2D(tex, pixel + vec2( c_twoPixels_x, c_twoPixels_y)).rgb;  \n    vec3 CP0X = cubic_hermite(C00, C10, C20, C30, frac.x);\n    vec3 CP1X = cubic_hermite(C01, C11, C21, C31, frac.x);\n    vec3 CP2X = cubic_hermite(C02, C12, C22, C32, frac.x);\n    vec3 CP3X = cubic_hermite(C03, C13, C23, C33, frac.x);\n    return vec4(cubic_hermite(CP0X, CP1X, CP2X, CP3X, frac.y), 1.0);}\nvec4 sample(vec2 p) {\n  float y = bicubic_sample(y_tex, p) * 1.16438;\n  float u = bicubic_sample(u_tex, p);\n  float v = bicubic_sample(v_tex, p);\n  return vec4(y + 1.59603 * v - 0.874202,\n    y - 0.391762 * u - 0.812968 * v + 0.531668,\n    y + 2.01723 * u - 1.08563, 1);\n}\n"

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    sget-object p1, Lcom/bytedance/realx/video/FilterType;->BOX:Lcom/bytedance/realx/video/FilterType;

    .line 59
    .line 60
    if-ne p2, p1, :cond_4

    .line 61
    .line 62
    const-string p1, "float box_filter(sampler2D tex, vec2 p) {\n  vec2 c_onePixel =  1.0 / ori_tex_size;\n  float C11, C12, C13, C21, C22, C23, C31, C32, C33;\n  C11 = texture2D(tex, p - c_onePixel).r;\n  C12 = texture2D(tex, p + vec2( 0, -c_onePixel.y)).r;\n  C13 = texture2D(tex, p + vec2( c_onePixel.x, -c_onePixel.y)).r;\n  C21 = texture2D(tex, p + vec2( -c_onePixel.x , 0)).r;\n  C22 = texture2D(tex, p).r;\n  C23 = texture2D(tex, p + vec2( c_onePixel.x , 0)).r;\n  C31 = texture2D(tex, p + vec2( -c_onePixel.x , c_onePixel.y)).r;\n  C32 = texture2D(tex, p + vec2( 0 , c_onePixel.y)).r;\n  C33 = texture2D(tex, p + c_onePixel).r;\n  return (C11 + C12 + C13 + C21 + C22 + C23 + C31 + C32 + C33) / 9.0;\n}\nvec4 sample(vec2 p) {\n  float y = box_filter(y_tex, p) * 1.16438;\n  float u = box_filter(u_tex, p);\n  float v = box_filter(v_tex, p);\n  return vec4(y + 1.59603 * v - 0.874202,\n    y - 0.391762 * u - 0.812968 * v + 0.531668,\n    y + 2.01723 * u - 1.08563, 1);\n}\n"

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    const-string p1, "vec4 sample(vec2 p) {\n  float y = texture2D(y_tex, p).r * 1.16438;\n  float u = texture2D(u_tex, p).r;\n  float v = texture2D(v_tex, p).r;\n  return vec4(y + 1.59603 * v - 0.874202,\n    y - 0.391762 * u - 0.812968 * v + 0.531668,\n    y + 2.01723 * u - 1.08563, 1);\n}\n"

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_5
    if-ne p1, v1, :cond_6

    .line 78
    .line 79
    const-string p1, "samplerExternalOES"

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_6
    const-string p1, "sampler2D"

    .line 83
    .line 84
    :goto_1
    const-string v1, "uniform "

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string p1, " tex;\n"

    .line 93
    .line 94
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    sget-object p1, Lcom/bytedance/realx/video/FilterType;->Bilinear:Lcom/bytedance/realx/video/FilterType;

    .line 98
    .line 99
    if-ne p2, p1, :cond_7

    .line 100
    .line 101
    const-string p1, "vec4 sample(vec2 p) {\n    vec2 c_onePixel =  vec2(1.0 / ori_tex_size.y - tar_tex_size.x + tar_tex_size.x, 1.0 / ori_tex_size.y);\n    vec2 frac = vec2(0.5, 0.5);\n    vec3 C11 = texture2D(tex, p - c_onePixel).rgb;\n    vec3 C21 = texture2D(tex, p + vec2( c_onePixel.x , -c_onePixel.y)).rgb;\n    vec3 C12 = texture2D(tex, p + vec2( -c_onePixel.x , c_onePixel.y)).rgb;\n    vec3 C22 = texture2D(tex, p + c_onePixel).rgb;\n    vec3 x1 = mix(C11, C21, frac.x);\n    vec3 x2 = mix(C12, C22, frac.x);\n    return vec4(mix(x1, x2, frac.y), 1);\n}\n"

    .line 102
    .line 103
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_7
    sget-object p1, Lcom/bytedance/realx/video/FilterType;->Bicubic:Lcom/bytedance/realx/video/FilterType;

    .line 111
    .line 112
    if-ne p2, p1, :cond_8

    .line 113
    .line 114
    const-string p1, "vec3 cubic_hermite (vec3 A, vec3 B, vec3 C, vec3 D, float t) {\n\t  float t2 = t*t;\n    float t3 = t*t*t;\n    vec3 a = -A/2.0 + (3.0*B)/2.0 - (3.0*C)/2.0 + D/2.0;\n    vec3 b = A - (5.0*B)/2.0 + 2.0*C - D / 2.0;\n    vec3 c = -A/2.0 + C/2.0;\n   \tvec3 d = B;\n    return a*t3 + b*t2 + c*t + d;\n}\nvec4 sample (vec2 P) {\n    float c_onePixel_x = 1.0 / ori_tex_size.x - tar_tex_size.x + tar_tex_size.x;\n    float c_onePixel_y = 1.0 / ori_tex_size.y;\n    float c_twoPixels_x = 2.0 / ori_tex_size.x;\n    float c_twoPixels_y = 2.0 / ori_tex_size.y;\n    vec2 pixel = vec2(P.x * ori_tex_size.x, P.y * ori_tex_size.y) + 0.5;\n    vec2 frac = fract(pixel);\n    pixel = floor(pixel);\n    pixel = vec2(pixel.x / ori_tex_size.x, pixel.y / ori_tex_size.y) - vec2(c_onePixel_x, c_onePixel_y) / 2.0;\n    vec3 C00 = texture2D(tex, pixel + vec2(-c_onePixel_x ,-c_onePixel_y)).rgb;\n    vec3 C10 = texture2D(tex, pixel + vec2( 0.0        ,-c_onePixel_y)).rgb;\n    vec3 C20 = texture2D(tex, pixel + vec2( c_onePixel_x ,-c_onePixel_y)).rgb;\n    vec3 C30 = texture2D(tex, pixel + vec2( c_twoPixels_x,-c_onePixel_y)).rgb;\n    vec3 C01 = texture2D(tex, pixel + vec2(-c_onePixel_x , 0.0)).rgb;\n    vec3 C11 = texture2D(tex, pixel + vec2( 0.0        , 0.0)).rgb;\n    vec3 C21 = texture2D(tex, pixel + vec2( c_onePixel_x , 0.0)).rgb;\n    vec3 C31 = texture2D(tex, pixel + vec2( c_twoPixels_x, 0.0)).rgb;\n    vec3 C02 = texture2D(tex, pixel + vec2(-c_onePixel_x , c_onePixel_y)).rgb;\n    vec3 C12 = texture2D(tex, pixel + vec2( 0.0        , c_onePixel_y)).rgb;\n    vec3 C22 = texture2D(tex, pixel + vec2( c_onePixel_x , c_onePixel_y)).rgb;\n    vec3 C32 = texture2D(tex, pixel + vec2( c_twoPixels_x, c_onePixel_y)).rgb;\n    vec3 C03 = texture2D(tex, pixel + vec2(-c_onePixel_x , c_twoPixels_y)).rgb;\n    vec3 C13 = texture2D(tex, pixel + vec2( 0.0        , c_twoPixels_y)).rgb;\n    vec3 C23 = texture2D(tex, pixel + vec2( c_onePixel_x , c_twoPixels_y)).rgb;\n    vec3 C33 = texture2D(tex, pixel + vec2( c_twoPixels_x, c_twoPixels_y)).rgb;  \n    vec3 CP0X = cubic_hermite(C00, C10, C20, C30, frac.x);\n    vec3 CP1X = cubic_hermite(C01, C11, C21, C31, frac.x);\n    vec3 CP2X = cubic_hermite(C02, C12, C22, C32, frac.x);\n    vec3 CP3X = cubic_hermite(C03, C13, C23, C33, frac.x);\n    return vec4(cubic_hermite(CP0X, CP1X, CP2X, CP3X, frac.y), 1.0);}\n"

    .line 115
    .line 116
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_8
    sget-object p1, Lcom/bytedance/realx/video/FilterType;->BOX:Lcom/bytedance/realx/video/FilterType;

    .line 124
    .line 125
    if-ne p2, p1, :cond_9

    .line 126
    .line 127
    const-string p1, "vec4 sample(vec2 p) {\n  vec2 c_onePixel =  1.0 / ori_tex_size;\n  vec3 C11 = texture2D(tex, p - c_onePixel).rgb;\n  vec3 C12 = texture2D(tex, p + vec2( 0, -c_onePixel.y)).rgb;\n  vec3 C13 = texture2D(tex, p + vec2( c_onePixel.x, -c_onePixel.y)).rgb;\n  vec3 C21 = texture2D(tex, p + vec2( -c_onePixel.x , 0)).rgb;\n  vec3 C22 = texture2D(tex, p).rgb;\n  vec3 C23 = texture2D(tex, p + vec2( c_onePixel.x , 0)).rgb;\n  vec3 C31 = texture2D(tex, p + vec2( -c_onePixel.x , c_onePixel.y)).rgb;\n  vec3 C32 = texture2D(tex, p + vec2( 0 , c_onePixel.y)).rgb;\n  vec3 C33 = texture2D(tex, p + c_onePixel).rgb;\n  return vec4((C11 + C12 + C13 + C21 + C22 + C23 + C31 + C32 + C33) / 9.0, 1.0);\n}\n"

    .line 128
    .line 129
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_9
    const-string p1, "sample("

    .line 137
    .line 138
    const-string p2, "texture2D(tex, "

    .line 139
    .line 140
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    return-object p0
.end method

.method private prepareShader(Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;[FIIIILcom/bytedance/realx/video/FilterType;II)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz p7, :cond_1

    .line 7
    .line 8
    if-eqz p8, :cond_1

    .line 9
    .line 10
    if-nez p9, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object/from16 v3, p7

    .line 14
    .line 15
    move/from16 v4, p8

    .line 16
    .line 17
    move/from16 v5, p9

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    sget-object v3, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 21
    .line 22
    move v4, v2

    .line 23
    move v5, v4

    .line 24
    :goto_1
    iget-object v6, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->currentShaderType:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;

    .line 25
    .line 26
    invoke-virtual {v1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    const/4 v7, 0x1

    .line 31
    if-eqz v6, :cond_2

    .line 32
    .line 33
    iget-object v6, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->currentScaleFilter:Lcom/bytedance/realx/video/FilterType;

    .line 34
    .line 35
    invoke-virtual {v3, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-eqz v6, :cond_2

    .line 40
    .line 41
    iget-object v1, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->currentShader:Lcom/bytedance/realx/video/GlShader;

    .line 42
    .line 43
    move-object v9, v1

    .line 44
    goto :goto_3

    .line 45
    :cond_2
    iput-object v1, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->currentShaderType:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;

    .line 46
    .line 47
    iget-object v6, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->currentShader:Lcom/bytedance/realx/video/GlShader;

    .line 48
    .line 49
    if-eqz v6, :cond_3

    .line 50
    .line 51
    invoke-virtual {v6}, Lcom/bytedance/realx/video/GlShader;->release()V

    .line 52
    .line 53
    .line 54
    :cond_3
    invoke-virtual {v0, v1, v3}, Lcom/bytedance/realx/video/GlGenericDrawer;->createShader(Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;Lcom/bytedance/realx/video/FilterType;)Lcom/bytedance/realx/video/GlShader;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    iput-object v6, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->currentShader:Lcom/bytedance/realx/video/GlShader;

    .line 59
    .line 60
    iput-object v3, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->currentScaleFilter:Lcom/bytedance/realx/video/FilterType;

    .line 61
    .line 62
    invoke-virtual {v6}, Lcom/bytedance/realx/video/GlShader;->useProgram()V

    .line 63
    .line 64
    .line 65
    sget-object v8, Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;->YUV:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;

    .line 66
    .line 67
    if-ne v1, v8, :cond_4

    .line 68
    .line 69
    const-string v1, "y_tex"

    .line 70
    .line 71
    invoke-virtual {v6, v1}, Lcom/bytedance/realx/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 76
    .line 77
    .line 78
    const-string v1, "u_tex"

    .line 79
    .line 80
    invoke-virtual {v6, v1}, Lcom/bytedance/realx/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-static {v1, v7}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 85
    .line 86
    .line 87
    const-string v1, "v_tex"

    .line 88
    .line 89
    invoke-virtual {v6, v1}, Lcom/bytedance/realx/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    const/4 v8, 0x2

    .line 94
    invoke-static {v1, v8}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_4
    const-string v1, "tex"

    .line 99
    .line 100
    invoke-virtual {v6, v1}, Lcom/bytedance/realx/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 105
    .line 106
    .line 107
    :goto_2
    const-string v1, "Create shader"

    .line 108
    .line 109
    invoke-static {v1}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object v1, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->shaderCallbacks:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderCallbacks;

    .line 113
    .line 114
    invoke-interface {v1, v6}, Lcom/bytedance/realx/video/GlGenericDrawer$ShaderCallbacks;->onNewShader(Lcom/bytedance/realx/video/GlShader;)V

    .line 115
    .line 116
    .line 117
    const-string v1, "tex_mat"

    .line 118
    .line 119
    invoke-virtual {v6, v1}, Lcom/bytedance/realx/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    iput v1, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->texMatrixLocation:I

    .line 124
    .line 125
    const-string v1, "in_pos"

    .line 126
    .line 127
    invoke-virtual {v6, v1}, Lcom/bytedance/realx/video/GlShader;->getAttribLocation(Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    iput v1, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->inPosLocation:I

    .line 132
    .line 133
    const-string v1, "in_tc"

    .line 134
    .line 135
    invoke-virtual {v6, v1}, Lcom/bytedance/realx/video/GlShader;->getAttribLocation(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    iput v1, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->inTcLocation:I

    .line 140
    .line 141
    move-object v9, v6

    .line 142
    :goto_3
    sget-object v1, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 143
    .line 144
    if-eq v3, v1, :cond_6

    .line 145
    .line 146
    sget-object v6, Lcom/bytedance/realx/video/FilterType;->BOX:Lcom/bytedance/realx/video/FilterType;

    .line 147
    .line 148
    if-eq v3, v6, :cond_5

    .line 149
    .line 150
    const-string v6, "tar_tex_size"

    .line 151
    .line 152
    invoke-virtual {v9, v6}, Lcom/bytedance/realx/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    move-result v6

    .line 156
    iput v6, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->tarTexSizeLocation:I

    .line 157
    .line 158
    :cond_5
    const-string v6, "ori_tex_size"

    .line 159
    .line 160
    invoke-virtual {v9, v6}, Lcom/bytedance/realx/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    move-result v6

    .line 164
    iput v6, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->oriTexSizeLocation:I

    .line 165
    .line 166
    :cond_6
    const-string v6, "before useProgram "

    .line 167
    .line 168
    invoke-static {v6}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v9}, Lcom/bytedance/realx/video/GlShader;->useProgram()V

    .line 172
    .line 173
    .line 174
    iget v6, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->inPosLocation:I

    .line 175
    .line 176
    invoke-static {v6}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 177
    .line 178
    .line 179
    iget v10, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->inPosLocation:I

    .line 180
    .line 181
    const/4 v14, 0x0

    .line 182
    sget-object v15, Lcom/bytedance/realx/video/GlGenericDrawer;->FULL_RECTANGLE_BUFFER:Ljava/nio/FloatBuffer;

    .line 183
    .line 184
    const/4 v11, 0x2

    .line 185
    const/16 v12, 0x1406

    .line 186
    .line 187
    const/4 v13, 0x0

    .line 188
    invoke-static/range {v10 .. v15}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 189
    .line 190
    .line 191
    iget v6, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->inTcLocation:I

    .line 192
    .line 193
    invoke-static {v6}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 194
    .line 195
    .line 196
    iget v10, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->inTcLocation:I

    .line 197
    .line 198
    sget-object v15, Lcom/bytedance/realx/video/GlGenericDrawer;->FULL_RECTANGLE_TEXTURE_BUFFER:Ljava/nio/FloatBuffer;

    .line 199
    .line 200
    invoke-static/range {v10 .. v15}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 201
    .line 202
    .line 203
    iget v6, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->texMatrixLocation:I

    .line 204
    .line 205
    move-object/from16 v10, p2

    .line 206
    .line 207
    invoke-static {v6, v7, v2, v10, v2}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 208
    .line 209
    .line 210
    if-eq v3, v1, :cond_8

    .line 211
    .line 212
    if-lez v4, :cond_8

    .line 213
    .line 214
    if-lez v4, :cond_8

    .line 215
    .line 216
    iget v1, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->tarTexSizeLocation:I

    .line 217
    .line 218
    move/from16 v11, p3

    .line 219
    .line 220
    if-eqz v1, :cond_7

    .line 221
    .line 222
    int-to-float v2, v11

    .line 223
    move/from16 v12, p4

    .line 224
    .line 225
    int-to-float v3, v12

    .line 226
    invoke-static {v1, v2, v3}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 227
    .line 228
    .line 229
    goto :goto_4

    .line 230
    :cond_7
    move/from16 v12, p4

    .line 231
    .line 232
    :goto_4
    iget v1, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->oriTexSizeLocation:I

    .line 233
    .line 234
    if-eqz v1, :cond_9

    .line 235
    .line 236
    int-to-float v2, v4

    .line 237
    int-to-float v3, v5

    .line 238
    invoke-static {v1, v2, v3}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 239
    .line 240
    .line 241
    goto :goto_5

    .line 242
    :cond_8
    move/from16 v11, p3

    .line 243
    .line 244
    move/from16 v12, p4

    .line 245
    .line 246
    :cond_9
    :goto_5
    iget-object v8, v0, Lcom/bytedance/realx/video/GlGenericDrawer;->shaderCallbacks:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderCallbacks;

    .line 247
    .line 248
    move/from16 v13, p5

    .line 249
    .line 250
    move/from16 v14, p6

    .line 251
    .line 252
    invoke-interface/range {v8 .. v14}, Lcom/bytedance/realx/video/GlGenericDrawer$ShaderCallbacks;->onPrepareShader(Lcom/bytedance/realx/video/GlShader;[FIIII)V

    .line 253
    .line 254
    .line 255
    const-string v0, "Prepare shader"

    .line 256
    .line 257
    invoke-static {v0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    return-void
.end method


# virtual methods
.method public createShader(Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;Lcom/bytedance/realx/video/FilterType;)Lcom/bytedance/realx/video/GlShader;
    .locals 2

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/GlShader;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/video/GlGenericDrawer;->vertexShader:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/bytedance/realx/video/GlGenericDrawer;->genericFragmentSource:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1, p2}, Lcom/bytedance/realx/video/GlGenericDrawer;->createFragmentShaderString(Ljava/lang/String;Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;Lcom/bytedance/realx/video/FilterType;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, v1, p0}, Lcom/bytedance/realx/video/GlShader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public drawOes(I[FIIIIII)V
    .locals 12

    .line 91
    sget-object v9, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v11}, Lcom/bytedance/realx/video/GlGenericDrawer;->drawOes(I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V

    return-void
.end method

.method public drawOes(I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V
    .locals 10

    .line 1
    sget-object v1, Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;->OES:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move/from16 v5, p7

    .line 8
    .line 9
    move/from16 v6, p8

    .line 10
    .line 11
    move-object/from16 v7, p9

    .line 12
    .line 13
    move/from16 v8, p10

    .line 14
    .line 15
    move/from16 v9, p11

    .line 16
    .line 17
    invoke-direct/range {v0 .. v9}, Lcom/bytedance/realx/video/GlGenericDrawer;->prepareShader(Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;[FIIIILcom/bytedance/realx/video/FilterType;II)V

    .line 18
    .line 19
    .line 20
    const p0, 0x84c0

    .line 21
    .line 22
    .line 23
    invoke-static {p0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 24
    .line 25
    .line 26
    const p0, 0x8d65

    .line 27
    .line 28
    .line 29
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    new-instance p0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string p2, "drawOes glBindTexture error: "

    .line 41
    .line 42
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p3, "GlGenericDrawer"

    .line 53
    .line 54
    invoke-static {p3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    new-instance p0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p3, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    invoke-static/range {p5 .. p8}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 74
    .line 75
    .line 76
    const/4 p1, 0x5

    .line 77
    const/4 p2, 0x4

    .line 78
    const/4 p3, 0x0

    .line 79
    invoke-static {p1, p3, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 80
    .line 81
    .line 82
    invoke-static {p0, p3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 83
    .line 84
    .line 85
    const-string p0, "drawOes done"

    .line 86
    .line 87
    invoke-static {p0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public drawRgb(I[FIIIIII)V
    .locals 12

    .line 95
    sget-object v9, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v11}, Lcom/bytedance/realx/video/GlGenericDrawer;->drawRgb(I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V

    return-void
.end method

.method public drawRgb(I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V
    .locals 10

    .line 1
    sget-object v1, Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;->RGB:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move/from16 v5, p7

    .line 8
    .line 9
    move/from16 v6, p8

    .line 10
    .line 11
    move-object/from16 v7, p9

    .line 12
    .line 13
    move/from16 v8, p10

    .line 14
    .line 15
    move/from16 v9, p11

    .line 16
    .line 17
    invoke-direct/range {v0 .. v9}, Lcom/bytedance/realx/video/GlGenericDrawer;->prepareShader(Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;[FIIIILcom/bytedance/realx/video/FilterType;II)V

    .line 18
    .line 19
    .line 20
    const-string p0, "after prepare shader"

    .line 21
    .line 22
    invoke-static {p0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const p0, 0x84c0

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 29
    .line 30
    .line 31
    const/16 p0, 0xde1

    .line 32
    .line 33
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string p2, "drawRgb glBindTexture error: "

    .line 45
    .line 46
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string p3, "GlGenericDrawer"

    .line 57
    .line 58
    invoke-static {p3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    new-instance p0, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p3, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    invoke-static/range {p5 .. p8}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 78
    .line 79
    .line 80
    const/4 p1, 0x5

    .line 81
    const/4 p2, 0x4

    .line 82
    const/4 p3, 0x0

    .line 83
    invoke-static {p1, p3, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 84
    .line 85
    .line 86
    invoke-static {p0, p3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 87
    .line 88
    .line 89
    const-string p0, "drawRgb done"

    .line 90
    .line 91
    invoke-static {p0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public drawYuv([I[FIIIIII)V
    .locals 12

    .line 111
    sget-object v9, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v11}, Lcom/bytedance/realx/video/GlGenericDrawer;->drawYuv([I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V

    return-void
.end method

.method public drawYuv([I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V
    .locals 10

    .line 1
    sget-object v1, Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;->YUV:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move/from16 v5, p7

    .line 8
    .line 9
    move/from16 v6, p8

    .line 10
    .line 11
    move-object/from16 v7, p9

    .line 12
    .line 13
    move/from16 v8, p10

    .line 14
    .line 15
    move/from16 v9, p11

    .line 16
    .line 17
    invoke-direct/range {v0 .. v9}, Lcom/bytedance/realx/video/GlGenericDrawer;->prepareShader(Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;[FIIIILcom/bytedance/realx/video/FilterType;II)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    move p2, p0

    .line 22
    :goto_0
    const/16 p3, 0xde1

    .line 23
    .line 24
    const p4, 0x84c0

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    if-ge p2, v0, :cond_0

    .line 29
    .line 30
    add-int/2addr p4, p2

    .line 31
    invoke-static {p4}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 32
    .line 33
    .line 34
    aget p4, p1, p2

    .line 35
    .line 36
    invoke-static {p3, p4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 37
    .line 38
    .line 39
    add-int/lit8 p2, p2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    new-instance p0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string p2, "drawYuv glBindTexture error: "

    .line 51
    .line 52
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p3, "GlGenericDrawer"

    .line 63
    .line 64
    invoke-static {p3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    new-instance p0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p3, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    invoke-static/range {p5 .. p8}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 84
    .line 85
    .line 86
    const/4 p1, 0x5

    .line 87
    const/4 p2, 0x4

    .line 88
    invoke-static {p1, p0, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 89
    .line 90
    .line 91
    move p1, p0

    .line 92
    :goto_1
    if-ge p1, v0, :cond_2

    .line 93
    .line 94
    add-int p2, p1, p4

    .line 95
    .line 96
    invoke-static {p2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 97
    .line 98
    .line 99
    invoke-static {p3, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 100
    .line 101
    .line 102
    add-int/lit8 p1, p1, 0x1

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    const-string p0, "drawYuv done"

    .line 106
    .line 107
    invoke-static {p0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/GlGenericDrawer;->currentShader:Lcom/bytedance/realx/video/GlShader;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlShader;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/bytedance/realx/video/GlGenericDrawer;->currentShader:Lcom/bytedance/realx/video/GlShader;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/bytedance/realx/video/GlGenericDrawer;->currentShaderType:Lcom/bytedance/realx/video/GlGenericDrawer$ShaderType;

    .line 12
    .line 13
    :cond_0
    return-void
.end method
