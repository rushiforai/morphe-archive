.class Lcn/shuzilm/core/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcn/shuzilm/core/m;->a:I

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
    .locals 2

    .line 1
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->b()Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->tryLock()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    :try_start_0
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->c()Lcn/shuzilm/core/AIClient;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    new-instance v0, Lcn/shuzilm/core/AIClient;

    .line 19
    .line 20
    sget-object v1, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 21
    .line 22
    invoke-direct {v0, v1}, Lcn/shuzilm/core/AIClient;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Lcn/shuzilm/core/DUHelper;->a(Lcn/shuzilm/core/AIClient;)Lcn/shuzilm/core/AIClient;

    .line 26
    .line 27
    .line 28
    :cond_1
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->c()Lcn/shuzilm/core/AIClient;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget p0, p0, Lcn/shuzilm/core/m;->a:I

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcn/shuzilm/core/AIClient;->asynAI(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->b()Ljava/util/concurrent/locks/Lock;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw p0

    .line 47
    :catch_0
    :goto_0
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->b()Ljava/util/concurrent/locks/Lock;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 52
    .line 53
    .line 54
    return-void
.end method
