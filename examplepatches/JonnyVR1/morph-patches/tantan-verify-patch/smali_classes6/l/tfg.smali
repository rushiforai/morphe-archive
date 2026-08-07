.class public Ll/tfg;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Ll/ufg;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/ntl;


# direct methods
.method public constructor <init>(ZLl/ntl;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/tfg;->b:Ljava/util/List;

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/tfg;->a:Z

    .line 12
    .line 13
    iput-object p2, p0, Ll/tfg;->c:Ll/ntl;

    .line 14
    .line 15
    return-void
.end method

.method public static bridge synthetic A(Ll/tfg;)Ll/ntl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tfg;->c:Ll/ntl;

    return-object p0
.end method

.method public static bridge synthetic y(Ll/tfg;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tfg;->a:Z

    return p0
.end method

.method public static bridge synthetic z(Ll/tfg;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tfg;->b:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public C(Ll/ufg;I)V
    .locals 2
    .param p1    # Ll/ufg;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "RecyclerView"
            }
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/tfg$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p2}, Ll/tfg$a;-><init>(Ll/tfg;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/tfg;->b:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ll/ufg;->b(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public D(Landroid/view/ViewGroup;I)Ll/ufg;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-boolean v0, p0, Ll/tfg;->a:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Ll/vec0;->A:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v0, Ll/vec0;->z:I

    .line 17
    .line 18
    :goto_0
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance p2, Ll/ufg;

    .line 24
    .line 25
    iget-boolean p0, p0, Ll/tfg;->a:Z

    .line 26
    .line 27
    invoke-direct {p2, p1, p0}, Ll/ufg;-><init>(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    return-object p2
.end method

.method public E(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tfg;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/tfg;->b:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

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
    iget-object p0, p0, Ll/tfg;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "RecyclerView"
            }
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/ufg;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/tfg;->C(Ll/ufg;I)V

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

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tfg;->D(Landroid/view/ViewGroup;I)Ll/ufg;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
