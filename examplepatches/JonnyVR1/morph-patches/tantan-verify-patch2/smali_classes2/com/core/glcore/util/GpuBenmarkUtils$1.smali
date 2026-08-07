.class Lcom/core/glcore/util/GpuBenmarkUtils$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/core/glcore/util/GpuBenmarkUtils;->updata()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/core/glcore/util/GpuBenmarkUtils;


# direct methods
.method public constructor <init>(Lcom/core/glcore/util/GpuBenmarkUtils;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

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
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$002(Lcom/core/glcore/util/GpuBenmarkUtils;I)I

    .line 5
    .line 6
    .line 7
    :goto_0
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$000(Lcom/core/glcore/util/GpuBenmarkUtils;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x3

    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    new-instance v0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;-><init>(Lcom/core/glcore/util/GpuBenmarkUtils$1;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$600(Lcom/core/glcore/util/GpuBenmarkUtils;)Ljava/util/concurrent/ThreadPoolExecutor;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 v0, 0x3e8

    .line 31
    .line 32
    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$008(Lcom/core/glcore/util/GpuBenmarkUtils;)I

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method
