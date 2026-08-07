.class Lcom/ss/bytertc/base/media/EglRenderer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/EglRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/EglRenderer;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/EglRenderer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/EglRenderer$1;->this$0:Lcom/ss/bytertc/base/media/EglRenderer;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/EglRenderer$1;->this$0:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/EglRenderer;->access$100(Lcom/ss/bytertc/base/media/EglRenderer;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/base/media/EglRenderer$1;->this$0:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/ss/bytertc/base/media/EglRenderer;->access$200(Lcom/ss/bytertc/base/media/EglRenderer;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/base/media/EglRenderer$1;->this$0:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/ss/bytertc/base/media/EglRenderer;->access$300(Lcom/ss/bytertc/base/media/EglRenderer;)Landroid/os/Handler;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/ss/bytertc/base/media/EglRenderer$1;->this$0:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/ss/bytertc/base/media/EglRenderer;->access$300(Lcom/ss/bytertc/base/media/EglRenderer;)Landroid/os/Handler;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v2, p0, Lcom/ss/bytertc/base/media/EglRenderer$1;->this$0:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 28
    .line 29
    invoke-static {v2}, Lcom/ss/bytertc/base/media/EglRenderer;->access$400(Lcom/ss/bytertc/base/media/EglRenderer;)Ljava/lang/Runnable;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/ss/bytertc/base/media/EglRenderer$1;->this$0:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 37
    .line 38
    invoke-static {v1}, Lcom/ss/bytertc/base/media/EglRenderer;->access$300(Lcom/ss/bytertc/base/media/EglRenderer;)Landroid/os/Handler;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object p0, p0, Lcom/ss/bytertc/base/media/EglRenderer$1;->this$0:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 43
    .line 44
    invoke-static {p0}, Lcom/ss/bytertc/base/media/EglRenderer;->access$400(Lcom/ss/bytertc/base/media/EglRenderer;)Ljava/lang/Runnable;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-wide/16 v2, 0xfa0

    .line 49
    .line 50
    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    :goto_0
    monitor-exit v0

    .line 57
    return-void

    .line 58
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method
