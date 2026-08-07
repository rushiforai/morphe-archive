.class Lcom/immomo/mmdns/NetUtil$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mmdns/NetUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/immomo/mmdns/NetUtil$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mmdns/NetUtil$1;->onNetworkChange()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private onNetworkChange()V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/immomo/mmdns/NetUtil;->access$200()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, -0x1

    .line 10
    .line 11
    :goto_0
    if-ltz p0, :cond_0

    .line 12
    .line 13
    const-string v0, "MMDNS"

    .line 14
    .line 15
    const-string v1, "onNetworkChange"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/immomo/mmdns/NetUtil;->access$200()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/lang/Long;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    invoke-static {v0, v1}, Lcom/immomo/mmdns/NetUtil;->access$300(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    .line 36
    .line 37
    add-int/lit8 p0, p0, -0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    :cond_0
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    invoke-static {}, Lcom/immomo/mmdns/NetUtil;->access$000()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    sub-long/2addr v0, v2

    .line 15
    const-wide/16 v2, 0x1388

    .line 16
    .line 17
    cmp-long p1, v0, v2

    .line 18
    .line 19
    if-gez p1, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const-string p1, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 23
    .line 24
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    const-string p1, "dnsNetChanged"

    .line 35
    .line 36
    invoke-static {p1}, Lcom/immomo/mmdns/MomoMainThreadExecutor;->cancelAllRunnables(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    new-instance p2, Lcom/immomo/mmdns/NetUtil$1$1;

    .line 40
    .line 41
    invoke-direct {p2, p0}, Lcom/immomo/mmdns/NetUtil$1$1;-><init>(Lcom/immomo/mmdns/NetUtil$1;)V

    .line 42
    .line 43
    .line 44
    const-wide/16 v0, 0xbb8

    .line 45
    .line 46
    invoke-static {p1, p2, v0, v1}, Lcom/immomo/mmdns/MomoMainThreadExecutor;->postDelayed(Ljava/lang/Object;Ljava/lang/Runnable;J)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method
