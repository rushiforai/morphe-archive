.class public Lcom/momo/mcamera/mask/skin/AISkinMixFilter;
.super Ll/hs10;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main() {\n    vec4 color1 = texture2D(inputImageTexture0,textureCoordinate);\n    vec4 color2 = texture2D(inputImageTexture1,textureCoordinate);\n    vec4 rColor = vec4((color1.xyz + 2.0 * color2.xyz) - vec3(1., 1., 1.), 1.0);\n    gl_FragColor = mix(rColor, color1, 0.5);}\n"

    .line 2
    .line 3
    return-object p0
.end method
