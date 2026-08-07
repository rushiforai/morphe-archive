.class public Ll/fjr;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Ll/ihr$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ijr;",
        ">;",
        "Ll/ihr$b;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

.field public c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

.field public d:Lcom/p1/mobile/putong/core/data/LikedUser;

.field public e:J

.field public f:Lcom/p1/mobile/putong/data/Links;

.field public g:Z

.field public h:Z

.field public i:I

.field public j:I

.field public k:Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

.field public l:Z

.field public m:Ll/nm0;

.field public n:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/fjr;->c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 6
    .line 7
    iput-object v0, p0, Ll/fjr;->d:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 8
    .line 9
    iput-object v0, p0, Ll/fjr;->f:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/fjr;->g:Z

    .line 13
    .line 14
    iput v0, p0, Ll/fjr;->j:I

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 19
    .line 20
    iget-object v1, v1, Ll/xf9;->V:Ll/exd0;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->clone()Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, p0, Ll/fjr;->k:Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 33
    .line 34
    iput-boolean v0, p0, Ll/fjr;->l:Z

    .line 35
    .line 36
    new-instance v0, Ll/lir;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/lir;-><init>(Ll/fjr;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/fjr;->n:Ljava/lang/Runnable;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    iput-object p1, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 50
    .line 51
    return-void
.end method

.method public static synthetic A0(Ll/fjr;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fjr;->P0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic C0(Ll/fjr;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fjr;->S0(ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private G0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xf9;->y3()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Ll/fjr;->Y0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic J0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/fjr;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/rs9;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean v0, p0, Ll/fjr;->g:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v0, "p_navigation_ilike,card_button_pull"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/fjr;->f1(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic L0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/ijr;

    .line 4
    .line 5
    new-instance v0, Ll/oir;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/oir;-><init>(Ll/fjr;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/ijr;->k(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p1, Ll/ijr;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/ijr;->q()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p1, Ll/ijr;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p1, v0, v1}, Ll/ijr;->j(ZZ)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p1, Ll/ijr;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/ijr;->i()V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/rs9;->d()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast p1, Ll/ijr;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/ijr;->f()V

    .line 47
    .line 48
    .line 49
    new-instance p1, Ll/nm0;

    .line 50
    .line 51
    invoke-direct {p1}, Ll/nm0;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Ll/fjr;->m:Ll/nm0;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/fjr;->b1()V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method private synthetic R0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fjr;->k:Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, v0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->minAge:I

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "iliked_filter_min_age"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Ll/fjr;->k:Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 19
    .line 20
    iget p0, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->maxAge:I

    .line 21
    .line 22
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v1, "iliked_filter_max_age"

    .line 27
    .line 28
    invoke-static {v1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    filled-new-array {v0, p0}, [Ll/sfj0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string v0, "e_iliked_age"

    .line 37
    .line 38
    const-string v1, "p_who_i_liked"

    .line 39
    .line 40
    invoke-static {v0, v1, p0}, Ll/sfj0;->g(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic e0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/e7d0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/e7d0;->c()Ll/e7d0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "my_like"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/e7d0;->g(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic g0(Ll/fjr;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fjr;->U0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic h0(Ll/fjr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fjr;->R0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic j0(Ll/fjr;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fjr;->L0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;
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
    new-instance v1, Ll/qir;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/qir;-><init>(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

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

.method public static synthetic l0(Ll/fjr;ZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fjr;->V0(ZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic m0(Ll/fjr;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fjr;->O0(Lcom/p1/mobile/putong/data/Settings;)V

    return-void
.end method

.method public static synthetic n0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic o0(Ll/fjr;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fjr;->Q0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->m5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r0(Ll/fjr;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fjr;->I0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Settings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t0(Ll/fjr;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fjr;->N0(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic u0(Ll/fjr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fjr;->J0()V

    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic y0(Ll/fjr;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fjr;->H0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method public static synthetic z0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public D(Lcom/p1/mobile/putong/core/data/LikedUser;Z)V
    .locals 13

    .line 1
    iput-object p1, p0, Ll/fjr;->d:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v11

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 17
    .line 18
    const-string v1, "superliked"

    .line 19
    .line 20
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-virtual {p0, p2, p1, v11, v0}, Ll/fjr;->d1(ZLcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/data/User;Z)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;->Q4()Ll/ahr;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-static {}, Ll/joa;->f4()Z

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p2, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    const-string v2, "p_navigation_ilike,card_button_pull"

    .line 60
    .line 61
    invoke-interface {p1, p2, v2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;->Q4()Ll/ahr;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p2}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iget-object v3, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    iget-object v4, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 85
    .line 86
    invoke-virtual {v11, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v9

    .line 102
    const-string v10, ""

    .line 103
    .line 104
    const/4 v5, 0x0

    .line 105
    const/4 v6, 0x0

    .line 106
    const/4 v7, 0x0

    .line 107
    const/4 v8, 0x0

    .line 108
    move-object v12, p1

    .line 109
    invoke-interface/range {v2 .. v12}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->be(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-nez p1, :cond_2

    .line 114
    .line 115
    iget-object p0, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;->Q4()Ll/ahr;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 122
    .line 123
    .line 124
    :cond_2
    return-void
.end method

.method public D0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ijr;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ijr;->s:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final E0(Landroid/content/Intent;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->gl()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->L8()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p0, p0, Ll/fjr;->d:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_0

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    return-object p1

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    return-object p0
.end method

.method public F0(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/xf9;->F3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final synthetic H0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/fjr;->h:Z

    .line 8
    .line 9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/ijr;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/ijr;->n(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic I0(Ll/vg60;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    iget-object v2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/vg60;->d()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-gtz v2, :cond_1

    .line 18
    .line 19
    :cond_0
    iget v2, p0, Ll/fjr;->i:I

    .line 20
    .line 21
    if-le v2, v0, :cond_2

    .line 22
    .line 23
    iget-object v3, p1, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-lt v2, v3, :cond_2

    .line 30
    .line 31
    :cond_1
    iput-boolean v1, p0, Ll/fjr;->g:Z

    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    if-nez p1, :cond_3

    .line 35
    .line 36
    move v2, v1

    .line 37
    goto :goto_0

    .line 38
    :cond_3
    invoke-virtual {p1}, Ll/vg60;->d()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    :goto_0
    iput v2, p0, Ll/fjr;->j:I

    .line 43
    .line 44
    if-lez v2, :cond_4

    .line 45
    .line 46
    iput-boolean v0, p0, Ll/fjr;->g:Z

    .line 47
    .line 48
    :cond_4
    if-eqz p1, :cond_6

    .line 49
    .line 50
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 51
    .line 52
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_5
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    goto :goto_2

    .line 66
    :cond_6
    :goto_1
    move v0, v1

    .line 67
    :goto_2
    iget v2, p0, Ll/fjr;->j:I

    .line 68
    .line 69
    if-lt v0, v2, :cond_7

    .line 70
    .line 71
    iput-boolean v1, p0, Ll/fjr;->g:Z

    .line 72
    .line 73
    :cond_7
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 74
    .line 75
    check-cast v0, Ll/ijr;

    .line 76
    .line 77
    iget-boolean p0, p0, Ll/fjr;->h:Z

    .line 78
    .line 79
    invoke-virtual {v0, p1, p0}, Ll/ijr;->s(Ll/vg60;Z)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic N0(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/xf9;->H3()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/xf9;->W3()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xf9;->a4()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-direct {p0}, Ll/fjr;->G0()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public final synthetic O0(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/fjr;->f:Lcom/p1/mobile/putong/data/Links;

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/fjr;->g:Z

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->l5()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/fjr;->X0()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic P0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fjr;->m:Ll/nm0;

    .line 2
    .line 3
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/nm0;->i(Lcom/p1/mobile/putong/data/Links;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/fjr;->m:Ll/nm0;

    .line 11
    .line 12
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p1, Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/nm0;->j(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p1, Ll/ijr;

    .line 22
    .line 23
    iget-object p0, p0, Ll/fjr;->m:Ll/nm0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/nm0;->b()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Ll/ijr;->p(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic Q0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fjr;->m:Ll/nm0;

    .line 2
    .line 3
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/nm0;->i(Lcom/p1/mobile/putong/data/Links;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/fjr;->m:Ll/nm0;

    .line 11
    .line 12
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p1, Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/nm0;->k(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/fjr;->m:Ll/nm0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/nm0;->d()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p1, Ll/ijr;

    .line 30
    .line 31
    iget-object p0, p0, Ll/fjr;->m:Ll/nm0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/nm0;->b()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Ll/ijr;->p(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final synthetic S0(ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 12

    .line 1
    iget-object p3, p0, Ll/fjr;->c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_6

    .line 8
    .line 9
    iget-object p3, p0, Ll/fjr;->d:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 10
    .line 11
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_6

    .line 16
    .line 17
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    iget-object v0, p0, Ll/fjr;->d:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p3, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v10

    .line 29
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 30
    .line 31
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    const/4 v0, 0x1

    .line 36
    const/4 v1, 0x0

    .line 37
    if-eq p1, p3, :cond_1

    .line 38
    .line 39
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 40
    .line 41
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    if-ne p1, p3, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move v4, v1

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    move v4, v0

    .line 51
    :goto_1
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 52
    .line 53
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-ne p1, v2, :cond_2

    .line 58
    .line 59
    move v5, v0

    .line 60
    goto :goto_2

    .line 61
    :cond_2
    move v5, v1

    .line 62
    :goto_2
    iget-object v0, v10, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_3

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->bo()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->ch()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    :cond_3
    move-object v8, v0

    .line 111
    move v7, v1

    .line 112
    if-eqz v5, :cond_4

    .line 113
    .line 114
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 115
    .line 116
    .line 117
    move-result p3

    .line 118
    if-ne p1, p3, :cond_4

    .line 119
    .line 120
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_4

    .line 125
    .line 126
    invoke-virtual {p0, p2}, Ll/fjr;->E0(Landroid/content/Intent;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    :goto_3
    move-object v9, p1

    .line 131
    goto :goto_4

    .line 132
    :cond_4
    const/4 p1, 0x0

    .line 133
    goto :goto_3

    .line 134
    :goto_4
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-nez p1, :cond_5

    .line 139
    .line 140
    iget-object p1, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    const-string p2, "e_iliked_letter"

    .line 147
    .line 148
    invoke-static {p2, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-virtual {p1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iget-object v2, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 160
    .line 161
    iget-object v3, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 162
    .line 163
    const/4 v6, 0x1

    .line 164
    iget-object v11, p0, Ll/fjr;->d:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 165
    .line 166
    invoke-interface/range {v1 .. v11}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->be(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)Z

    .line 167
    .line 168
    .line 169
    :cond_6
    return-void
.end method

.method public final synthetic U0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/fjr;->l:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V0(ZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 12

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
    iget-object v2, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object v3, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v8, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v11, p0, Ll/fjr;->d:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    const/4 v5, 0x1

    .line 28
    const/4 v7, 0x0

    .line 29
    move v6, p1

    .line 30
    move-object v10, p2

    .line 31
    move-object v9, p3

    .line 32
    invoke-interface/range {v1 .. v11}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->be(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final W0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public X0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/fjr;->Y0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public Y0(Z)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    goto :goto_0

    .line 5
    :cond_0
    iget-object p1, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;->Q4()Ll/ahr;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/ahr;->U()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    add-int/2addr v0, p1

    .line 16
    :goto_0
    iput v0, p0, Ll/fjr;->i:I

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/xf9;->z3()V

    .line 23
    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 28
    .line 29
    iget v0, p0, Ll/fjr;->i:I

    .line 30
    .line 31
    const/16 v1, 0x14

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {p1, v0, v1, v2}, Ll/xf9;->Y3(IIZ)Lrx/c;

    .line 35
    .line 36
    .line 37
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    iput-wide v0, p0, Ll/fjr;->e:J

    .line 42
    .line 43
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/joa;->f4()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    xor-int/lit8 v0, v0, 0x1

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/fjr;->h:Z

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vf()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    invoke-direct {p0}, Ll/fjr;->G0()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/iir;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/iir;-><init>(Ll/fjr;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/yir;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/yir;-><init>()V

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
    new-instance v2, Ll/zir;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/zir;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v2, Ll/ajr;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/ajr;-><init>(Ll/fjr;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v2, Ll/bjr;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/bjr;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v2, Ll/cjr;

    .line 73
    .line 74
    invoke-direct {v2}, Ll/cjr;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/djr;

    .line 86
    .line 87
    invoke-direct {v1}, Ll/djr;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-wide/16 v1, 0x1

    .line 95
    .line 96
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 97
    .line 98
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    new-instance v1, Ll/ejr;

    .line 111
    .line 112
    invoke-direct {v1, p0}, Ll/ejr;-><init>(Ll/fjr;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 120
    .line 121
    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->On()Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Ll/jir;

    .line 139
    .line 140
    invoke-direct {v1}, Ll/jir;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    new-instance v1, Ll/kir;

    .line 148
    .line 149
    invoke-direct {v1}, Ll/kir;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    new-instance v1, Ll/tir;

    .line 157
    .line 158
    invoke-direct {v1, p0}, Ll/tir;-><init>(Ll/fjr;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 166
    .line 167
    .line 168
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 169
    .line 170
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 171
    .line 172
    invoke-virtual {v0}, Ll/xf9;->X3()Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    new-instance v1, Ll/xir;

    .line 181
    .line 182
    invoke-direct {v1, p0}, Ll/xir;-><init>(Ll/fjr;)V

    .line 183
    .line 184
    .line 185
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public a1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fjr;->m:Ll/nm0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/nm0;->e()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/fjr;->m:Ll/nm0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/nm0;->c()Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/nm0;->g(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/vir;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/vir;-><init>(Ll/fjr;)V

    .line 31
    .line 32
    .line 33
    new-instance p0, Ll/wir;

    .line 34
    .line 35
    invoke-direct {p0}, Ll/wir;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    return-void
.end method

.method public b1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fjr;->m:Ll/nm0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/nm0;->h()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/rir;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/rir;-><init>(Ll/fjr;)V

    .line 17
    .line 18
    .line 19
    new-instance p0, Ll/sir;

    .line 20
    .line 21
    invoke-direct {p0}, Ll/sir;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public c1(IILandroid/content/Intent;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ck()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eq p2, p1, :cond_0

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eq p2, p1, :cond_0

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-ne p2, p1, :cond_2

    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v0, Ll/mir;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/mir;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance v0, Ll/nir;

    .line 52
    .line 53
    invoke-direct {v0, p0, p2, p3}, Ll/nir;-><init>(Ll/fjr;ILandroid/content/Intent;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    return v1

    .line 64
    :cond_1
    const/16 v0, 0x312

    .line 65
    .line 66
    if-ne p1, v0, :cond_2

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-interface {p1, p0, p2, p3}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Jb(Lcom/p1/mobile/android/app/Act;ILandroid/content/Intent;)V

    .line 81
    .line 82
    .line 83
    return v1

    .line 84
    :cond_2
    const/4 p0, 0x0

    .line 85
    return p0
.end method

.method public d1(ZLcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/data/User;Z)Z
    .locals 11

    .line 1
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v2, Ll/ijr;

    .line 4
    .line 5
    iget-object v2, v2, Ll/ijr;->s:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    if-lez v2, :cond_0

    .line 13
    .line 14
    return v3

    .line 15
    :cond_0
    iput-object p2, p0, Ll/fjr;->d:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/fjr;->W0()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    return v3

    .line 26
    :cond_1
    if-eqz p1, :cond_3

    .line 27
    .line 28
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 29
    .line 30
    const-string v2, "lettered"

    .line 31
    .line 32
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_3

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-interface {v1, p3}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Bi(Lcom/p1/mobile/putong/data/User;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, "e_iliked_letter"

    .line 56
    .line 57
    invoke-static {v2, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/joa;->f4()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget-object v0, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 77
    .line 78
    const/4 v4, 0x0

    .line 79
    const-string v5, "p_navigation_ilike,card_button_pull"

    .line 80
    .line 81
    invoke-interface {v1, v0, v5, v2, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 82
    .line 83
    .line 84
    return v3

    .line 85
    :cond_2
    invoke-virtual {p0, p3, p4}, Ll/fjr;->g1(Lcom/p1/mobile/putong/data/User;Z)V

    .line 86
    .line 87
    .line 88
    return v3

    .line 89
    :cond_3
    iget-object v1, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const-string v2, "e_iliked_superlike"

    .line 96
    .line 97
    invoke-static {v2, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    const-string v2, "moments_user_id"

    .line 107
    .line 108
    iget-object v4, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v2, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-static {}, Ll/joa;->f4()Z

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    xor-int/lit8 v4, v4, 0x1

    .line 119
    .line 120
    const-string v6, "is_privileged"

    .line 121
    .line 122
    invoke-static {v6, v4}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    const-string v6, "showfrom_superlike"

    .line 127
    .line 128
    const-string v7, "ilike"

    .line 129
    .line 130
    invoke-static {v6, v7}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 131
    .line 132
    .line 133
    move-result-object v6

    .line 134
    filled-new-array {v2, v4, v6}, [Ll/sfj0$a;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    const-string v4, "e_superlikeButton"

    .line 139
    .line 140
    invoke-static {v4, v1, v2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 141
    .line 142
    .line 143
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {v1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    move-object v2, v1

    .line 152
    iget-object v1, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 153
    .line 154
    move-object v4, v2

    .line 155
    iget-object v2, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 156
    .line 157
    invoke-virtual {p3, v3}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    iget-object v7, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 166
    .line 167
    const/4 v8, 0x0

    .line 168
    iget-object v10, p0, Ll/fjr;->d:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 169
    .line 170
    const/4 v3, 0x1

    .line 171
    move-object v0, v4

    .line 172
    const/4 v4, 0x1

    .line 173
    const/4 v6, 0x0

    .line 174
    move-object v9, p3

    .line 175
    move v5, p4

    .line 176
    invoke-interface/range {v0 .. v10}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->be(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    return v0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e1(Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;->Q4()Ll/ahr;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/ahr;->S(Lcom/p1/mobile/putong/core/data/LikedUser;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/xf9;->d4(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget p1, p0, Ll/fjr;->j:I

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    sub-int/2addr p1, v0

    .line 26
    iput p1, p0, Ll/fjr;->j:I

    .line 27
    .line 28
    iget-object p1, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;->Q4()Ll/ahr;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ll/ahr;->U()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-gtz p1, :cond_2

    .line 39
    .line 40
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p1, Ll/ijr;

    .line 43
    .line 44
    iget-object v1, p0, Ll/fjr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;->Q4()Ll/ahr;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ll/ahr;->U()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    const/4 v2, 0x0

    .line 55
    if-gtz v1, :cond_0

    .line 56
    .line 57
    move v1, v0

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    move v1, v2

    .line 60
    :goto_0
    invoke-virtual {p1, v2, v1}, Ll/ijr;->j(ZZ)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vf()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 76
    .line 77
    if-eqz p1, :cond_1

    .line 78
    .line 79
    check-cast v1, Ll/ijr;

    .line 80
    .line 81
    iget-boolean p1, p0, Ll/fjr;->h:Z

    .line 82
    .line 83
    xor-int/2addr p1, v0

    .line 84
    invoke-virtual {v1, p1}, Ll/ijr;->w(Z)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_1
    check-cast v1, Ll/ijr;

    .line 89
    .line 90
    invoke-virtual {v1, v2}, Ll/ijr;->w(Z)V

    .line 91
    .line 92
    .line 93
    :cond_2
    :goto_1
    iget-object p1, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->w:I

    .line 96
    .line 97
    iget v1, p0, Ll/fjr;->j:I

    .line 98
    .line 99
    const/16 v2, 0x63

    .line 100
    .line 101
    if-le v1, v2, :cond_3

    .line 102
    .line 103
    const-string v1, "99+"

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_3
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    :goto_2
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 119
    .line 120
    check-cast p0, Ll/ijr;

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Ll/ijr;->u(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public f1(Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/fjr;->l:Z

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
    iput-boolean v0, p0, Ll/fjr;->l:Z

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
    iget-object v2, p0, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 20
    .line 21
    new-instance v6, Ll/uir;

    .line 22
    .line 23
    invoke-direct {v6, p0}, Ll/uir;-><init>(Ll/fjr;)V

    .line 24
    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    move-object v3, p1

    .line 28
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final g1(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 2

    .line 1
    new-instance v0, Ll/pir;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/pir;-><init>(Ll/fjr;ZLcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/joa;->E3()Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p2, p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->S9()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-nez p2, :cond_1

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p2, "p_navigation_ilike,card_button_pull"

    .line 56
    .line 57
    invoke-interface {p1, p0, p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->ot(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-interface {p2, p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Z)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vf()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, Ll/fjr;->G0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
