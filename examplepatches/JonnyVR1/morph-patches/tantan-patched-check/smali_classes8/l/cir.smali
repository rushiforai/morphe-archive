.class public Ll/cir;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Ll/ihr$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/fir;",
        ">;",
        "Ll/ihr$b;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

.field public b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

.field public c:Lcom/p1/mobile/putong/core/data/LikedUser;

.field public d:Z

.field public e:Z

.field public f:I

.field public g:I

.field public h:Ll/ihr;

.field public i:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/cir;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 6
    .line 7
    iput-object v0, p0, Ll/cir;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Ll/cir;->d:Z

    .line 11
    .line 12
    iput v0, p0, Ll/cir;->g:I

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/cir;->i:Z

    .line 15
    .line 16
    iput-object p1, p0, Ll/cir;->a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 17
    .line 18
    return-void
.end method

.method private synthetic E0(ZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, p0, Ll/cir;->a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v8, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v11, p0, Ll/cir;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 27
    .line 28
    const/4 v4, 0x1

    .line 29
    const/4 v5, 0x1

    .line 30
    const/4 v7, 0x0

    .line 31
    move v6, p1

    .line 32
    move-object v10, p2

    .line 33
    move-object v9, p3

    .line 34
    invoke-interface/range {v1 .. v11}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->be(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private F0()Z
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

.method private O0(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 2

    .line 1
    new-instance v0, Ll/rhr;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/rhr;-><init>(Ll/cir;ZLcom/p1/mobile/putong/data/User;)V

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

.method public static synthetic e0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic f0(Ll/cir;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cir;->A0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static synthetic g0(Ll/cir;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cir;->x0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/cir;Ll/x20;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cir;->D0(Ll/x20;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic i0(Ll/cir;ZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/cir;->E0(ZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic k0(Ll/cir;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cir;->C0(ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m0(Ll/cir;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cir;->y0(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic n0(Ll/cir;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cir;->z0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic o0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p0(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "all"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "my_like"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic q0(Ll/cir;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cir;->u0(Ll/vg60;)V

    return-void
.end method

.method private s0(Landroid/content/Intent;)Ljava/lang/String;
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
    iget-object p0, p0, Ll/cir;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

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

.method private synthetic x0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/fir;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/fir;->r()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/fir;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/fir;->n()V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final synthetic A0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    xor-int/lit8 v0, p1, 0x1

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/cir;->e:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p1, Ll/fir;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, v0}, Ll/fir;->s(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p1, Ll/fir;

    .line 22
    .line 23
    iget-boolean p0, p0, Ll/cir;->e:Z

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ll/fir;->m(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic C0(ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 12

    .line 1
    iget-object p3, p0, Ll/cir;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

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
    iget-object p3, p0, Ll/cir;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

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
    iget-object v0, p0, Ll/cir;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

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
    invoke-direct {p0, p2}, Ll/cir;->s0(Landroid/content/Intent;)Ljava/lang/String;

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
    const-string p1, "e_iliked_letter"

    .line 141
    .line 142
    const-string p2, "p_navigation_view"

    .line 143
    .line 144
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    iget-object v3, p0, Ll/cir;->a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 160
    .line 161
    const/4 v6, 0x1

    .line 162
    iget-object v11, p0, Ll/cir;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 163
    .line 164
    invoke-interface/range {v1 .. v11}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->be(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)Z

    .line 165
    .line 166
    .line 167
    :cond_6
    return-void
.end method

.method public D(Lcom/p1/mobile/putong/core/data/LikedUser;Z)V
    .locals 13

    .line 1
    iput-object p1, p0, Ll/cir;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

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
    invoke-virtual {p0, p2, p1, v11, v0}, Ll/cir;->I0(ZLcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/data/User;Z)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Ll/cir;->a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->O4()Ll/ohr;

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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    const-string v2, "p_navigation,ilike_module"

    .line 62
    .line 63
    invoke-interface {p1, p2, v2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/cir;->a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->O4()Ll/ohr;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-virtual {p2}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    iget-object v4, p0, Ll/cir;->a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 89
    .line 90
    invoke-virtual {v11, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v9

    .line 106
    const-string v10, ""

    .line 107
    .line 108
    const/4 v5, 0x0

    .line 109
    const/4 v6, 0x0

    .line 110
    const/4 v7, 0x0

    .line 111
    const/4 v8, 0x0

    .line 112
    move-object v12, p1

    .line 113
    invoke-interface/range {v2 .. v12}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->be(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_2

    .line 118
    .line 119
    iget-object p0, p0, Ll/cir;->a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->O4()Ll/ohr;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 126
    .line 127
    .line 128
    :cond_2
    return-void
.end method

.method public final synthetic D0(Ll/x20;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/cir;->i:Z

    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public G0(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    goto :goto_0

    .line 5
    :cond_0
    iget-object v1, p0, Ll/cir;->a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->O4()Ll/ohr;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/ohr;->U()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    :goto_0
    iput v0, p0, Ll/cir;->f:I

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/xf9;->x3()V

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/xf9;->A3()V

    .line 32
    .line 33
    .line 34
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 37
    .line 38
    iget p0, p0, Ll/cir;->f:I

    .line 39
    .line 40
    const/16 v0, 0x19

    .line 41
    .line 42
    invoke-virtual {p1, p0, v0}, Ll/xf9;->b4(II)Lrx/c;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public H0(IILandroid/content/Intent;)Z
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
    new-instance v0, Ll/bir;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/bir;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance v0, Ll/qhr;

    .line 52
    .line 53
    invoke-direct {v0, p0, p2, p3}, Ll/qhr;-><init>(Ll/cir;ILandroid/content/Intent;)V

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

.method public I0(ZLcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/data/User;Z)Z
    .locals 11

    .line 1
    iput-object p2, p0, Ll/cir;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Ll/cir;->F0()Z

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    const-string v3, "p_navigation_view"

    .line 14
    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 18
    .line 19
    const-string v4, "lettered"

    .line 20
    .line 21
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v1, p3}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Bi(Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    const-string v1, "e_iliked_letter"

    .line 39
    .line 40
    invoke-static {v1, v3}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/joa;->f4()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    const-string v5, "p_navigation,ilike_module"

    .line 65
    .line 66
    invoke-interface {v1, v0, v5, v3, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 67
    .line 68
    .line 69
    return v2

    .line 70
    :cond_1
    invoke-direct {p0, p3, p4}, Ll/cir;->O0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 71
    .line 72
    .line 73
    return v2

    .line 74
    :cond_2
    const-string v1, "e_iliked_superlike"

    .line 75
    .line 76
    invoke-static {v1, v3}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v1}, Ll/f7d0;->a(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    move-object v3, v1

    .line 93
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    iget-object v4, p0, Ll/cir;->a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 98
    .line 99
    invoke-virtual {p3, v2}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    iget-object v7, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 108
    .line 109
    const/4 v8, 0x0

    .line 110
    iget-object v10, p0, Ll/cir;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 111
    .line 112
    move-object v0, v3

    .line 113
    const/4 v3, 0x1

    .line 114
    move-object v2, v4

    .line 115
    const/4 v4, 0x1

    .line 116
    const/4 v6, 0x0

    .line 117
    move-object v9, p3

    .line 118
    move v5, p4

    .line 119
    invoke-interface/range {v0 .. v10}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->be(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    return v0
.end method

.method public J0(Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cir;->a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->O4()Ll/ohr;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/ohr;->S(Lcom/p1/mobile/putong/core/data/LikedUser;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

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
    invoke-virtual {v0, p1}, Ll/xf9;->e4(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget p1, p0, Ll/cir;->g:I

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    sub-int/2addr p1, v0

    .line 26
    iput p1, p0, Ll/cir;->g:I

    .line 27
    .line 28
    iget-object p1, p0, Ll/cir;->a:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->O4()Ll/ohr;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ll/ohr;->U()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-gtz p1, :cond_0

    .line 39
    .line 40
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Ll/fir;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/fir;->q(Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public L0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/cir;->N0(Ljava/lang/String;Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public N0(Ljava/lang/String;Ll/x20;)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/cir;->i:Z

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
    iput-boolean v0, p0, Ll/cir;->i:Z

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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    new-instance v6, Ll/shr;

    .line 24
    .line 25
    invoke-direct {v6, p0, p2}, Ll/shr;-><init>(Ll/cir;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    const/4 v5, 0x0

    .line 29
    move-object v3, p1

    .line 30
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public Z()V
    .locals 2

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
    const/4 v1, 0x1

    .line 9
    xor-int/2addr v0, v1

    .line 10
    iput-boolean v0, p0, Ll/cir;->e:Z

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ll/cir;->G0(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/phr;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/phr;-><init>(Ll/cir;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/thr;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/thr;-><init>()V

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
    new-instance v1, Ll/uhr;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/uhr;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/vhr;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/vhr;-><init>(Ll/cir;)V

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
    invoke-static {}, Ll/e7d0;->c()Ll/e7d0;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/e7d0;->d()Lrx/c;

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
    new-instance v1, Ll/whr;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/whr;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/xhr;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/xhr;-><init>(Ll/cir;)V

    .line 75
    .line 76
    .line 77
    new-instance v2, Ll/yhr;

    .line 78
    .line 79
    invoke-direct {v2}, Ll/yhr;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 92
    .line 93
    const-string v1, "svip"

    .line 94
    .line 95
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/zhr;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/zhr;-><init>(Ll/cir;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/xf9;->D3()Lrx/c;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    new-instance v1, Ll/air;

    .line 136
    .line 137
    invoke-direct {v1, p0}, Ll/air;-><init>(Ll/cir;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public r0()Landroidx/recyclerview/widget/k$e;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cir;->h:Ll/ihr;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ihr;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/ihr;-><init>(Ll/ihr$b;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/cir;->h:Ll/ihr;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/cir;->h:Ll/ihr;

    .line 13
    .line 14
    return-object p0
.end method

.method public t0(Lcom/p1/mobile/putong/data/User;)Z
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
    invoke-virtual {p0, p1}, Ll/xf9;->G3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikedUser;

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

.method public final synthetic u0(Ll/vg60;)V
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
    iget v2, p0, Ll/cir;->f:I

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
    iput-boolean v1, p0, Ll/cir;->d:Z

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
    iput v2, p0, Ll/cir;->g:I

    .line 43
    .line 44
    if-lez v2, :cond_4

    .line 45
    .line 46
    iput-boolean v0, p0, Ll/cir;->d:Z

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
    iget v2, p0, Ll/cir;->g:I

    .line 68
    .line 69
    if-lt v0, v2, :cond_7

    .line 70
    .line 71
    iput-boolean v1, p0, Ll/cir;->d:Z

    .line 72
    .line 73
    :cond_7
    new-instance v0, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_b

    .line 83
    .line 84
    iget-boolean v2, p0, Ll/cir;->e:Z

    .line 85
    .line 86
    if-eqz v2, :cond_9

    .line 87
    .line 88
    iget-object v2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    const/16 v3, 0x1f4

    .line 95
    .line 96
    if-le v2, v3, :cond_8

    .line 97
    .line 98
    iput-boolean v1, p0, Ll/cir;->d:Z

    .line 99
    .line 100
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {p1, v1, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 107
    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_8
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 111
    .line 112
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 113
    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_9
    iget-object v2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    const/16 v3, 0x32

    .line 123
    .line 124
    if-le v2, v3, :cond_a

    .line 125
    .line 126
    iput-boolean v1, p0, Ll/cir;->d:Z

    .line 127
    .line 128
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 129
    .line 130
    invoke-interface {p1, v1, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_a
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 139
    .line 140
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 141
    .line 142
    .line 143
    :cond_b
    :goto_3
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 144
    .line 145
    check-cast p1, Ll/fir;

    .line 146
    .line 147
    iget-boolean p0, p0, Ll/cir;->e:Z

    .line 148
    .line 149
    invoke-virtual {p1, v0, p0}, Ll/fir;->p(Ljava/util/ArrayList;Z)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public final synthetic y0(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/xf9;->E3()Ll/vg60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/xf9;->E3()Ll/vg60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 30
    invoke-virtual {p0, p1}, Ll/cir;->G0(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic z0(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/cir;->G0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
