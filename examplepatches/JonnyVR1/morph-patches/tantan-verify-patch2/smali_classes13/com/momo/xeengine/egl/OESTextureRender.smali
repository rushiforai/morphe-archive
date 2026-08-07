.class public final Lcom/momo/xeengine/egl/OESTextureRender;
.super Lcom/momo/xeengine/egl/BaseTextureRender;
.source "SourceFile"


# static fields
.field private static final ps_type_0:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\nprecision highp float;varying vec2 vTextureCo;uniform samplerExternalOES uTexture;void main() {    vec2 adjustedCo = vec2(vTextureCo.x, vTextureCo.y);    gl_FragColor = texture2D(uTexture, adjustedCo);}"

.field private static final ps_type_1:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\nprecision highp float;varying vec2 vTextureCo;uniform mat4 uTextureMatrix;uniform samplerExternalOES uTexture;void main() {    float alphaPos = (uTextureMatrix * vec4(0.5, 1.0, 0.0, 1.0)).x;    vec2 alphaCood = vec2(vTextureCo.x * 0.5, vTextureCo.y);    vec2 colorCood = vec2(vTextureCo.x * 0.5 + alphaPos, vTextureCo.y);    vec3 rgb = texture2D(uTexture, colorCood).rgb;    float alpha = texture2D(uTexture, alphaCood).r;    gl_FragColor = vec4(rgb, alpha);}"

.field private static final ps_type_2:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\nprecision highp float;varying vec2 vTextureCo;uniform mat4 uTextureMatrix;uniform samplerExternalOES uTexture;vec3 rgb2yuv_bt709(vec3 rgb) {   float y =  0.2126 * rgb.r + 0.7152 * rgb.g + 0.0722 * rgb.b;   float u = -0.1146 * rgb.r - 0.3854 * rgb.g + 0.5000 * rgb.b;   float v =  0.5000 * rgb.r - 0.4542 * rgb.g - 0.0458 * rgb.b;   return vec3(y, u, v);}vec3 yuv2rgb_bt709(vec3 yuv) {   float y = yuv.x, u = yuv.y, v = yuv.z;   float r = y + 1.5748 * v;   float g = y - 0.1873 * u - 0.4681 * v;   float b = y + 1.8556 * u;   return vec3(r, g, b);}void main() {    float alphaPos = (uTextureMatrix * vec4(0.5, 1.0, 0.0, 1.0)).x;    vec2 alphaCood = vec2(alphaPos - vTextureCo.x * 0.5, vTextureCo.y);    vec2 colorCood = vec2(vTextureCo.x * 0.5 + alphaPos, vTextureCo.y);    vec3 videoRGB = texture2D(uTexture, colorCood).rgb;    vec3 videoYUV = rgb2yuv_bt709(videoRGB).xzy;    vec3 rgb = yuv2rgb_bt709(videoYUV);    float alpha = texture2D(uTexture, alphaCood).r;    gl_FragColor = vec4(rgb, alpha);}"

.field private static final ps_type_3:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\nprecision highp float;varying vec2 vTextureCo;uniform mat4 uTextureMatrix;uniform samplerExternalOES uTexture;void main() {    float colorWidth = (uTextureMatrix * vec4(1.0 / 3.0 * 2.0, 1, 0, 1)).x;    vec2 alphaCood = vec2(colorWidth + vTextureCo.x / 3.0, vTextureCo.y * 0.5);    vec2 colorCood = vec2(vTextureCo.x / 3.0 * 2.0, vTextureCo.y);    vec3 rgb = texture2D(uTexture, colorCood).rgb;    float alpha = texture2D(uTexture, alphaCood).r;    gl_FragColor = vec4(rgb, alpha);}"

