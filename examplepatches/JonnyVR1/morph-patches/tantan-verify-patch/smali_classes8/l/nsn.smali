.class public Ll/nsn;
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
.method public constructor <init>(Ll/zsn;)V
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
    iput-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/nsn;->d:Ll/bwl;

    .line 12
    .line 13
    iget-object p1, p1, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 14
    .line 15
    iput-object p1, p0, Ll/nsn;->e:Landroid/content/Context;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic E(Ll/nsn;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nsn;->P(Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic F(Ll/nsn;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/nsn;->N(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/core/data/LikeUser;)V

    return-void
.end method

.method public static synthetic G(Ll/nsn;Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/nsn;->Q(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic H(Ll/nsn;Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nsn;->M(Lcom/p1/mobile/putong/core/data/LikeUser;)V

    return-void
.end method

.method public static synthetic I(Ll/nsn;Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/nsn;->O(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/nsn;->J(Landroid/view/View;Lcom/p1/mobile/putong/core/data/LikeUser;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

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
    const/16 p0, 0x33

    .line 28
    .line 29
    return p0

    .line 30
    :cond_1
    iget-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/16 v1, 0x1f4

    .line 37
    .line 38
    if-le v0, v1, :cond_2

    .line 39
    .line 40
    const/16 p0, 0x1f5

    .line 41
    .line 42
    return p0

    .line 43
    :cond_2
    iget-object p0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    add-int/lit8 p0, p0, 0x1

    .line 50
    .line 51
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nsn;->e:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget p2, Ll/pec0;->q:I

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget p2, Ll/pec0;->o:I

    .line 22
    .line 23
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public J(Landroid/view/View;Lcom/p1/mobile/putong/core/data/LikeUser;II)V
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    if-ne p3, p4, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/nsn;->K(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/core/data/LikeUser;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    if-nez p3, :cond_1

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUserHeaderView;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUserHeaderView;->b()V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public final K(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nsn;->e:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Ll/ner;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/LikeUser;->userId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/isn;

    .line 20
    .line 21
    invoke-direct {v1, p0, p2, p1}, Ll/isn;-><init>(Ll/nsn;Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public L(I)Lcom/p1/mobile/putong/core/data/LikeUser;
    .locals 1

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-gt p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    add-int/lit8 p1, p1, -0x1

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsn;->d:Ll/bwl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bwl;->K(Lcom/p1/mobile/putong/core/data/LikeUser;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nsn;->d:Ll/bwl;

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
    iget-object p0, p0, Ll/nsn;->d:Ll/bwl;

    .line 11
    .line 12
    invoke-interface {p0, p3, p2}, Ll/bwl;->G(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsn;->d:Ll/bwl;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/bwl;->N(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsn;->d:Ll/bwl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bwl;->t(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/data/User;)V
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
    new-instance p2, Ll/jsn;

    .line 22
    .line 23
    invoke-direct {p2, p0, p1}, Ll/jsn;-><init>(Ll/nsn;Lcom/p1/mobile/putong/core/data/LikeUser;)V

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
    new-instance v3, Ll/ksn;

    .line 31
    .line 32
    invoke-direct {v3, p0, p3, p2}, Ll/ksn;-><init>(Ll/nsn;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V

    .line 33
    .line 34
    .line 35
    new-instance v4, Ll/lsn;

    .line 36
    .line 37
    invoke-direct {v4, p0, p1, p3}, Ll/lsn;-><init>(Ll/nsn;Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;)V

    .line 38
    .line 39
    .line 40
    new-instance v5, Ll/msn;

    .line 41
    .line 42
    invoke-direct {v5, p0, p3}, Ll/msn;-><init>(Ll/nsn;Lcom/p1/mobile/putong/data/User;)V

    .line 43
    .line 44
    .line 45
    const/4 v6, 0x1

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

.method public R(Lcom/p1/mobile/putong/core/data/LikeUser;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    add-int/2addr p1, v1

    .line 31
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 32
    .line 33
    .line 34
    :goto_0
    return v1
.end method

.method public S(Ljava/util/List;)V
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
    iget-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

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

.method public T()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/nsn;->c:Ljava/util/ArrayList;

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
    iget-object p1, p0, Ll/nsn;->d:Ll/bwl;

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
    iget-object p1, p0, Ll/nsn;->e:Landroid/content/Context;

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
    iget-object p0, p0, Ll/nsn;->d:Ll/bwl;

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
    invoke-virtual {p0, p1}, Ll/nsn;->L(I)Lcom/p1/mobile/putong/core/data/LikeUser;

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
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
.end method
