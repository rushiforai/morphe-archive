.class public Lcom/p1/mobile/putong/core/CoreBusinessModule;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/putong/module/Module;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreBusinessModule"
    path = "/core_module/module"
.end annotation


# static fields
.field public static c:Ll/u17;

.field public static d:Ll/wr2;

.field public static e:Ll/bua;

.field public static f:Ll/ya7;

.field public static g:Ll/tl9;

.field public static h:Ll/fu9;

.field public static i:Z


# instance fields
.field public a:Ll/byd0;

.field public b:Ll/byd0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ya7;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ya7;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->f:Ll/ya7;

    .line 7
    .line 8
    new-instance v0, Ll/fu9;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/fu9;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->h:Ll/fu9;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    sput-boolean v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->i:Z

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "sameDaylastActiveTime"

    .line 13
    .line 14
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->a:Ll/byd0;

    .line 18
    .line 19
    new-instance v0, Ll/byd0;

    .line 20
    .line 21
    const-string v2, "lastActiveTimeCursor"

    .line 22
    .line 23
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->b:Ll/byd0;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Lcom/p1/mobile/putong/data/IdealTag;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserIdealInfo;->details:Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, Ll/i97;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/i97;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/data/IdealTag;

    .line 15
    .line 16
    return-object p0
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/CoreBusinessModule;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->k0(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic K()V
    .locals 2

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->d()Lcom/p1/mobile/putong/data/OMSData;

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->M5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/data/GroupNotification;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GroupNotification;->groupApplyData:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->userId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic M(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic N(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IdealTag;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/IdealTag;->new_()Lcom/p1/mobile/putong/data/IdealTag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p0, v0, Lcom/p1/mobile/putong/data/IdealTag;->id:Ljava/lang/String;

    .line 6
    .line 7
    return-object v0
.end method

.method public static synthetic P(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

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
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 12
    .line 13
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/api/CoreProduct;->f0:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-ne v0, p0, :cond_0

    .line 38
    .line 39
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->v4()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/data/GroupNotification;Lcom/p1/mobile/putong/core/data/ChatGroup;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GroupNotification;->groupApplyData:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic R(Ljava/lang/String;Lcom/p1/mobile/putong/data/IdealTag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/IdealTag;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic S(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/app/Activity;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-class v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    :goto_0
    invoke-static {p0}, Ll/uqi;->a(Z)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const-string p0, "others"

    .line 42
    .line 43
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->F(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic T(Ll/uxj0;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string v0, "assets://asset/asset.PNG?id=core_oms_verification_complete&ext=PNG"

    .line 6
    .line 7
    const-string v1, "assets://asset/asset.PNG?id=core_oms_verification_fail&ext=PNG"

    .line 8
    .line 9
    const-string v2, "assets://asset/asset.PNG?id=core_oms_ready_active&ext=PNG"

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget v3, Ll/dbc0;->ai:I

    .line 18
    .line 19
    invoke-virtual {p0, v2, v3}, Ll/pk50;->r(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget v2, Ll/dbc0;->ci:I

    .line 27
    .line 28
    invoke-virtual {p0, v1, v2}, Ll/pk50;->r(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget v1, Ll/dbc0;->bi:I

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1}, Ll/pk50;->r(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget v3, Ll/dbc0;->hj:I

    .line 46
    .line 47
    invoke-virtual {p0, v2, v3}, Ll/pk50;->r(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget v2, Ll/dbc0;->jj:I

    .line 55
    .line 56
    invoke-virtual {p0, v1, v2}, Ll/pk50;->r(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    sget v1, Ll/dbc0;->ij:I

    .line 64
    .line 65
    invoke-virtual {p0, v0, v1}, Ll/pk50;->r(Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z1:Ll/jxd0;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Ljava/lang/Boolean;

    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_1

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->p()V

    .line 91
    .line 92
    .line 93
    sget-object p0, Ll/uqb0;->A0:Lrx/subjects/a;

    .line 94
    .line 95
    new-instance v0, Ll/pf60;

    .line 96
    .line 97
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    check-cast v1, Ll/pf60;

    .line 102
    .line 103
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast v1, Ljava/lang/Boolean;

    .line 106
    .line 107
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 108
    .line 109
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 118
    .line 119
    iget-object p0, p0, Ll/dkb;->K3:Ll/byd0;

    .line 120
    .line 121
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    check-cast p0, Ljava/lang/Long;

    .line 126
    .line 127
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 128
    .line 129
    .line 130
    move-result-wide v0

    .line 131
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-nez p0, :cond_2

    .line 136
    .line 137
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 140
    .line 141
    iget-object p0, p0, Ll/dkb;->L3:Ll/vxd0;

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/vxd0;->clear()Z

    .line 144
    .line 145
    .line 146
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 147
    .line 148
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 149
    .line 150
    iget-object p0, p0, Ll/dkb;->K3:Ll/byd0;

    .line 151
    .line 152
    invoke-static {}, Ll/pzi0;->o()J

    .line 153
    .line 154
    .line 155
    move-result-wide v0

    .line 156
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 164
    .line 165
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 166
    .line 167
    iget-object p0, p0, Ll/dkb;->L3:Ll/vxd0;

    .line 168
    .line 169
    const/4 v0, 0x1

    .line 170
    invoke-virtual {p0, v0}, Ll/vxd0;->a(I)V

    .line 171
    .line 172
    .line 173
    invoke-static {}, Ll/gra;->K1()Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-eqz p0, :cond_3

    .line 178
    .line 179
    invoke-static {}, Ll/pzi0;->o()J

    .line 180
    .line 181
    .line 182
    move-result-wide v0

    .line 183
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 184
    .line 185
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 186
    .line 187
    iget-object p0, p0, Ll/dkb;->A5:Ll/byd0;

    .line 188
    .line 189
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    check-cast p0, Ljava/lang/Long;

    .line 194
    .line 195
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 196
    .line 197
    .line 198
    move-result-wide v2

    .line 199
    invoke-static {v0, v1, v2, v3}, Ll/pzi0;->C(JJ)Z

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    if-nez p0, :cond_3

    .line 204
    .line 205
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 206
    .line 207
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 208
    .line 209
    iget-object p0, p0, Ll/dkb;->A5:Ll/byd0;

    .line 210
    .line 211
    invoke-static {}, Ll/pzi0;->o()J

    .line 212
    .line 213
    .line 214
    move-result-wide v0

    .line 215
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 223
    .line 224
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 225
    .line 226
    iget-object p0, p0, Ll/dkb;->B5:Ll/vxd0;

    .line 227
    .line 228
    const/4 v0, 0x0

    .line 229
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    :cond_3
    new-instance p0, Ll/l97;

    .line 237
    .line 238
    invoke-direct {p0}, Ll/l97;-><init>()V

    .line 239
    .line 240
    .line 241
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 242
    .line 243
    .line 244
    invoke-static {}, Ll/gra;->N2()Z

    .line 245
    .line 246
    .line 247
    move-result p0

    .line 248
    if-eqz p0, :cond_4

    .line 249
    .line 250
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 251
    .line 252
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 253
    .line 254
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w8()V

    .line 255
    .line 256
    .line 257
    :cond_4
    invoke-static {}, Ll/spl0;->Q()Z

    .line 258
    .line 259
    .line 260
    move-result p0

    .line 261
    if-eqz p0, :cond_6

    .line 262
    .line 263
    invoke-static {}, Ll/i5c0;->i()Ll/i5c0;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    invoke-virtual {p0}, Ll/i5c0;->j()V

    .line 268
    .line 269
    .line 270
    invoke-static {}, Ll/spl0;->j()Z

    .line 271
    .line 272
    .line 273
    move-result p0

    .line 274
    if-eqz p0, :cond_5

    .line 275
    .line 276
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 277
    .line 278
    const-string v0, "https://static.tancdn.com/pe-webplatform/gcyXEc-3NM-VdbuEN0wPLIzc.webp"

    .line 279
    .line 280
    invoke-virtual {p0, v0}, Ll/fsb0;->r0(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 284
    .line 285
    const-string v0, "https://static.tancdn.com/pe-webplatform/WZj8NDixaW5RhIFWlQug_4JA.webp"

    .line 286
    .line 287
    invoke-virtual {p0, v0}, Ll/fsb0;->r0(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    :cond_5
    invoke-static {}, Ll/spl0;->b0()Z

    .line 291
    .line 292
    .line 293
    move-result p0

    .line 294
    if-eqz p0, :cond_6

    .line 295
    .line 296
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 297
    .line 298
    const-string v0, "https://static.tancdn.com/pe-webplatform/iKiD6UfDTb_pOoQZ2RHTCzP5.webp"

    .line 299
    .line 300
    invoke-virtual {p0, v0}, Ll/fsb0;->r0(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 304
    .line 305
    const-string v0, "https://static.tancdn.com/pe-webplatform/Espsnpgm79p15sNAVGOcsGTv.webp"

    .line 306
    .line 307
    invoke-virtual {p0, v0}, Ll/fsb0;->r0(Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    :cond_6
    invoke-static {}, Ll/spl0;->R()Z

    .line 311
    .line 312
    .line 313
    move-result p0

    .line 314
    if-eqz p0, :cond_7

    .line 315
    .line 316
    sget-object p0, Ll/h1c0;->INSTANCE:Ll/h1c0;

    .line 317
    .line 318
    invoke-virtual {p0}, Ll/h1c0;->c()V

    .line 319
    .line 320
    .line 321
    :cond_7
    invoke-static {}, Ll/spl0;->U()Z

    .line 322
    .line 323
    .line 324
    move-result p0

    .line 325
    if-eqz p0, :cond_8

    .line 326
    .line 327
    sget-object p0, Ll/q0e0;->INSTANCE:Ll/q0e0;

    .line 328
    .line 329
    invoke-virtual {p0}, Ll/q0e0;->l()V

    .line 330
    .line 331
    .line 332
    :cond_8
    invoke-static {}, Ll/s7a;->h()Z

    .line 333
    .line 334
    .line 335
    move-result p0

    .line 336
    if-eqz p0, :cond_9

    .line 337
    .line 338
    new-instance p0, Ljava/util/ArrayList;

    .line 339
    .line 340
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 341
    .line 342
    .line 343
    const-string v0, "https://fe-static.tancdn.com/v1/raw/fc24b12c-e55f-404c-8da2-a7916aacc4a814.svga"

    .line 344
    .line 345
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    const-string v0, "https://fe-static.tancdn.com/v1/raw/8aebaed7-dff9-4bc9-9693-f2eb3509473214.svga"

    .line 349
    .line 350
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    const-string v0, "https://fe-static.tancdn.com/v1/raw/84570b50-d8bb-472f-b054-29051c568dec14.svga"

    .line 354
    .line 355
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 359
    .line 360
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->batchDownload(Ljava/util/List;)V

    .line 365
    .line 366
    .line 367
    :cond_9
    invoke-static {}, Ll/rm50;->e()Z

    .line 368
    .line 369
    .line 370
    move-result p0

    .line 371
    if-eqz p0, :cond_a

    .line 372
    .line 373
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 374
    .line 375
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFZMlVFTU02WE1PVFpYM0RLVkhLTldOVjZISkRCNzEyIiwidyI6NzE4LCJoIjo0MzgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTg3ODQ2NzM1MjE4MTE0NjI5fQ.png"

    .line 376
    .line 377
    invoke-virtual {p0, v0}, Ll/fsb0;->r0(Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    :cond_a
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 381
    .line 382
    .line 383
    move-result-object p0

    .line 384
    const-string v0, "continue_popup"

    .line 385
    .line 386
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    const-string v1, "exp"

    .line 391
    .line 392
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 393
    .line 394
    .line 395
    move-result v0

    .line 396
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/poplevel/a;->B(Z)V

    .line 397
    .line 398
    .line 399
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 400
    .line 401
    .line 402
    move-result-object p0

    .line 403
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 404
    .line 405
    .line 406
    move-result p0

    .line 407
    if-eqz p0, :cond_b

    .line 408
    .line 409
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    const-string v1, "popup_schedule_config"

    .line 418
    .line 419
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object v0

    .line 423
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/poplevel/a;->x(Ljava/lang/String;)V

    .line 424
    .line 425
    .line 426
    :cond_b
    invoke-static {}, Ll/gbe0;->b()Ll/gbe0;

    .line 427
    .line 428
    .line 429
    move-result-object p0

    .line 430
    invoke-virtual {p0}, Ll/gbe0;->d()V

    .line 431
    .line 432
    .line 433
    invoke-static {}, Ll/t8r;->a()Ll/t8r;

    .line 434
    .line 435
    .line 436
    move-result-object p0

    .line 437
    new-instance v0, Ll/me9;

    .line 438
    .line 439
    invoke-direct {v0}, Ll/me9;-><init>()V

    .line 440
    .line 441
    .line 442
    invoke-virtual {p0, v0}, Ll/t8r;->d(Ll/v8r;)V

    .line 443
    .line 444
    .line 445
    return-void
.end method

.method public static synthetic V(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p1, p0}, Ll/llb0;->b(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/h97;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/h97;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic Y()V
    .locals 1

    .line 1
    invoke-static {}, Ll/wkh0;->b()Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/guy;->N()Ll/guy;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/guy;->O()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/guy;->N()Ll/guy;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/guy;->P()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic Z(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->X:I

    .line 15
    .line 16
    :cond_0
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/tx0;->Q()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a0()V
    .locals 0

    .line 1
    invoke-static {}, Ll/oze;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b0(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/rrf;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rrf;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/rrf;->e()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/core/CoreBusinessModule;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->l0(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic d0(Lcom/p1/mobile/putong/core/data/GroupNotification;Lcom/p1/mobile/putong/core/data/GroupApply;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GroupNotification;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static e0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->z1:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 36
    .line 37
    iget-object v0, v0, Ll/kua;->R:Ll/mof0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/mof0;->o()V

    .line 40
    .line 41
    .line 42
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 45
    .line 46
    iget-object v0, v0, Ll/dkb;->z1:Ll/wyd0;

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public static m0()Ll/eu9;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->h:Ll/fu9;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fu9;->a()Ll/eu9;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static z0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->j:Ll/kcg0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->K2:Ll/q16;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/q16;->E()Ll/kcg0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/CoreModule;->j:Ll/kcg0;

    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method public final A0()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->a:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->a:Ll/byd0;

    .line 21
    .line 22
    invoke-static {}, Ll/pzi0;->o()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->b:Ll/byd0;

    .line 34
    .line 35
    invoke-static {}, Ll/pzi0;->o()J

    .line 36
    .line 37
    .line 38
    move-result-wide v2

    .line 39
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    sput-boolean v1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->i:Z

    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->a:Ll/byd0;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ljava/lang/Long;

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 62
    .line 63
    .line 64
    move-result-wide v4

    .line 65
    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->h0(JJ)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->a:Ll/byd0;

    .line 72
    .line 73
    invoke-static {}, Ll/pzi0;->o()J

    .line 74
    .line 75
    .line 76
    move-result-wide v2

    .line 77
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->b:Ll/byd0;

    .line 86
    .line 87
    iget-object v2, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->a:Ll/byd0;

    .line 88
    .line 89
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    check-cast v2, Ljava/lang/Long;

    .line 94
    .line 95
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->a:Ll/byd0;

    .line 99
    .line 100
    invoke-static {}, Ll/pzi0;->o()J

    .line 101
    .line 102
    .line 103
    move-result-wide v2

    .line 104
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->a:Ll/byd0;

    .line 112
    .line 113
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Ljava/lang/Long;

    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 120
    .line 121
    .line 122
    move-result-wide v2

    .line 123
    iget-object v0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->b:Ll/byd0;

    .line 124
    .line 125
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Ljava/lang/Long;

    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 132
    .line 133
    .line 134
    move-result-wide v4

    .line 135
    const/4 v0, 0x1

    .line 136
    invoke-static {v2, v3, v4, v5, v0}, Ll/tzi0;->h(JJI)Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    const/4 v3, 0x2

    .line 141
    if-eqz v2, :cond_2

    .line 142
    .line 143
    iget-object v2, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->a:Ll/byd0;

    .line 144
    .line 145
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    check-cast v2, Ljava/lang/Long;

    .line 150
    .line 151
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 152
    .line 153
    .line 154
    move-result-wide v4

    .line 155
    iget-object v2, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->b:Ll/byd0;

    .line 156
    .line 157
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    check-cast v2, Ljava/lang/Long;

    .line 162
    .line 163
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 164
    .line 165
    .line 166
    move-result-wide v6

    .line 167
    invoke-static {v4, v5, v6, v7, v3}, Ll/tzi0;->h(JJI)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-nez v2, :cond_2

    .line 172
    .line 173
    sput-boolean v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->i:Z

    .line 174
    .line 175
    return-void

    .line 176
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->a:Ll/byd0;

    .line 177
    .line 178
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    check-cast v0, Ljava/lang/Long;

    .line 183
    .line 184
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 185
    .line 186
    .line 187
    move-result-wide v4

    .line 188
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->b:Ll/byd0;

    .line 189
    .line 190
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    check-cast p0, Ljava/lang/Long;

    .line 195
    .line 196
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 197
    .line 198
    .line 199
    move-result-wide v6

    .line 200
    invoke-static {v4, v5, v6, v7, v3}, Ll/tzi0;->h(JJI)Z

    .line 201
    .line 202
    .line 203
    move-result p0

    .line 204
    if-eqz p0, :cond_3

    .line 205
    .line 206
    sput-boolean v1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->i:Z

    .line 207
    .line 208
    :cond_3
    return-void
.end method

.method public Ai()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->q()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/z87;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/z87;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public Ec()V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->r0()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/p1/mobile/putong/core/CoreBusinessModule$a;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule$a;-><init>(Lcom/p1/mobile/putong/core/CoreBusinessModule;)V

    .line 14
    .line 15
    .line 16
    const-string v2, "core"

    .line 17
    .line 18
    invoke-virtual {v0, v2, v1}, Ll/pk50;->q(Ljava/lang/String;Ll/fl50;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/a17;->h()Ll/a17;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/a17;->j()V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/xwa;->E()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->w0()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->t0()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public Jh()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    sput-boolean p0, Ll/hw80;->f:Z

    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/fake/b;->J()V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public Ma()V
    .locals 0

    .line 1
    return-void
.end method

.method public Qh()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/aq8;->v()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/bua;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/bua;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->e:Ll/bua;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/bua;->p()V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/m97;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/m97;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/o97;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/o97;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/p97;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/p97;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/hxj0;->b()V

    .line 59
    .line 60
    .line 61
    new-instance v0, Ll/q97;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/q97;-><init>(Lcom/p1/mobile/putong/core/CoreBusinessModule;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Envelope;->registerApiParseCompleteListener(Lcom/p1/mobile/putong/data/Envelope$ApiParseCompleteListener;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->n0()V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Ll/cqq;->e()Ll/cqq;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-class v0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 79
    .line 80
    .line 81
    new-instance p0, Ll/p87;

    .line 82
    .line 83
    invoke-direct {p0}, Ll/p87;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v0, "tantan_core"

    .line 87
    .line 88
    invoke-static {v0, p0}, Ll/w0c;->O(Ljava/lang/String;Ll/scj;)V

    .line 89
    .line 90
    .line 91
    new-instance p0, Ll/q87;

    .line 92
    .line 93
    invoke-direct {p0}, Ll/q87;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v0, "tantan_usercenter"

    .line 97
    .line 98
    invoke-static {v0, p0}, Ll/w0c;->O(Ljava/lang/String;Ll/scj;)V

    .line 99
    .line 100
    .line 101
    new-instance p0, Ll/r87;

    .line 102
    .line 103
    invoke-direct {p0}, Ll/r87;-><init>()V

    .line 104
    .line 105
    .line 106
    const-string v0, "tantan_growth"

    .line 107
    .line 108
    invoke-static {v0, p0}, Ll/w0c;->O(Ljava/lang/String;Ll/scj;)V

    .line 109
    .line 110
    .line 111
    new-instance p0, Ll/s87;

    .line 112
    .line 113
    invoke-direct {p0}, Ll/s87;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v0, "tantan_verification"

    .line 117
    .line 118
    invoke-static {v0, p0}, Ll/w0c;->O(Ljava/lang/String;Ll/scj;)V

    .line 119
    .line 120
    .line 121
    new-instance p0, Ll/t87;

    .line 122
    .line 123
    invoke-direct {p0}, Ll/t87;-><init>()V

    .line 124
    .line 125
    .line 126
    const-string v0, "tantan_swipe"

    .line 127
    .line 128
    invoke-static {v0, p0}, Ll/w0c;->O(Ljava/lang/String;Ll/scj;)V

    .line 129
    .line 130
    .line 131
    new-instance p0, Ll/u87;

    .line 132
    .line 133
    invoke-direct {p0}, Ll/u87;-><init>()V

    .line 134
    .line 135
    .line 136
    const-string v0, "tantan_commercialize"

    .line 137
    .line 138
    invoke-static {v0, p0}, Ll/w0c;->O(Ljava/lang/String;Ll/scj;)V

    .line 139
    .line 140
    .line 141
    new-instance p0, Ll/n97;

    .line 142
    .line 143
    invoke-direct {p0}, Ll/n97;-><init>()V

    .line 144
    .line 145
    .line 146
    const-string v0, "tantan_settings"

    .line 147
    .line 148
    invoke-static {v0, p0}, Ll/w0c;->O(Ljava/lang/String;Ll/scj;)V

    .line 149
    .line 150
    .line 151
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 152
    .line 153
    invoke-static {p0}, Lcom/p1/mobile/putong/core/app/LocalChangedListener;->register(Landroid/content/Context;)V

    .line 154
    .line 155
    .line 156
    sget-object p0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->UNKNOWN:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 157
    .line 158
    return-void
.end method

.method public Wn()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Ee()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/r8f0;->f()Ll/r8f0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/r8f0;->i(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/bze;->h()Ll/bze;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/bze;->e()V

    .line 28
    .line 29
    .line 30
    new-instance p0, Ll/o87;

    .line 31
    .line 32
    invoke-direct {p0}, Ll/o87;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitAllTags:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 39
    .line 40
    filled-new-array {p0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/gj40;->S()V

    .line 52
    .line 53
    .line 54
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/s7a;->p()Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/br60;->A()V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method public final f0()V
    .locals 0

    .line 1
    return-void
.end method

.method public ft()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final g0()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 6
    .line 7
    sput-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->f:Ll/ya7;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/wr2;->a(Ll/wr2$a;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h0(JJ)Z
    .locals 2

    .line 1
    new-instance p0, Ll/m8c;

    .line 2
    .line 3
    const-string v0, "yy/MM/dd"

    .line 4
    .line 5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0, v0, v1}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Ljava/util/Date;

    .line 17
    .line 18
    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance p2, Ljava/util/Date;

    .line 26
    .line 27
    invoke-direct {p2, p3, p4}, Ljava/util/Date;-><init>(J)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/app/Application;

    .line 2
    .line 3
    sput-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 14

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/Exception;

    .line 4
    .line 5
    const-string p1, "return null envelope"

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p1, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p4:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 11
    .line 12
    const/16 v0, 0x64

    .line 13
    .line 14
    const-string v1, "core_business_module_api_parse_complete"

    .line 15
    .line 16
    invoke-static {p0, v1, p1, v0}, Lcom/tantanapp/common/utils/CrashHelper;->i(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 23
    .line 24
    .line 25
    new-instance v1, Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 33
    .line 34
    .line 35
    const-class v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 36
    .line 37
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 42
    .line 43
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    if-eqz v5, :cond_2

    .line 54
    .line 55
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 60
    .line 61
    if-nez v5, :cond_1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-object v6, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v7, v5, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 67
    .line 68
    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    iget-object v6, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v2, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    check-cast v4, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 84
    .line 85
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-eqz v5, :cond_4

    .line 96
    .line 97
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    check-cast v5, Lcom/p1/mobile/putong/data/Relationship;

    .line 102
    .line 103
    if-nez v5, :cond_3

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    iget-object v6, v5, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v0, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_4
    new-instance v4, Ljava/util/HashMap;

    .line 113
    .line 114
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    if-eqz v5, :cond_6

    .line 126
    .line 127
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    invoke-interface {v5, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Pn(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    if-nez v6, :cond_6

    .line 140
    .line 141
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    if-eqz v6, :cond_6

    .line 150
    .line 151
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    check-cast v6, Lcom/p1/mobile/putong/data/Followship;

    .line 156
    .line 157
    if-nez v6, :cond_5

    .line 158
    .line 159
    goto :goto_2

    .line 160
    :cond_5
    iget-object v7, v6, Lcom/p1/mobile/putong/data/Followship;->otherUser:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v4, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    goto :goto_2

    .line 166
    :cond_6
    const-class v5, Lcom/p1/mobile/putong/data/CommonData;

    .line 167
    .line 168
    invoke-virtual {p1, v5}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    check-cast v6, Lcom/p1/mobile/putong/data/CommonData;

    .line 173
    .line 174
    iget-object v6, v6, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 175
    .line 176
    invoke-virtual {p1, v5}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    check-cast v7, Lcom/p1/mobile/putong/data/CommonData;

    .line 181
    .line 182
    iget-object v7, v7, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 183
    .line 184
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 185
    .line 186
    .line 187
    move-result-object v7

    .line 188
    :cond_7
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 189
    .line 190
    .line 191
    move-result v8

    .line 192
    if-eqz v8, :cond_14

    .line 193
    .line 194
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v8

    .line 198
    check-cast v8, Lcom/p1/mobile/putong/data/User;

    .line 199
    .line 200
    if-nez v8, :cond_8

    .line 201
    .line 202
    goto :goto_3

    .line 203
    :cond_8
    invoke-virtual {v4}, Ljava/util/HashMap;->size()I

    .line 204
    .line 205
    .line 206
    move-result v9

    .line 207
    if-eqz v9, :cond_9

    .line 208
    .line 209
    iget-object v9, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {v4, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v9

    .line 215
    check-cast v9, Lcom/p1/mobile/putong/data/Followship;

    .line 216
    .line 217
    iput-object v9, v8, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 218
    .line 219
    :cond_9
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 220
    .line 221
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v9

    .line 225
    const/4 v10, 0x0

    .line 226
    if-eqz v9, :cond_b

    .line 227
    .line 228
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 229
    .line 230
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 231
    .line 232
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    move-result v9

    .line 236
    if-eqz v9, :cond_b

    .line 237
    .line 238
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 239
    .line 240
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 241
    .line 242
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 243
    .line 244
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result v9

    .line 248
    if-eqz v9, :cond_b

    .line 249
    .line 250
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 251
    .line 252
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 253
    .line 254
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 255
    .line 256
    iget-object v9, v9, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 257
    .line 258
    invoke-static {v9}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 259
    .line 260
    .line 261
    move-result v9

    .line 262
    if-nez v9, :cond_b

    .line 263
    .line 264
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 265
    .line 266
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 267
    .line 268
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 269
    .line 270
    iget-object v9, v9, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 271
    .line 272
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 273
    .line 274
    .line 275
    move-result v9

    .line 276
    const/4 v11, 0x3

    .line 277
    if-le v9, v11, :cond_b

    .line 278
    .line 279
    new-instance v9, Ljava/util/ArrayList;

    .line 280
    .line 281
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 282
    .line 283
    .line 284
    move v12, v10

    .line 285
    :goto_4
    iget-object v13, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 286
    .line 287
    if-ge v12, v11, :cond_a

    .line 288
    .line 289
    iget-object v13, v13, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 290
    .line 291
    iget-object v13, v13, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 292
    .line 293
    iget-object v13, v13, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 294
    .line 295
    invoke-interface {v13, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object v13

    .line 299
    check-cast v13, Ljava/lang/String;

    .line 300
    .line 301
    invoke-interface {v9, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    add-int/lit8 v12, v12, 0x1

    .line 305
    .line 306
    goto :goto_4

    .line 307
    :cond_a
    iget-object v11, v13, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 308
    .line 309
    iget-object v11, v11, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 310
    .line 311
    iput-object v9, v11, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 312
    .line 313
    :cond_b
    if-eqz v6, :cond_c

    .line 314
    .line 315
    iget-object v9, v6, Lcom/p1/mobile/putong/data/UserActivityInfo;->userId:Ljava/lang/String;

    .line 316
    .line 317
    iget-object v11, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 318
    .line 319
    invoke-static {v9, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 320
    .line 321
    .line 322
    move-result v9

    .line 323
    if-eqz v9, :cond_c

    .line 324
    .line 325
    iput-object v6, v8, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 326
    .line 327
    :cond_c
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 328
    .line 329
    .line 330
    move-result v9

    .line 331
    if-eqz v9, :cond_f

    .line 332
    .line 333
    iget-object v9, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 334
    .line 335
    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v9

    .line 339
    if-eqz v9, :cond_f

    .line 340
    .line 341
    iget-object v9, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 342
    .line 343
    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    .line 345
    .line 346
    move-result-object v9

    .line 347
    check-cast v9, Lcom/p1/mobile/putong/data/Relationship;

    .line 348
    .line 349
    iput-object v9, v8, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 350
    .line 351
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    .line 352
    .line 353
    .line 354
    move-result v9

    .line 355
    if-eqz v9, :cond_d

    .line 356
    .line 357
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 358
    .line 359
    iget-object v11, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 360
    .line 361
    invoke-virtual {v1, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object v11

    .line 365
    check-cast v11, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 366
    .line 367
    iput-object v11, v9, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 368
    .line 369
    :cond_d
    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    .line 370
    .line 371
    .line 372
    move-result v9

    .line 373
    if-eqz v9, :cond_e

    .line 374
    .line 375
    iget-object v9, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 376
    .line 377
    invoke-virtual {v2, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    .line 379
    .line 380
    move-result-object v9

    .line 381
    check-cast v9, Ljava/lang/CharSequence;

    .line 382
    .line 383
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 384
    .line 385
    .line 386
    move-result v9

    .line 387
    if-nez v9, :cond_e

    .line 388
    .line 389
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 390
    .line 391
    iget-object v11, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 392
    .line 393
    invoke-virtual {v2, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    .line 395
    .line 396
    move-result-object v11

    .line 397
    check-cast v11, Ljava/lang/String;

    .line 398
    .line 399
    iput-object v11, v9, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 400
    .line 401
    goto :goto_5

    .line 402
    :cond_e
    sget-object v9, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 403
    .line 404
    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 405
    .line 406
    iget-object v11, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 407
    .line 408
    invoke-virtual {v9, v11}, Ll/dkb;->Q9(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 409
    .line 410
    .line 411
    move-result-object v9

    .line 412
    if-eqz v9, :cond_f

    .line 413
    .line 414
    iget-object v11, v9, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 415
    .line 416
    if-eqz v11, :cond_f

    .line 417
    .line 418
    iget-object v11, v11, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 419
    .line 420
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 421
    .line 422
    .line 423
    move-result v11

    .line 424
    if-nez v11, :cond_f

    .line 425
    .line 426
    iget-object v11, v8, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 427
    .line 428
    iget-object v9, v9, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 429
    .line 430
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 431
    .line 432
    iput-object v9, v11, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 433
    .line 434
    :cond_f
    :goto_5
    invoke-static {}, Ll/gra;->Y1()Z

    .line 435
    .line 436
    .line 437
    move-result v9

    .line 438
    if-eqz v9, :cond_7

    .line 439
    .line 440
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 441
    .line 442
    if-eqz v9, :cond_7

    .line 443
    .line 444
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 445
    .line 446
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 447
    .line 448
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 449
    .line 450
    iget-object v9, v9, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->idealType:Ljava/util/List;

    .line 451
    .line 452
    if-eqz v9, :cond_11

    .line 453
    .line 454
    invoke-static {v9}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 455
    .line 456
    .line 457
    move-result v9

    .line 458
    iget-object v11, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 459
    .line 460
    if-eqz v9, :cond_10

    .line 461
    .line 462
    iget-object v9, v11, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 463
    .line 464
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 465
    .line 466
    new-array v10, v10, [Lcom/p1/mobile/putong/data/IdealTag;

    .line 467
    .line 468
    invoke-static {v10}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 469
    .line 470
    .line 471
    move-result-object v10

    .line 472
    iput-object v10, v9, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 473
    .line 474
    goto :goto_6

    .line 475
    :cond_10
    iget-object v9, v11, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 476
    .line 477
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 478
    .line 479
    iget-object v9, v9, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->idealType:Ljava/util/List;

    .line 480
    .line 481
    new-instance v10, Ll/b97;

    .line 482
    .line 483
    invoke-direct {v10, v8}, Ll/b97;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 484
    .line 485
    .line 486
    invoke-static {v9, v10}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 487
    .line 488
    .line 489
    move-result-object v9

    .line 490
    new-instance v10, Ll/c97;

    .line 491
    .line 492
    invoke-direct {v10}, Ll/c97;-><init>()V

    .line 493
    .line 494
    .line 495
    invoke-static {v9, v10}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 496
    .line 497
    .line 498
    move-result-object v9

    .line 499
    invoke-static {v9}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 500
    .line 501
    .line 502
    move-result v10

    .line 503
    if-nez v10, :cond_11

    .line 504
    .line 505
    iget-object v10, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 506
    .line 507
    iget-object v10, v10, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 508
    .line 509
    iget-object v10, v10, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 510
    .line 511
    iput-object v9, v10, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 512
    .line 513
    :cond_11
    :goto_6
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 514
    .line 515
    iget-object v9, v9, Lcom/p1/mobile/putong/data/UserIdealInfo;->mediaTagIdeal:Ljava/util/List;

    .line 516
    .line 517
    invoke-static {v9}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 518
    .line 519
    .line 520
    move-result v9

    .line 521
    if-nez v9, :cond_7

    .line 522
    .line 523
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 524
    .line 525
    iget-object v9, v9, Lcom/p1/mobile/putong/data/UserIdealInfo;->mediaTagIdeal:Ljava/util/List;

    .line 526
    .line 527
    if-eqz v9, :cond_12

    .line 528
    .line 529
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 530
    .line 531
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 532
    .line 533
    .line 534
    move-result-object v9

    .line 535
    :goto_7
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 536
    .line 537
    .line 538
    move-result v10

    .line 539
    if-eqz v10, :cond_12

    .line 540
    .line 541
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 542
    .line 543
    .line 544
    move-result-object v10

    .line 545
    check-cast v10, Lcom/p1/mobile/putong/data/Media;

    .line 546
    .line 547
    new-instance v11, Ljava/util/ArrayList;

    .line 548
    .line 549
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 550
    .line 551
    .line 552
    iput-object v11, v10, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 553
    .line 554
    goto :goto_7

    .line 555
    :cond_12
    iget-object v9, v8, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 556
    .line 557
    iget-object v9, v9, Lcom/p1/mobile/putong/data/UserIdealInfo;->mediaTagIdeal:Ljava/util/List;

    .line 558
    .line 559
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 560
    .line 561
    .line 562
    move-result-object v9

    .line 563
    :cond_13
    :goto_8
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 564
    .line 565
    .line 566
    move-result v10

    .line 567
    if-eqz v10, :cond_7

    .line 568
    .line 569
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 570
    .line 571
    .line 572
    move-result-object v10

    .line 573
    check-cast v10, Lcom/p1/mobile/putong/data/PictureIdealInfo;

    .line 574
    .line 575
    iget v11, v10, Lcom/p1/mobile/putong/data/PictureIdealInfo;->index:I

    .line 576
    .line 577
    iget-object v12, v8, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 578
    .line 579
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 580
    .line 581
    .line 582
    move-result v12

    .line 583
    if-ge v11, v12, :cond_13

    .line 584
    .line 585
    iget-object v11, v10, Lcom/p1/mobile/putong/data/PictureIdealInfo;->idealTypes:Ljava/util/List;

    .line 586
    .line 587
    new-instance v12, Ll/d97;

    .line 588
    .line 589
    invoke-direct {v12}, Ll/d97;-><init>()V

    .line 590
    .line 591
    .line 592
    invoke-static {v11, v12}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 593
    .line 594
    .line 595
    move-result-object v11

    .line 596
    invoke-static {v11}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 597
    .line 598
    .line 599
    move-result v12

    .line 600
    if-nez v12, :cond_13

    .line 601
    .line 602
    iget-object v12, v8, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 603
    .line 604
    iget v10, v10, Lcom/p1/mobile/putong/data/PictureIdealInfo;->index:I

    .line 605
    .line 606
    invoke-interface {v12, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 607
    .line 608
    .line 609
    move-result-object v10

    .line 610
    check-cast v10, Lcom/p1/mobile/putong/data/Media;

    .line 611
    .line 612
    iput-object v11, v10, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 613
    .line 614
    goto :goto_8

    .line 615
    :cond_14
    invoke-static {}, Ll/gra;->V1()Z

    .line 616
    .line 617
    .line 618
    move-result v0

    .line 619
    if-eqz v0, :cond_28

    .line 620
    .line 621
    new-instance v0, Ljava/util/HashMap;

    .line 622
    .line 623
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 624
    .line 625
    .line 626
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 627
    .line 628
    .line 629
    move-result-object v1

    .line 630
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 631
    .line 632
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 633
    .line 634
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 635
    .line 636
    .line 637
    move-result v1

    .line 638
    if-nez v1, :cond_17

    .line 639
    .line 640
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 641
    .line 642
    .line 643
    move-result-object v1

    .line 644
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 645
    .line 646
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 647
    .line 648
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 649
    .line 650
    .line 651
    move-result-object v1

    .line 652
    :cond_15
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 653
    .line 654
    .line 655
    move-result v2

    .line 656
    if-eqz v2, :cond_17

    .line 657
    .line 658
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 659
    .line 660
    .line 661
    move-result-object v2

    .line 662
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 663
    .line 664
    if-nez v2, :cond_16

    .line 665
    .line 666
    goto :goto_9

    .line 667
    :cond_16
    invoke-static {v2}, Ll/pm6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 668
    .line 669
    .line 670
    move-result v4

    .line 671
    if-eqz v4, :cond_15

    .line 672
    .line 673
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 674
    .line 675
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 676
    .line 677
    invoke-virtual {v0, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 678
    .line 679
    .line 680
    goto :goto_9

    .line 681
    :cond_17
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 682
    .line 683
    .line 684
    move-result-object v1

    .line 685
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 686
    .line 687
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 688
    .line 689
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 690
    .line 691
    .line 692
    move-result v1

    .line 693
    if-nez v1, :cond_1a

    .line 694
    .line 695
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 696
    .line 697
    .line 698
    move-result-object v1

    .line 699
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 700
    .line 701
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 702
    .line 703
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 704
    .line 705
    .line 706
    move-result-object v1

    .line 707
    :cond_18
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 708
    .line 709
    .line 710
    move-result v2

    .line 711
    if-eqz v2, :cond_1a

    .line 712
    .line 713
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 714
    .line 715
    .line 716
    move-result-object v2

    .line 717
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 718
    .line 719
    if-nez v2, :cond_19

    .line 720
    .line 721
    goto :goto_a

    .line 722
    :cond_19
    iget-object v4, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 723
    .line 724
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 725
    .line 726
    .line 727
    move-result-object v4

    .line 728
    check-cast v4, Ljava/lang/String;

    .line 729
    .line 730
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 731
    .line 732
    .line 733
    move-result v6

    .line 734
    if-nez v6, :cond_18

    .line 735
    .line 736
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 737
    .line 738
    goto :goto_a

    .line 739
    :cond_1a
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 740
    .line 741
    .line 742
    move-result-object v1

    .line 743
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 744
    .line 745
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 746
    .line 747
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 748
    .line 749
    .line 750
    move-result v1

    .line 751
    if-nez v1, :cond_1d

    .line 752
    .line 753
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 754
    .line 755
    .line 756
    move-result-object v1

    .line 757
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 758
    .line 759
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 760
    .line 761
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 762
    .line 763
    .line 764
    move-result-object v1

    .line 765
    :cond_1b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 766
    .line 767
    .line 768
    move-result v2

    .line 769
    if-eqz v2, :cond_1d

    .line 770
    .line 771
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 772
    .line 773
    .line 774
    move-result-object v2

    .line 775
    check-cast v2, Lcom/p1/mobile/putong/core/data/Message;

    .line 776
    .line 777
    if-nez v2, :cond_1c

    .line 778
    .line 779
    goto :goto_b

    .line 780
    :cond_1c
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 781
    .line 782
    const-string v6, "group"

    .line 783
    .line 784
    invoke-static {v4, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 785
    .line 786
    .line 787
    move-result v4

    .line 788
    if-eqz v4, :cond_1b

    .line 789
    .line 790
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 791
    .line 792
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 793
    .line 794
    .line 795
    move-result-object v4

    .line 796
    check-cast v4, Ljava/lang/String;

    .line 797
    .line 798
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 799
    .line 800
    .line 801
    move-result v6

    .line 802
    if-nez v6, :cond_1b

    .line 803
    .line 804
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 805
    .line 806
    goto :goto_b

    .line 807
    :cond_1d
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 808
    .line 809
    .line 810
    move-result-object v0

    .line 811
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 812
    .line 813
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 814
    .line 815
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 816
    .line 817
    .line 818
    move-result v0

    .line 819
    if-nez v0, :cond_1f

    .line 820
    .line 821
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 822
    .line 823
    .line 824
    move-result-object v0

    .line 825
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 826
    .line 827
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 828
    .line 829
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 830
    .line 831
    .line 832
    move-result-object v0

    .line 833
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 834
    .line 835
    .line 836
    move-result v1

    .line 837
    if-eqz v1, :cond_1f

    .line 838
    .line 839
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 840
    .line 841
    .line 842
    move-result-object v1

    .line 843
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 844
    .line 845
    if-nez v1, :cond_1e

    .line 846
    .line 847
    goto :goto_c

    .line 848
    :cond_1e
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->y0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 849
    .line 850
    .line 851
    goto :goto_c

    .line 852
    :cond_1f
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 853
    .line 854
    .line 855
    move-result-object v0

    .line 856
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 857
    .line 858
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    .line 859
    .line 860
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 861
    .line 862
    .line 863
    move-result v0

    .line 864
    if-nez v0, :cond_21

    .line 865
    .line 866
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 867
    .line 868
    .line 869
    move-result-object v0

    .line 870
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 871
    .line 872
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    .line 873
    .line 874
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 875
    .line 876
    .line 877
    move-result-object v0

    .line 878
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 879
    .line 880
    .line 881
    move-result v1

    .line 882
    if-eqz v1, :cond_21

    .line 883
    .line 884
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 885
    .line 886
    .line 887
    move-result-object v1

    .line 888
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 889
    .line 890
    if-nez v1, :cond_20

    .line 891
    .line 892
    goto :goto_d

    .line 893
    :cond_20
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->y0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 894
    .line 895
    .line 896
    goto :goto_d

    .line 897
    :cond_21
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 898
    .line 899
    .line 900
    move-result-object p0

    .line 901
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 902
    .line 903
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    .line 904
    .line 905
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 906
    .line 907
    .line 908
    move-result p0

    .line 909
    if-nez p0, :cond_28

    .line 910
    .line 911
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 912
    .line 913
    .line 914
    move-result-object p0

    .line 915
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 916
    .line 917
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 918
    .line 919
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 920
    .line 921
    .line 922
    move-result p0

    .line 923
    if-eqz p0, :cond_22

    .line 924
    .line 925
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 926
    .line 927
    goto :goto_e

    .line 928
    :cond_22
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 929
    .line 930
    .line 931
    move-result-object p0

    .line 932
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 933
    .line 934
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 935
    .line 936
    :goto_e
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 937
    .line 938
    .line 939
    move-result-object v0

    .line 940
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 941
    .line 942
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 943
    .line 944
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 945
    .line 946
    .line 947
    move-result v0

    .line 948
    if-eqz v0, :cond_23

    .line 949
    .line 950
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 951
    .line 952
    goto :goto_f

    .line 953
    :cond_23
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 954
    .line 955
    .line 956
    move-result-object v0

    .line 957
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 958
    .line 959
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 960
    .line 961
    :goto_f
    invoke-virtual {p1, v5}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 962
    .line 963
    .line 964
    move-result-object v1

    .line 965
    check-cast v1, Lcom/p1/mobile/putong/data/CommonData;

    .line 966
    .line 967
    iget-object v1, v1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 968
    .line 969
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 970
    .line 971
    .line 972
    move-result v1

    .line 973
    if-eqz v1, :cond_24

    .line 974
    .line 975
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 976
    .line 977
    goto :goto_10

    .line 978
    :cond_24
    invoke-virtual {p1, v5}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 979
    .line 980
    .line 981
    move-result-object v1

    .line 982
    check-cast v1, Lcom/p1/mobile/putong/data/CommonData;

    .line 983
    .line 984
    iget-object v1, v1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 985
    .line 986
    :goto_10
    new-instance v2, Ljava/util/ArrayList;

    .line 987
    .line 988
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 989
    .line 990
    .line 991
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 992
    .line 993
    .line 994
    move-result-object v4

    .line 995
    check-cast v4, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 996
    .line 997
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    .line 998
    .line 999
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 1000
    .line 1001
    .line 1002
    move-result-object v4

    .line 1003
    :cond_25
    :goto_11
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 1004
    .line 1005
    .line 1006
    move-result v5

    .line 1007
    if-eqz v5, :cond_27

    .line 1008
    .line 1009
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1010
    .line 1011
    .line 1012
    move-result-object v5

    .line 1013
    check-cast v5, Lcom/p1/mobile/putong/core/data/GroupNotification;

    .line 1014
    .line 1015
    if-nez v5, :cond_26

    .line 1016
    .line 1017
    goto :goto_11

    .line 1018
    :cond_26
    const-string v6, "join_group_apply"

    .line 1019
    .line 1020
    iget-object v7, v5, Lcom/p1/mobile/putong/core/data/GroupNotification;->type:Ljava/lang/String;

    .line 1021
    .line 1022
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1023
    .line 1024
    .line 1025
    move-result v6

    .line 1026
    if-eqz v6, :cond_25

    .line 1027
    .line 1028
    new-instance v6, Ll/e97;

    .line 1029
    .line 1030
    invoke-direct {v6, v5}, Ll/e97;-><init>(Lcom/p1/mobile/putong/core/data/GroupNotification;)V

    .line 1031
    .line 1032
    .line 1033
    invoke-static {p0, v6}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 1034
    .line 1035
    .line 1036
    move-result-object v6

    .line 1037
    check-cast v6, Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 1038
    .line 1039
    iput-object v6, v5, Lcom/p1/mobile/putong/core/data/GroupNotification;->groupApplyData:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 1040
    .line 1041
    new-instance v6, Ll/f97;

    .line 1042
    .line 1043
    invoke-direct {v6, v5}, Ll/f97;-><init>(Lcom/p1/mobile/putong/core/data/GroupNotification;)V

    .line 1044
    .line 1045
    .line 1046
    invoke-static {v0, v6}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 1047
    .line 1048
    .line 1049
    move-result-object v6

    .line 1050
    check-cast v6, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 1051
    .line 1052
    iput-object v6, v5, Lcom/p1/mobile/putong/core/data/GroupNotification;->chatGroupData:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 1053
    .line 1054
    new-instance v6, Ll/g97;

    .line 1055
    .line 1056
    invoke-direct {v6, v5}, Ll/g97;-><init>(Lcom/p1/mobile/putong/core/data/GroupNotification;)V

    .line 1057
    .line 1058
    .line 1059
    invoke-static {v1, v6}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 1060
    .line 1061
    .line 1062
    move-result-object v6

    .line 1063
    check-cast v6, Lcom/p1/mobile/putong/data/User;

    .line 1064
    .line 1065
    iput-object v6, v5, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 1066
    .line 1067
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1068
    .line 1069
    .line 1070
    goto :goto_11

    .line 1071
    :cond_27
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 1072
    .line 1073
    .line 1074
    move-result-object p0

    .line 1075
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 1076
    .line 1077
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    .line 1078
    .line 1079
    :cond_28
    invoke-static {p1}, Ll/s75;->q(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 1080
    .line 1081
    .line 1082
    invoke-static {p1}, Ll/fcp;->w(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 1083
    .line 1084
    .line 1085
    return-void
.end method

.method public final synthetic l0(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->A0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/tx0;->P()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public ms()V
    .locals 3

    .line 1
    const-string p0, "live_region_tag_"

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequestsAndStop()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequestsAndStop()V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Fe()V

    .line 20
    .line 21
    .line 22
    sget-object v0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->R()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/wrf0;->j()V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/upm;->Y()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/nh00;->a()V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/x19;->w()Ll/x19;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/x19;->u()V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/ts8;->b()Ll/ts8;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/ts8;->a()V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/g7d0;->d0()V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/gp/a;->h()V

    .line 58
    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    sput-boolean v0, Ll/b240;->X0:Z

    .line 62
    .line 63
    invoke-static {}, Ll/z5h0;->t()V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Ll/xzm0;->z()V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/xzm0;->s()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_0

    .line 82
    .line 83
    invoke-static {}, Ll/wyb0;->s0()V

    .line 84
    .line 85
    .line 86
    :cond_0
    invoke-static {}, Ll/y63;->j()Ll/y63;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/y63;->t()V

    .line 91
    .line 92
    .line 93
    invoke-static {}, Ll/n9;->j()Ll/n9;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Ll/n9;->s()V

    .line 98
    .line 99
    .line 100
    invoke-static {}, Ll/zsb;->f()Ll/zsb;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ll/zsb;->j()V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Ll/a8d0;->F0()V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->e0()V

    .line 111
    .line 112
    .line 113
    invoke-static {}, Ll/xzc0;->O()V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->i()Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->p()V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Ll/yti0;->k()V

    .line 124
    .line 125
    .line 126
    invoke-static {}, Ll/t4j;->j()V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Ll/uqx;->y()V

    .line 130
    .line 131
    .line 132
    invoke-static {}, Ll/fp60;->F()V

    .line 133
    .line 134
    .line 135
    invoke-static {}, Ll/vj30;->t()V

    .line 136
    .line 137
    .line 138
    sget-object v0, Ll/yyh0;->INSTANCE:Ll/yyh0;

    .line 139
    .line 140
    invoke-virtual {v0}, Ll/yyh0;->j()V

    .line 141
    .line 142
    .line 143
    invoke-static {}, Ll/ktl0;->I0()V

    .line 144
    .line 145
    .line 146
    invoke-static {}, Ll/s8d0;->k()V

    .line 147
    .line 148
    .line 149
    invoke-static {}, Ll/b5d0;->a()V

    .line 150
    .line 151
    .line 152
    invoke-static {}, Ll/qk60;->c()V

    .line 153
    .line 154
    .line 155
    invoke-static {}, Ll/ueh0;->p()V

    .line 156
    .line 157
    .line 158
    invoke-static {}, Ll/mwl0;->a()V

    .line 159
    .line 160
    .line 161
    invoke-static {}, Ll/d09;->m()Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_1

    .line 166
    .line 167
    invoke-static {}, Ll/d09;->n()Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_2

    .line 172
    .line 173
    :cond_1
    invoke-static {}, Ll/of7;->o()Ll/of7;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v0}, Ll/of7;->n()V

    .line 178
    .line 179
    .line 180
    :cond_2
    invoke-static {}, Ll/a5i0;->F0()V

    .line 181
    .line 182
    .line 183
    invoke-static {}, Ll/lq40;->b()V

    .line 184
    .line 185
    .line 186
    invoke-static {}, Ll/yie0;->r()V

    .line 187
    .line 188
    .line 189
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->g()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_3

    .line 194
    .line 195
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v0}, Ll/o3z;->m()V

    .line 200
    .line 201
    .line 202
    :cond_3
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {v0}, Ll/ijj;->d()V

    .line 207
    .line 208
    .line 209
    invoke-static {}, Ll/z90;->c()V

    .line 210
    .line 211
    .line 212
    invoke-static {}, Ll/wtd0;->m()V

    .line 213
    .line 214
    .line 215
    invoke-static {}, Ll/t450;->m()V

    .line 216
    .line 217
    .line 218
    invoke-static {}, Ll/i7d0;->c()V

    .line 219
    .line 220
    .line 221
    invoke-static {}, Ll/aw90;->l0()V

    .line 222
    .line 223
    .line 224
    invoke-static {}, Ll/j7d0;->e0()V

    .line 225
    .line 226
    .line 227
    invoke-static {}, Ll/p6d0;->i0()V

    .line 228
    .line 229
    .line 230
    invoke-static {}, Ll/b1a0;->e()V

    .line 231
    .line 232
    .line 233
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a0;->j()Lcom/p1/mobile/putong/core/api/a0;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/a0;->v()V

    .line 238
    .line 239
    .line 240
    invoke-static {}, Ll/rcn;->q()Ll/rcn;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    invoke-virtual {v0}, Ll/rcn;->w()V

    .line 245
    .line 246
    .line 247
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/gp/a;->p()V

    .line 252
    .line 253
    .line 254
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v0}, Ll/r8n;->o()V

    .line 259
    .line 260
    .line 261
    invoke-static {}, Ll/fcp;->i()Ll/fcp;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    invoke-virtual {v0}, Ll/fcp;->v()V

    .line 266
    .line 267
    .line 268
    sget-object v0, Ll/bep;->INSTANCE:Ll/bep;

    .line 269
    .line 270
    invoke-virtual {v0}, Ll/bep;->m()V

    .line 271
    .line 272
    .line 273
    sget-object v0, Ll/udo;->INSTANCE:Ll/udo;

    .line 274
    .line 275
    invoke-virtual {v0}, Ll/udo;->c()V

    .line 276
    .line 277
    .line 278
    sget-object v0, Ll/sp0;->INSTANCE:Ll/sp0;

    .line 279
    .line 280
    invoke-virtual {v0}, Ll/sp0;->b()V

    .line 281
    .line 282
    .line 283
    sget-object v0, Ll/ur40;->INSTANCE:Ll/ur40;

    .line 284
    .line 285
    invoke-virtual {v0}, Ll/ur40;->i()V

    .line 286
    .line 287
    .line 288
    invoke-static {}, Ll/k7d0;->c0()V

    .line 289
    .line 290
    .line 291
    invoke-static {}, Ll/kde0;->o()Ll/kde0;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-virtual {v0}, Ll/kde0;->v()V

    .line 296
    .line 297
    .line 298
    invoke-static {}, Ll/ud2;->j()Ll/ud2;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v0}, Ll/ud2;->m()V

    .line 303
    .line 304
    .line 305
    invoke-static {}, Ll/d09;->g()Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-eqz v0, :cond_4

    .line 310
    .line 311
    invoke-static {}, Ll/uih0;->c1()V

    .line 312
    .line 313
    .line 314
    :cond_4
    invoke-static {}, Ll/wgb0;->c()V

    .line 315
    .line 316
    .line 317
    invoke-static {}, Ll/zg6;->g()V

    .line 318
    .line 319
    .line 320
    invoke-static {}, Ll/h7d0;->m0()Z

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    if-eqz v0, :cond_5

    .line 325
    .line 326
    invoke-static {}, Ll/h7d0;->o0()V

    .line 327
    .line 328
    .line 329
    :cond_5
    invoke-static {}, Ll/x5l0;->j()V

    .line 330
    .line 331
    .line 332
    invoke-static {}, Ll/eqq0;->m()V

    .line 333
    .line 334
    .line 335
    invoke-static {}, Ll/xje0;->e()V

    .line 336
    .line 337
    .line 338
    invoke-static {}, Ll/d7d0;->f()V

    .line 339
    .line 340
    .line 341
    invoke-static {}, Ll/bpe0;->g()V

    .line 342
    .line 343
    .line 344
    invoke-static {}, Ll/k190;->b()V

    .line 345
    .line 346
    .line 347
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 348
    .line 349
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 350
    .line 351
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c0;->s()V

    .line 352
    .line 353
    .line 354
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 355
    .line 356
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 357
    .line 358
    iget-object v0, v0, Ll/kua;->T:Ll/byd0;

    .line 359
    .line 360
    const-wide/16 v1, 0x0

    .line 361
    .line 362
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 363
    .line 364
    .line 365
    move-result-object v1

    .line 366
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 367
    .line 368
    .line 369
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/b;->z()V

    .line 370
    .line 371
    .line 372
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->O()V

    .line 373
    .line 374
    .line 375
    invoke-static {}, Ll/wkh0;->e()V

    .line 376
    .line 377
    .line 378
    invoke-static {}, Ll/rv4;->c()V

    .line 379
    .line 380
    .line 381
    invoke-static {}, Ll/uj4;->d()V

    .line 382
    .line 383
    .line 384
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->o()V

    .line 389
    .line 390
    .line 391
    invoke-static {}, Ll/k05;->r()V

    .line 392
    .line 393
    .line 394
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 395
    .line 396
    .line 397
    move-result-object v0

    .line 398
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 399
    .line 400
    .line 401
    move-result v0

    .line 402
    if-eqz v0, :cond_6

    .line 403
    .line 404
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/poplevel/a;->m()V

    .line 409
    .line 410
    .line 411
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 416
    .line 417
    .line 418
    move-result-object v0

    .line 419
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->fl()V

    .line 420
    .line 421
    .line 422
    invoke-static {}, Ll/vih0;->f()V

    .line 423
    .line 424
    .line 425
    invoke-static {}, Ll/ebm;->c()V

    .line 426
    .line 427
    .line 428
    invoke-static {}, Ll/wek0;->l()V

    .line 429
    .line 430
    .line 431
    invoke-static {}, Ll/nvm;->y()V

    .line 432
    .line 433
    .line 434
    invoke-static {}, Ll/en4;->i()V

    .line 435
    .line 436
    .line 437
    invoke-static {}, Ll/fdw;->j()V

    .line 438
    .line 439
    .line 440
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->i:Ll/kcg0;

    .line 441
    .line 442
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 443
    .line 444
    .line 445
    move-result v0

    .line 446
    if-eqz v0, :cond_7

    .line 447
    .line 448
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->i:Ll/kcg0;

    .line 449
    .line 450
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 451
    .line 452
    .line 453
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->j:Ll/kcg0;

    .line 454
    .line 455
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 456
    .line 457
    .line 458
    move-result v0

    .line 459
    if-eqz v0, :cond_8

    .line 460
    .line 461
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->j:Ll/kcg0;

    .line 462
    .line 463
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 464
    .line 465
    .line 466
    :cond_8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 471
    .line 472
    .line 473
    move-result v0

    .line 474
    if-eqz v0, :cond_9

    .line 475
    .line 476
    invoke-static {}, Ll/e3i;->c()Ll/e3i;

    .line 477
    .line 478
    .line 479
    move-result-object v0

    .line 480
    invoke-virtual {v0}, Ll/e3i;->g()V

    .line 481
    .line 482
    .line 483
    :cond_9
    const/4 v0, 0x0

    .line 484
    sput-object v0, Lcom/p1/mobile/putong/core/CoreModule;->j:Ll/kcg0;

    .line 485
    .line 486
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    invoke-virtual {v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->b0()Ll/jni0;

    .line 491
    .line 492
    .line 493
    invoke-static {}, Lcom/p1/mobile/putong/core/api/e0;->g()V

    .line 494
    .line 495
    .line 496
    sget-object v0, Ll/jj40;->f:Ljava/util/Set;

    .line 497
    .line 498
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 499
    .line 500
    .line 501
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 502
    .line 503
    .line 504
    move-result-object v0

    .line 505
    invoke-virtual {v0}, Ll/gj40;->L()V

    .line 506
    .line 507
    .line 508
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 509
    .line 510
    .line 511
    move-result-object v0

    .line 512
    invoke-virtual {v0}, Ll/cl80;->p()V

    .line 513
    .line 514
    .line 515
    invoke-static {}, Ll/efh0;->j()Ll/efh0;

    .line 516
    .line 517
    .line 518
    move-result-object v0

    .line 519
    invoke-virtual {v0}, Ll/efh0;->m()V

    .line 520
    .line 521
    .line 522
    invoke-static {}, Ll/nzi0;->a()Ll/nzi0;

    .line 523
    .line 524
    .line 525
    move-result-object v0

    .line 526
    invoke-virtual {v0}, Ll/nzi0;->d()V

    .line 527
    .line 528
    .line 529
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 530
    .line 531
    invoke-virtual {v0}, Ll/gta;->b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;

    .line 532
    .line 533
    .line 534
    move-result-object v0

    .line 535
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;->wf()Z

    .line 536
    .line 537
    .line 538
    move-result v0

    .line 539
    if-eqz v0, :cond_a

    .line 540
    .line 541
    sget-object v0, Ll/qap;->Companion:Ll/qap$a;

    .line 542
    .line 543
    invoke-virtual {v0}, Ll/qap$a;->q()V

    .line 544
    .line 545
    .line 546
    :cond_a
    invoke-static {}, Ll/s7a;->k()Z

    .line 547
    .line 548
    .line 549
    move-result v0

    .line 550
    if-eqz v0, :cond_b

    .line 551
    .line 552
    invoke-static {}, Ll/xei;->k()V

    .line 553
    .line 554
    .line 555
    :cond_b
    invoke-static {}, Ll/s7a;->n()Z

    .line 556
    .line 557
    .line 558
    move-result v0

    .line 559
    if-eqz v0, :cond_c

    .line 560
    .line 561
    invoke-static {}, Ll/p550;->l()V

    .line 562
    .line 563
    .line 564
    :cond_c
    invoke-static {}, Ll/wgx;->A()Ll/wgx;

    .line 565
    .line 566
    .line 567
    move-result-object v0

    .line 568
    invoke-virtual {v0}, Ll/wgx;->I()V

    .line 569
    .line 570
    .line 571
    invoke-static {}, Ll/cs20;->a()Ll/cs20;

    .line 572
    .line 573
    .line 574
    move-result-object v0

    .line 575
    invoke-virtual {v0}, Ll/cs20;->g()V

    .line 576
    .line 577
    .line 578
    invoke-static {}, Ll/otm;->A()V

    .line 579
    .line 580
    .line 581
    invoke-static {}, Ll/yap;->l()V

    .line 582
    .line 583
    .line 584
    invoke-static {}, Ll/vyh0;->a()V

    .line 585
    .line 586
    .line 587
    invoke-static {}, Ll/bi40;->a()V

    .line 588
    .line 589
    .line 590
    invoke-static {}, Ll/bpc0;->b()V

    .line 591
    .line 592
    .line 593
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 594
    .line 595
    .line 596
    move-result-object v0

    .line 597
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v0

    .line 601
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 602
    .line 603
    .line 604
    move-result v1

    .line 605
    if-nez v1, :cond_d

    .line 606
    .line 607
    new-instance v1, Ll/wyd0;

    .line 608
    .line 609
    new-instance v2, Ljava/lang/StringBuilder;

    .line 610
    .line 611
    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 612
    .line 613
    .line 614
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 615
    .line 616
    .line 617
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 618
    .line 619
    .line 620
    move-result-object p0

    .line 621
    const-string v0, ""

    .line 622
    .line 623
    invoke-direct {v1, p0, v0}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 624
    .line 625
    .line 626
    invoke-virtual {v1}, Ll/wyd0;->clear()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 627
    .line 628
    .line 629
    :catch_0
    :cond_d
    return-void
.end method

.method public final n0()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlZKWVdYSktTUEdJWUUyVVFVQkNYNk1NWDdQWUJRQzE0IiwidyI6NDIwLCJoIjo0MjEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0MzQ1MTY1ODQ3ODUwNTg4NDE5fQ.webp"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/fsb0;->r0(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final o0()V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Ll/rd00;->d(Landroid/content/Context;)Ll/rd00;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/y8r;->a()Lcom/google/mlkit/nl/languageid/LanguageIdentifier;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "init"

    .line 11
    .line 12
    invoke-interface {v0, v1}, Lcom/google/mlkit/nl/languageid/LanguageIdentifier;->identifyLanguage(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Lcom/p1/mobile/putong/core/CoreBusinessModule$b;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule$b;-><init>(Lcom/p1/mobile/putong/core/CoreBusinessModule;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    :catch_0
    return-void
.end method

.method public final r0()V
    .locals 0

    .line 1
    new-instance p0, Ll/gra;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gra;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 7
    .line 8
    .line 9
    new-instance p0, Ll/spl0;

    .line 10
    .line 11
    invoke-direct {p0}, Ll/spl0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 15
    .line 16
    .line 17
    new-instance p0, Ll/d09;

    .line 18
    .line 19
    invoke-direct {p0}, Ll/d09;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/xg50;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/xg50;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 31
    .line 32
    .line 33
    new-instance p0, Ll/wcl0;

    .line 34
    .line 35
    invoke-direct {p0}, Ll/wcl0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Ll/d79;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/d79;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 47
    .line 48
    .line 49
    new-instance p0, Ll/g4a;

    .line 50
    .line 51
    invoke-direct {p0}, Ll/g4a;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 55
    .line 56
    .line 57
    new-instance p0, Ll/s7a;

    .line 58
    .line 59
    invoke-direct {p0}, Ll/s7a;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 63
    .line 64
    .line 65
    new-instance p0, Ll/t7a;

    .line 66
    .line 67
    invoke-direct {p0}, Ll/t7a;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 71
    .line 72
    .line 73
    new-instance p0, Ll/rs9;

    .line 74
    .line 75
    invoke-direct {p0}, Ll/rs9;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 79
    .line 80
    .line 81
    invoke-static {}, Ll/s75;->l()Ll/s75;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final t0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onInitSubscription:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 6
    .line 7
    new-instance v2, Ll/v87;

    .line 8
    .line 9
    invoke-direct {v2}, Ll/v87;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Ll/srf;->b(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v2, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onStopToBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 20
    .line 21
    new-instance v3, Ll/w87;

    .line 22
    .line 23
    invoke-direct {v3}, Ll/w87;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v2, v3}, Ll/srf;->b(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v2, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onResumeFromBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 34
    .line 35
    new-instance v3, Ll/x87;

    .line 36
    .line 37
    invoke-direct {v3}, Ll/x87;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v2, v3}, Ll/srf;->b(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget-object v2, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onResumeFromAppStartOrBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 48
    .line 49
    new-instance v3, Ll/y87;

    .line 50
    .line 51
    invoke-direct {v3, p0}, Ll/y87;-><init>(Lcom/p1/mobile/putong/core/CoreBusinessModule;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v2, v3}, Ll/srf;->b(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    new-instance v0, Ll/a97;

    .line 62
    .line 63
    invoke-direct {v0}, Ll/a97;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v1, v0}, Ll/srf;->b(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public tr(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->CoreAfterSignIn:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/tl9;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/tl9;-><init>()V

    .line 13
    .line 14
    .line 15
    sput-object v1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g:Ll/tl9;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g0()V

    .line 18
    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->n:Ll/u17;

    .line 21
    .line 22
    sput-object v1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 23
    .line 24
    new-instance v1, Ll/j97;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/j97;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/l51;->s(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->e0()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->x0()V

    .line 36
    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    const-string v2, ""

    .line 41
    .line 42
    iput-object v2, v1, Lcom/p1/mobile/putong/core/api/c;->I2:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {}, Ll/rcn;->q()Ll/rcn;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Ll/rcn;->p()V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/gp/a;->g()V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/cjj;->F()V

    .line 59
    .line 60
    .line 61
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/k;->B3()V

    .line 66
    .line 67
    .line 68
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->h1:Ll/o7a;

    .line 71
    .line 72
    invoke-virtual {v1}, Ll/o7a;->j3()V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/fcp;->i()Ll/fcp;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Ll/fcp;->e()V

    .line 80
    .line 81
    .line 82
    invoke-static {}, Ll/d79;->o()V

    .line 83
    .line 84
    .line 85
    sget-object v1, Ll/uqb0;->E0:Ll/jxd0;

    .line 86
    .line 87
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    check-cast v1, Ljava/lang/Boolean;

    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_0

    .line 98
    .line 99
    sget-object v1, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 100
    .line 101
    invoke-virtual {v1}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->b()V

    .line 102
    .line 103
    .line 104
    :cond_0
    invoke-static {}, Ll/d09;->g()Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_1

    .line 109
    .line 110
    invoke-static {}, Ll/uih0;->w0()V

    .line 111
    .line 112
    .line 113
    :cond_1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v1}, Ll/xzm0;->f()V

    .line 118
    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/fake/b;->A()V

    .line 125
    .line 126
    .line 127
    const/4 v1, 0x1

    .line 128
    if-eqz p1, :cond_2

    .line 129
    .line 130
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->a()Ll/bo;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-interface {p1}, Ll/bo;->c()Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_2

    .line 143
    .line 144
    sget-object p1, Ll/uqb0;->O:Ll/tl8;

    .line 145
    .line 146
    invoke-virtual {p1, v1}, Ll/tl8;->P(Z)V

    .line 147
    .line 148
    .line 149
    :cond_2
    invoke-static {}, Ll/sw6;->o3()V

    .line 150
    .line 151
    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->q()Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1, v1}, Lrx/c;->take(I)Lrx/c;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    new-instance v2, Ll/k97;

    .line 161
    .line 162
    invoke-direct {v2}, Ll/k97;-><init>()V

    .line 163
    .line 164
    .line 165
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {p1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->A0()V

    .line 173
    .line 174
    .line 175
    invoke-static {}, Ll/d79;->q0()Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-nez p1, :cond_3

    .line 180
    .line 181
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 182
    .line 183
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e1:Ll/uwa;

    .line 184
    .line 185
    invoke-virtual {p1}, Ll/uwa;->b3()Lrx/c;

    .line 186
    .line 187
    .line 188
    :cond_3
    invoke-static {}, Ll/kde0;->u()Z

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    if-eqz p1, :cond_4

    .line 193
    .line 194
    invoke-static {}, Ll/kde0;->o()Ll/kde0;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p1}, Ll/kde0;->n()V

    .line 199
    .line 200
    .line 201
    :cond_4
    invoke-static {}, Ll/ts8;->b()Ll/ts8;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-virtual {p1}, Ll/ts8;->c()V

    .line 206
    .line 207
    .line 208
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-virtual {p1}, Ll/cl80;->j()V

    .line 213
    .line 214
    .line 215
    invoke-static {}, Ll/gra;->R1()Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-eqz p1, :cond_5

    .line 220
    .line 221
    sput-boolean v1, Ll/m6i;->g:Z

    .line 222
    .line 223
    :cond_5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 224
    .line 225
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 226
    .line 227
    invoke-virtual {p1}, Ll/r4a;->d()V

    .line 228
    .line 229
    .line 230
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->f0()V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->o0()V

    .line 234
    .line 235
    .line 236
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public final w0()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/s4w;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/s4w;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->f0(Ll/fxl;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v0, Ll/y4w;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/y4w;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->f0(Ll/fxl;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Ll/w4w;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/w4w;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->f0(Ll/fxl;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance v0, Ll/u4w;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/u4w;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->f0(Ll/fxl;)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance v0, Ll/z4w;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/z4w;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->f0(Ll/fxl;)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance v0, Ll/v4w;

    .line 66
    .line 67
    invoke-direct {v0}, Ll/v4w;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->f0(Ll/fxl;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance v0, Ll/x4w;

    .line 78
    .line 79
    invoke-direct {v0}, Ll/x4w;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->f0(Ll/fxl;)V

    .line 83
    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    new-instance v0, Ll/t4w;

    .line 90
    .line 91
    invoke-direct {v0}, Ll/t4w;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->f0(Ll/fxl;)V

    .line 95
    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    new-instance v0, Ll/r4w;

    .line 102
    .line 103
    invoke-direct {v0}, Ll/r4w;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->f0(Ll/fxl;)V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    new-instance v0, Ll/v4c0;

    .line 114
    .line 115
    invoke-direct {v0}, Ll/v4c0;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 119
    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    new-instance v0, Ll/oj40;

    .line 126
    .line 127
    invoke-direct {v0}, Ll/oj40;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 131
    .line 132
    .line 133
    invoke-static {}, Ll/oj40;->j()V

    .line 134
    .line 135
    .line 136
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    new-instance v0, Ll/n0l;

    .line 141
    .line 142
    invoke-direct {v0}, Ll/n0l;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 146
    .line 147
    .line 148
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    new-instance v0, Ll/p4w;

    .line 153
    .line 154
    invoke-direct {v0}, Ll/p4w;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 158
    .line 159
    .line 160
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    new-instance v0, Ll/t8f0;

    .line 165
    .line 166
    invoke-direct {v0}, Ll/t8f0;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 170
    .line 171
    .line 172
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    new-instance v0, Ll/a5w;

    .line 177
    .line 178
    invoke-direct {v0}, Ll/a5w;-><init>()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 182
    .line 183
    .line 184
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    new-instance v0, Ll/q3w;

    .line 189
    .line 190
    invoke-direct {v0}, Ll/q3w;-><init>()V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 194
    .line 195
    .line 196
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    new-instance v0, Ll/n3w;

    .line 201
    .line 202
    invoke-direct {v0}, Ll/n3w;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 206
    .line 207
    .line 208
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    new-instance v0, Ll/e2w;

    .line 213
    .line 214
    invoke-direct {v0}, Ll/e2w;-><init>()V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 218
    .line 219
    .line 220
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    new-instance v0, Ll/b5w;

    .line 225
    .line 226
    invoke-direct {v0}, Ll/b5w;-><init>()V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 230
    .line 231
    .line 232
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    new-instance v0, Ll/o4w;

    .line 237
    .line 238
    invoke-direct {v0}, Ll/o4w;-><init>()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 242
    .line 243
    .line 244
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    new-instance v0, Ll/e8w;

    .line 249
    .line 250
    invoke-direct {v0}, Ll/e8w;-><init>()V

    .line 251
    .line 252
    .line 253
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 254
    .line 255
    .line 256
    invoke-static {}, Ll/e8w;->j()V

    .line 257
    .line 258
    .line 259
    return-void
.end method

.method public x0()V
    .locals 5

    .line 1
    const-string p0, "hidden"

    .line 2
    .line 3
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string v1, "gender"

    .line 15
    .line 16
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v1, v2}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/16 v2, 0x14

    .line 32
    .line 33
    if-gt v1, v2, :cond_1

    .line 34
    .line 35
    const-string v1, "18-20"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/16 v2, 0x16

    .line 45
    .line 46
    if-gt v1, v2, :cond_2

    .line 47
    .line 48
    const-string v1, "21-22"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const/16 v2, 0x19

    .line 58
    .line 59
    if-gt v1, v2, :cond_3

    .line 60
    .line 61
    const-string v1, "23-25"

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    const/16 v2, 0x1e

    .line 71
    .line 72
    if-gt v1, v2, :cond_4

    .line 73
    .line 74
    const-string v1, "26-30"

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    const/16 v2, 0x28

    .line 84
    .line 85
    if-gt v1, v2, :cond_5

    .line 86
    .line 87
    const-string v1, "31-40"

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_5
    const-string v1, "41+"

    .line 91
    .line 92
    :goto_0
    const-string v2, "age_group"

    .line 93
    .line 94
    invoke-static {v2, v1}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    const-string v1, "latest_country_name_en"

    .line 98
    .line 99
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 100
    .line 101
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 102
    .line 103
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v1, v2}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const-string v1, "latest_city_name_en"

    .line 109
    .line 110
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 111
    .line 112
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 113
    .line 114
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v1, v2}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    const-string v1, "latest_district_name_en"

    .line 120
    .line 121
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 122
    .line 123
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 124
    .line 125
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v1, v2}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 131
    .line 132
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 133
    .line 134
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 139
    .line 140
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 141
    .line 142
    invoke-virtual {v2, v0}, Ll/dkb;->j8(Lcom/p1/mobile/putong/data/User;)Z

    .line 143
    .line 144
    .line 145
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    const-string v3, "status"

    .line 147
    .line 148
    if-eqz v2, :cond_6

    .line 149
    .line 150
    :try_start_1
    const-string p0, "default"

    .line 151
    .line 152
    invoke-static {v3, p0}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_6
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 157
    .line 158
    invoke-static {p0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    if-eqz v2, :cond_7

    .line 167
    .line 168
    invoke-static {v3, p0}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    goto :goto_1

    .line 172
    :cond_7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-eqz p0, :cond_8

    .line 177
    .line 178
    const-string p0, "banned"

    .line 179
    .line 180
    invoke-static {v3, p0}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_8
    iget-boolean p0, v0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 185
    .line 186
    if-eqz p0, :cond_9

    .line 187
    .line 188
    const-string p0, "inactivated"

    .line 189
    .line 190
    invoke-static {v3, p0}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->veryUgly()Z

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    if-eqz p0, :cond_a

    .line 199
    .line 200
    const-string p0, "inappropriate"

    .line 201
    .line 202
    invoke-static {v3, p0}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    goto :goto_1

    .line 206
    :cond_a
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 210
    const-string v2, "pending"

    .line 211
    .line 212
    if-eqz p0, :cond_b

    .line 213
    .line 214
    :try_start_2
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 215
    .line 216
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 217
    .line 218
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    if-eqz p0, :cond_c

    .line 223
    .line 224
    :cond_b
    invoke-static {v3, v2}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    :cond_c
    :goto_1
    const-string p0, "popularity"

    .line 228
    .line 229
    iget v1, v0, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 230
    .line 231
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-static {p0, v1}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    const-string p0, "lastest_os_name"

    .line 239
    .line 240
    const-string v1, "Android"

    .line 241
    .line 242
    invoke-static {p0, v1}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    const-string p0, "picture_verification"

    .line 246
    .line 247
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    invoke-static {p0, v1}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 259
    .line 260
    if-eqz p0, :cond_d

    .line 261
    .line 262
    const-string v1, "student_verification"

    .line 263
    .line 264
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 265
    .line 266
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 267
    .line 268
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 269
    .line 270
    const-string v2, "verified"

    .line 271
    .line 272
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 273
    .line 274
    .line 275
    move-result p0

    .line 276
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    invoke-static {v1, p0}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    :cond_d
    const-string p0, "is_see"

    .line 284
    .line 285
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 286
    .line 287
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/api/c;->W0:Z

    .line 288
    .line 289
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    invoke-static {p0, v1}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    const-string p0, "wealth_grade"

    .line 297
    .line 298
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 299
    .line 300
    iget-wide v1, v1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 301
    .line 302
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    invoke-static {p0, v1}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    const-string p0, "isVIP"

    .line 310
    .line 311
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    if-nez v1, :cond_f

    .line 316
    .line 317
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-eqz v0, :cond_e

    .line 322
    .line 323
    goto :goto_2

    .line 324
    :cond_e
    const/4 v0, 0x0

    .line 325
    goto :goto_3

    .line 326
    :cond_f
    :goto_2
    const/4 v0, 0x1

    .line 327
    :goto_3
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-static {p0, v0}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    const-string p0, "mcc"

    .line 335
    .line 336
    sget v0, Ll/uqb0;->f0:I

    .line 337
    .line 338
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-static {p0, v0}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 343
    .line 344
    .line 345
    return-void

    .line 346
    :catch_0
    move-exception p0

    .line 347
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 348
    .line 349
    .line 350
    return-void
.end method

.method public final y0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 5

    .line 1
    const-class p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "default"

    .line 16
    .line 17
    if-nez v0, :cond_3

    .line 18
    .line 19
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_3

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 42
    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_0

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_0

    .line 71
    .line 72
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 73
    .line 74
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_2

    .line 79
    .line 80
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 81
    .line 82
    const-string v2, "silenced"

    .line 83
    .line 84
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 91
    .line 92
    const-string p1, "approved"

    .line 93
    .line 94
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_6

    .line 114
    .line 115
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 122
    .line 123
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    :cond_4
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    if-eqz p2, :cond_6

    .line 132
    .line 133
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    check-cast p2, Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 138
    .line 139
    if-nez p2, :cond_5

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_5
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 143
    .line 144
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_4

    .line 151
    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/GroupApply;->userId:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-eqz v0, :cond_4

    .line 167
    .line 168
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 169
    .line 170
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    if-eqz p0, :cond_6

    .line 175
    .line 176
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 177
    .line 178
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 183
    .line 184
    :cond_6
    return-void
.end method
