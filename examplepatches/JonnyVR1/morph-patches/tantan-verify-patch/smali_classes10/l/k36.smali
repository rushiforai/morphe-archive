.class public Ll/k36;
.super Ll/mic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mic0<",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/mic0;-><init>(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/k36;->d:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/k36;->G(Landroid/view/View;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k36;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x3

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object p0, p0, Ll/k36;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/yec0;->S4:I

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-static {p0, p1, p2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/mic0;->A(Landroid/view/View;Ljava/lang/Object;II)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;

    .line 5
    .line 6
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->b(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k36;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 8
    .line 9
    return-object p0
.end method

.method public I(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/k36;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ge v0, v1, :cond_1

    .line 22
    .line 23
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setRank(I)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 30
    .line 31
    .line 32
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object v0, p0, Ll/k36;->d:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k36;->H(I)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
