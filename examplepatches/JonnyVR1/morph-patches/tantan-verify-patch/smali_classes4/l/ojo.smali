.class public Ll/ojo;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/qjo;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/wyd0;

.field public final b:Ll/byd0;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/wyd0;

    .line 5
    .line 6
    const-string v0, "tribe_cache"

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/ojo;->a:Ll/wyd0;

    .line 14
    .line 15
    new-instance p1, Ll/byd0;

    .line 16
    .line 17
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "tribe_cache_time"

    .line 24
    .line 25
    invoke-direct {p1, v1, v0}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/ojo;->b:Ll/byd0;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic e0(Ll/ojo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/ojo;->A0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/data/TribeSubset;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/TribeSubset;->subsetContent:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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

.method public static synthetic h0(Ll/ojo;Lcom/p1/mobile/putong/core/data/TribeSubset;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ojo;->E0(Lcom/p1/mobile/putong/core/data/TribeSubset;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Ll/ojo;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojo;->C0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/TribeSubset;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/TribeSubset;->mainHead:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/TribeSubset;->subsetContent:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string v0, "right"

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/TribeSubset;->groupCategory:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static synthetic k0(Ll/ojo;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojo;->D0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/member/R$string;->N:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic m0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n0(Ll/ojo;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojo;->z0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic o0(Ll/ojo;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ojo;->y0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic p0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move-object p0, v0

    .line 20
    :goto_0
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 31
    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 35
    .line 36
    :cond_1
    invoke-static {p0, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method private synthetic y0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/qjo;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/qjo;->r()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ojo;->G0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final synthetic A0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p6

    .line 5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    move-object v3, p1

    .line 18
    move-object v4, p2

    .line 19
    move-object v5, p3

    .line 20
    move-object v6, p4

    .line 21
    move-object v7, p5

    .line 22
    invoke-interface/range {v1 .. v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->xq(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/16 p1, 0x3e9

    .line 27
    .line 28
    invoke-virtual {p6, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic C0(Ljava/util/List;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ojo;->N0(Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Ll/qjo;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/qjo;->i(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/ojo;->O0(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic D0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ojo;->F0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic E0(Lcom/p1/mobile/putong/core/data/TribeSubset;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/TribeSubset;->groupCategory:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Ll/ojo;->u0(Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Ljava/lang/String;)Z

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

.method public final F0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/ojo;->b:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    sub-long/2addr v0, v2

    .line 18
    const-wide/32 v2, 0x5265c00

    .line 19
    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-gez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/ojo;->a:Ll/wyd0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/CharSequence;

    .line 32
    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    :try_start_0
    new-instance v0, Lcom/google/gson/Gson;

    .line 40
    .line 41
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/ojo;->a:Ll/wyd0;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Ljava/lang/String;

    .line 51
    .line 52
    new-instance v2, Ll/ojo$a;

    .line 53
    .line 54
    invoke-direct {v2, p0}, Ll/ojo$a;-><init>(Ll/ojo;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v0, v1, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ljava/util/List;

    .line 66
    .line 67
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-nez v1, :cond_0

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/ojo;->N0(Ljava/util/List;)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 78
    .line 79
    check-cast p0, Ll/qjo;

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ll/qjo;->i(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    .line 84
    :catch_0
    :cond_0
    return-void
.end method

.method public G0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ojo;->F0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ojo;->H0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final H0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/m;->L3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/hjo;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/hjo;-><init>(Ll/ojo;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/ijo;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/ijo;-><init>(Ll/ojo;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public I0(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/16 p2, 0x3e9

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ojo;->G0()V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public J0(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ojo;->G0()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public L0(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;)V
    .locals 13

    .line 1
    const-string v0, "intl_purpose"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ojo;->s0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "groupcategory"

    .line 12
    .line 13
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "tribe_subtype"

    .line 18
    .line 19
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->subType:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    filled-new-array {v0, v1, v2}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "e_intl_tribe_tribes_any_click"

    .line 30
    .line 31
    const-string v2, "p_intl_tribe_view"

    .line 32
    .line 33
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    const-string v0, "web"

    .line 37
    .line 38
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->action:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->jumpUrl:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_a

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v1, "tantanapp://webview?url="

    .line 69
    .line 70
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->jumpUrl:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-interface {p1, p0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ug(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_0
    const-string v0, "friend"

    .line 91
    .line 92
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->action:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    const-string v0, "short-term-fun"

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/ojo;->s0()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_1

    .line 111
    .line 112
    const-string v0, "short-but-long"

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/ojo;->s0()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_2

    .line 123
    .line 124
    :cond_1
    const-string v0, "long-term-partner"

    .line 125
    .line 126
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->subType:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-eqz v0, :cond_2

    .line 133
    .line 134
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ud(Lcom/p1/mobile/android/app/Act;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_2
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->subType:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {p0, v0}, Ll/ojo;->r0(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->subType:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->title:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v5, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->icon:Ljava/lang/String;

    .line 160
    .line 161
    iget-object v6, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->innerBackgroundUrl:Ljava/lang/String;

    .line 162
    .line 163
    move-object v1, p0

    .line 164
    move-object v2, p1

    .line 165
    invoke-virtual/range {v1 .. v6}, Ll/ojo;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_3
    move-object v7, p0

    .line 170
    move-object v8, p1

    .line 171
    const-string p0, "verify"

    .line 172
    .line 173
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->action:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    if-eqz p0, :cond_7

    .line 180
    .line 181
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 182
    .line 183
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 184
    .line 185
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->q4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    if-eqz p0, :cond_4

    .line 190
    .line 191
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 192
    .line 193
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 194
    .line 195
    goto :goto_0

    .line 196
    :cond_4
    const/4 p0, 0x0

    .line 197
    :goto_0
    invoke-static {}, Ll/joa;->f4()Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    if-eqz p1, :cond_6

    .line 202
    .line 203
    const-string p1, "verified"

    .line 204
    .line 205
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    if-eqz p0, :cond_5

    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_5
    new-instance p0, Ll/zfp;

    .line 213
    .line 214
    invoke-virtual {v7}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-direct {p0, p1}, Ll/zfp;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0}, Ll/q27;->show()V

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :cond_6
    :goto_1
    iget-object v9, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->subType:Ljava/lang/String;

    .line 226
    .line 227
    iget-object v10, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->title:Ljava/lang/String;

    .line 228
    .line 229
    iget-object v11, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->icon:Ljava/lang/String;

    .line 230
    .line 231
    iget-object v12, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->innerBackgroundUrl:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual/range {v7 .. v12}, Ll/ojo;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :cond_7
    const-string p0, "premium"

    .line 238
    .line 239
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->action:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p0

    .line 245
    if-eqz p0, :cond_9

    .line 246
    .line 247
    invoke-static {}, Ll/joa;->f4()Z

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    if-eqz p0, :cond_8

    .line 252
    .line 253
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    invoke-virtual {v7}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->subType:Ljava/lang/String;

    .line 266
    .line 267
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->tribe:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 268
    .line 269
    invoke-interface {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 270
    .line 271
    .line 272
    return-void

    .line 273
    :cond_8
    iget-object v9, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->subType:Ljava/lang/String;

    .line 274
    .line 275
    iget-object v10, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->title:Ljava/lang/String;

    .line 276
    .line 277
    iget-object v11, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->icon:Ljava/lang/String;

    .line 278
    .line 279
    iget-object v12, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->innerBackgroundUrl:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual/range {v7 .. v12}, Ll/ojo;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    return-void

    .line 285
    :cond_9
    const-string p0, "circle"

    .line 286
    .line 287
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->action:Ljava/lang/String;

    .line 288
    .line 289
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result p0

    .line 293
    if-eqz p0, :cond_a

    .line 294
    .line 295
    iget-object v9, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->subType:Ljava/lang/String;

    .line 296
    .line 297
    iget-object v10, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->title:Ljava/lang/String;

    .line 298
    .line 299
    iget-object v11, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->icon:Ljava/lang/String;

    .line 300
    .line 301
    iget-object v12, p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->innerBackgroundUrl:Ljava/lang/String;

    .line 302
    .line 303
    invoke-virtual/range {v7 .. v12}, Ll/ojo;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    :cond_a
    return-void
.end method

.method public final N0(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TribeSubset;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TribeSubset;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/bjo;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/bjo;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 12
    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/p1/mobile/putong/core/data/TribeSubset;

    .line 29
    .line 30
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/TribeSubset;->subsetContent:Ljava/util/List;

    .line 31
    .line 32
    new-instance v3, Ll/fjo;

    .line 33
    .line 34
    invoke-direct {v3, p0, v1}, Ll/fjo;-><init>(Ll/ojo;Lcom/p1/mobile/putong/core/data/TribeSubset;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v2, v3}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    new-instance p0, Ll/gjo;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/gjo;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, p0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public final O0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TribeSubset;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/ojo;->a:Ll/wyd0;

    .line 8
    .line 9
    new-instance v1, Lcom/google/gson/Gson;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/ojo;->b:Ll/byd0;

    .line 22
    .line 23
    invoke-static {}, Ll/pzi0;->o()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jjo;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/jjo;-><init>(Ll/ojo;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/kjo;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/kjo;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/ljo;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/ljo;-><init>(Ll/ojo;)V

    .line 52
    .line 53
    .line 54
    new-instance p0, Ll/mjo;

    .line 55
    .line 56
    invoke-direct {p0}, Ll/mjo;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public r0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ojo;->s0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-string v1, "unknown_"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    const-string v1, "not-sure-yet"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 52
    .line 53
    iput-object v1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurpose:Ljava/util/List;

    .line 54
    .line 55
    iput-object v1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 82
    .line 83
    const-string v1, "updateIntlInterval"

    .line 84
    .line 85
    invoke-virtual {v0, p1, v1}, Ll/dkb;->v9(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    new-instance p1, Ll/djo;

    .line 94
    .line 95
    invoke-direct {p1}, Ll/djo;-><init>()V

    .line 96
    .line 97
    .line 98
    new-instance v0, Ll/ejo;

    .line 99
    .line 100
    invoke-direct {v0}, Ll/ejo;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    :cond_1
    return-void
.end method

.method public s0()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/lang/String;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const-string p0, ""

    .line 32
    .line 33
    return-object p0
.end method

.method public t0(IZ)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/16 p0, 0x63

    .line 4
    .line 5
    if-le p1, p0, :cond_0

    .line 6
    .line 7
    const-string p0, "99+"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/16 p0, 0x3e8

    .line 11
    .line 12
    if-ge p1, p0, :cond_1

    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_1
    add-int/lit16 p1, p1, 0x1f4

    .line 20
    .line 21
    div-int/2addr p1, p0

    .line 22
    new-instance p0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p1, "k"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final u0(Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Ljava/lang/String;)Z
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->subType:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-nez p0, :cond_a

    .line 9
    .line 10
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    goto/16 :goto_3

    .line 17
    .line 18
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/4 v1, 0x3

    .line 26
    const/4 v2, 0x0

    .line 27
    const/4 v3, -0x1

    .line 28
    sparse-switch p0, :sswitch_data_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :sswitch_0
    const-string p0, "right"

    .line 33
    .line 34
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    move v3, v1

    .line 42
    goto :goto_0

    .line 43
    :sswitch_1
    const-string p0, "hobby"

    .line 44
    .line 45
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v3, 0x2

    .line 53
    goto :goto_0

    .line 54
    :sswitch_2
    const-string p0, "pursue"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    move v3, v0

    .line 64
    goto :goto_0

    .line 65
    :sswitch_3
    const-string p0, "banner"

    .line 66
    .line 67
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_4

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    move v3, v2

    .line 75
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 76
    .line 77
    .line 78
    return v0

    .line 79
    :pswitch_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->title:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-nez p0, :cond_6

    .line 86
    .line 87
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->coverUrl:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-nez p0, :cond_6

    .line 94
    .line 95
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 96
    .line 97
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-nez p0, :cond_6

    .line 102
    .line 103
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-ge p0, v1, :cond_5

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_5
    return v2

    .line 113
    :cond_6
    :goto_1
    return v0

    .line 114
    :pswitch_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->title:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-nez p0, :cond_8

    .line 121
    .line 122
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->icon:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-nez p0, :cond_8

    .line 129
    .line 130
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->coverUrl:Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_7

    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_7
    return v2

    .line 140
    :cond_8
    :goto_2
    return v0

    .line 141
    :pswitch_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->title:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-nez p0, :cond_a

    .line 148
    .line 149
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->coverUrl:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-eqz p0, :cond_9

    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_9
    return v2

    .line 159
    :cond_a
    :goto_3
    return v0

    .line 160
    nop

    .line 161
    :sswitch_data_0
    .sparse-switch
        -0x533a80d4 -> :sswitch_3
        -0x3a3aebea -> :sswitch_2
        0x5ed7dd2 -> :sswitch_1
        0x677c21c -> :sswitch_0
    .end sparse-switch

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 4
    .line 5
    const-string v1, "join"

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1, p2}, Lcom/p1/mobile/putong/core/api/m;->H3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/njo;

    .line 16
    .line 17
    move-object v2, p0

    .line 18
    move-object v3, p1

    .line 19
    move-object v4, p2

    .line 20
    move-object v5, p3

    .line 21
    move-object v6, p4

    .line 22
    move-object v7, p5

    .line 23
    invoke-direct/range {v1 .. v7}, Ll/njo;-><init>(Ll/ojo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/cjo;

    .line 27
    .line 28
    invoke-direct {p0}, Ll/cjo;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ojo;->G0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
