.class public Ll/am80;
.super Ll/it2;
.source "SourceFile"

# interfaces
.implements Ll/i3m;


# instance fields
.field private E:F

.field private F:I

.field private G:Ljava/lang/String;


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
    iput-object v0, p0, Ll/am80;->G:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public d(Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/high16 p1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;->getSaturation()F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    :goto_0
    iput p1, p0, Ll/am80;->E:F

    .line 11
    .line 12
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/am80;->G:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

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
    iget-object p0, p0, Ll/am80;->G:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, " float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float u_Saturation;\nconst vec3 luminanceWeighting = vec3(0.2125, 0.7154, 0.0721);\nvoid main(){\n   vec4 color = texture2D(inputImageTexture0,textureCoordinate);\n   float luminance = dot(color.rgb, luminanceWeighting);\n   vec3 greyScaleColor = vec3(luminance);\n   gl_FragColor = vec4(mix(greyScaleColor, color.rgb, u_Saturation), color.a);\n}\n"

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

.method public u()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/vej;->u()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/vej;->d:I

    .line 5
    .line 6
    const-string v1, "u_Saturation"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/am80;->F:I

    .line 13
    .line 14
    return-void
.end method

.method public x()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/vej;->x()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/am80;->F:I

    .line 5
    .line 6
    iget p0, p0, Ll/am80;->E:F

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
