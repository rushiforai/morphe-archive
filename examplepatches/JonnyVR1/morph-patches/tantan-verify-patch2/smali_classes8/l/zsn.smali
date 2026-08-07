.class public Ll/zsn;
.super Ll/an2;
.source "SourceFile"

# interfaces
.implements Ll/ihr$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/an2<",
        "Ll/ctn;",
        ">;",
        "Ll/ihr$a;"
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/an2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic X0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic Y0(Ll/zsn;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zsn;->d1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic a1(Ll/zsn;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zsn;->c1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic b1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic c1(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ctn;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ctn;->k()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private f1()V
    .locals 1

    .line 1
    new-instance v0, Ll/xsn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xsn;-><init>(Ll/zsn;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public J0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ctn;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ctn;->v()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public L0(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ctn;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ctn;->m(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public O0(Lcom/p1/mobile/putong/core/data/LikeUser;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->Z1()Ll/nsn;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/nsn;->R(Lcom/p1/mobile/putong/core/data/LikeUser;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public P0(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ctn;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ctn;->m(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Q0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zsn;->v()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/fwl;->f(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public R0(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zsn;->v()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/fwl;->h(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/core/data/LikeUser;Z)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LikeUser;->userId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_3

    .line 23
    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    invoke-virtual {p0, p1, v0}, Ll/zsn;->e1(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->Z1()Ll/nsn;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void

    .line 43
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->Z1()Ll/nsn;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/zsn;->f1()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/an2;->V0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/an2;->U0()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/tsn;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/tsn;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/usn;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/usn;-><init>(Ll/zsn;)V

    .line 33
    .line 34
    .line 35
    new-instance p0, Ll/vsn;

    .line 36
    .line 37
    invoke-direct {p0}, Ll/vsn;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->Z1()Ll/nsn;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic d1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/ctn;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/ctn;->init()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/an2;->N0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e1(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;)Z
    .locals 13

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/zsn;->v()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/fwl;->h(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v3, p0, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 27
    .line 28
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v7, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 37
    .line 38
    new-instance v12, Ll/wsn;

    .line 39
    .line 40
    invoke-direct {v12, p0}, Ll/wsn;-><init>(Ll/zsn;)V

    .line 41
    .line 42
    .line 43
    const/4 v4, 0x1

    .line 44
    const/4 v5, 0x1

    .line 45
    const/4 v6, 0x0

    .line 46
    const/4 v8, 0x0

    .line 47
    const-string v11, "p_intl_like_i_sent,e_intl_i_like_photo,swipe_like"

    .line 48
    .line 49
    move-object v10, p1

    .line 50
    move-object v9, p2

    .line 51
    invoke-interface/range {v2 .. v12}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Qd(Lcom/p1/mobile/android/app/Act;ZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikeUser;Ljava/lang/String;Ll/y20;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0
.end method

.method public g1(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 10
    .line 11
    invoke-interface {v0, p0, p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->zr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public q0()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public r0()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->Z1()Ll/nsn;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/nsn;->T()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public s0()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_like_i_sent,e_intl_i_like_photo,click"

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/zsn;->v()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/fwl;->e(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 17
    .line 18
    new-instance v2, Ll/ysn;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/ysn;-><init>(Ll/zsn;)V

    .line 21
    .line 22
    .line 23
    const-string p0, "p_intl_like_i_sent,e_intl_instantmatch_btn,click"

    .line 24
    .line 25
    invoke-interface {v0, v1, p1, p0, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Me(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public t0()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_like_i_sent,e_intl_i_like_superlike,click"

    .line 2
    .line 3
    return-object p0
.end method

.method public v()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zsn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
