.class public final Lmte;
.super Lclb;
.source "SourceFile"


# instance fields
.field public final synthetic d:Lpte;


# direct methods
.method public constructor <init>(Lpte;)V
    .registers 2

    iput-object p1, p0, Lmte;->d:Lpte;

    invoke-direct {p0}, Lclb;-><init>()V

    return-void
.end method


# virtual methods
.method public final f(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I
    .registers 3

    iget-object p0, p0, Lmte;->d:Lpte;

    iget-object p0, p0, Lpte;->w:Ljava/util/List;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result p1

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcwf;

    iget-boolean p0, p0, Lcwf;->c:Z

    const/4 p1, 0x0

    if-eqz p0, :cond_15

    move p0, p1

    goto :goto_17

    :cond_15
    const/16 p0, 0xf

    :goto_17
    invoke-static {p0, p1}, Lclb;->j(II)I

    move-result p0

    return p0
.end method

.method public final l(Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;)Z
    .registers 5

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result p1

    invoke-virtual {p2}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result p2

    iget-object p0, p0, Lmte;->d:Lpte;

    iget-object v0, p0, Lpte;->w:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcwf;

    iget-boolean v0, v0, Lcwf;->c:Z

    if-eqz v0, :cond_18

    const/4 p0, 0x0

    return p0

    :cond_18
    iget-object v0, p0, Lpte;->w:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcwf;

    iget-object v1, p0, Lpte;->w:Ljava/util/List;

    invoke-interface {v1, p2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    iget-object p0, p0, Lpte;->y:Lx93;

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemMoved(II)V

    const/4 p0, 0x1

    return p0
.end method

.method public final n(Landroidx/recyclerview/widget/i;I)V
    .registers 3

    return-void
.end method
