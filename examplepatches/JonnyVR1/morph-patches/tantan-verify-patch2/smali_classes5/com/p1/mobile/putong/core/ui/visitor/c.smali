.class public Lcom/p1/mobile/putong/core/ui/visitor/c;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/visitor/a$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/ui/visitor/d;",
        ">;",
        "Lcom/p1/mobile/putong/core/ui/visitor/a$a;"
    }
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/cfm0;",
            ">;"
        }
    .end annotation
.end field

.field public b:Z

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/data/Links;

.field public e:Z

.field public f:Z

.field public final g:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

.field public h:I


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->f:Z

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/enb;->K3()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->clone()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->g:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 27
    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->h:I

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic A0(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Ll/cfm0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Ll/cfm0;->d:Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

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
    iget-object p1, p1, Ll/cfm0;->d:Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->userId:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->userId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method private synthetic U0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->f:Z

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->y(Z)V

    .line 8
    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->getData()V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Ll/r97;->f()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ll/joa;->G3()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    const-string p1, "p_see_who_likes_me_view_membership"

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->c:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast p0, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 50
    .line 51
    const-string p1, "p_navigation_visit,button_pull"

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->M(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-interface {p1}, Ll/r97;->f()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->L0()V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-void
.end method

.method private synthetic V0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->v()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->getData()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/visitor/c;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->Y0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/visitor/c;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->V0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/data/Visitor;Ll/cfm0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

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
    iget-object p1, p1, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Visitor;->userId:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Visitor;->userId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/visitor/c;Lcom/p1/mobile/putong/core/data/VisitorSetting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->S0(Lcom/p1/mobile/putong/core/data/VisitorSetting;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/visitor/c;Lcom/p1/mobile/putong/core/data/VisitorSetting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->R0(Lcom/p1/mobile/putong/core/data/VisitorSetting;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/visitor/c;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->P0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic k0()V
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
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/s;->s5()Lrx/c;

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m0()Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/enb;->q4(Z)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/ui/visitor/c;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->W0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/core/ui/visitor/c;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->O0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/ui/visitor/c;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->U0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/core/ui/visitor/c;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->N0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic s0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/core/ui/visitor/c;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->X0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/core/ui/visitor/c;Lcom/p1/mobile/putong/core/data/VisitorSetting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->a1(Lcom/p1/mobile/putong/core/data/VisitorSetting;)V

    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/core/ui/visitor/c;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->Q0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic y0(Ljava/lang/String;)Lrx/c;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "list"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-virtual {v0, v1, v2, p0, v3}, Ll/enb;->a4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic z0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "\u6b64\u529f\u80fd24\u5c0f\u6642\u53ea\u80fd\u4fee\u6539\u4e00\u6b21"

    .line 6
    .line 7
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/enb;->K3()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->g:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    return p0
.end method

.method public D0()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->g:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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

.method public F0(Lcom/p1/mobile/putong/data/Links;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

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

.method public final G0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 2
    .line 3
    iget p1, p0, Lcom/p1/mobile/putong/data/NewVisitors;->totalCount:I

    .line 4
    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/NewVisitors;->visitors:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-lez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final H0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 2
    .line 3
    iget p1, p0, Lcom/p1/mobile/putong/data/RecommendVisitors;->totalCount:I

    .line 4
    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RecommendVisitors;->visitors:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-lez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final I0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public J0(ZLjava/lang/String;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->c:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->f:Z

    .line 6
    .line 7
    return-void
.end method

.method public L0()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/r97;->f()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x1

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/joa;->G3()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/enb;->q4(Z)Lrx/c;

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "list"

    .line 43
    .line 44
    const-string v3, ""

    .line 45
    .line 46
    invoke-virtual {p0, v1, v2, v3, v0}, Ll/enb;->a4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic N0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->N()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->e1(Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic O0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->O(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic P0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->N()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->e1(Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic Q0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->O(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->L(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic R0(Lcom/p1/mobile/putong/core/data/VisitorSetting;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VisitorSetting;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 18
    .line 19
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/VisitorSetting;->visitorPermission:Z

    .line 20
    .line 21
    xor-int/2addr v0, p1

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 25
    .line 26
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->R()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final synthetic S0(Lcom/p1/mobile/putong/core/data/VisitorSetting;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VisitorSetting;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 18
    .line 19
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/VisitorSetting;->visitorPermission:Z

    .line 20
    .line 21
    xor-int/2addr v0, p1

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 25
    .line 26
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->R()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final synthetic W0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->Q(ZZ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic X0(Ll/pf60;)V
    .locals 6

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->d:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VisitorInfo;->nullCheck()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/data/NewVisitors;->visitors:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    add-int/2addr v0, v2

    .line 38
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/data/RecommendVisitors;->visitors:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    add-int/2addr v0, v2

    .line 47
    const/16 v2, 0xa

    .line 48
    .line 49
    const/4 v3, 0x1

    .line 50
    if-gt v0, v2, :cond_0

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->d:Lcom/p1/mobile/putong/data/Links;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->F0(Lcom/p1/mobile/putong/data/Links;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->h:I

    .line 61
    .line 62
    if-ge v0, v2, :cond_0

    .line 63
    .line 64
    add-int/2addr v0, v3

    .line 65
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->h:I

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->b1()V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->h:I

    .line 72
    .line 73
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->G0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    const/4 v1, -0x3

    .line 78
    const-string v2, "\u5168\u90e8"

    .line 79
    .line 80
    const-string v4, ""

    .line 81
    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/data/NewVisitors;->visitors:Ljava/util/List;

    .line 87
    .line 88
    const/4 v5, -0x1

    .line 89
    invoke-virtual {p0, v4, v0, v5}, Lcom/p1/mobile/putong/core/ui/visitor/c;->h1(Ljava/lang/String;Ljava/util/List;I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->E0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_4

    .line 97
    .line 98
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 99
    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 101
    .line 102
    invoke-virtual {p0, v2, p1, v1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->h1(Ljava/lang/String;Ljava/util/List;I)V

    .line 103
    .line 104
    .line 105
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->e:Z

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->E0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_4

    .line 113
    .line 114
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->e:Z

    .line 115
    .line 116
    if-eqz v0, :cond_2

    .line 117
    .line 118
    move-object v2, v4

    .line 119
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 120
    .line 121
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 122
    .line 123
    invoke-virtual {p0, v2, p1, v1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->h1(Ljava/lang/String;Ljava/util/List;I)V

    .line 124
    .line 125
    .line 126
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->e:Z

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_3
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->h:I

    .line 130
    .line 131
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 132
    .line 133
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 136
    .line 137
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->L(Ljava/util/List;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final synthetic Y0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->h:I

    .line 3
    .line 4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->L(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public a0()V
    .locals 8

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 18
    .line 19
    iget-object v0, v0, Ll/enb;->S:Lrx/subjects/a;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/hu00;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/hu00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/iu00;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/iu00;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Ll/enb;->J3(Ljava/lang/String;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/ju00;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/ju00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 65
    .line 66
    .line 67
    new-instance v2, Ll/ku00;

    .line 68
    .line 69
    invoke-direct {v2}, Ll/ku00;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    new-instance v0, Ll/rt00;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Ll/rt00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 82
    .line 83
    .line 84
    new-instance v1, Ll/st00;

    .line 85
    .line 86
    invoke-direct {v1}, Ll/st00;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 90
    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->eb()Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const/4 v1, 0x1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/tt00;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/tt00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 112
    .line 113
    .line 114
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d4()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_1

    .line 134
    .line 135
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 136
    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 138
    .line 139
    invoke-virtual {v0}, Ll/enb;->s4()Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    new-instance v1, Ll/ut00;

    .line 152
    .line 153
    invoke-direct {v1, p0}, Ll/ut00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 154
    .line 155
    .line 156
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 161
    .line 162
    .line 163
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->dd()Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-eqz v0, :cond_2

    .line 176
    .line 177
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-interface {v0}, Ll/r97;->a2()Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_2

    .line 190
    .line 191
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    new-instance v4, Ll/vt00;

    .line 204
    .line 205
    invoke-direct {v4}, Ll/vt00;-><init>()V

    .line 206
    .line 207
    .line 208
    const/4 v6, 0x0

    .line 209
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondVisitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 210
    .line 211
    const-string v3, "p_navigation_visit,default"

    .line 212
    .line 213
    const/4 v5, 0x0

    .line 214
    invoke-interface/range {v1 .. v7}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Og(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 215
    .line 216
    .line 217
    :cond_2
    return-void
.end method

.method public final synthetic a1(Lcom/p1/mobile/putong/core/data/VisitorSetting;)V
    .locals 1

    .line 1
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/VisitorSetting;->visitorPermission:Z

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 4
    .line 5
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->P()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 15
    .line 16
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->Q(ZZ)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final b1()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->d:Lcom/p1/mobile/putong/data/Links;

    .line 14
    .line 15
    const-string v3, "list"

    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/enb;->b4(Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;Ljava/lang/String;Z)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/xt00;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/xt00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/yt00;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/yt00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public c1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->h:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->d:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->getData()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d1(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 2
    .line 3
    xor-int/2addr v0, p1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1, p1}, Ll/enb;->h4(Ljava/lang/String;Z)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/au00;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/au00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 29
    .line 30
    .line 31
    new-instance p0, Ll/cu00;

    .line 32
    .line 33
    invoke-direct {p0}, Ll/cu00;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x4

    .line 8
    .line 9
    if-lt p1, v0, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-lez p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->d:Lcom/p1/mobile/putong/data/Links;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->F0(Lcom/p1/mobile/putong/data/Links;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-interface {p1}, Ll/r97;->f()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-static {}, Ll/joa;->G3()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->h:I

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->b1()V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method

.method public final e1(Ll/pf60;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Lcom/p1/mobile/putong/data/VisitorInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->d:Lcom/p1/mobile/putong/data/Links;

    .line 11
    .line 12
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_5

    .line 19
    .line 20
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Ll/r97;->f()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-static {}, Ll/joa;->G3()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->I0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast p1, Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->g1(Ljava/util/List;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->G0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    const/4 v1, 0x1

    .line 65
    const-string v2, "\u5168\u90e8"

    .line 66
    .line 67
    const/4 v3, -0x3

    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    iget-object p1, v0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/data/NewVisitors;->visitors:Ljava/util/List;

    .line 73
    .line 74
    const/4 v4, -0x1

    .line 75
    const-string v5, "\u65b0\u8bbf\u5ba2"

    .line 76
    .line 77
    invoke-virtual {p0, v5, p1, v4}, Lcom/p1/mobile/putong/core/ui/visitor/c;->h1(Ljava/lang/String;Ljava/util/List;I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->E0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_5

    .line 85
    .line 86
    iget-object p1, v0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 89
    .line 90
    invoke-virtual {p0, v2, p1, v3}, Lcom/p1/mobile/putong/core/ui/visitor/c;->h1(Ljava/lang/String;Ljava/util/List;I)V

    .line 91
    .line 92
    .line 93
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->e:Z

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->H0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_4

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-interface {p1}, Ll/r97;->f()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_2

    .line 115
    .line 116
    invoke-static {}, Ll/joa;->G3()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_3

    .line 121
    .line 122
    :cond_2
    iget-object p1, v0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 123
    .line 124
    iget-object p1, p1, Lcom/p1/mobile/putong/data/RecommendVisitors;->visitors:Ljava/util/List;

    .line 125
    .line 126
    const/4 v4, -0x2

    .line 127
    const-string v5, "\u63a8\u8350"

    .line 128
    .line 129
    invoke-virtual {p0, v5, p1, v4}, Lcom/p1/mobile/putong/core/ui/visitor/c;->h1(Ljava/lang/String;Ljava/util/List;I)V

    .line 130
    .line 131
    .line 132
    :cond_3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->E0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz p1, :cond_5

    .line 137
    .line 138
    iget-object p1, v0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 141
    .line 142
    invoke-virtual {p0, v2, p1, v3}, Lcom/p1/mobile/putong/core/ui/visitor/c;->h1(Ljava/lang/String;Ljava/util/List;I)V

    .line 143
    .line 144
    .line 145
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->e:Z

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->E0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_5

    .line 153
    .line 154
    iget-object p1, v0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 155
    .line 156
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 157
    .line 158
    const-string v0, ""

    .line 159
    .line 160
    invoke-virtual {p0, v0, p1, v3}, Lcom/p1/mobile/putong/core/ui/visitor/c;->h1(Ljava/lang/String;Ljava/util/List;I)V

    .line 161
    .line 162
    .line 163
    :cond_5
    :goto_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 164
    .line 165
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 166
    .line 167
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 168
    .line 169
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->L(Ljava/util/List;)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method public f1()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->g:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/enb;->i4(Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final g1(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_2

    .line 8
    .line 9
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

    .line 14
    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 16
    .line 17
    new-instance v4, Ll/wt00;

    .line 18
    .line 19
    invoke-direct {v4, v2}, Ll/wt00;-><init>(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v3, v4}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-nez v3, :cond_1

    .line 27
    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 29
    .line 30
    new-instance v4, Ll/cfm0;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    const/4 v5, 0x1

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    move v5, v0

    .line 37
    :goto_1
    invoke-direct {v4, v2, v5}, Ll/cfm0;-><init>(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Z)V

    .line 38
    .line 39
    .line 40
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->mc()Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 61
    .line 62
    new-instance v1, Ll/cfm0;

    .line 63
    .line 64
    iget p1, p1, Lcom/p1/mobile/putong/data/VisitorCounter;->totalCnt:I

    .line 65
    .line 66
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string v2, "%s\u4eba\u770b\u8fc7\u6211 \u00b7 \u5f00\u901a\u9ed1\u91d1\u4f1a\u5458\u4e00\u952e\u89e3\u9501"

    .line 75
    .line 76
    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-direct {v1, p1, v0}, Ll/cfm0;-><init>(Ljava/lang/String;Z)V

    .line 81
    .line 82
    .line 83
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :cond_3
    return-void
.end method

.method public getData()V
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
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/joa;->G3()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/qt00;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/qt00;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/bu00;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/bu00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/du00;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/du00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

    .line 48
    :cond_0
    new-instance v0, Ll/eu00;

    .line 49
    .line 50
    const-string v1, ""

    .line 51
    .line 52
    invoke-direct {v0, v1}, Ll/eu00;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/fu00;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/fu00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 62
    .line 63
    .line 64
    new-instance v2, Ll/gu00;

    .line 65
    .line 66
    invoke-direct {v2, p0}, Ll/gu00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final h1(Ljava/lang/String;Ljava/util/List;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Visitor;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 8
    .line 9
    new-instance v1, Ll/cfm0;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/Visitor;->new_()Lcom/p1/mobile/putong/data/Visitor;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {v1, v2, p1, p3}, Ll/cfm0;-><init>(Lcom/p1/mobile/putong/data/Visitor;Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_2

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    check-cast p2, Lcom/p1/mobile/putong/data/Visitor;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 38
    .line 39
    new-instance v1, Ll/zt00;

    .line 40
    .line 41
    invoke-direct {v1, p2}, Ll/zt00;-><init>(Lcom/p1/mobile/putong/data/Visitor;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->a:Ljava/util/List;

    .line 51
    .line 52
    new-instance v1, Ll/cfm0;

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-direct {v1, p2, v2, p3}, Ll/cfm0;-><init>(Lcom/p1/mobile/putong/data/Visitor;Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    return-void
.end method
