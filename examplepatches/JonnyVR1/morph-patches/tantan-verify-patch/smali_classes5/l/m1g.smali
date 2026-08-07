.class public Ll/m1g;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/z1g;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public final b:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

.field public c:Z

.field public d:Z

.field public e:Lcom/p1/mobile/putong/app/PutongAct;

.field public f:Lcom/p1/mobile/putong/data/User;

.field public g:I

.field public h:I

.field public i:J

.field public j:Ll/jxd0;

.field public k:Ll/jxd0;

.field public l:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/m1g;->f:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/m1g;->g:I

    .line 9
    .line 10
    iput v0, p0, Ll/m1g;->h:I

    .line 11
    .line 12
    const-wide/16 v1, 0x0

    .line 13
    .line 14
    iput-wide v1, p0, Ll/m1g;->i:J

    .line 15
    .line 16
    new-instance v1, Ll/jxd0;

    .line 17
    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v3, "show_see_guide_dlg"

    .line 21
    .line 22
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-direct {v1, v2, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Ll/m1g;->j:Ll/jxd0;

    .line 46
    .line 47
    new-instance v1, Ll/jxd0;

    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v4, "show_see_guide_anim"

    .line 52
    .line 53
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-direct {v1, v2, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 72
    .line 73
    .line 74
    iput-object v1, p0, Ll/m1g;->k:Ll/jxd0;

    .line 75
    .line 76
    iput-boolean v0, p0, Ll/m1g;->l:Z

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 83
    .line 84
    iput-object p1, p0, Ll/m1g;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    const-string v0, "from"

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 97
    .line 98
    iget-object p1, p0, Ll/m1g;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const-string v0, "style"

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 111
    .line 112
    iput-object p1, p0, Ll/m1g;->b:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 113
    .line 114
    return-void
.end method

.method private synthetic C0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/m1g;->c:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method private synthetic D0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m1g;->R0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private F0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->m5()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 11
    .line 12
    iget-wide v1, p0, Ll/m1g;->i:J

    .line 13
    .line 14
    const-string p0, ""

    .line 15
    .line 16
    const/16 v3, 0x32

    .line 17
    .line 18
    invoke-virtual {v0, v3, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->j7(IJLjava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic e0(Ll/m1g;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/m1g;->E0(ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic f0(Ll/m1g;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m1g;->O0()V

    return-void
.end method

.method public static synthetic g0(Ll/m1g;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m1g;->z0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic h0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i0(Ll/m1g;Lcom/p1/mobile/putong/data/Counter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m1g;->A0(Lcom/p1/mobile/putong/data/Counter;)V

    return-void
.end method

.method public static synthetic j0(Ll/x20;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic k0(Ll/m1g;Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m1g;->C0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l0(Ll/m1g;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m1g;->D0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic p0(Ll/m1g;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m1g;->y0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic y0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const-string v0, "price_recall_shown"

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    :cond_0
    invoke-static {}, Ll/yie0;->h()Ll/yie0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v1}, Ll/yie0;->u(Z)V

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-direct {p0}, Ll/m1g;->F0()V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/yie0;->d()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 v0, 0x1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/m1g;->P0()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    move v1, v0

    .line 40
    :cond_2
    iput-boolean v1, p0, Ll/m1g;->d:Z

    .line 41
    .line 42
    iget-object p1, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 43
    .line 44
    const-string v1, "p_special_card,deeplink,click"

    .line 45
    .line 46
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_3

    .line 51
    .line 52
    iget-object p1, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 53
    .line 54
    const-string v1, "p_special_card,deeplink_intl,click"

    .line 55
    .line 56
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_4

    .line 61
    .line 62
    :cond_3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    const-string v1, "preferred_show_purchase"

    .line 71
    .line 72
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iput-boolean p1, p0, Ll/m1g;->d:Z

    .line 77
    .line 78
    :cond_4
    iget-boolean p1, p0, Ll/m1g;->d:Z

    .line 79
    .line 80
    if-eqz p1, :cond_5

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    new-instance v0, Ll/a1g;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Ll/a1g;-><init>(Ll/m1g;)V

    .line 89
    .line 90
    .line 91
    const-wide/16 v1, 0x190

    .line 92
    .line 93
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 94
    .line 95
    .line 96
    :cond_5
    return-void
.end method


# virtual methods
.method public final synthetic A0(Lcom/p1/mobile/putong/data/Counter;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 20
    .line 21
    if-ne p1, v0, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Ll/m1g;->c:Z

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/m1g;->R0()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/z1g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m1g;->q0(Ll/z1g;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic E0(ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 9

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/z1g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/z1g;->J()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_4

    .line 10
    .line 11
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->e:Ll/sm70;

    .line 12
    .line 13
    invoke-virtual {p3}, Ll/sm70;->j0()Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->e:Ll/sm70;

    .line 18
    .line 19
    iget-object v0, v0, Ll/sm70;->c:Lcom/p1/mobile/putong/core/data/PicksUser;

    .line 20
    .line 21
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    if-eqz p3, :cond_4

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-eqz p3, :cond_4

    .line 32
    .line 33
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicksUser;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p3, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 44
    .line 45
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    const/4 v0, 0x1

    .line 50
    const/4 v1, 0x0

    .line 51
    if-eq p1, p3, :cond_1

    .line 52
    .line 53
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 54
    .line 55
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    if-ne p1, p3, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move v2, v1

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    :goto_0
    move v2, v0

    .line 65
    :goto_1
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 66
    .line 67
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-ne p1, v3, :cond_2

    .line 72
    .line 73
    move v3, v0

    .line 74
    goto :goto_2

    .line 75
    :cond_2
    move v3, v1

    .line 76
    :goto_2
    iget-object v0, v7, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    const/4 v5, 0x0

    .line 91
    if-eqz v4, :cond_3

    .line 92
    .line 93
    const-string v0, "currentImageIndex"

    .line 94
    .line 95
    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    const-string v0, "currentImageUrl"

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    if-ne p1, p3, :cond_3

    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->pc()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    :cond_3
    move-object v6, v0

    .line 128
    move-object v8, v5

    .line 129
    move v5, v1

    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->e:Ll/sm70;

    .line 131
    .line 132
    const/4 v4, 0x1

    .line 133
    invoke-virtual/range {v1 .. v8}, Ll/sm70;->n0(ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    :cond_4
    return-void
.end method

.method public G0(IILandroid/content/Intent;)Z
    .locals 2

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
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->bj()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eq p2, p1, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eq p2, p1, :cond_0

    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-ne p2, p1, :cond_2

    .line 39
    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ll/k1g;

    .line 45
    .line 46
    invoke-direct {v0}, Ll/k1g;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance v0, Ll/l1g;

    .line 54
    .line 55
    invoke-direct {v0, p0, p2, p3}, Ll/l1g;-><init>(Ll/m1g;ILandroid/content/Intent;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return v1

    .line 66
    :cond_1
    const/16 v0, 0x312

    .line 67
    .line 68
    if-ne p1, v0, :cond_2

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-interface {p1, p2, p3, p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Yq(ILandroid/content/Intent;Lcom/p1/mobile/android/app/Act;)V

    .line 83
    .line 84
    .line 85
    return v1

    .line 86
    :cond_2
    const/4 p0, 0x0

    .line 87
    return p0
.end method

.method public H0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m1g;->Q0(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I0(Ll/x20;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/m1g;->u0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p1}, Ll/m1g;->N0(Ljava/lang/String;Ll/x20;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public J0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/m1g;->u0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/m1g;->L0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public L0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/m1g;->N0(Ljava/lang/String;Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public N0(Ljava/lang/String;Ll/x20;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/z99;->e3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 24
    .line 25
    new-instance v6, Ll/b1g;

    .line 26
    .line 27
    invoke-direct {v6, p2}, Ll/b1g;-><init>(Ll/x20;)V

    .line 28
    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    move-object v3, p1

    .line 32
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    move-object v3, p1

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p1, p0, p2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->showSeeDialog(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final O0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m1g;->k:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Ll/m1g;->k:Ll/jxd0;

    .line 17
    .line 18
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Ll/z1g;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/z1g;->b0()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public P0()Z
    .locals 2

    .line 1
    const-string v0, "p_navigation_view,e_see_banner,intl_click"

    .line 2
    .line 3
    iget-object v1, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "p_special_card,deeplink_intl,click"

    .line 12
    .line 13
    iget-object p0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public Q0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/seepage/match/FakeMatchAct;->c2(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public R0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->m0:Ll/byd0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/Long;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iput-wide v0, p0, Ll/m1g;->i:J

    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->m0:Ll/byd0;

    .line 27
    .line 28
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 44
    .line 45
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/yie0;->h()Ll/yie0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, v0, Ll/yie0;->a:Z

    .line 10
    .line 11
    new-instance v0, Ll/z0g;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/z0g;-><init>(Ll/m1g;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/d1g;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/d1g;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->V6()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/e1g;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/e1g;-><init>(Ll/m1g;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/f1g;

    .line 42
    .line 43
    invoke-direct {v2}, Ll/f1g;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

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
    new-instance v1, Ll/g1g;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/g1g;-><init>(Ll/m1g;)V

    .line 70
    .line 71
    .line 72
    new-instance v2, Ll/h1g;

    .line 73
    .line 74
    invoke-direct {v2}, Ll/h1g;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/i1g;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/i1g;-><init>(Ll/m1g;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v1, Ll/j1g;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/j1g;-><init>(Ll/m1g;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-static {}, Ll/yie0;->h()Ll/yie0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/yie0;->a:Z

    .line 7
    .line 8
    return-void
.end method

.method public q0(Ll/z1g;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final r0()Ljava/lang/String;
    .locals 3

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ht()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "p_meet_view,e_see_banner,click"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, "p_navigation_see,default"

    .line 36
    .line 37
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "p_messages_view,e_see_banner,click"

    .line 46
    .line 47
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 54
    .line 55
    const-string v2, "p_popup_see,default"

    .line 56
    .line 57
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const/4 p0, 0x1

    .line 65
    invoke-static {v1, p0}, Ll/abb0;->c(Ljava/lang/String;I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 71
    .line 72
    return-object p0
.end method

.method public s0()V
    .locals 3

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/16 v0, 0xc

    .line 16
    .line 17
    const/16 v1, 0xd

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/pzi0;->x(II)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    new-instance v2, Ll/c1g;

    .line 70
    .line 71
    invoke-direct {v2, p0}, Ll/c1g;-><init>(Ll/m1g;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/m1g;->r0()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-interface {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->showSeeDialog(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    :goto_0
    return-void
.end method

.method public final t0(I)Ljava/lang/String;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "?"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const/16 p0, 0x63

    .line 7
    .line 8
    if-lt p1, p0, :cond_1

    .line 9
    .line 10
    const-string p0, "99+"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final u0()Ljava/lang/String;
    .locals 2

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ht()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "p_meet_view,e_see_banner,click"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iget-object v0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, "p_navigation_see,default"

    .line 36
    .line 37
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_3

    .line 42
    .line 43
    iget-object v0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 44
    .line 45
    const-string v1, "p_messages_view,e_see_banner,click"

    .line 46
    .line 47
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-object p0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 55
    .line 56
    const-string v0, "p_popup_see,default"

    .line 57
    .line 58
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    const-string p0, "p_popup_see,card_button_pull"

    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_2
    const-string p0, "p_navigation_see,card_button_pull"

    .line 68
    .line 69
    const/4 v0, 0x1

    .line 70
    invoke-static {p0, v0}, Ll/abb0;->c(Ljava/lang/String;I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/m1g;->a:Ljava/lang/String;

    .line 76
    .line 77
    return-object p0
.end method

.method public x0()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Ll/m1g;->g:I

    .line 2
    .line 3
    const/16 v1, 0x2710

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/text/DecimalFormat;

    .line 8
    .line 9
    const-string v1, "#.#"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    iget p0, p0, Ll/m1g;->g:I

    .line 20
    .line 21
    int-to-float p0, p0

    .line 22
    const v2, 0x461c4000    # 10000.0f

    .line 23
    .line 24
    .line 25
    div-float/2addr p0, v2

    .line 26
    float-to-double v2, p0

    .line 27
    invoke-virtual {v0, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p0, "w"

    .line 35
    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final synthetic z0(Ll/pf60;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->u0:Z

    .line 7
    .line 8
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v1, Ljava/util/Collection;

    .line 19
    .line 20
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v0, p0, Ll/m1g;->g:I

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast v1, Ll/z1g;

    .line 31
    .line 32
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p1, Ljava/util/List;

    .line 35
    .line 36
    invoke-virtual {v1, p1}, Ll/z1g;->Y(Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    iget-boolean p1, p0, Ll/m1g;->d:Z

    .line 40
    .line 41
    if-nez p1, :cond_3

    .line 42
    .line 43
    iget p1, p0, Ll/m1g;->g:I

    .line 44
    .line 45
    if-lez p1, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/m1g;->O0()V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    sget-object v1, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->Companion:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;->b()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->m()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_2

    .line 76
    .line 77
    :cond_1
    invoke-virtual {p0}, Ll/m1g;->P0()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_3

    .line 82
    .line 83
    :cond_2
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 84
    .line 85
    check-cast v1, Ll/z1g;

    .line 86
    .line 87
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast p1, Ljava/util/List;

    .line 90
    .line 91
    invoke-virtual {v1, p1}, Ll/z1g;->Y(Ljava/util/List;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    :goto_0
    if-gtz v0, :cond_5

    .line 95
    .line 96
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p0}, Ll/m1g;->P0()Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-eqz p0, :cond_4

    .line 105
    .line 106
    sget p0, Lcom/p1/mobile/putong/core/member/R$string;->l0:I

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_4
    sget p0, Lcom/p1/mobile/putong/core/member/R$string;->Y0:I

    .line 110
    .line 111
    :goto_1
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0}, Ll/m1g;->P0()Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_6

    .line 124
    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->l0:I

    .line 139
    .line 140
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string p0, "("

    .line 148
    .line 149
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string p0, ")"

    .line 156
    .line 157
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    goto :goto_2

    .line 165
    :cond_6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->X0:I

    .line 174
    .line 175
    invoke-virtual {p0, v0}, Ll/m1g;->t0(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-virtual {v1, v2, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    :goto_2
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 188
    .line 189
    .line 190
    return-void
.end method
