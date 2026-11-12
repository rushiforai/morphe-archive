.class public final Lu37;
.super Lro9;
.source "SourceFile"


# instance fields
.field public final l:Landroid/util/SparseBooleanArray;

.field public final m:Lt37;


# direct methods
.method public constructor <init>(Lt37;)V
    .registers 3

    const/16 v0, 0x1c

    invoke-direct {p0, v0}, Lro9;-><init>(B)V

    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lu37;->l:Landroid/util/SparseBooleanArray;

    iput-object p1, p0, Lu37;->m:Lt37;

    return-void
.end method


# virtual methods
.method public final F(Landroidx/recyclerview/widget/i;)V
    .registers 5

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getItemViewType()I

    move-result v0

    iget-object v1, p0, Lu37;->l:Landroid/util/SparseBooleanArray;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseBooleanArray;->append(IZ)V

    invoke-virtual {p0, v0}, Lro9;->u(I)Lpph;

    move-result-object v1

    iget-object v1, v1, Lpph;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-super {p0, p1}, Lro9;->F(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {p0, v0}, Lro9;->u(I)Lpph;

    move-result-object v0

    iget-object v0, v0, Lpph;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v1, v0, :cond_26

    invoke-virtual {p0, p1}, Lu37;->f0(Landroidx/recyclerview/widget/i;)V

    :cond_26
    return-void
.end method

.method public final f()V
    .registers 4

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lu37;->l:Landroid/util/SparseBooleanArray;

    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_1e

    invoke-virtual {v1, v0}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v1

    invoke-virtual {p0, v1}, Lro9;->t(I)Landroidx/recyclerview/widget/i;

    move-result-object v2

    :goto_11
    if-eqz v2, :cond_1b

    invoke-virtual {p0, v2}, Lu37;->f0(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {p0, v1}, Lro9;->t(I)Landroidx/recyclerview/widget/i;

    move-result-object v2

    goto :goto_11

    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1e
    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->clear()V

    invoke-super {p0}, Lro9;->f()V

    return-void
.end method

.method public final f0(Landroidx/recyclerview/widget/i;)V
    .registers 4

    instance-of v0, p1, Lab2;

    if-nez v0, :cond_5

    return-void

    :cond_5
    move-object v0, p1

    check-cast v0, Lab2;

    iget-object v1, v0, Lab2;->b:Lja2;

    if-nez v1, :cond_e

    const/4 v1, 0x1

    goto :goto_f

    :cond_e
    const/4 v1, 0x0

    :goto_f
    if-nez v1, :cond_16

    iget-object p0, p0, Lu37;->m:Lt37;

    invoke-interface {p0, p1}, Lt37;->a(Landroidx/recyclerview/widget/i;)V

    :cond_16
    invoke-virtual {v0}, Lab2;->onDestroy()V

    return-void
.end method
