.class Lcom/tencent/liteav/videoencoder/b$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/videoencoder/b;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/basic/c/b;

.field final synthetic b:Lcom/tencent/liteav/videoencoder/b;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/basic/c/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/b$3;->b:Lcom/tencent/liteav/videoencoder/b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/videoencoder/b$3;->a:Lcom/tencent/liteav/basic/c/b;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$3;->b:Lcom/tencent/liteav/videoencoder/b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->c(Lcom/tencent/liteav/videoencoder/b;)Ljava/util/LinkedList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$3;->b:Lcom/tencent/liteav/videoencoder/b;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->d(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$3;->b:Lcom/tencent/liteav/videoencoder/b;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->d(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/tencent/liteav/videoencoder/c;->stop()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$3;->b:Lcom/tencent/liteav/videoencoder/b;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$3;->b:Lcom/tencent/liteav/videoencoder/b;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$3;->b:Lcom/tencent/liteav/videoencoder/b;

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-static {v0, v1}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/beauty/b/k;)Lcom/tencent/liteav/beauty/b/k;

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b$3;->a:Lcom/tencent/liteav/basic/c/b;

    .line 51
    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/b;->c()V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method
