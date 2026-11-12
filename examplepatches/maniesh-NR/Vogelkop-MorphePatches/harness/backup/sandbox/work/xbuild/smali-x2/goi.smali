.class public final Lgoi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/os/CancellationSignal;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Lhoi;


# direct methods
.method public constructor <init>(Lhoi;Landroid/os/CancellationSignal;Ljava/lang/Runnable;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lgoi;->a:Landroid/os/CancellationSignal;

    iput-object p3, p0, Lgoi;->b:Ljava/lang/Runnable;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lgoi;->c:Lhoi;

    return-void
.end method


# virtual methods
.method public final a(Landroid/util/Size;Landroid/graphics/Point;)V
    .registers 8

    iget-object v0, p0, Lgoi;->c:Lhoi;

    iget-object v1, v0, Lhoi;->c:Lr72;

    iget-object v1, v1, Lr72;->d:Ljava/lang/Object;

    check-cast v1, Lh7f;

    invoke-virtual {v1, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    if-eqz v1, :cond_4f

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v1

    if-eqz v1, :cond_4f

    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v2

    int-to-float v2, v2

    iget v3, v0, Lhoi;->f:F

    mul-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v2, v2

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result p1

    int-to-float p1, p1

    iget v3, v0, Lhoi;->f:F

    mul-float/2addr p1, v3

    float-to-double v3, p1

    invoke-static {v3, v4}, Ljava/lang/Math;->floor(D)D

    move-result-wide v3

    double-to-int p1, v3

    const/4 v3, 0x0

    invoke-direct {v1, v3, v3, v2, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, v0, Lhoi;->d:Landroid/graphics/Rect;

    iget p1, p2, Landroid/graphics/Point;->y:I

    int-to-float p1, p1

    iget p2, v0, Lhoi;->f:F

    mul-float/2addr p1, p2

    float-to-double p1, p1

    invoke-static {p1, p2}, Ljava/lang/Math;->floor(D)D

    move-result-wide p1

    double-to-int p1, p1

    iput p1, v0, Lhoi;->e:I

    iget-object p0, p0, Lgoi;->b:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_4f
    iget-object p1, v0, Lhoi;->c:Lr72;

    invoke-virtual {p1}, Lr72;->b()V

    iget-object p0, p0, Lgoi;->a:Landroid/os/CancellationSignal;

    invoke-virtual {p0}, Landroid/os/CancellationSignal;->cancel()V

    return-void
.end method

.method public final b(I)V
    .registers 3

    const/4 v0, 0x5

    if-eq p1, v0, :cond_1e

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1e

    iget-object p1, p0, Lgoi;->c:Lhoi;

    iget-object v0, p1, Lhoi;->c:Lr72;

    iget-object v0, v0, Lr72;->d:Ljava/lang/Object;

    check-cast v0, Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object p1, p1, Lhoi;->c:Lr72;

    invoke-virtual {p1}, Lr72;->b()V

    iget-object p0, p0, Lgoi;->a:Landroid/os/CancellationSignal;

    invoke-virtual {p0}, Landroid/os/CancellationSignal;->cancel()V

    invoke-static {}, LJ/N;->Mud1A5Xc()Z

    :cond_1e
    return-void
.end method
