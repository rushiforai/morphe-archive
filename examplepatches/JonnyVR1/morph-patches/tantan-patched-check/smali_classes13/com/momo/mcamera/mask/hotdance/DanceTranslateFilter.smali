.class public Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;
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
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->animator:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    const/high16 v0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->offset:F

    .line 19
    .line 20
    return-void

    .line 21
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->offset:F

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->animator:Landroid/animation/ValueAnimator;

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
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float offset;\nvoid main(){\n    vec2 uv = textureCoordinate;\n    vec4 color = texture2D(inputImageTexture0, vec2(uv.x, (1.0 - uv.y) - offset));\n    vec4 color1 = texture2D(inputImageTexture0, vec2(uv.x, uv.y - (1.0 - offset)));\n    vec4 color2 = mix(color, color1, step(1.0 - offset, uv.y));\n    vec4 color3 = texture2D(inputImageTexture0, vec2(uv.x, uv.y + (1.0 - offset)));\n    vec4 color4 = texture2D(inputImageTexture0, vec2(uv.x, (1.0 - uv.y) + offset));\n    vec4 color5 = mix(color3, color4, step(offset, uv.y));\n    gl_FragColor = mix(color2, color5, step(0.5, uv.x));\n}\n"

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
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->offsetHandle:I

    .line 13
    .line 14
    return-void
.end method

.method public onMusicBeatDetect()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->animator:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    const-wide/16 v1, 0x320

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->animator:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    new-instance v1, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter$1;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter$1;-><init>(Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->animator:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    new-instance v1, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter$2;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter$2;-><init>(Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->animator:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public passShaderValues()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->offsetHandle:I

    .line 5
    .line 6
    iget p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->offset:F

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
