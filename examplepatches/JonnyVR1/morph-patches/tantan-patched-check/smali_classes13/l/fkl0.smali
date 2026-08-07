.class public final Ll/fkl0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fkl0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u0000 \u00192\u00020\u0001:\u0001\nB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J%\u0010\n\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0008\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\n\u0010\u000bR\u0016\u0010\r\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\n\u0010\u000cR\u0016\u0010\u000e\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010\u000cR\u0016\u0010\u0010\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u000cR\u0016\u0010\u0012\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010\u000cR\u0016\u0010\u0016\u001a\u00020\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0015R\u0016\u0010\u0018\u001a\u00020\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0015\u00a8\u0006\u001a"
    }
    d2 = {
        "Ll/fkl0;",
        "",
        "<init>",
        "()V",
        "",
        "b",
        "",
        "textId",
        "width",
        "height",
        "a",
        "(III)V",
        "I",
        "program",
        "positionAttr",
        "c",
        "texCoordinateAttr",
        "d",
        "texUniform",
        "Ljava/nio/FloatBuffer;",
        "e",
        "Ljava/nio/FloatBuffer;",
        "vertexCoordinateBuffer",
        "f",
        "textureCoordinateBuffer",
        "Companion",
        "android_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/fkl0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Ljava/nio/FloatBuffer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public f:Ljava/nio/FloatBuffer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/fkl0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/fkl0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/fkl0;->Companion:Ll/fkl0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Ljava/nio/FloatBuffer;->allocate(I)Ljava/nio/FloatBuffer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/fkl0;->e:Ljava/nio/FloatBuffer;

    .line 13
    .line 14
    invoke-static {v0}, Ljava/nio/FloatBuffer;->allocate(I)Ljava/nio/FloatBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/fkl0;->f:Ljava/nio/FloatBuffer;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final a(III)V
    .locals 7

    .line 1
    sget-object v0, Ll/ifj;->INSTANCE:Ll/ifj;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ifj;->b()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {v0, v0, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 8
    .line 9
    .line 10
    iget p2, p0, Ll/fkl0;->a:I

    .line 11
    .line 12
    invoke-static {p2}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 13
    .line 14
    .line 15
    iget p2, p0, Ll/fkl0;->b:I

    .line 16
    .line 17
    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 18
    .line 19
    .line 20
    iget v1, p0, Ll/fkl0;->b:I

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    iget-object v6, p0, Ll/fkl0;->e:Ljava/nio/FloatBuffer;

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    const/16 v3, 0x1406

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 30
    .line 31
    .line 32
    iget p2, p0, Ll/fkl0;->c:I

    .line 33
    .line 34
    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 35
    .line 36
    .line 37
    iget v1, p0, Ll/fkl0;->c:I

    .line 38
    .line 39
    iget-object v6, p0, Ll/fkl0;->f:Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 42
    .line 43
    .line 44
    const p2, 0x84c0

    .line 45
    .line 46
    .line 47
    invoke-static {p2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 48
    .line 49
    .line 50
    const/16 p2, 0xde1

    .line 51
    .line 52
    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 53
    .line 54
    .line 55
    iget p1, p0, Ll/fkl0;->d:I

    .line 56
    .line 57
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 58
    .line 59
    .line 60
    const/4 p1, 0x5

    .line 61
    const/4 p3, 0x4

    .line 62
    invoke-static {p1, v0, p3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 63
    .line 64
    .line 65
    iget p1, p0, Ll/fkl0;->b:I

    .line 66
    .line 67
    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 68
    .line 69
    .line 70
    iget p0, p0, Ll/fkl0;->c:I

    .line 71
    .line 72
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 73
    .line 74
    .line 75
    invoke-static {p2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    sget-object v0, Ll/ifj;->INSTANCE:Ll/ifj;

    .line 2
    .line 3
    const-string v1, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    .line 4
    .line 5
    const-string v2, "varying highp vec2 textureCoordinate;\nuniform sampler2D inputImageTexture;\nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/ifj;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iput v1, p0, Ll/fkl0;->a:I

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string v2, "position"

    .line 16
    .line 17
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iput v1, p0, Ll/fkl0;->b:I

    .line 22
    .line 23
    iget v1, p0, Ll/fkl0;->a:I

    .line 24
    .line 25
    const-string v2, "inputTextureCoordinate"

    .line 26
    .line 27
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput v1, p0, Ll/fkl0;->c:I

    .line 32
    .line 33
    iget v1, p0, Ll/fkl0;->a:I

    .line 34
    .line 35
    const-string v2, "inputImageTexture"

    .line 36
    .line 37
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput v1, p0, Ll/fkl0;->d:I

    .line 42
    .line 43
    sget-object v1, Ll/ifj;->a:[F

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/ifj;->g([F)Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, p0, Ll/fkl0;->e:Ljava/nio/FloatBuffer;

    .line 50
    .line 51
    sget-object v1, Ll/ifj;->b:[F

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/ifj;->g([F)Ljava/nio/FloatBuffer;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Ll/fkl0;->f:Ljava/nio/FloatBuffer;

    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    const-string p0, "Unable to create program"

    .line 61
    .line 62
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
