.class public abstract Ll/zr2;
.super Ll/lt2;
.source "SourceFile"


# instance fields
.field protected a:I

.field protected b:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lt2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
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
    iput v0, p0, Ll/zr2;->a:I

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
    iget v0, p0, Ll/zr2;->a:I

    .line 5
    .line 6
    iget p0, p0, Ll/zr2;->b:F

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
    invoke-super {p0, p1, p2}, Ll/lt2;->setTimeStamp(J)V

    .line 2
    .line 3
    .line 4
    long-to-float p1, p1

    .line 5
    const/high16 p2, 0x447a0000    # 1000.0f

    .line 6
    .line 7
    div-float/2addr p1, p2

    .line 8
    iput p1, p0, Ll/zr2;->b:F

    .line 9
    .line 10
    return-void
.end method
