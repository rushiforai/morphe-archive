.class public final Lu3m;
.super Lbqh;
.source "SourceFile"


# instance fields
.field public final s:Ljava/util/Set;

.field public final t:Ls3m;

.field public final u:Lszb;

.field public final v:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(ILjava/util/Set;Ls3m;Lszb;Ljava/util/ArrayList;)V
    .registers 7

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Llj;-><init>(II)V

    iput-object p2, p0, Lu3m;->s:Ljava/util/Set;

    iput-object p3, p0, Lu3m;->t:Ls3m;

    iput-object p4, p0, Lu3m;->u:Lszb;

    if-eqz p5, :cond_1f

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Le6l;

    const/4 p3, 0x1

    invoke-direct {p1, p2, p3}, Le6l;-><init>(Ljava/util/Set;B)V

    new-instance p2, Lzlb;

    invoke-direct {p2, p5, p1, v0}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {p2}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p1

    goto :goto_20

    :cond_1f
    const/4 p1, 0x0

    :goto_20
    iput-object p1, p0, Lu3m;->v:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lbqh;->r:Lkf;

    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance p2, Lev5;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, p0, v0}, Lev5;-><init>(Lu3m;Landroid/content/Context;)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method
