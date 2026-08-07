.class public Ll/uq1;
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
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main() {\n   vec4 image = texture2D(inputImageTexture0,textureCoordinate);\n     vec4 base = vec4(image.g,image.g,image.g,1.0);\n     vec4 overlay = vec4(image.b,image.b,image.b,1.0);\n     float ba = 2.0 * overlay.b * base.b + overlay.b * (1.0 - base.a) + base.b * (1.0 - overlay.a);\n     gl_FragColor = vec4(ba,ba,ba,1.0);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method
