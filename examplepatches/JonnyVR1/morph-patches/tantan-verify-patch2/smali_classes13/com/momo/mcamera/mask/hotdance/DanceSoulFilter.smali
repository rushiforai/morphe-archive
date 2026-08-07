.class public Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private final animator:Landroid/animation/ValueAnimator;

.field private percent:F

.field private percentHandle:I


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
    iput-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->animator:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->percentHandle:I

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->percent:F

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->animator:Landroid/animation/ValueAnimator;

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
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float percent;\nvoid main(){\n    vec2 uv = textureCoordinate;\n    float maxAlpha = 0.3;\n    float maxScale = 1.8;\n    float alpha = maxAlpha * (1.0 - percent);\n    float scale = 1.0 + (maxScale - 1.0) * percent;\n    float weakX = 0.5 + (uv.x - 0.5) / scale;\n    float weakY = 0.5 + (uv.y - 0.5) / scale;\n    vec4 weakMask = texture2D(inputImageTexture0, vec2(weakX, weakY));\n    vec4 color = texture2D(inputImageTexture0, uv);\n    gl_FragColor = mix(color, weakMask, alpha);\n}\n"

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
    const-string v1, "percent"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->percentHandle:I

    .line 13
    .line 14
    return-void
.end method

.method public onMusicBeatDetect()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->animator:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    const-wide/16 v1, 0x1f4

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->animator:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->animator:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    new-instance v1, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter$1;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter$1;-><init>(Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->animator:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public passShaderValues()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->percentHandle:I

    .line 5
    .line 6
    iget p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->percent:F

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
