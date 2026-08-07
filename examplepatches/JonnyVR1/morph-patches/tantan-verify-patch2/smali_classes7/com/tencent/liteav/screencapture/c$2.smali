.class Lcom/tencent/liteav/screencapture/c$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/util/h$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/screencapture/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/screencapture/c;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/screencapture/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/c$2;->a:Lcom/tencent/liteav/screencapture/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTimeout()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/c$2;->a:Lcom/tencent/liteav/screencapture/c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/screencapture/c;->b(Lcom/tencent/liteav/screencapture/c;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Lcom/tencent/liteav/screencapture/c;->a(Lcom/tencent/liteav/screencapture/c;Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/c$2;->a:Lcom/tencent/liteav/screencapture/c;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/tencent/liteav/screencapture/c;->c(Lcom/tencent/liteav/screencapture/c;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ne v1, v0, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/c$2;->a:Lcom/tencent/liteav/screencapture/c;

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/tencent/liteav/screencapture/c;->b(Lcom/tencent/liteav/screencapture/c;Z)Z

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/c$2;->a:Lcom/tencent/liteav/screencapture/c;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/tencent/liteav/screencapture/c;->a(Lcom/tencent/liteav/screencapture/c;)Ljava/util/Map;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/tencent/liteav/screencapture/c$a;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/tencent/liteav/screencapture/c$a;->d:Lcom/tencent/liteav/screencapture/c$b;

    .line 52
    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    invoke-interface {v1, v0}, Lcom/tencent/liteav/screencapture/c$b;->a(Z)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    :goto_1
    return-void
.end method