.field private static final vs:Ljava/lang/String; = "attribute vec4 aVertexCo;attribute vec2 aTextureCo;uniform mat4 uVertexMatrix;uniform mat4 uTextureMatrix;varying vec2 vTextureCo;void main(){    gl_Position = uVertexMatrix * aVertexCo;    vTextureCo = (uTextureMatrix * vec4(aTextureCo, 0.0, 1.0)).xy;}"


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    const-string v0, "attribute vec4 aVertexCo;attribute vec2 aTextureCo;uniform mat4 uVertexMatrix;uniform mat4 uTextureMatrix;varying vec2 vTextureCo;void main(){    gl_Position = uVertexMatrix * aVertexCo;    vTextureCo = (uTextureMatrix * vec4(aTextureCo, 0.0, 1.0)).xy;}"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/momo/xeengine/egl/OESTextureRender;->getPsShader(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, v0, p1}, Lcom/momo/xeengine/egl/BaseTextureRender;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/momo/xeengine/egl/BaseTextureRender;->create()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private static getPsShader(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_2

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    const-string p0, "#extension GL_OES_EGL_image_external : require\nprecision highp float;varying vec2 vTextureCo;uniform samplerExternalOES uTexture;void main() {    vec2 adjustedCo = vec2(vTextureCo.x, vTextureCo.y);    gl_FragColor = texture2D(uTexture, adjustedCo);}"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const-string p0, "#extension GL_OES_EGL_image_external : require\nprecision highp float;varying vec2 vTextureCo;uniform mat4 uTextureMatrix;uniform samplerExternalOES uTexture;void main() {    float colorWidth = (uTextureMatrix * vec4(1.0 / 3.0 * 2.0, 1, 0, 1)).x;    vec2 alphaCood = vec2(colorWidth + vTextureCo.x / 3.0, vTextureCo.y * 0.5);    vec2 colorCood = vec2(vTextureCo.x / 3.0 * 2.0, vTextureCo.y);    vec3 rgb = texture2D(uTexture, colorCood).rgb;    float alpha = texture2D(uTexture, alphaCood).r;    gl_FragColor = vec4(rgb, alpha);}"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_1
    const-string p0, "#extension GL_OES_EGL_image_external : require\nprecision highp float;varying vec2 vTextureCo;uniform mat4 uTextureMatrix;uniform samplerExternalOES uTexture;vec3 rgb2yuv_bt709(vec3 rgb) {   float y =  0.2126 * rgb.r + 0.7152 * rgb.g + 0.0722 * rgb.b;   float u = -0.1146 * rgb.r - 0.3854 * rgb.g + 0.5000 * rgb.b;   float v =  0.5000 * rgb.r - 0.4542 * rgb.g - 0.0458 * rgb.b;   return vec3(y, u, v);}vec3 yuv2rgb_bt709(vec3 yuv) {   float y = yuv.x, u = yuv.y, v = yuv.z;   float r = y + 1.5748 * v;   float g = y - 0.1873 * u - 0.4681 * v;   float b = y + 1.8556 * u;   return vec3(r, g, b);}void main() {    float alphaPos = (uTextureMatrix * vec4(0.5, 1.0, 0.0, 1.0)).x;    vec2 alphaCood = vec2(alphaPos - vTextureCo.x * 0.5, vTextureCo.y);    vec2 colorCood = vec2(vTextureCo.x * 0.5 + alphaPos, vTextureCo.y);    vec3 videoRGB = texture2D(uTexture, colorCood).rgb;    vec3 videoYUV = rgb2yuv_bt709(videoRGB).xzy;    vec3 rgb = yuv2rgb_bt709(videoYUV);    float alpha = texture2D(uTexture, alphaCood).r;    gl_FragColor = vec4(rgb, alpha);}"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    const-string p0, "#extension GL_OES_EGL_image_external : require\nprecision highp float;varying vec2 vTextureCo;uniform mat4 uTextureMatrix;uniform samplerExternalOES uTexture;void main() {    float alphaPos = (uTextureMatrix * vec4(0.5, 1.0, 0.0, 1.0)).x;    vec2 alphaCood = vec2(vTextureCo.x * 0.5, vTextureCo.y);    vec2 colorCood = vec2(vTextureCo.x * 0.5 + alphaPos, vTextureCo.y);    vec3 rgb = texture2D(uTexture, colorCood).rgb;    float alpha = texture2D(uTexture, alphaCood).r;    gl_FragColor = vec4(rgb, alpha);}"

    .line 20
    .line 21
    return-object p0
.end method
