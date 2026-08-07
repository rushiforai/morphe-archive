.class Lcom/tencent/iliveroom/a/c$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/c;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/c;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/c$2;->a:Lcom/tencent/iliveroom/a/c;

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
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$2;->a:Lcom/tencent/iliveroom/a/c;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-static {v0, v1, v2}, Lcom/tencent/iliveroom/a/c;->a(Lcom/tencent/iliveroom/a/c;J)J

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$2;->a:Lcom/tencent/iliveroom/a/c;

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/c;->a(Lcom/tencent/iliveroom/a/c;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$2;->a:Lcom/tencent/iliveroom/a/c;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tencent/iliveroom/a/c;->a(Lcom/tencent/iliveroom/a/c;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/16 v1, 0x1f

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/tencent/iliveroom/a/c$2;->a:Lcom/tencent/iliveroom/a/c;

    .line 27
    .line 28
    invoke-static {p0}, Lcom/tencent/iliveroom/a/c;->b(Lcom/tencent/iliveroom/a/c;)Ljava/lang/ref/WeakReference;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/tencent/iliveroom/a/a;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->DisconnectOtherRoom()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
