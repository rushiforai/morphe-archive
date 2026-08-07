.class public Lcom/momo/mcamera/mask/st/WhitenFilter;
.super Lcom/momo/mcamera/mask/st/RuddyFilter;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/st/RuddyFilter;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\n varying vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform sampler2D ruddyTexture;\n uniform sampler2D whitenTexture;\n uniform float whitenValue;\n uniform float ruddyValue;\n float sigmoid(float x, float t, float s){\n    return 1.0 / (1.0 + exp(-(x - t) / s));\n}\n vec3 rgb2YCrCb(vec3 rgb){\n    vec3 ycrcb;\n    ycrcb.x = 0.299 * rgb.r + 0.587 * rgb.g + 0.114 * rgb.b;\n    ycrcb.y = (rgb.r - ycrcb.x) * 0.718 + 0.5;\n    ycrcb.z = (rgb.b - ycrcb.x) * 0.564 + 0.5;\n    return ycrcb;\n}\n vec3 YCrCb2RGB(vec3 ycrcb){\n    vec3 rgb;\n    rgb.r = ycrcb.x + 1.403 * (ycrcb.y - 0.5);\n    rgb.g = ycrcb.x - 0.714 * (ycrcb.y - 0.5) - 0.344 * (ycrcb.z - 0.5);\n    rgb.b = ycrcb.x + 1.733 * (ycrcb.z - 0.5);\n    return rgb;\n}\n vec3 filterColor(vec3 src, sampler2D table, float factor){\n    highp float blue = src.b * 63.0;\n    highp vec2 q1;\n    float fb = floor(blue);\n    q1.y = floor(fb * 0.125);\n    q1.x = fb - (q1.y * 8.0);\n    highp vec2 q2;\n    float cb = ceil(blue);\n    q2.y = floor(cb * 0.125);\n    q2.x = cb - (q2.y * 8.0);\n    vec2 t = 0.123 * src.rg + vec2(0.000976563);\n    vec2 t1 = q1 * 0.125 + t;\n    vec3 p1 = texture2D(table, t1).rgb;\n    vec2 t2 = q2 * 0.125 + t;\n    vec3 p2 = texture2D(table, t2).rgb;\n    vec3 filtered = mix(p1, p2, fract(blue));\n    return mix(src, filtered, factor);\n}\n void main() {\n    vec4 src = texture2D(inputImageTexture0, textureCoordinate);\n    vec3 ycrcb = rgb2YCrCb(src.rgb);\n    float sg = sigmoid(ycrcb.y, ycrcb.z, 0.0392157);\n    vec3 whitten = filterColor(src.rgb, whitenTexture, whitenValue);\n    vec3 dst = mix(src.rgb, whitten, sg);\n    vec3 redden = filterColor(dst, ruddyTexture, ruddyValue);\n    gl_FragColor = vec4(redden, src.a);\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public setWhitenValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/st/RuddyFilter;->whitenValue:F

    .line 2
    .line 3
    return-void
.end method
