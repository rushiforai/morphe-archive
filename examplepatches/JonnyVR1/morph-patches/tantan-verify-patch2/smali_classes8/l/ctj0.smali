.class public Ll/ctj0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/etj0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

.field public c:Z

.field public d:Lcom/p1/mobile/putong/data/Links;

.field public e:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/ctj0;->e:Z

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/ctj0;->a:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p1, p0, Ll/ctj0;->b:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic e0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->fromSign:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/btj0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/btj0;-><init>(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic h0(Ll/ctj0;Lcom/p1/mobile/putong/core/data/DislikedUsers;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ctj0;->z0(Lcom/p1/mobile/putong/core/data/DislikedUsers;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic i0(Ll/ctj0;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ctj0;->y0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method public static synthetic j0(Ll/ctj0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ctj0;->u0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k0(Ll/ctj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ctj0;->A0()V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic m0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n0(Ll/ctj0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ctj0;->t0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic o0(Ll/ctj0;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ctj0;->x0(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic p0(Ll/ctj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ctj0;->s0()V

    return-void
.end method

.method private synthetic s0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ctj0;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "p_navigation_disliked,card_button_pull"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/ctj0;->F0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private synthetic u0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/etj0;

    .line 4
    .line 5
    new-instance v0, Ll/atj0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/atj0;-><init>(Ll/ctj0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/etj0;->e(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p1, Ll/etj0;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/etj0;->j()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Ll/etj0;

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, p1, v0}, Ll/etj0;->d(ZZ)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private synthetic x0(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/ctj0;->C0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final synthetic A0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ctj0;->e:Z

    .line 3
    .line 4
    return-void
.end method

.method public C0(Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ctj0;->d:Lcom/p1/mobile/putong/data/Links;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->f6(Lcom/p1/mobile/putong/data/Links;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public D0(Lcom/p1/mobile/putong/core/data/DislikedUsers;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ctj0;->b:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->O4()Ll/lsj0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/lsj0;->N(Lcom/p1/mobile/putong/core/data/DislikedUsers;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DislikedUsers;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z8(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/ctj0;->b:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->O4()Ll/lsj0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ll/lsj0;->Q()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-gtz p1, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p1, Ll/etj0;

    .line 37
    .line 38
    iget-object v0, p0, Ll/ctj0;->b:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->O4()Ll/lsj0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/lsj0;->Q()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const/4 v1, 0x1

    .line 49
    const/4 v2, 0x0

    .line 50
    if-gtz v0, :cond_0

    .line 51
    .line 52
    move v0, v1

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    move v0, v2

    .line 55
    :goto_0
    invoke-virtual {p1, v2, v0}, Ll/etj0;->d(ZZ)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 59
    .line 60
    check-cast p1, Ll/etj0;

    .line 61
    .line 62
    iget-boolean p0, p0, Ll/ctj0;->c:Z

    .line 63
    .line 64
    xor-int/2addr p0, v1

    .line 65
    invoke-virtual {p1, p0}, Ll/etj0;->m(Z)V

    .line 66
    .line 67
    .line 68
    :cond_1
    return-void
.end method

.method public E0(Lcom/p1/mobile/putong/core/data/DislikedUsers;)Z
    .locals 14

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/ctj0;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/DislikedUsers;->userInfo:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    new-instance v8, Ll/ssj0;

    .line 14
    .line 15
    invoke-direct {v8, p0, p1}, Ll/ssj0;-><init>(Ll/ctj0;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/ctj0;->b:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->pageId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v10

    .line 24
    const/4 v12, 0x0

    .line 25
    const/4 v13, 0x0

    .line 26
    const/4 v4, 0x1

    .line 27
    const/4 v5, 0x0

    .line 28
    const/4 v6, 0x0

    .line 29
    const-string v7, "p_navigation_disliked,card_button_pull"

    .line 30
    .line 31
    const/4 v9, 0x0

    .line 32
    const/4 v11, 0x0

    .line 33
    invoke-interface/range {v1 .. v13}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->tq(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public F0(Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/ctj0;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/ctj0;->e:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/ctj0;->a:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    new-instance v4, Ll/rsj0;

    .line 20
    .line 21
    invoke-direct {v4, p0}, Ll/rsj0;-><init>(Ll/ctj0;)V

    .line 22
    .line 23
    .line 24
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 25
    .line 26
    const/4 v6, 0x0

    .line 27
    const/4 v7, 0x0

    .line 28
    move-object v3, p1

    .line 29
    invoke-interface/range {v1 .. v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Eq(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;ZLcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ctj0;->r0()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput-boolean v0, p0, Ll/ctj0;->c:Z

    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/joa;->y4()Lrx/c;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qsj0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/qsj0;-><init>(Ll/ctj0;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/tsj0;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/tsj0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/usj0;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/usj0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/vsj0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/vsj0;-><init>(Ll/ctj0;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->On()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/wsj0;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/wsj0;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/xsj0;

    .line 77
    .line 78
    invoke-direct {v1}, Ll/xsj0;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/ysj0;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/ysj0;-><init>(Ll/ctj0;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->g6()Lrx/subjects/a;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/zsj0;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/zsj0;-><init>(Ll/ctj0;)V

    .line 112
    .line 113
    .line 114
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public q0()Lcom/p1/mobile/putong/data/Links;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ctj0;->d:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    return-object p0
.end method

.method public r0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->n4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public final synthetic t0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iput-object v0, p0, Ll/ctj0;->d:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Ll/etj0;

    .line 10
    .line 11
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/util/List;

    .line 14
    .line 15
    iget-boolean p0, p0, Ll/ctj0;->c:Z

    .line 16
    .line 17
    invoke-virtual {v0, p1, p0}, Ll/etj0;->k(Ljava/util/List;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ctj0;->r0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/ctj0;->c:Z

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/etj0;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/etj0;->i(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/core/data/DislikedUsers;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    const-string v0, "matched"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DislikedUsers;->userInfo:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    const-string p2, "\u5979"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p2, "\u4ed6"

    .line 23
    .line 24
    :goto_0
    const-string v0, "\u5df2\u5411%s\u53d1\u9001\u559c\u6b22"

    .line 25
    .line 26
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-static {p2}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-virtual {p0, p1}, Ll/ctj0;->D0(Lcom/p1/mobile/putong/core/data/DislikedUsers;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
