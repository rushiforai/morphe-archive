.class public Lcom/tencent/liteav/beauty/a/a/c;
.super Lcom/tencent/liteav/beauty/a/a/b;
.source "SourceFile"


# instance fields
.field private b:Landroid/view/Surface;

.field private c:Z


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/beauty/a/a/a;IIZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/a/a/b;-><init>(Lcom/tencent/liteav/beauty/a/a/a;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2, p3}, Lcom/tencent/liteav/beauty/a/a/b;->a(II)V

    .line 5
    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/tencent/liteav/beauty/a/a/c;->c:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public c()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/a/a/b;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/c;->b:Landroid/view/Surface;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/tencent/liteav/beauty/a/a/c;->c:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/tencent/liteav/beauty/a/a/c;->b:Landroid/view/Surface;

    .line 17
    .line 18
    :cond_1
    return-void
.end method
