.class Lcom/tencent/liteav/beauty/c$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/beauty/c;->f(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/tencent/liteav/beauty/c;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/beauty/c;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c$4;->b:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/beauty/c$4;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/c$4;->a:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/liteav/beauty/a;->a()Lcom/tencent/liteav/beauty/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/a;->f()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$4;->b:Lcom/tencent/liteav/beauty/c;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->e(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/b;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget v0, p0, Lcom/tencent/liteav/beauty/c$4;->a:I

    .line 21
    .line 22
    if-ltz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$4;->b:Lcom/tencent/liteav/beauty/c;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->e(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/b;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget p0, p0, Lcom/tencent/liteav/beauty/c$4;->a:I

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/beauty/b/b;->f(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method
