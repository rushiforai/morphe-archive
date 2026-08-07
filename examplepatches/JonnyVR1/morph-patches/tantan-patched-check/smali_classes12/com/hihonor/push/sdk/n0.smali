.class public Lcom/hihonor/push/sdk/n0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TResult:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Lcom/hihonor/push/sdk/a1;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/hihonor/push/sdk/a1;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/hihonor/push/sdk/a1;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/hihonor/push/sdk/n0;->a:Lcom/hihonor/push/sdk/a1;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;)V
    .locals 2

    .line 30
    iget-object p0, p0, Lcom/hihonor/push/sdk/n0;->a:Lcom/hihonor/push/sdk/a1;

    .line 31
    iget-object v0, p0, Lcom/hihonor/push/sdk/a1;->a:Ljava/lang/Object;

    monitor-enter v0

    .line 32
    :try_start_0
    iget-boolean v1, p0, Lcom/hihonor/push/sdk/a1;->b:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    .line 33
    iput-boolean v1, p0, Lcom/hihonor/push/sdk/a1;->b:Z

    .line 34
    iput-object p1, p0, Lcom/hihonor/push/sdk/a1;->d:Ljava/lang/Exception;

    .line 35
    iget-object p1, p0, Lcom/hihonor/push/sdk/a1;->a:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 36
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/a1;->a()V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTResult;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hihonor/push/sdk/n0;->a:Lcom/hihonor/push/sdk/a1;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/hihonor/push/sdk/a1;->a:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-boolean v1, p0, Lcom/hihonor/push/sdk/a1;->b:Z

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    iput-boolean v1, p0, Lcom/hihonor/push/sdk/a1;->b:Z

    .line 12
    .line 13
    iput-object p1, p0, Lcom/hihonor/push/sdk/a1;->c:Ljava/lang/Object;

    .line 14
    .line 15
    iget-object p1, p0, Lcom/hihonor/push/sdk/a1;->a:Ljava/lang/Object;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/a1;->a()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit v0

    .line 27
    return-void

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method
