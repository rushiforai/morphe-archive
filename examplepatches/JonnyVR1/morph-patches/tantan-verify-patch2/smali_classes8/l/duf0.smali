.class public Ll/duf0;
.super Ll/rt2;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# instance fields
.field private a:I

.field private b:F

.field private c:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/rt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/duf0;->b:F

    .line 6
    .line 7
    const-wide/32 v0, 0x186a0

    .line 8
    .line 9
    .line 10
    iput-wide v0, p0, Ll/duf0;->c:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float time;\nvec2 scaleFromCenter(vec2 coord, float scale) {\n  if (scale > 1.0 || scale < 0.0) { return coord; }\n  vec2 scaleCenter = vec2(0.5);\n  return (coord - scaleCenter) * scale + scaleCenter;\n}\nvoid main(){\n    vec2 st = textureCoordinate;\n  \n    float scale = 1.0 - mod(time * 1.3, 0.8) + 0.1;\n    if (scale < 0.0) {\n    gl_FragColor = texture2D(inputImageTexture0, st);\n    return;\n    }\n    vec2 newCoord = scaleFromCenter(st, scale);\n    float colorScale = scale * 0.5;\n    vec4 resultColor = texture2D(inputImageTexture0, st) * (1.0 - colorScale + 0.2);\n    vec4 newCoordColor = texture2D(inputImageTexture0, newCoord) * (colorScale - 0.2);\n    vec4 result = (resultColor + newCoordColor);\n    gl_FragColor = result;\n}\n"

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
    const-string v1, "time"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/duf0;->a:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/duf0;->a:I

    .line 5
    .line 6
    iget p0, p0, Ll/duf0;->b:F

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/bof0;->setTimeStamp(J)V

    .line 2
    .line 3
    .line 4
    long-to-float p1, p1

    .line 5
    const/high16 p2, 0x44960000    # 1200.0f

    .line 6
    .line 7
    div-float/2addr p1, p2

    .line 8
    iput p1, p0, Ll/duf0;->b:F

    .line 9
    .line 10
    return-void
.end method
