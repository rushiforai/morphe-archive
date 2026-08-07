.class public Ll/zel0;
.super Ll/it2;
.source "SourceFile"


# instance fields
.field public E:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/it2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "mediump"

    .line 5
    .line 6
    iput-object v0, p0, Ll/zel0;->E:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public p()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "precision "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/zel0;->E:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, " float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main(){\n vec2 texOne = textureCoordinate;\n   vec4 color1 = texture2D(inputImageTexture0, vec2(texOne.x/2.0,texOne.y));\n   vec4 color2 = texture2D(inputImageTexture0,vec2(texOne.x/2.0 + 0.5,texOne.y));\ncolor2.a = color1.r; color2.rgb = color2.rgb * color1.r;    gl_FragColor = color2;\n}\n"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
