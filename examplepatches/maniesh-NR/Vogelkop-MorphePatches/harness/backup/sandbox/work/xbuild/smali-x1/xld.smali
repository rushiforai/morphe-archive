.class public final Lxld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leig;


# instance fields
.field public final synthetic a:Lzld;


# direct methods
.method public constructor <init>(Lzld;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxld;->a:Lzld;

    return-void
.end method


# virtual methods
.method public final K(Lgql;I)V
    .registers 3

    iget-object p0, p0, Lxld;->a:Lzld;

    invoke-virtual {p0}, Lzld;->H()V

    return-void
.end method

.method public final P(Z)V
    .registers 2

    invoke-virtual {p0}, Lxld;->d()V

    return-void
.end method

.method public final d()V
    .registers 3

    iget-object p0, p0, Lxld;->a:Lzld;

    iget-object p0, p0, Lzld;->a:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1d

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v1

    check-cast v1, Lcmd;

    if-eqz v1, :cond_1a

    invoke-virtual {v1}, Lcmd;->V()V

    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_1d
    return-void
.end method

.method public final onPositionDiscontinuity(I)V
    .registers 2

    invoke-virtual {p0}, Lxld;->d()V

    iget-object p0, p0, Lxld;->a:Lzld;

    invoke-virtual {p0}, Lzld;->G()V

    return-void
.end method

.method public final onShuffleModeEnabledChanged(Z)V
    .registers 2

    iget-object p0, p0, Lxld;->a:Lzld;

    invoke-virtual {p0}, Lzld;->H()V

    return-void
.end method
