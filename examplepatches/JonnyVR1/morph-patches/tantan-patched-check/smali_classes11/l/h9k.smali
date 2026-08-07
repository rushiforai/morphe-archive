.class public Ll/h9k;
.super Ll/is10;
.source "SourceFile"


# instance fields
.field private I:Landroid/graphics/Bitmap;

.field private J:I

.field private K:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/is10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public R(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hfj;->I()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iput-object p1, p0, Ll/h9k;->I:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Ll/h9k;->K:Z

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public c(ILl/hfj;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/is10;->F:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    const/4 v2, 0x1

    .line 9
    const/4 v3, 0x0

    .line 10
    if-lt v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/is10;->F:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Ll/is10;->O()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p2, v3}, Ll/is10;->Q(Ll/hfj;I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p0, v2}, Ll/is10;->Q(Ll/hfj;I)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget v0, p0, Ll/h9k;->J:I

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-boolean v1, p0, Ll/h9k;->K:Z

    .line 38
    .line 39
    if-eqz v1, :cond_4

    .line 40
    .line 41
    :cond_2
    if-eqz v0, :cond_3

    .line 42
    .line 43
    filled-new-array {v0}, [I

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 48
    .line 49
    .line 50
    iput v3, p0, Ll/h9k;->J:I

    .line 51
    .line 52
    :cond_3
    iget-object v0, p0, Ll/h9k;->I:Landroid/graphics/Bitmap;

    .line 53
    .line 54
    invoke-static {v0}, Ll/pim;->a(Landroid/graphics/Bitmap;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, Ll/h9k;->J:I

    .line 59
    .line 60
    iput-boolean v3, p0, Ll/h9k;->K:Z

    .line 61
    .line 62
    :cond_4
    iget v0, p0, Ll/h9k;->J:I

    .line 63
    .line 64
    invoke-super {p0, v0, p0, p3}, Ll/is10;->c(ILl/hfj;Z)V

    .line 65
    .line 66
    .line 67
    invoke-super {p0, p1, p2, p3}, Ll/is10;->c(ILl/hfj;Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/is10;->f()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/h9k;->J:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Ll/h9k;->J:I

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/h9k;->I:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/h9k;->I:Landroid/graphics/Bitmap;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Ll/h9k;->I:Landroid/graphics/Bitmap;

    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, " precision lowp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\n \n void main() {\n  vec2 textCood = textureCoordinate;  vec2 textCanvas = vec2(textCood.x,1.0 - textCood.y);     vec4 originalImage = texture2D(inputImageTexture0, textCood);\n     vec4 canvasImage = texture2D(inputImageTexture1,textCanvas);\n     \n     if (canvasImage.a > 0.0) {\n         gl_FragColor = originalImage;\n     } else {\n         gl_FragColor = canvasImage;\n     }\n }\n"

    .line 2
    .line 3
    return-object p0
.end method
