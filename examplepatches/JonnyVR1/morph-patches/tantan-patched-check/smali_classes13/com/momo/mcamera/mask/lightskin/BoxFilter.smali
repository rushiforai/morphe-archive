.class public Lcom/momo/mcamera/mask/lightskin/BoxFilter;
.super Ll/tmj0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tmj0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nvarying vec2 textureCoordinate;\nuniform sampler2D inputImageTexture0;\nvarying vec4 textureShift_1;\nvarying vec4 textureShift_2;\nvarying vec4 textureShift_3;\nvarying vec4 textureShift_4;\nvoid main() {\nmediump vec3 sum = texture2D(inputImageTexture0, textureCoordinate).rgb;\n    sum += texture2D(inputImageTexture0, textureShift_1.xy).rgb;\n    sum += texture2D(inputImageTexture0, textureShift_1.zw).rgb;\n    sum += texture2D(inputImageTexture0, textureShift_2.xy).rgb;\n    sum += texture2D(inputImageTexture0, textureShift_2.zw).rgb;\n    sum += texture2D(inputImageTexture0, textureShift_3.xy).rgb;\n    sum += texture2D(inputImageTexture0, textureShift_3.zw).rgb;\n    sum += texture2D(inputImageTexture0, textureShift_4.xy).rgb;\n    sum += texture2D(inputImageTexture0, textureShift_4.zw).rgb;\n \n    gl_FragColor = vec4(sum * 0.1111, 1.0);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvarying vec4 textureShift_1;\nvarying vec4 textureShift_2;\nvarying vec4 textureShift_3;\nvarying vec4 textureShift_4;\nuniform float texelWidthOffset;\nuniform float texelHeightOffset;\n\nvoid main() {\n    textureCoordinate = inputTextureCoordinate;\n    gl_Position = position;\n    vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);\n    textureShift_1 = vec4(inputTextureCoordinate.st - singleStepOffset, inputTextureCoordinate.st + singleStepOffset);\n    textureShift_2 = vec4(inputTextureCoordinate.st - 2.0 * singleStepOffset, inputTextureCoordinate.st + 2.0 * singleStepOffset);\n    textureShift_3 = vec4(inputTextureCoordinate.st - 3.0 * singleStepOffset, inputTextureCoordinate.st + 3.0 * singleStepOffset);\n    textureShift_4 = vec4(inputTextureCoordinate.st - 4.0 * singleStepOffset, inputTextureCoordinate.st + 4.0 * singleStepOffset);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method
