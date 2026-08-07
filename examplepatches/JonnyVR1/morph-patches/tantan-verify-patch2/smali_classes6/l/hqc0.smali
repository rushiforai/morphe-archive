.class public Ll/hqc0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/data/RecommendUsers;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/RecommendUsers;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:I

.field public f:Ljava/lang/String;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/h80;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;Ll/h80;)V
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
    iput-object v0, p0, Ll/hqc0;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/hqc0;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput p2, p0, Ll/hqc0;->e:I

    .line 14
    .line 15
    iput-object p3, p0, Ll/hqc0;->f:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p4, p0, Ll/hqc0;->h:Ll/h80;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic E(Ll/hqc0;Lcom/p1/mobile/putong/feed/data/RecommendUsers;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hqc0;->M(Lcom/p1/mobile/putong/feed/data/RecommendUsers;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private K()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget p0, p0, Ll/hqc0;->e:I

    .line 8
    .line 9
    const/16 v0, 0xe

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const-string p0, "p_discover_dating"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/16 v0, 0xf

    .line 17
    .line 18
    if-ne p0, v0, :cond_1

    .line 19
    .line 20
    const-string p0, "p_discover_discussion"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "p_follow"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    const-string p0, "p_nearby"

    .line 27
    .line 28
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/RecommendUsers;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/hqc0;->G(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/RecommendUsers;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hqc0;->c:Ljava/util/List;

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
    iget-object p0, p0, Ll/hqc0;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/tec0;->F3:I

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

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/RecommendUsers;II)V
    .locals 2

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;

    .line 2
    .line 3
    iget-object p3, p0, Ll/hqc0;->d:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Ll/hqc0;->J(Lcom/p1/mobile/putong/feed/data/RecommendUsers;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0}, Ll/hqc0;->K()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p1, p3, p2, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserItemView;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/RecommendUsers;Ljava/util/List;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Ll/hqc0;->L(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/RecommendUsers;)V

    .line 17
    .line 18
    .line 19
    const/high16 p2, 0x41400000    # 12.0f

    .line 20
    .line 21
    if-nez p4, :cond_0

    .line 22
    .line 23
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-static {p1, p0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Ll/hqc0;->C()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    add-int/lit8 p0, p0, -0x1

    .line 36
    .line 37
    if-ne p4, p0, :cond_1

    .line 38
    .line 39
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-static {p1, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public final H(Lcom/p1/mobile/putong/feed/data/RecommendUsers;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/hqc0;->K()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/pf60;

    .line 6
    .line 7
    const-string v1, "card_user_id"

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->userId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    filled-new-array {v0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "e_user_suggest_card"

    .line 19
    .line 20
    invoke-static {v0, p0, p1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public I(I)Lcom/p1/mobile/putong/feed/data/RecommendUsers;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hqc0;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/RecommendUsers;

    .line 8
    .line 9
    return-object p0
.end method

.method public final J(Lcom/p1/mobile/putong/feed/data/RecommendUsers;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/RecommendUsers;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hqc0;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->momentIds:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->momentIds:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ljava/lang/String;

    .line 40
    .line 41
    iget-object v2, p0, Ll/hqc0;->g:Ljava/util/List;

    .line 42
    .line 43
    new-instance v3, Ll/fqc0;

    .line 44
    .line 45
    invoke-direct {v3, v1}, Ll/fqc0;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v2, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return-object v0

    .line 65
    :cond_3
    :goto_1
    const/4 p0, 0x0

    .line 66
    return-object p0
.end method

.method public final L(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/RecommendUsers;)V
    .locals 1

    .line 1
    new-instance v0, Ll/gqc0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/gqc0;-><init>(Ll/hqc0;Lcom/p1/mobile/putong/feed/data/RecommendUsers;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/feed/data/RecommendUsers;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hqc0;->H(Lcom/p1/mobile/putong/feed/data/RecommendUsers;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/hqc0;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iget-object p0, p0, Ll/hqc0;->f:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p2, p1, p0}, Ll/at0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public N(Ll/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/RecommendUsers;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    iput-object v0, p0, Ll/hqc0;->g:Ljava/util/List;

    .line 6
    .line 7
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/hqc0;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hqc0;->I(I)Lcom/p1/mobile/putong/feed/data/RecommendUsers;

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
    iget-object v0, p0, Ll/hqc0;->c:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/feed/data/RecommendUsers;

    .line 11
    .line 12
    iget-object p0, p0, Ll/hqc0;->h:Ll/h80;

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
    iget-object p0, p0, Ll/hqc0;->h:Ll/h80;

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
    iget-object p0, p0, Ll/hqc0;->h:Ll/h80;

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
