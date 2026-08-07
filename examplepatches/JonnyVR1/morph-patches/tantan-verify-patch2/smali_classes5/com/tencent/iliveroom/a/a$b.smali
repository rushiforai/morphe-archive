.class final Lcom/tencent/iliveroom/a/a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/iliveroom/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field private a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/iliveroom/a/a;",
            ">;"
        }
    .end annotation
.end field

.field private b:Z


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/iliveroom/a/a$b;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/tencent/iliveroom/a/a$b;->b:Z

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a$b;)Z
    .locals 0

    .line 21
    iget-boolean p0, p0, Lcom/tencent/iliveroom/a/a$b;->b:Z

    return p0
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a$b;Z)Z
    .locals 0

    .line 20
    iput-boolean p1, p0, Lcom/tencent/iliveroom/a/a$b;->b:Z

    return p1
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$b;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tencent/iliveroom/a/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v1, Lcom/tencent/iliveroom/a/a$b$1;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0}, Lcom/tencent/iliveroom/a/a$b$1;-><init>(Lcom/tencent/iliveroom/a/a$b;Lcom/tencent/iliveroom/a/a;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$b;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tencent/iliveroom/a/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v1, Lcom/tencent/iliveroom/a/a$b$2;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/tencent/iliveroom/a/a$b$2;-><init>(Lcom/tencent/iliveroom/a/a$b;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$b;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tencent/iliveroom/a/a;

    .line 8
    .line 9
    const-string v1, "TRTCAdapter-ext"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->V(Lcom/tencent/iliveroom/a/a;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v4

    .line 19
    invoke-static {v3, v4, v5}, Lcom/tencent/iliveroom/a/b/b;->a(IJ)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->W(Lcom/tencent/iliveroom/a/a;)J

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    invoke-static {v2, v3, v4}, Lcom/tencent/iliveroom/a/b/b;->a(IJ)V

    .line 27
    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->X(Lcom/tencent/iliveroom/a/a;)J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    invoke-static {v2, v3, v4}, Lcom/tencent/iliveroom/a/b/b;->a(IJ)V

    .line 35
    .line 36
    .line 37
    iget-boolean v2, p0, Lcom/tencent/iliveroom/a/a$b;->b:Z

    .line 38
    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->Y(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/basic/util/e;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-wide/16 v1, 0x3e8

    .line 46
    .line 47
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    const-string p0, "TRTCAdapter: timer task is stop. give up to delay task."

    .line 52
    .line 53
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    const-string v0, "TRTCAdapter: adapter is null in timer task, timer task is stop."

    .line 58
    .line 59
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iput-boolean v2, p0, Lcom/tencent/iliveroom/a/a$b;->b:Z

    .line 63
    .line 64
    return-void
.end method
