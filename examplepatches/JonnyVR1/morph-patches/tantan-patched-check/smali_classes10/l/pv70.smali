.class public Ll/pv70;
.super Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
.source "SourceFile"


# static fields
.field public static p:I = 0x1

.field public static q:I = 0x2

.field public static r:I = 0x3

.field public static s:I = 0x4

.field public static t:I = 0x5


# instance fields
.field public j:Ll/jw70;

.field public k:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ">;"
        }
    .end annotation
.end field

.field public l:I

.field public m:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/x20;

.field public o:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/jw70;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Ll/pv70;->l:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/pv70;->j:Ll/jw70;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e0(Ll/pv70;ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pv70;->m0(ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method

.method public static synthetic f0(Ll/pv70;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pv70;->n0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    return-void
.end method

.method private o0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pv70;->j:Ll/jw70;

    .line 2
    .line 3
    new-instance v1, Ll/nv70;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/nv70;-><init>(Ll/pv70;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/jw70;->x4(Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public e(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->e(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pv70;->m:Ll/pf60;

    .line 5
    .line 6
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->isHasNextPage()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/pv70;->m:Ll/pf60;

    .line 17
    .line 18
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->anchors:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget v1, p0, Ll/pv70;->l:I

    .line 29
    .line 30
    sub-int/2addr v0, v1

    .line 31
    if-ne p1, v0, :cond_0

    .line 32
    .line 33
    invoke-direct {p0}, Ll/pv70;->o0()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public g0()Ll/d3q;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/d3q<",
            "*>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/h0q;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/pv70;->o:Z

    .line 4
    .line 5
    iget-object p0, p0, Ll/pv70;->n:Ll/x20;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Ll/h0q;-><init>(ZLl/x20;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public final h0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ljava/util/List;ZZ)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            ">;ZZ)",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance p4, Ll/ov70;

    .line 13
    .line 14
    invoke-direct {p4, p0, p3, p1, v0}, Ll/ov70;-><init>(Ll/pv70;ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p2, p4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    if-eqz p4, :cond_2

    .line 22
    .line 23
    new-instance p0, Ll/a0f;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/a0f;-><init>()V

    .line 26
    .line 27
    .line 28
    if-eqz p3, :cond_1

    .line 29
    .line 30
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 31
    .line 32
    sget p2, Ll/fct;->j:I

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 40
    .line 41
    sget p2, Ll/fct;->k:I

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    :goto_0
    invoke-virtual {p0, p1}, Ll/a0f;->I(Ljava/lang/String;)Ll/a0f;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    :cond_2
    return-object v0
.end method

.method public final i0(Z)Ll/d3q;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ll/d3q<",
            "*>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/w0j0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/w0j0;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 9
    .line 10
    sget v0, Ll/fct;->i:I

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 18
    .line 19
    sget v0, Ll/fct;->l:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    invoke-virtual {p0, p1}, Ll/w0j0;->I(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method public j0(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Ll/pv70;->o:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/d3q;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    instance-of v1, v0, Ll/h0q;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    check-cast v0, Ll/h0q;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {v0, p1}, Ll/h0q;->I(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v1}, Ll/pv70;->i0(Z)Ll/d3q;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->anchors:Ljava/util/List;

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    invoke-virtual {p0, p1, v2, v1, v3}, Ll/pv70;->h0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ljava/util/List;ZZ)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public l0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pv70;->m:Ll/pf60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->contact(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->anchors:Ljava/util/List;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {p0, p1, v1, v2, v3}, Ll/pv70;->h0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ljava/util/List;ZZ)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->isHasNextPage()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Ll/pv70;->m:Ll/pf60;

    .line 30
    .line 31
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/pv70;->k0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic m0(ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/n9j;

    .line 4
    .line 5
    invoke-direct {p1, p4, p2}, Ll/n9j;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/pv70;->k:Ll/z20;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ll/n9j;->I(Ll/z20;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance p1, Ll/y1h0;

    .line 18
    .line 19
    invoke-direct {p1, p4, p2}, Ll/y1h0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/pv70;->k:Ll/z20;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Ll/y1h0;->I(Ll/z20;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pv70;->l0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p0(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/pv70;->k:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public q0(Ll/pf60;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/pv70;->m:Ll/pf60;

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pv70;->g0()Ll/d3q;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p0, v1}, Ll/pv70;->i0(Z)Ll/d3q;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 24
    .line 25
    move-object v3, v2

    .line 26
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 27
    .line 28
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->anchors:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {p0, v3, v2, v1, v1}, Ll/pv70;->h0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ljava/util/List;ZZ)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->isHasNextPage()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_0

    .line 48
    .line 49
    iget-object p1, p0, Ll/pv70;->m:Ll/pf60;

    .line 50
    .line 51
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/pv70;->k0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public r0(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pv70;->n:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
