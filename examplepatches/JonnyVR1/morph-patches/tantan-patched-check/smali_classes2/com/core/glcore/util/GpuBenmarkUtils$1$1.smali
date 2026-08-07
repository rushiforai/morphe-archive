.class Lcom/core/glcore/util/GpuBenmarkUtils$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/core/glcore/util/GpuBenmarkUtils$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;


# direct methods
.method public constructor <init>(Lcom/core/glcore/util/GpuBenmarkUtils$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;

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
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 4
    .line 5
    new-instance v1, Lcom/core/glcore/util/GpuBenmark;

    .line 6
    .line 7
    invoke-direct {v1}, Lcom/core/glcore/util/GpuBenmark;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$102(Lcom/core/glcore/util/GpuBenmarkUtils;Lcom/core/glcore/util/GpuBenmark;)Lcom/core/glcore/util/GpuBenmark;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$100(Lcom/core/glcore/util/GpuBenmarkUtils;)Lcom/core/glcore/util/GpuBenmark;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Lcom/core/glcore/util/GpuBenmarkUtils$1$1$1;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/core/glcore/util/GpuBenmarkUtils$1$1$1;-><init>(Lcom/core/glcore/util/GpuBenmarkUtils$1$1;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/core/glcore/util/GpuBenmark;->setGpuBenmarkListener(Lcom/core/glcore/util/GpuBenmarkListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$100(Lcom/core/glcore/util/GpuBenmarkUtils;)Lcom/core/glcore/util/GpuBenmark;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/core/glcore/util/GpuBenmark;->startGpuBenmark()V

    .line 38
    .line 39
    .line 40
    return-void
.end method
