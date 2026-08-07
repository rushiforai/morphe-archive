.class public Lcom/immomo/momomediaext/filter/beauty/VerticalFlipFilter;
.super Ll/jt2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec2 uv = textureCoordinate;\n   gl_FragColor = texture2D(inputImageTexture0, vec2(uv.x, 1.0 - uv.y));\n}\n"

    .line 2
    .line 3
    return-object p0
.end method
