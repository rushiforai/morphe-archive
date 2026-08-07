.class public Lcom/tencent/liteav/beauty/b/j;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static j:Ljava/lang/String; = "GPUGreenScreen"


# instance fields
.field private a:I

.field private b:I

.field private c:Z

.field private d:Lcom/tencent/liteav/beauty/b/x;

.field private e:Z

.field private f:Lcom/tencent/liteav/basic/c/i;

.field private g:Lcom/tencent/liteav/beauty/b/e;

.field private h:Lcom/tencent/liteav/beauty/b/q;

.field private i:Z

.field private k:Lcom/tencent/liteav/basic/b/b;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private b()V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/liteav/beauty/b/j;->j:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "come into destroyPlayer"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/j;->d:Lcom/tencent/liteav/beauty/b/x;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/x;->a()V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/j;->d:Lcom/tencent/liteav/beauty/b/x;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/b/j;->e:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/b/j;->i:Z

    .line 22
    .line 23
    sget-object p0, Lcom/tencent/liteav/beauty/b/j;->j:Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "come out destroyPlayer"

    .line 26
    .line 27
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private c()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/j;->b:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, -0x1

    .line 6
    if-eq v0, v3, :cond_0

    .line 7
    .line 8
    iget v4, p0, Lcom/tencent/liteav/beauty/b/j;->a:I

    .line 9
    .line 10
    if-eq v0, v4, :cond_0

    .line 11
    .line 12
    filled-new-array {v0}, [I

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 17
    .line 18
    .line 19
    iput v3, p0, Lcom/tencent/liteav/beauty/b/j;->b:I

    .line 20
    .line 21
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/beauty/b/j;->a:I

    .line 22
    .line 23
    if-eq v0, v3, :cond_1

    .line 24
    .line 25
    filled-new-array {v0}, [I

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 30
    .line 31
    .line 32
    iput v3, p0, Lcom/tencent/liteav/beauty/b/j;->a:I

    .line 33
    .line 34
    :cond_1
    return-void
.end method


# virtual methods
.method public a(I)I
    .locals 0

    .line 55
    return p1
.end method

.method public a()V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/liteav/beauty/b/j;->j:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "come into GreenScreen destroy"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/j;->b()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/j;->c()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/j;->f:Lcom/tencent/liteav/basic/c/i;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/j;->f:Lcom/tencent/liteav/basic/c/i;

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/j;->g:Lcom/tencent/liteav/beauty/b/e;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/j;->g:Lcom/tencent/liteav/beauty/b/e;

    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/j;->h:Lcom/tencent/liteav/beauty/b/q;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/j;->h:Lcom/tencent/liteav/beauty/b/q;

    .line 41
    .line 42
    :cond_2
    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/b/j;->c:Z

    .line 44
    .line 45
    sget-object p0, Lcom/tencent/liteav/beauty/b/j;->j:Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "come out GreenScreen destroy"

    .line 48
    .line 49
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/b/b;)V
    .locals 2

    .line 53
    sget-object v0, Lcom/tencent/liteav/beauty/b/j;->j:Ljava/lang/String;

    const-string v1, "set notify"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/j;->k:Lcom/tencent/liteav/basic/b/b;

    return-void
.end method
