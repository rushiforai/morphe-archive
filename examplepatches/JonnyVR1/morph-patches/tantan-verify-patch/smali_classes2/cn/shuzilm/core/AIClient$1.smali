.class Lcn/shuzilm/core/AIClient$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Ljava/util/concurrent/LinkedBlockingQueue;

.field final synthetic b:Landroid/os/IBinder;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/LinkedBlockingQueue;Landroid/os/IBinder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/AIClient$1;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    iput-object p2, p0, Lcn/shuzilm/core/AIClient$1;->b:Landroid/os/IBinder;

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
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcn/shuzilm/core/AIClient$1;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    iget-object p0, p0, Lcn/shuzilm/core/AIClient$1;->b:Landroid/os/IBinder;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/LinkedBlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method
