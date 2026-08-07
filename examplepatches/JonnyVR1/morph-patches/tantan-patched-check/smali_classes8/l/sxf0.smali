.class public Ll/sxf0;
.super Ll/i4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/i4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main(){\n    vec2 uv = textureCoordinate;\n     uv.y = uv.y < 0.5 ? 1.0 - uv.y : uv.y;\n     vec4 color = texture2D(inputImageTexture0, uv);\n gl_FragColor = color;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method
