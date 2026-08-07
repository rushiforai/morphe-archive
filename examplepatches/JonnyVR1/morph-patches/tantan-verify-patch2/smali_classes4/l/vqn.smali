.class public Ll/vqn;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/LikeUser;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/bwl;

.field public final e:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ll/arn;)V
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
    iput-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/vqn;->d:Ll/bwl;

    .line 12
    .line 13
    iget-object p1, p1, Ll/arn;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/vqn;->e:Landroid/content/Context;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic E(Ll/vqn;Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/vqn;->P(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic F(Ll/vqn;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vqn;->O(Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic G(Ll/vqn;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/vqn;->M(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/core/data/LikeUser;)V

    return-void
.end method

.method public static synthetic H(Ll/vqn;Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/vqn;->N(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic I(Ll/vqn;Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vqn;->L(Lcom/p1/mobile/putong/core/data/LikeUser;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/vqn;->J(Landroid/view/View;Lcom/p1/mobile/putong/core/data/LikeUser;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {}, Ll/joa;->f4()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/16 v1, 0x32

    .line 24
    .line 25
    if-le v0, v1, :cond_1

    .line 26
    .line 27
    return v1

    .line 28
    :cond_1
    iget-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/16 v1, 0x1f4

    .line 35
    .line 36
    if-le v0, v1, :cond_2

    .line 37
    .line 38
    return v1

    .line 39
    :cond_2
    iget-object p0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vqn;->e:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/pec0;->o:I

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

.method public J(Landroid/view/View;Lcom/p1/mobile/putong/core/data/LikeUser;II)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;

    .line 2
    .line 3
    iget-object p3, p0, Ll/vqn;->e:Landroid/content/Context;

    .line 4
    .line 5
    check-cast p3, Ll/ner;

    .line 6
    .line 7
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/LikeUser;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p4, v0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    invoke-virtual {p0, p3, p4}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    new-instance p4, Ll/qqn;

    .line 22
    .line 23
    invoke-direct {p4, p0, p2, p1}, Ll/qqn;-><init>(Ll/vqn;Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public K(I)Lcom/p1/mobile/putong/core/data/LikeUser;
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ge p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vqn;->d:Ll/bwl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bwl;->K(Lcom/p1/mobile/putong/core/data/LikeUser;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vqn;->d:Ll/bwl;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/bwl;->o(Lcom/p1/mobile/putong/data/User;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/vqn;->d:Ll/bwl;

    .line 11
    .line 12
    invoke-interface {p0, p3, p2}, Ll/bwl;->G(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vqn;->d:Ll/bwl;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/bwl;->N(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vqn;->d:Ll/bwl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bwl;->t(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 12
    .line 13
    const-string v1, "matched"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    new-instance p2, Ll/rqn;

    .line 22
    .line 23
    invoke-direct {p2, p0, p1}, Ll/rqn;-><init>(Ll/vqn;Lcom/p1/mobile/putong/core/data/LikeUser;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    new-instance v3, Ll/sqn;

    .line 31
    .line 32
    invoke-direct {v3, p0, p3, p2}, Ll/sqn;-><init>(Ll/vqn;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V

    .line 33
    .line 34
    .line 35
    new-instance v4, Ll/tqn;

    .line 36
    .line 37
    invoke-direct {v4, p0, p1, p3}, Ll/tqn;-><init>(Ll/vqn;Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;)V

    .line 38
    .line 39
    .line 40
    new-instance v5, Ll/uqn;

    .line 41
    .line 42
    invoke-direct {v5, p0, p3}, Ll/uqn;-><init>(Ll/vqn;Lcom/p1/mobile/putong/data/User;)V

    .line 43
    .line 44
    .line 45
    const/4 v6, 0x2

    .line 46
    move-object v1, p1

    .line 47
    move-object v0, p2

    .line 48
    move-object v2, p3

    .line 49
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->k(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;Ll/y20;Ll/y20;Ll/y20;I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/core/data/LikeUser;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, -0x1

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 30
    .line 31
    .line 32
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public R(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public S()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/vqn;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x2

    .line 16
    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/vqn;->d:Ll/bwl;

    .line 20
    .line 21
    invoke-interface {p1}, Ll/bwl;->g()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Ll/vqn;->e:Landroid/content/Context;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Ll/vqn;->d:Ll/bwl;

    .line 36
    .line 37
    invoke-interface {p0}, Ll/bwl;->b()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/member/R$string;->F:I

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vqn;->K(I)Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
