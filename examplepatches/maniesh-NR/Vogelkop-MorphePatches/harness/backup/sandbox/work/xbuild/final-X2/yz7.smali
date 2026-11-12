.class public Lyz7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/recyclerview/widget/d;

.field public final b:Lwz7;

.field public final c:Lx93;

.field public d:Z


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/d;IIII)V
    .registers 7

    .line 56
    new-instance v0, Lwz7;

    invoke-direct {v0, p2, p3, p4, p5}, Lwz7;-><init>(IIII)V

    invoke-direct {p0, p1, v0}, Lyz7;-><init>(Landroidx/recyclerview/widget/d;Lwz7;)V

    return-void
.end method

.method public constructor <init>(Landroidx/recyclerview/widget/d;Lwz7;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyz7;->a:Landroidx/recyclerview/widget/d;

    iput-object p2, p0, Lyz7;->b:Lwz7;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/d;->hasStableIds()Z

    move-result v0

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    invoke-virtual {p1}, Landroidx/recyclerview/widget/d;->hasStableIds()Z

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-eqz v0, :cond_18

    move v0, v1

    goto :goto_19

    :cond_18
    move v0, v2

    :goto_19
    new-instance v3, Lsa2;

    const/16 v4, 0x8

    const/4 v5, 0x0

    invoke-direct {v3, v4, v0, v5}, Lsa2;-><init>(BIZ)V

    new-instance v0, Lx93;

    const/4 v4, 0x2

    new-array v4, v4, [Landroidx/recyclerview/widget/d;

    aput-object p2, v4, v5

    aput-object p1, v4, v2

    invoke-direct {v0, v3, v4}, Lx93;-><init>(Lsa2;[Landroidx/recyclerview/widget/d;)V

    iput-object v0, p0, Lyz7;->c:Lx93;

    new-instance p2, La83;

    invoke-direct {p2, p0, v1}, La83;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 3

    iget-object p0, p0, Lyz7;->b:Lwz7;

    iget v0, p0, Lwz7;->c:I

    if-eq v0, p1, :cond_10

    iput p1, p0, Lwz7;->c:I

    iget-boolean p1, p0, Lwz7;->e:Z

    if-eqz p1, :cond_10

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_10
    return-void
.end method

.method public final b(I)V
    .registers 3

    iget-object p0, p0, Lyz7;->b:Lwz7;

    iget v0, p0, Lwz7;->d:I

    if-eq v0, p1, :cond_10

    iput p1, p0, Lwz7;->d:I

    iget-boolean p1, p0, Lwz7;->e:Z

    if-eqz p1, :cond_10

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_10
    return-void
.end method

.method public final c()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lyz7;->d:Z

    invoke-virtual {p0}, Lyz7;->d()V

    return-void
.end method

.method public final d()V
    .registers 5

    iget-boolean v0, p0, Lyz7;->d:Z

    if-eqz v0, :cond_16

    iget-object v0, p0, Lyz7;->a:Landroidx/recyclerview/widget/d;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_f

    const/4 v0, 0x1

    goto :goto_10

    :cond_f
    move v0, v1

    :goto_10
    iget-object p0, p0, Lyz7;->b:Lwz7;

    iget-boolean v2, p0, Lwz7;->e:Z

    if-ne v0, v2, :cond_17

    :cond_16
    return-void

    :cond_17
    iput-boolean v0, p0, Lwz7;->e:Z

    iget-object v2, p0, Lwz7;->f:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v2, :cond_26

    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz v2, :cond_26

    xor-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/f;->setMeasurementCacheEnabled(Z)V

    :cond_26
    if-eqz v0, :cond_2c

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/d;->notifyItemInserted(I)V

    return-void

    :cond_2c
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    return-void
.end method
