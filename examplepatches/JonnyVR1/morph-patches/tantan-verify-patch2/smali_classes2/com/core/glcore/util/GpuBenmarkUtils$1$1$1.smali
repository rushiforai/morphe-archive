.class Lcom/core/glcore/util/GpuBenmarkUtils$1$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/core/glcore/util/GpuBenmarkListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/core/glcore/util/GpuBenmarkUtils$1$1;


# direct methods
.method public constructor <init>(Lcom/core/glcore/util/GpuBenmarkUtils$1$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1$1;->this$2:Lcom/core/glcore/util/GpuBenmarkUtils$1$1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getGpuBenmark(D)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1$1;->this$2:Lcom/core/glcore/util/GpuBenmarkUtils$1$1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 6
    .line 7
    const-wide/high16 v1, 0x4008000000000000L    # 3.0

    .line 8
    .line 9
    div-double/2addr p1, v1

    .line 10
    invoke-static {v0, p1, p2}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$218(Lcom/core/glcore/util/GpuBenmarkUtils;D)D

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1$1;->this$2:Lcom/core/glcore/util/GpuBenmarkUtils$1$1;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$000(Lcom/core/glcore/util/GpuBenmarkUtils;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/4 p2, 0x2

    .line 24
    if-ne p1, p2, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1$1;->this$2:Lcom/core/glcore/util/GpuBenmarkUtils$1$1;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$300(Lcom/core/glcore/util/GpuBenmarkUtils;)Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Lcom/core/glcore/util/PreferenceUtil;->getGpuBenmarkLevel(Landroid/content/Context;)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget-object p2, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1$1;->this$2:Lcom/core/glcore/util/GpuBenmarkUtils$1$1;

    .line 41
    .line 42
    iget-object p2, p2, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;

    .line 43
    .line 44
    iget-object p2, p2, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 45
    .line 46
    invoke-static {p2}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$200(Lcom/core/glcore/util/GpuBenmarkUtils;)D

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    invoke-static {p2, v0, v1}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$400(Lcom/core/glcore/util/GpuBenmarkUtils;D)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1$1;->this$2:Lcom/core/glcore/util/GpuBenmarkUtils$1$1;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 59
    .line 60
    invoke-static {v0}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$500(Lcom/core/glcore/util/GpuBenmarkUtils;)Lcom/core/glcore/util/GpuBenmarkChangeListener;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-interface {v0, p2}, Lcom/core/glcore/util/GpuBenmarkChangeListener;->getGpuBenmarkLevel(I)V

    .line 65
    .line 66
    .line 67
    if-eq p1, p2, :cond_0

    .line 68
    .line 69
    iget-object p1, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1$1;->this$2:Lcom/core/glcore/util/GpuBenmarkUtils$1$1;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$300(Lcom/core/glcore/util/GpuBenmarkUtils;)Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {p1, p2}, Lcom/core/glcore/util/PreferenceUtil;->setGpuBenmarkLevel(Landroid/content/Context;I)V

    .line 80
    .line 81
    .line 82
    :cond_0
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1$1;->this$2:Lcom/core/glcore/util/GpuBenmarkUtils$1$1;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1$1;->this$1:Lcom/core/glcore/util/GpuBenmarkUtils$1;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmarkUtils$1;->this$0:Lcom/core/glcore/util/GpuBenmarkUtils;

    .line 87
    .line 88
    invoke-static {p0}, Lcom/core/glcore/util/GpuBenmarkUtils;->access$100(Lcom/core/glcore/util/GpuBenmarkUtils;)Lcom/core/glcore/util/GpuBenmark;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/core/glcore/util/GpuBenmark;->releaseGL()V

    .line 93
    .line 94
    .line 95
    return-void
.end method
