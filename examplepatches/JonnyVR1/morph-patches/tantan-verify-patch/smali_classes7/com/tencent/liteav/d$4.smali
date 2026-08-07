.class Lcom/tencent/liteav/d$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->a(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$4;->c:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/d$4;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/d$4;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d$4;->c:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/liteav/d$4;->a:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/d;->b(Lcom/tencent/liteav/d;I)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/d$4;->c:Lcom/tencent/liteav/d;

    .line 9
    .line 10
    iget v1, p0, Lcom/tencent/liteav/d$4;->b:I

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;I)I

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/liteav/d$4;->c:Lcom/tencent/liteav/d;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tencent/liteav/d;->j(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/basic/structs/b;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/liteav/d$4;->c:Lcom/tencent/liteav/d;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tencent/liteav/d;->k(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/basic/c/e;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/tencent/liteav/d$4;->c:Lcom/tencent/liteav/d;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/tencent/liteav/d;->j(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/basic/structs/b;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-static {p0, v0, v1}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/d;Lcom/tencent/liteav/basic/structs/b;Z)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method
