.class public Lcom/tencent/liteav/beauty/b/o;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field private r:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tencent/liteav/beauty/b/o;->r:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public b([F)V
    .locals 1

    .line 27
    iget v0, p0, Lcom/tencent/liteav/beauty/b/o;->r:I

    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->c(I[F)V

    return-void
.end method

.method public b()Z
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, "purlColor"

    .line 10
    .line 11
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, p0, Lcom/tencent/liteav/beauty/b/o;->r:I

    .line 16
    .line 17
    const/4 v2, 0x4

    .line 18
    new-array v2, v2, [F

    .line 19
    .line 20
    fill-array-data v2, :array_0

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v1, v2}, Lcom/tencent/liteav/basic/c/h;->c(I[F)V

    .line 24
    .line 25
    .line 26
    return v0

    .line 27
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
