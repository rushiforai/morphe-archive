.class Lcom/tencent/liteav/screencapture/c$1;
.super Landroid/media/projection/MediaProjection$Callback;
.source "SourceFile"


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
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/c$1;->a:Lcom/tencent/liteav/screencapture/c;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/media/projection/MediaProjection$Callback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onStop()V
    .locals 4

    .line 1
    const-string v0, "VirtualDisplayManager"

    .line 2
    .line 3
    const-string v1, "MediaProjection session is no longer valid"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/c$1;->a:Lcom/tencent/liteav/screencapture/c;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/tencent/liteav/screencapture/c;->a(Lcom/tencent/liteav/screencapture/c;)Ljava/util/Map;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/c$1;->a:Lcom/tencent/liteav/screencapture/c;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tencent/liteav/screencapture/c;->a(Lcom/tencent/liteav/screencapture/c;)Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    const/4 v2, 0x0

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/tencent/liteav/screencapture/c$a;

    .line 48
    .line 49
    iget-object v3, v1, Lcom/tencent/liteav/screencapture/c$a;->d:Lcom/tencent/liteav/screencapture/c$b;

    .line 50
    .line 51
    if-nez v3, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object v1, v1, Lcom/tencent/liteav/screencapture/c$a;->e:Landroid/hardware/display/VirtualDisplay;

    .line 55
    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    invoke-interface {v3}, Lcom/tencent/liteav/screencapture/c$b;->a()V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    invoke-interface {v3, v2, v2}, Lcom/tencent/liteav/screencapture/c$b;->a(ZZ)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/c$1;->a:Lcom/tencent/liteav/screencapture/c;

    .line 67
    .line 68
    invoke-static {p0, v2}, Lcom/tencent/liteav/screencapture/c;->a(Lcom/tencent/liteav/screencapture/c;Z)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
