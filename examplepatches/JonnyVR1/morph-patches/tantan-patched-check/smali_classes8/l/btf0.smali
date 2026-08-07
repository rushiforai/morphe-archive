.class public Ll/btf0;
.super Ll/ct5;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Ll/ct5;-><init>(I)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ll/odk;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/odk;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/ct5;->registerInitialFilter(Ll/jt2;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/ct5;->R1(Ll/gfj;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float u_TexelWidth;\nuniform float u_TexelHeight;\nvoid main(){\n   vec2 up = vec2(0.0, u_TexelHeight);\n   vec2 right = vec2(u_TexelWidth, 0.0);\n   float bottomLeftIntensity = texture2D(inputImageTexture0, textureCoordinate - up - right).r;\n   float topRightIntensity = texture2D(inputImageTexture0, textureCoordinate + up + right).r;\n   float topLeftIntensity = texture2D(inputImageTexture0, textureCoordinate + up - right).r;\n   float bottomRightIntensity = texture2D(inputImageTexture0, textureCoordinate - up + right).r;\n   float leftIntensity = texture2D(inputImageTexture0, textureCoordinate - right).r;\n   float rightIntensity = texture2D(inputImageTexture0, textureCoordinate + right).r;\n   float bottomIntensity = texture2D(inputImageTexture0, textureCoordinate - up).r;\n   float topIntensity = texture2D(inputImageTexture0, textureCoordinate + up).r;\n   float h = -topLeftIntensity - 2.0 * topIntensity - topRightIntensity + bottomLeftIntensity + 2.0 * bottomIntensity + bottomRightIntensity;\n   float v = -bottomLeftIntensity - 2.0 * leftIntensity - topLeftIntensity + bottomRightIntensity + 2.0 * rightIntensity + topRightIntensity;\n   float mag = length(vec2(h, v));\n   gl_FragColor = vec4(vec3(mag), 1.0);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method
