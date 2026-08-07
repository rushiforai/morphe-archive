.class public Ll/jrf0;
.super Ll/btf0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/btf0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float u_TexelWidth;\nuniform float u_TexelHeight;\nvoid main(){\n   vec2 up = vec2(0.0, u_TexelHeight);\n   vec2 right = vec2(u_TexelWidth, 0.0);\n   float bottomLeftIntensity = texture2D(inputImageTexture0, textureCoordinate - up - right).r;\n   float topRightIntensity = texture2D(inputImageTexture0, textureCoordinate + up + right).r;\n   float topLeftIntensity = texture2D(inputImageTexture0, textureCoordinate + up - right).r;\n   float bottomRightIntensity = texture2D(inputImageTexture0, textureCoordinate - up + right).r;\n   float leftIntensity = texture2D(inputImageTexture0, textureCoordinate - right).r;\n   float rightIntensity = texture2D(inputImageTexture0, textureCoordinate + right).r;\n   float bottomIntensity = texture2D(inputImageTexture0, textureCoordinate - up).r;\n   float topIntensity = texture2D(inputImageTexture0, textureCoordinate + up).r;\n   float h = -topLeftIntensity - 2.0 * topIntensity - topRightIntensity + bottomLeftIntensity + 2.0 * bottomIntensity + bottomRightIntensity;\n   float v = -bottomLeftIntensity - 2.0 * leftIntensity - topLeftIntensity + bottomRightIntensity + 2.0 * rightIntensity + topRightIntensity;\n   float mag = 1.0 - length(vec2(h, v));\n   gl_FragColor = vec4(vec3(mag), 1.0);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method
