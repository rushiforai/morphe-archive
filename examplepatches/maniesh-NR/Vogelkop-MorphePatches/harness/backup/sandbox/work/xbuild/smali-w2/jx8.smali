.class public final Ljx8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leig;


# instance fields
.field public final a:Ldg7;

.field public final b:Lx5f;

.field public c:J

.field public d:I

.field public e:Z


# direct methods
.method public constructor <init>(Ldg7;Lx5f;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Ljx8;->c:J

    iput-object p1, p0, Ljx8;->a:Ldg7;

    iput-object p2, p0, Ljx8;->b:Lx5f;

    return-void
.end method


# virtual methods
.method public final F(Lrhg;)V
    .registers 2

    return-void
.end method

.method public final K(Lgql;I)V
    .registers 3

    return-void
.end method

.method public final M(Lthg;)V
    .registers 2

    return-void
.end method

.method public final d(Z)V
    .registers 12

    iget-wide v0, p0, Ljx8;->c:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    if-ne v0, p1, :cond_e

    return-void

    :cond_e
    iget-object v1, p0, Ljx8;->a:Ldg7;

    iget-object v1, v1, Ldg7;->b:Ljava/lang/Object;

    check-cast v1, Lkx8;

    iget-object v1, v1, Lkx8;->s:Landroidx/media3/ui/PlayerView;

    if-eqz v1, :cond_1b

    invoke-virtual {v1, p1}, Landroid/view/View;->setKeepScreenOn(Z)V

    :cond_1b
    if-eqz v0, :cond_61

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v4, p0, Ljx8;->c:J

    sub-long/2addr v0, v4

    iget-object v4, p0, Ljx8;->b:Lx5f;

    iget-boolean v5, v4, Lx5f;->h:Z

    if-eqz v5, :cond_61

    iget-object v5, v4, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v5}, Lx56;->A(Lzpa;)Luc0;

    move-result-object v5

    const/4 v7, 0x4

    invoke-virtual {v5, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    if-eqz v8, :cond_49

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_49

    new-instance v9, Lhf0;

    invoke-direct {v9, v5, v7, v8}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_57

    :cond_49
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    const/4 v9, -0x1

    invoke-virtual {v5, v7, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v9, Lhf0;

    invoke-direct {v9, v5, v7, v8}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_57
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v4, v6}, Lx5f;->U0(Lx56;)V

    :cond_61
    if-eqz p1, :cond_67

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    :cond_67
    iput-wide v2, p0, Ljx8;->c:J

    return-void
.end method

.method public final h(I)V
    .registers 3

    iget v0, p0, Ljx8;->d:I

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput p1, p0, Ljx8;->d:I

    const/4 v0, 0x3

    if-ne p1, v0, :cond_10

    iget-boolean p1, p0, Ljx8;->e:Z

    if-eqz p1, :cond_10

    const/4 p1, 0x1

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    invoke-virtual {p0, p1}, Ljx8;->d(Z)V

    return-void
.end method

.method public final onRepeatModeChanged(I)V
    .registers 2

    return-void
.end method

.method public final onShuffleModeEnabledChanged(Z)V
    .registers 2

    return-void
.end method

.method public final z(IZ)V
    .registers 4

    iget-boolean p1, p0, Ljx8;->e:Z

    if-ne p1, p2, :cond_5

    return-void

    :cond_5
    iput-boolean p2, p0, Ljx8;->e:Z

    iget p1, p0, Ljx8;->d:I

    const/4 v0, 0x3

    if-ne p1, v0, :cond_10

    if-eqz p2, :cond_10

    const/4 p1, 0x1

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    invoke-virtual {p0, p1}, Ljx8;->d(Z)V

    return-void
.end method
