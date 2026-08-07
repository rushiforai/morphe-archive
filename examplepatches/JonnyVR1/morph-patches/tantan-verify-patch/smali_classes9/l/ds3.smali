.class public Ll/ds3;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ds3$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Ll/ds3$a;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/inj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/inj0<",
            "Ll/e80<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/inj0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/inj0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ds3;->b:Ll/inj0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ds3;->a:Landroid/content/Context;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public A(Landroid/view/ViewGroup;I)Ll/ds3$a;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/ds3$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ds3;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-direct {v0, p0}, Ll/ds3$a;-><init>(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public C(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/e80<",
            "Landroid/view/View;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ds3;->b:Ll/inj0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fok;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ds3;->b:Ll/inj0;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/fok;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ds3;->b:Ll/inj0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fok;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ds3;->b:Ll/inj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fok;->j(I)Ll/mqk;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/e80;

    .line 8
    .line 9
    iget p0, p0, Ll/kf2;->n:I

    .line 10
    .line 11
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/ds3$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ds3;->z(Ll/ds3$a;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ds3;->A(Landroid/view/ViewGroup;I)Ll/ds3$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public y()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/e80<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ds3;->b:Ll/inj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public z(Ll/ds3$a;I)V
    .locals 0
    .param p1    # Ll/ds3$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/ds3;->b:Ll/inj0;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/fok;->j(I)Ll/mqk;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/e80;

    .line 8
    .line 9
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/e80;->d4(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
