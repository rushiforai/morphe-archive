.class public Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;
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
    const-string p0, "varying highp vec2 textureCoordinate;\nuniform sampler2D inputImageTexture0; \nuniform sampler2D inputImageTexture1; \n \n void main() \n{ \n    lowp vec3 iColor = texture2D(inputImageTexture0, textureCoordinate).rgb;\n    lowp vec3 meanColor = texture2D(inputImageTexture1, textureCoordinate).rgb;\n    highp vec3 diffColor = (iColor - meanColor) * 7.07;\n    diffColor = min(diffColor * diffColor, 1.0);\n    gl_FragColor = vec4(diffColor, 1.0);\n}"

    .line 2
    .line 3
    return-object p0
.end method
