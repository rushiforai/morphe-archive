.class public Ll/qxf0;
.super Ll/hs10;
.source "SourceFile"


# instance fields
.field private a:F

.field private b:F

.field private c:F

.field private d:Landroid/graphics/PointF;

.field private e:I

.field private f:I

.field private g:I

.field private i:I

.field private j:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/qxf0;->j:Z

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/PointF;

    .line 9
    .line 10
    const/high16 v1, 0x3f000000    # 0.5f

    .line 11
    .line 12
    invoke-direct {v0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/qxf0;->d:Landroid/graphics/PointF;

    .line 16
    .line 17
    const v0, 0x3fc90fdb

    .line 18
    .line 19
    .line 20
    iput v0, p0, Ll/qxf0;->b:F

    .line 21
    .line 22
    const/high16 v0, 0x3f800000    # 1.0f

    .line 23
    .line 24
    iput v0, p0, Ll/qxf0;->c:F

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public Q1(Landroid/graphics/PointF;F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iput-object p1, p0, Ll/qxf0;->d:Landroid/graphics/PointF;

    .line 7
    .line 8
    iput p2, p0, Ll/qxf0;->b:F

    .line 9
    .line 10
    iget p1, p1, Landroid/graphics/PointF;->x:F

    .line 11
    .line 12
    iput p1, p0, Ll/qxf0;->a:F

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p0
.end method

.method public R1(F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-boolean v1, p0, Ll/qxf0;->j:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const/high16 v1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    sub-float p1, v1, p1

    .line 13
    .line 14
    :cond_0
    iput p1, p0, Ll/qxf0;->a:F

    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public S1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/qxf0;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qxf0;->j:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "precision lowp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\n uniform float mixturePercent;\n uniform vec2 center;  uniform float tiltShiftRotationAngle; uniform float imageWidthAndHeightRatio; \n void main() {\n     vec4 pic0 = texture2D(inputImageTexture0, textureCoordinate);\n     vec4 pic1 = texture2D(inputImageTexture1, textureCoordinate); \n     vec2 normalizedCenter = center * vec2(imageWidthAndHeightRatio, 1.0); \n     float angleSub = abs(tiltShiftRotationAngle - 3.1415926/2.0); \n           float mixFactor = clamp(0.0,abs((textureCoordinate.y - mixturePercent)/0.01),1.0);\n             if(mixturePercent < 0.02){                gl_FragColor = pic1;              }             else if (textureCoordinate.y >= mixturePercent && textureCoordinate.y <= mixturePercent + 1.0) {\n               gl_FragColor = mix(pic0,pic1,mixFactor);\n             } else {\n               gl_FragColor = pic0;\n             } \n}"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "precision lowp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\n uniform float mixturePercent;\n uniform vec2 center;  uniform float tiltShiftRotationAngle; uniform float imageWidthAndHeightRatio; \n void main() {\n     vec4 pic0 = texture2D(inputImageTexture0, textureCoordinate);\n     vec4 pic1 = texture2D(inputImageTexture1, textureCoordinate); \n     vec2 normalizedCenter = center * vec2(imageWidthAndHeightRatio, 1.0); \n     float angleSub = abs(tiltShiftRotationAngle - 3.1415926/2.0); \n     if (angleSub <= 0.01) {\n           float mixFactor = clamp(abs((textureCoordinate.x - mixturePercent)/0.01),0.0,1.0);\n             if(mixturePercent < 0.02){                gl_FragColor = pic1;              }             else if (textureCoordinate.x >= mixturePercent && textureCoordinate.x <= mixturePercent + 1.0) {\n               gl_FragColor = mix(pic0,pic1,mixFactor);\n             } else {\n               gl_FragColor = pic0;\n             } \n      } else {\n          float a = -tan(tiltShiftRotationAngle);          float b = normalizedCenter.y - a * normalizedCenter.x;           float mixFactor = clamp((abs(a*textureCoordinate.x - textureCoordinate.y + b)/sqrt(a*a + b*b))/0.01,0.0,1.0);          float d = -tan(tiltShiftRotationAngle) * textureCoordinate.x + normalizedCenter.y + tan(tiltShiftRotationAngle) * normalizedCenter.x;\n          if(tiltShiftRotationAngle >= 3.1415926/2.0){\n              if (d  >= textureCoordinate.y) {\n                    gl_FragColor = mix(pic0,pic1,mixFactor);\n                 } else {\n                    gl_FragColor = pic0;\n                 }\n           }\n           else{\n                 if (d < textureCoordinate.y) {\n                     gl_FragColor = mix(pic0,pic1,mixFactor);\n                 } else {\n                     gl_FragColor = pic0;\n                   }\n            }\n      } }"

    .line 9
    .line 10
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hs10;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "mixturePercent"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/qxf0;->e:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "imageWidthAndHeightRatio"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/qxf0;->f:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "tiltShiftRotationAngle"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/qxf0;->g:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "center"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/qxf0;->i:I

    .line 43
    .line 44
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/qxf0;->e:I

    .line 5
    .line 6
    iget v1, p0, Ll/qxf0;->a:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/qxf0;->f:I

    .line 12
    .line 13
    iget v1, p0, Ll/qxf0;->c:F

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/qxf0;->g:I

    .line 19
    .line 20
    iget v1, p0, Ll/qxf0;->b:F

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 23
    .line 24
    .line 25
    iget v0, p0, Ll/qxf0;->i:I

    .line 26
    .line 27
    iget-object p0, p0, Ll/qxf0;->d:Landroid/graphics/PointF;

    .line 28
    .line 29
    iget v1, p0, Landroid/graphics/PointF;->x:F

    .line 30
    .line 31
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 32
    .line 33
    invoke-static {v0, v1, p0}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
