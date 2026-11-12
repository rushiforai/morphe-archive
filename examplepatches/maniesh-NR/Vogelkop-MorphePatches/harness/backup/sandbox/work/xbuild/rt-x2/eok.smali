.class public final Leok;
.super Lh6e;
.source "SourceFile"


# instance fields
.field public final synthetic d:Lkok;


# direct methods
.method public constructor <init>(Lkok;)V
    .registers 2

    iput-object p1, p0, Leok;->d:Lkok;

    const/16 p1, 0x1e

    invoke-direct {p0, p1}, Lh6e;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final e(Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 7

    iget-object p0, p0, Leok;->d:Lkok;

    iget-object p1, p0, Lkok;->i:Lw6j;

    iget-object p0, p0, Lkok;->h:Lxok;

    iget-object p0, p0, Lxok;->h:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    :goto_d
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_35

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Look;

    if-lt v0, p2, :cond_21

    if-gt v0, p3, :cond_21

    invoke-virtual {p1, v0, v1}, Lw6j;->f(ILook;)V

    goto :goto_32

    :cond_21
    iget-object v2, p1, Lw6j;->a:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_32

    iget-object v2, p1, Lw6j;->b:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseArray;

    invoke-virtual {v2, v0, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_32
    :goto_32
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_35
    return-void
.end method
