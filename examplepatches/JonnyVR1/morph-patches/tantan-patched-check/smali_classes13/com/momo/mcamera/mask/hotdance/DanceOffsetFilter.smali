.class public Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private final animator:Landroid/animation/ValueAnimator;

.field private offset:F

.field private offsetHandle:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->offset:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->offsetHandle:I

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    new-array v0, v0, [F

    .line 12
    .line 13
    fill-array-data v0, :array_0

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->animator:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    return-void

    .line 23
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->offset:F

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->animator:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float offset;\nvoid main(){\n    float offsetX = offset * 0.05;\n    vec2 uv = textureCoordinate;\n    vec4 color = texture2D(inputImageTexture0, vec2(uv.x + offsetX, uv.y));\n    vec4 color1 = texture2D(inputImageTexture0, vec2(uv.x - offsetX, uv.y));\n    gl_FragColor = mix(color, color1, 0.5);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "offset"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->offsetHandle:I

    .line 13
    .line 14
    return-void
.end method

.method public onMusicBeatDetect()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->animator:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    const-wide/16 v1, 0x3e8

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->animator:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    new-instance v1, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter$1;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter$1;-><init>(Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->animator:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public passShaderValues()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->offsetHandle:I

    .line 5
    .line 6
    iget p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->offset:F

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
