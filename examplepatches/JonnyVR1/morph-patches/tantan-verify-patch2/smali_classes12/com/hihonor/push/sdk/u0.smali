.class public Lcom/hihonor/push/sdk/u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/hihonor/push/sdk/a1;

.field public final synthetic b:Lcom/hihonor/push/sdk/v0;


# direct methods
.method public constructor <init>(Lcom/hihonor/push/sdk/v0;Lcom/hihonor/push/sdk/a1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hihonor/push/sdk/u0;->b:Lcom/hihonor/push/sdk/v0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hihonor/push/sdk/u0;->a:Lcom/hihonor/push/sdk/a1;

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
    iget-object v0, p0, Lcom/hihonor/push/sdk/u0;->b:Lcom/hihonor/push/sdk/v0;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/hihonor/push/sdk/v0;->c:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Lcom/hihonor/push/sdk/u0;->b:Lcom/hihonor/push/sdk/v0;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/hihonor/push/sdk/v0;->b:Lcom/hihonor/push/sdk/l0;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/hihonor/push/sdk/u0;->a:Lcom/hihonor/push/sdk/a1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/a1;->b()Ljava/lang/Exception;

    .line 15
    .line 16
    .line 17
    check-cast v1, Lcom/hihonor/push/sdk/y0;

    .line 18
    .line 19
    iget-object p0, v1, Lcom/hihonor/push/sdk/y0;->a:Ljava/util/concurrent/CountDownLatch;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0
.end method
