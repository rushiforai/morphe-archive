.class public Ll/gqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/spn;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VButton;

.field public c:Lv/VButton;

.field public d:Lv/VButton;

.field public e:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;

.field public f:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

.field public g:Lcom/p1/mobile/putong/core/map/IntlHideAndSeekAct;

.field public h:Ll/spn;

.field public i:Ll/hyl;

.field public j:Ll/hyl$d;

.field public k:Ll/hyl$d;

.field public l:Ll/hyl$d;

.field public m:Ll/hyl$d;

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/map/IntlHideAndSeekAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gqn;->g:Lcom/p1/mobile/putong/core/map/IntlHideAndSeekAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/gqn;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gqn;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/gqn;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gqn;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/gqn;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GameData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gqn;->s(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GameData;)V

    return-void
.end method

.method public static synthetic d(Ll/gqn;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gqn;->v(Landroid/view/View;)V

    return-void
.end method

.method private q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gqn;->c:Lv/VButton;

    .line 2
    .line 3
    new-instance v1, Ll/dqn;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/dqn;-><init>(Ll/gqn;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/gqn;->b:Lv/VButton;

    .line 12
    .line 13
    new-instance v1, Ll/eqn;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/eqn;-><init>(Ll/gqn;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/gqn;->d:Lv/VButton;

    .line 22
    .line 23
    new-instance v1, Ll/fqn;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/fqn;-><init>(Ll/gqn;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/gqn;->f:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/gqn;->f:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;->B0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gqn;->f:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/gqn;->f:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;->r0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gqn;->g:Lcom/p1/mobile/putong/core/map/IntlHideAndSeekAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/gqn;->f()Lcom/p1/mobile/putong/core/map/IntlHideAndSeekAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gqn;->f:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

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
    iget-object v0, p0, Ll/gqn;->f:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;->u0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/gqn;->e:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/gqn;->e:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->s0()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hqn;->b(Ll/gqn;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f()Lcom/p1/mobile/putong/core/map/IntlHideAndSeekAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gqn;->g:Lcom/p1/mobile/putong/core/map/IntlHideAndSeekAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ll/hyl$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gqn;->i:Ll/hyl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/hyl;->r1(Ll/hyl$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/spn;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gqn;->m(Ll/spn;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gqn;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/core/data/HideAndSeekPushData;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekPushData;->players:Ljava/util/List;

    .line 13
    .line 14
    new-instance v2, Ll/cqn;

    .line 15
    .line 16
    invoke-direct {v2, p0, v0}, Ll/cqn;-><init>(Ll/gqn;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/gqn;->f:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Ll/gqn;->f:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

    .line 31
    .line 32
    iget p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekPushData;->mouseCount:I

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;->D0(I)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/location/Location;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gqn;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/core/data/GameData;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/GameData;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    invoke-static {v1, v2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GameData;->la:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    invoke-static {v1, v2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/GameData;->lg:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/GameData;->uid:Ljava/lang/String;

    .line 43
    .line 44
    iget-object p1, p0, Ll/gqn;->n:Ljava/lang/String;

    .line 45
    .line 46
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/GameData;->roleType:Ljava/lang/String;

    .line 47
    .line 48
    const/4 p1, 0x1

    .line 49
    invoke-virtual {p0, v0, p1}, Ll/gqn;->l(Lcom/p1/mobile/putong/core/data/GameData;Z)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/core/data/GameData;Z)V
    .locals 6

    .line 1
    const-string v0, "cat"

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/GameData;->roleType:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/gqn;->j:Ll/hyl$d;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Ll/gqn;->k:Ll/hyl$d;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/GameData;->roleType:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Ll/gqn;->l:Ll/hyl$d;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    iget-object v0, p0, Ll/gqn;->m:Ll/hyl$d;

    .line 31
    .line 32
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/GameData;->uid:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iget-object v2, p0, Ll/gqn;->i:Ll/hyl;

    .line 39
    .line 40
    invoke-interface {v2, v1}, Ll/hyl;->B0(I)Ll/hyl$b;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    invoke-interface {v2, v1}, Ll/hyl$b;->a(I)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/GameData;->la:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 52
    .line 53
    .line 54
    move-result-wide v2

    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GameData;->lg:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 58
    .line 59
    .line 60
    move-result-wide v4

    .line 61
    iget-object p0, p0, Ll/gqn;->i:Ll/hyl;

    .line 62
    .line 63
    invoke-interface {p0}, Ll/hyl;->d3()Ll/hyl$c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const/4 p1, 0x0

    .line 68
    invoke-interface {p0, p1}, Ll/hyl$c;->g(Z)Ll/hyl$c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-interface {p0, v2, v3, v4, v5}, Ll/hyl$c;->e(DD)Ll/hyl$c;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {p0, v0}, Ll/hyl$c;->d(Ll/hyl$d;)Ll/hyl$c;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const/high16 p1, 0x3f000000    # 0.5f

    .line 81
    .line 82
    invoke-interface {p0, p1, p1}, Ll/hyl$c;->c(FF)Ll/hyl$c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0, v1}, Ll/hyl$c;->a(I)Ll/hyl$c;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    if-eqz p2, :cond_4

    .line 91
    .line 92
    const/high16 p1, 0x3f800000    # 1.0f

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    const/4 p1, 0x0

    .line 96
    :goto_1
    invoke-interface {p0, p1}, Ll/hyl$c;->f(F)Ll/hyl$c;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-interface {p0}, Ll/hyl$c;->b()Ll/hyl$b;

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public m(Ll/spn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gqn;->h:Ll/spn;

    .line 2
    .line 3
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gqn;->h:Ll/spn;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/spn;->z0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p()Ll/hyl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gqn;->i:Ll/hyl;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gqn;->g:Lcom/p1/mobile/putong/core/map/IntlHideAndSeekAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekAct;->c2()Ll/hyl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/gqn;->i:Ll/hyl;

    .line 8
    .line 9
    sget v1, Ll/dbc0;->G9:I

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ll/hyl;->X2(I)Ll/hyl$d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/gqn;->j:Ll/hyl$d;

    .line 16
    .line 17
    iget-object v0, p0, Ll/gqn;->i:Ll/hyl;

    .line 18
    .line 19
    sget v1, Ll/dbc0;->H9:I

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ll/hyl;->X2(I)Ll/hyl$d;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/gqn;->k:Ll/hyl$d;

    .line 26
    .line 27
    iget-object v0, p0, Ll/gqn;->i:Ll/hyl;

    .line 28
    .line 29
    sget v1, Ll/dbc0;->C9:I

    .line 30
    .line 31
    invoke-interface {v0, v1}, Ll/hyl;->X2(I)Ll/hyl$d;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/gqn;->l:Ll/hyl$d;

    .line 36
    .line 37
    iget-object v0, p0, Ll/gqn;->i:Ll/hyl;

    .line 38
    .line 39
    sget v1, Ll/dbc0;->D9:I

    .line 40
    .line 41
    invoke-interface {v0, v1}, Ll/hyl;->X2(I)Ll/hyl$d;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Ll/gqn;->m:Ll/hyl$d;

    .line 46
    .line 47
    invoke-direct {p0}, Ll/gqn;->q()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic s(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GameData;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GameData;->uid:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p2, p1}, Ll/gqn;->l(Lcom/p1/mobile/putong/core/data/GameData;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p1, p0, Ll/gqn;->h:Ll/spn;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/spn;->y0()Lcom/p1/mobile/putong/location/Location;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/gqn;->i:Ll/hyl;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    const/high16 v5, 0x41880000    # 17.0f

    .line 20
    .line 21
    invoke-interface/range {v0 .. v5}, Ll/hyl;->K1(DDF)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gqn;->f()Lcom/p1/mobile/putong/core/map/IntlHideAndSeekAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gqn;->j:Ll/hyl$d;

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
    iget-object p0, p0, Ll/gqn;->j:Ll/hyl$d;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/hyl$d;->recycle()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public y(ZLcom/p1/mobile/putong/core/data/GameRole;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gqn;->c:Lv/VButton;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/gqn;->d:Lv/VButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/gqn;->n:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p0, p0, Ll/gqn;->d:Lv/VButton;

    .line 20
    .line 21
    const-string p1, "mouse"

    .line 22
    .line 23
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    sget p1, Ll/dbc0;->F9:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget p1, Ll/dbc0;->E9:I

    .line 33
    .line 34
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const/4 p1, 0x0

    .line 39
    iput-object p1, p0, Ll/gqn;->n:Ljava/lang/String;

    .line 40
    .line 41
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/core/data/HideAndSeekInfoData;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekInfoData;->gameInfo:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekInfoData;->gameRole:Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekInfoData;->gameInfo:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 24
    .line 25
    const-string v2, "player"

    .line 26
    .line 27
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekInfoData;->gameInfo:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 36
    .line 37
    const-string v2, "start"

    .line 38
    .line 39
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Ll/gqn;->e:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;

    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/gqn;->f:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

    .line 51
    .line 52
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekInfoData;->gameRole:Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;

    .line 53
    .line 54
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;->v0(Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;Ll/gqn;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/gqn;->h:Ll/spn;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekInfoData;->gameRole:Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;

    .line 60
    .line 61
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->endTime:J

    .line 62
    .line 63
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Ll/spn;->O0(Ljava/lang/Long;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    iget-object v0, p0, Ll/gqn;->i:Ll/hyl;

    .line 72
    .line 73
    invoke-interface {v0}, Ll/hyl;->b2()V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/gqn;->f:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;->r0()V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/gqn;->e:Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekInfoData;->gameInfo:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 84
    .line 85
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->v0(Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;)V

    .line 86
    .line 87
    .line 88
    const/4 p1, 0x0

    .line 89
    invoke-virtual {p0, v1, p1}, Ll/gqn;->y(ZLcom/p1/mobile/putong/core/data/GameRole;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method
