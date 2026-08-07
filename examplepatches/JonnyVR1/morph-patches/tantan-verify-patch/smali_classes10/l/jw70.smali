.class public Ll/jw70;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Landroid/view/View;

.field public j:Lv/VImage;

.field public k:Landroid/widget/TextView;

.field public l:Landroidx/recyclerview/widget/RecyclerView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public n:Ll/pv70;

.field public o:Z

.field public p:Lcom/p1/mobile/putong/data/Pagination;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public q:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jw70$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/jw70$a;-><init>(Ll/jw70;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/jw70;->q:Ll/y20;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic J3(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->unacceptPk:Z

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic K3(Ll/jw70;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jw70;->k4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic L3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 6
    .line 7
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchors:Ljava/util/List;

    .line 10
    .line 11
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->setHasNextPage(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic M3(Ll/jw70;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jw70;->l4(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V

    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 6
    .line 7
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchors:Ljava/util/List;

    .line 10
    .line 11
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->setHasNextPage(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic O3(Ll/hct;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/hct;->a:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic P3(Ll/jw70;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jw70;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    return-void
.end method

.method public static synthetic R3(Ll/jw70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jw70;->t4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S3(Ll/jw70;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jw70;->r4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic T3(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 4
    .line 5
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->unacceptPk:Z

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic U3(Ll/jw70;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jw70;->p4(Ll/pf60;)V

    return-void
.end method

.method public static synthetic V3(Ll/jw70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jw70;->n4()V

    return-void
.end method

.method public static synthetic W3(Ll/jw70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jw70;->s4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic X3(Ll/jw70;Ll/hct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jw70;->u4(Ll/hct;)V

    return-void
.end method

.method public static synthetic Y3(Ll/jw70;Ll/y20;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jw70;->q4(Ll/y20;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    return-void
.end method

.method public static synthetic Z3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a4(Ll/jw70;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jw70;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static bridge synthetic b4(Ll/jw70;)Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jw70;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    return-object p0
.end method

.method public static bridge synthetic c4(Ll/jw70;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jw70;->o:Z

    return-void
.end method

.method public static bridge synthetic d4(Ll/jw70;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jw70;->f4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private f4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jw70;->n:Ll/pv70;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pv70;->j0(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jw70;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private j4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jw70;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/pv70;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/pv70;-><init>(Ll/jw70;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/jw70;->n:Ll/pv70;

    .line 21
    .line 22
    new-instance v1, Ll/hw70;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/hw70;-><init>(Ll/jw70;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/pv70;->p0(Ll/z20;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/jw70;->n:Ll/pv70;

    .line 31
    .line 32
    new-instance v1, Ll/iw70;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/iw70;-><init>(Ll/jw70;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/pv70;->r0(Ll/x20;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/jw70;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    iget-object p0, p0, Ll/jw70;->n:Ll/pv70;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private synthetic s4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jw70;->h4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic t4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jw70;->h4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic u4(Ll/hct;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Ll/hct;->b:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jw70;->z4()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/jw70;->h4()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public e4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ix70;->b(Ll/jw70;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g4(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;Z)V
    .locals 7

    .line 1
    new-instance v6, Ll/uv70;

    .line 2
    .line 3
    invoke-direct {v6, p0}, Ll/uv70;-><init>(Ll/jw70;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->createInvite()Ll/v3f$d;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Ll/ict;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    move-object v4, p2

    .line 29
    move v5, p3

    .line 30
    invoke-direct/range {v0 .. v6}, Ll/ict;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;ZLl/y20;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public h4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jw70;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/jw70;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public i4(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->u4(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/dw70;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/dw70;-><init>(Ll/y20;)V

    .line 18
    .line 19
    .line 20
    new-instance p1, Ll/ew70;

    .line 21
    .line 22
    invoke-direct {p1}, Ll/ew70;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic k4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jw70;->q:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    sget p0, Ll/fct;->h:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jw70;->h4()V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Ll/jw70;->o:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Ll/wv70;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/wv70;-><init>(Ll/jw70;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0, p1}, Ll/jw70;->y4(ZLl/y20;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->queryUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->pkRecommendSource:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Ll/jw70;->g4(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic n4()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/jw70;->o:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iget-object v1, p0, Ll/jw70;->q:Ll/y20;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Ll/jw70;->y4(ZLl/y20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic o4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    iput-object p1, p0, Ll/jw70;->p:Lcom/p1/mobile/putong/data/Pagination;

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic p4(Ll/pf60;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jw70;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/jw70;->n:Ll/pv70;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/pv70;->q0(Ll/pf60;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic q4(Ll/y20;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jw70;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic r4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    iput-object p1, p0, Ll/jw70;->p:Lcom/p1/mobile/putong/data/Pagination;

    .line 4
    .line 5
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->showPkDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/rv70;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/rv70;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/aw70;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/aw70;-><init>(Ll/jw70;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final v4(Ljava/lang/String;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->D5(Ljava/lang/String;I)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance p2, Ll/sv70;

    .line 10
    .line 11
    invoke-direct {p2, p0}, Ll/sv70;-><init>(Ll/jw70;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ll/tv70;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/tv70;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final w4()V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const/16 v1, 0x32

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/jw70;->v4(Ljava/lang/String;I)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->Y5()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/fw70;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/fw70;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1, v2}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/gw70;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/gw70;-><init>(Ll/jw70;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Ll/ga80;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/ga80;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public x4(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jw70;->p:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Ll/jw70;->p:Lcom/p1/mobile/putong/data/Pagination;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->z5(Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/xv70;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/xv70;-><init>(Ll/jw70;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/yv70;

    .line 40
    .line 41
    invoke-direct {v1}, Ll/yv70;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/zv70;

    .line 49
    .line 50
    invoke-direct {v1, p0, p1}, Ll/zv70;-><init>(Ll/jw70;Ll/y20;)V

    .line 51
    .line 52
    .line 53
    new-instance p0, Ll/ga80;

    .line 54
    .line 55
    invoke-direct {p0}, Ll/ga80;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method public y4(ZLl/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setPkAcceptSetting unaccept:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->I7(Z)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p1, Ll/vv70;

    .line 27
    .line 28
    invoke-direct {p1, p2}, Ll/vv70;-><init>(Ll/y20;)V

    .line 29
    .line 30
    .line 31
    new-instance p2, Ll/ga80;

    .line 32
    .line 33
    invoke-direct {p2}, Ll/ga80;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public z4()V
    .locals 3

    .line 1
    const-string v0, "e_pk_start_specifiedpk"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/jw70;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ll/c0s;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {p0, v1, v2}, Ll/jw70;->e4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, p0, v1}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/jw70;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 33
    .line 34
    iget-object v0, p0, Ll/jw70;->j:Lv/VImage;

    .line 35
    .line 36
    new-instance v1, Ll/bw70;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/bw70;-><init>(Ll/jw70;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/jw70;->i:Landroid/view/View;

    .line 45
    .line 46
    new-instance v1, Ll/cw70;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/cw70;-><init>(Ll/jw70;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    invoke-direct {p0}, Ll/jw70;->j4()V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Ll/jw70;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/jw70;->q:Ll/y20;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ll/jw70;->i4(Ll/y20;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/jw70;->w4()V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/jw70;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 74
    .line 75
    .line 76
    return-void
.end method
