.class Lcom/tencent/liteav/renderer/d$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/renderer/d;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/renderer/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/renderer/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/renderer/d$3;->a:Lcom/tencent/liteav/renderer/d;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/d$3;->a:Lcom/tencent/liteav/renderer/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/renderer/d;->a(Lcom/tencent/liteav/renderer/d;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object v2, p0, Lcom/tencent/liteav/renderer/d$3;->a:Lcom/tencent/liteav/renderer/d;

    .line 8
    .line 9
    invoke-static {v2}, Lcom/tencent/liteav/renderer/d;->b(Lcom/tencent/liteav/renderer/d;)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/renderer/d;->a(Lcom/tencent/liteav/renderer/d;II)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/liteav/renderer/d$3;->a:Lcom/tencent/liteav/renderer/d;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tencent/liteav/renderer/d;->c(Lcom/tencent/liteav/renderer/d;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/renderer/d;->b(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/tencent/liteav/renderer/d$3;->a:Lcom/tencent/liteav/renderer/d;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/tencent/liteav/renderer/d;->d(Lcom/tencent/liteav/renderer/d;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/renderer/d;->d(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
