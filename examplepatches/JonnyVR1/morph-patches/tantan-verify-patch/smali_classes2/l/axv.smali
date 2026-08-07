.class public Ll/axv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x1d
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Landroid/content/ContentResolver;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Landroid/content/ContentResolver;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/axv;->a:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    iput-object p2, p0, Ll/axv;->b:Landroid/content/ContentResolver;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic c(Ll/axv;)Landroid/content/ContentResolver;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/axv;->b:Landroid/content/ContentResolver;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/axv;Lcom/facebook/imagepipeline/request/ImageRequest;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/axv;->e(Lcom/facebook/imagepipeline/request/ImageRequest;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 6
    .line 7
    .line 8
    move-result-object v8

    .line 9
    const-string v0, "local"

    .line 10
    .line 11
    const-string v1, "thumbnail_bitmap"

    .line 12
    .line 13
    invoke-interface {p2, v0, v1}, Ll/yk90;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v9, Landroid/os/CancellationSignal;

    .line 17
    .line 18
    invoke-direct {v9}, Landroid/os/CancellationSignal;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/axv$a;

    .line 22
    .line 23
    const-string v5, "LocalThumbnailBitmapSdk29Producer"

    .line 24
    .line 25
    move-object v6, v3

    .line 26
    move-object v7, p2

    .line 27
    move-object v1, p0

    .line 28
    move-object v2, p1

    .line 29
    move-object v4, p2

    .line 30
    invoke-direct/range {v0 .. v9}, Ll/axv$a;-><init>(Ll/axv;Ll/z06;Ll/cl90;Ll/yk90;Ljava/lang/String;Ll/cl90;Ll/yk90;Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/os/CancellationSignal;)V

    .line 31
    .line 32
    .line 33
    new-instance p0, Ll/axv$b;

    .line 34
    .line 35
    invoke-direct {p0, v1, v0}, Ll/axv$b;-><init>(Ll/axv;Ll/z3g0;)V

    .line 36
    .line 37
    .line 38
    invoke-interface {v4, p0}, Ll/yk90;->q(Ll/zk90;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, v1, Ll/axv;->a:Ljava/util/concurrent/Executor;

    .line 42
    .line 43
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final e(Lcom/facebook/imagepipeline/request/ImageRequest;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->w()Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/axv;->b:Landroid/content/ContentResolver;

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/i4k0;->e(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
