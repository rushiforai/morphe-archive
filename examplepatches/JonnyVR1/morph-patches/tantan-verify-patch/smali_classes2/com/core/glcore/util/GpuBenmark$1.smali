.class Lcom/core/glcore/util/GpuBenmark$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/core/glcore/util/GpuRenderListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/core/glcore/util/GpuBenmark;->startGpuBenmark()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/core/glcore/util/GpuBenmark;


# direct methods
.method public constructor <init>(Lcom/core/glcore/util/GpuBenmark;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/GpuBenmark$1;->this$0:Lcom/core/glcore/util/GpuBenmark;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getRenderTime(D)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmark$1;->this$0:Lcom/core/glcore/util/GpuBenmark;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/core/glcore/util/GpuBenmark;->access$000(Lcom/core/glcore/util/GpuBenmark;)Lcom/core/glcore/util/GpuBenmarkListener;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1, p2}, Lcom/core/glcore/util/GpuBenmarkListener;->getGpuBenmark(D)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
