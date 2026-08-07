.class public Ll/jgk;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/data/Group;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Ll/h80;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/h80;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

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
    iput-object v0, p0, Ll/jgk;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/jgk;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Ll/jgk;->e:Ll/h80;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic E(Ll/jgk;Lcom/p1/mobile/putong/feed/data/Group;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jgk;->M(Lcom/p1/mobile/putong/feed/data/Group;Landroid/view/View;)V

    return-void
.end method

.method private K()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "p_discover_dating"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "p_nearby"

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jgk;->F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Group;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jgk;->c:Ljava/util/List;

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

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jgk;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/tec0;->D0:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Group;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;->s(Lcom/p1/mobile/putong/feed/data/Group;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/jgk;->L(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Group;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/jgk;->C()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    add-int/lit8 p3, p3, -0x1

    .line 14
    .line 15
    if-ne p4, p3, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ll/jgk;->J(Lcom/p1/mobile/putong/feed/data/Group;)I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    invoke-static {p1, p3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p3, 0x0

    .line 26
    invoke-static {p1, p3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    :goto_0
    if-nez p4, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ll/jgk;->J(Lcom/p1/mobile/putong/feed/data/Group;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-static {p1, p0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    const/high16 p0, 0x41400000    # 12.0f

    .line 40
    .line 41
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-static {p1, p0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final G(Lcom/p1/mobile/putong/feed/data/Group;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/jgk;->K()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/pf60;

    .line 6
    .line 7
    const-string v2, "circle_id"

    .line 8
    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v1, v2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/pf60;

    .line 15
    .line 16
    const-string v2, "circle_source"

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/jgk;->H()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-direct {p1, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    filled-new-array {v1, p1}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "e_circle"

    .line 30
    .line 31
    invoke-static {p1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final H()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "dating"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const-string p0, "recommend"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    const-string p0, "nearby"

    .line 34
    .line 35
    return-object p0
.end method

.method public I(I)Lcom/p1/mobile/putong/feed/data/Group;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jgk;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Group;

    .line 8
    .line 9
    return-object p0
.end method

.method public final J(Lcom/p1/mobile/putong/feed/data/Group;)I
    .locals 0

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/high16 p0, 0x41880000    # 17.0f

    .line 6
    .line 7
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    div-int/lit8 p0, p0, 0x2

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    const/high16 p0, 0x41400000    # 12.0f

    .line 15
    .line 16
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public final L(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Group;)V
    .locals 1

    .line 1
    new-instance v0, Ll/igk;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/igk;-><init>(Ll/jgk;Lcom/p1/mobile/putong/feed/data/Group;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/feed/data/Group;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jgk;->G(Lcom/p1/mobile/putong/feed/data/Group;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/jgk;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->a()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public N(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jgk;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jgk;->I(I)Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/jic0;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jgk;->c:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Group;

    .line 11
    .line 12
    iget-object p0, p0, Ll/jgk;->e:Ll/h80;

    .line 13
    .line 14
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0, p2}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/jgk;->e:Ll/h80;

    .line 5
    .line 6
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/h80;->g(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/jgk;->e:Ll/h80;

    .line 5
    .line 6
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/h80;->i(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
