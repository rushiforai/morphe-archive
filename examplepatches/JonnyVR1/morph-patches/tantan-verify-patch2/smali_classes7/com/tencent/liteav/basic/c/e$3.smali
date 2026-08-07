.class Lcom/tencent/liteav/basic/c/e$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/basic/c/e;->a(IZIIIIIZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Z

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:I

.field final synthetic f:I

.field final synthetic g:I

.field final synthetic h:Z

.field final synthetic i:Z

.field final synthetic j:Lcom/tencent/liteav/basic/c/e;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/c/e;IZIIIIIZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/e$3;->j:Lcom/tencent/liteav/basic/c/e;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/basic/c/e$3;->a:I

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/tencent/liteav/basic/c/e$3;->b:Z

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/basic/c/e$3;->c:I

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/liteav/basic/c/e$3;->d:I

    .line 10
    .line 11
    iput p6, p0, Lcom/tencent/liteav/basic/c/e$3;->e:I

    .line 12
    .line 13
    iput p7, p0, Lcom/tencent/liteav/basic/c/e$3;->f:I

    .line 14
    .line 15
    iput p8, p0, Lcom/tencent/liteav/basic/c/e$3;->g:I

    .line 16
    .line 17
    iput-boolean p9, p0, Lcom/tencent/liteav/basic/c/e$3;->h:Z

    .line 18
    .line 19
    iput-boolean p10, p0, Lcom/tencent/liteav/basic/c/e$3;->i:Z

    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e$3;->j:Lcom/tencent/liteav/basic/c/e;

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/liteav/basic/c/e$3;->a:I

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/tencent/liteav/basic/c/e$3;->b:Z

    .line 6
    .line 7
    iget v3, p0, Lcom/tencent/liteav/basic/c/e$3;->c:I

    .line 8
    .line 9
    iget v4, p0, Lcom/tencent/liteav/basic/c/e$3;->d:I

    .line 10
    .line 11
    iget v5, p0, Lcom/tencent/liteav/basic/c/e$3;->e:I

    .line 12
    .line 13
    iget v6, p0, Lcom/tencent/liteav/basic/c/e$3;->f:I

    .line 14
    .line 15
    iget v7, p0, Lcom/tencent/liteav/basic/c/e$3;->g:I

    .line 16
    .line 17
    iget-boolean v8, p0, Lcom/tencent/liteav/basic/c/e$3;->h:Z

    .line 18
    .line 19
    iget-boolean v9, p0, Lcom/tencent/liteav/basic/c/e$3;->i:Z

    .line 20
    .line 21
    invoke-static/range {v0 .. v9}, Lcom/tencent/liteav/basic/c/e;->a(Lcom/tencent/liteav/basic/c/e;IZIIIIIZZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception v0

    .line 26
    move-object p0, v0

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v1, "surface-render: render texture error occurred!"

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "TXGLSurfaceRenderThread"

    .line 46
    .line 47
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
