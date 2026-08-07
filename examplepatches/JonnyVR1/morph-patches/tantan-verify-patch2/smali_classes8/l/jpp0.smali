.class public Ll/jpp0;
.super Ll/i4;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:F

.field private c:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/i4;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/jpp0;->b:F

    .line 6
    .line 7
    const-wide/32 v0, 0x186a0

    .line 8
    .line 9
    .line 10
    iput-wide v0, p0, Ll/jpp0;->c:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float iTime;\nvoid main(){\n vec2 uv = textureCoordinate;\n vec4 waterColor = vec4(1.0);\n    float reflactionY = 0.5;\n    if(uv.y <= reflactionY)\n    {        \n        float oy = uv.y;\n        uv.y = 2.0*reflactionY - uv.y;\n        uv.y = uv.y + sin(1./(oy-reflactionY)+iTime*10.0)*0.005;\n        waterColor = vec4(0.75,0.85, 0.95,1.0);\n    } gl_FragColor = texture2D(inputImageTexture0,uv)*waterColor;\n}"

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
    const-string v1, "iTime"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/jpp0;->a:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iget-wide v2, p0, Ll/jpp0;->c:J

    .line 9
    .line 10
    rem-long/2addr v0, v2

    .line 11
    long-to-float v0, v0

    .line 12
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 13
    .line 14
    div-float/2addr v0, v1

    .line 15
    iput v0, p0, Ll/jpp0;->b:F

    .line 16
    .line 17
    iget p0, p0, Ll/jpp0;->a:I

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
