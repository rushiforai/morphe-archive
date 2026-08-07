.class Lcom/tencent/liteav/screencapture/a$b$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/screencapture/a$b;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/screencapture/a$b;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/screencapture/a$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a$b$3;->a:Lcom/tencent/liteav/screencapture/a$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b$3;->a:Lcom/tencent/liteav/screencapture/a$b;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tencent/liteav/screencapture/a;->g(Lcom/tencent/liteav/screencapture/a;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tencent/liteav/screencapture/c;->a(Landroid/content/Context;)Lcom/tencent/liteav/screencapture/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a$b$3;->a:Lcom/tencent/liteav/screencapture/a$b;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/a$b;->c:Landroid/view/Surface;

    .line 16
    .line 17
    iget v2, p0, Lcom/tencent/liteav/screencapture/a$b;->e:I

    .line 18
    .line 19
    iget v3, p0, Lcom/tencent/liteav/screencapture/a$b;->f:I

    .line 20
    .line 21
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tencent/liteav/screencapture/a;->h(Lcom/tencent/liteav/screencapture/a;)Lcom/tencent/liteav/screencapture/c$b;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/tencent/liteav/screencapture/c;->a(Landroid/view/Surface;IILcom/tencent/liteav/screencapture/c$b;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
