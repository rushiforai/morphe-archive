.class public final Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/visitor/a$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/sgm0;",
        ">;",
        "Lcom/p1/mobile/putong/core/ui/visitor/a$a;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\r\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u0003B\u000f\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\'\u0010\r\u001a\u00020\u000c2\u0016\u0010\u000b\u001a\u0012\u0012\u0006\u0012\u0004\u0018\u00010\t\u0012\u0006\u0012\u0004\u0018\u00010\n0\u0008H\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0019\u0010\u0011\u001a\u00020\u00102\u0008\u0008\u0001\u0010\u000f\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u001d\u0010\u0016\u001a\u00020\u000c2\u000c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u0013H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0017\u0010\u0018\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0012J-\u0010\u001e\u001a\u00020\u000c2\u0006\u0010\u001a\u001a\u00020\u00192\u000c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u001b0\u00132\u0006\u0010\u001d\u001a\u00020\u001cH\u0002\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u0017\u0010 \u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008 \u0010\u0012J\u0017\u0010!\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008!\u0010\u0012J\u000f\u0010\"\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\"\u0010#J\u000f\u0010$\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008$\u0010#J\r\u0010%\u001a\u00020\u000c\u00a2\u0006\u0004\u0008%\u0010#J\u000f\u0010&\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008&\u0010#J\u000f\u0010\'\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\'\u0010#J\u0017\u0010)\u001a\u00020\u000c2\u0008\u0008\u0002\u0010(\u001a\u00020\u0010\u00a2\u0006\u0004\u0008)\u0010*J\r\u0010+\u001a\u00020\u000c\u00a2\u0006\u0004\u0008+\u0010#J\u0017\u0010-\u001a\u00020\u000c2\u0006\u0010,\u001a\u00020\u001cH\u0016\u00a2\u0006\u0004\u0008-\u0010.J\u0017\u00100\u001a\u00020\u00102\u0008\u0010/\u001a\u0004\u0018\u00010\t\u00a2\u0006\u0004\u00080\u00101R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u00082\u00103\u001a\u0004\u00084\u00105R\u0016\u00108\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00086\u00107R$\u0010>\u001a\u0012\u0012\u0004\u0012\u00020:09j\u0008\u0012\u0004\u0012\u00020:`;8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008<\u0010=R\u0018\u0010/\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008?\u0010@R\u0016\u0010A\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008-\u00107R\u0016\u0010D\u001a\u00020\u001c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008B\u0010CR(\u0010G\u001a\u0014\u0012\u0006\u0012\u0004\u0018\u00010\t\u0012\u0006\u0012\u0004\u0018\u00010\n\u0018\u00010\u00088\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008E\u0010F\u00a8\u0006H"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;",
        "Ll/ar2;",
        "Ll/sgm0;",
        "Lcom/p1/mobile/putong/core/ui/visitor/a$a;",
        "Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;",
        "frag",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;)V",
        "Ll/pf60;",
        "Lcom/p1/mobile/putong/data/Links;",
        "Lcom/p1/mobile/putong/data/VisitorInfo;",
        "pair",
        "",
        "S0",
        "(Ll/pf60;)V",
        "visitorInfo",
        "",
        "O0",
        "(Lcom/p1/mobile/putong/data/VisitorInfo;)Z",
        "",
        "Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;",
        "visitors",
        "U0",
        "(Ljava/util/List;)V",
        "L0",
        "",
        "moduleName",
        "Lcom/p1/mobile/putong/data/Visitor;",
        "",
        "part",
        "V0",
        "(Ljava/lang/String;Ljava/util/List;I)V",
        "I0",
        "N0",
        "Q0",
        "()V",
        "destroy",
        "P0",
        "a0",
        "getData",
        "updateLastVisitTime",
        "H0",
        "(Z)V",
        "R0",
        "i",
        "e",
        "(I)V",
        "links",
        "J0",
        "(Lcom/p1/mobile/putong/data/Links;)Z",
        "a",
        "Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;",
        "getFrag",
        "()Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;",
        "b",
        "Z",
        "hasPermission",
        "Ljava/util/ArrayList;",
        "Ll/cfm0;",
        "Lkotlin/collections/ArrayList;",
        "c",
        "Ljava/util/ArrayList;",
        "visitorItems",
        "d",
        "Lcom/p1/mobile/putong/data/Links;",
        "hasShowAllModuleName",
        "f",
        "I",
        "autoLoadMoreRetryCount",
        "g",
        "Ll/pf60;",
        "pairCached",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Z

.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/cfm0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/data/Links;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public e:Z

.field public f:I

.field public g:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Lcom/p1/mobile/putong/data/VisitorInfo;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->a:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;

    .line 8
    .line 9
    new-instance p1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

    .line 15
    .line 16
    return-void
.end method

.method public static A0(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/sgm0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/sgm0;->r()V

    .line 6
    .line 7
    .line 8
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->b:Z

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->getData()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Ll/sgm0;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Ll/sgm0;->C(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static C0(Z)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/enb;->q4(Z)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static D0()V
    .locals 2

    .line 1
    sget-object v0, Ll/e7d0;->Companion:Ll/e7d0$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/e7d0$a;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/e7d0$a;->b()Ll/e7d0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "visitor"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/e7d0;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static E0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/s;->Q4()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static F0(Lcom/p1/mobile/putong/core/data/VisitorSetting;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/VisitorSetting;->visitorPermission:Z

    .line 5
    .line 6
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static G0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method private final I0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 4
    .line 5
    check-cast p0, Ljava/util/Collection;

    .line 6
    .line 7
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    return p0
.end method

.method private final L0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z
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

.method private final N0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z
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

.method private final O0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z
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

.method private final Q0()V
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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->d:Lcom/p1/mobile/putong/data/Links;

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
    new-instance v1, Ll/cgm0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/cgm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/dgm0;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/dgm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V

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

.method private final S0(Ll/pf60;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->g:Ll/pf60;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->d:Lcom/p1/mobile/putong/data/Links;

    .line 13
    .line 14
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 17
    .line 18
    if-eqz p1, :cond_5

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-static {}, Ll/joa;->G3()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->O0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->U0(Ljava/util/List;)V

    .line 52
    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->L0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/4 v1, 0x1

    .line 61
    const-string v2, "\u5168\u90e8"

    .line 62
    .line 63
    const/4 v3, -0x3

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/data/NewVisitors;->visitors:Ljava/util/List;

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    const/4 v4, -0x1

    .line 74
    const-string v5, "\u65b0\u8bbf\u5ba2"

    .line 75
    .line 76
    invoke-direct {p0, v5, v0, v4}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->V0(Ljava/lang/String;Ljava/util/List;I)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->I0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_5

    .line 84
    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    invoke-direct {p0, v2, p1, v3}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->V0(Ljava/lang/String;Ljava/util/List;I)V

    .line 93
    .line 94
    .line 95
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->e:Z

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->N0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_2

    .line 117
    .line 118
    invoke-static {}, Ll/joa;->G3()Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-nez v0, :cond_3

    .line 123
    .line 124
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 125
    .line 126
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RecommendVisitors;->visitors:Ljava/util/List;

    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    .line 130
    .line 131
    const/4 v4, -0x2

    .line 132
    const-string v5, "\u63a8\u8350"

    .line 133
    .line 134
    invoke-direct {p0, v5, v0, v4}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->V0(Ljava/lang/String;Ljava/util/List;I)V

    .line 135
    .line 136
    .line 137
    :cond_3
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->I0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_5

    .line 142
    .line 143
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 144
    .line 145
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 146
    .line 147
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 148
    .line 149
    .line 150
    invoke-direct {p0, v2, p1, v3}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->V0(Ljava/lang/String;Ljava/util/List;I)V

    .line 151
    .line 152
    .line 153
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->e:Z

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->I0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-eqz v0, :cond_5

    .line 161
    .line 162
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 163
    .line 164
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 165
    .line 166
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 167
    .line 168
    .line 169
    const-string v0, ""

    .line 170
    .line 171
    invoke-direct {p0, v0, p1, v3}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->V0(Ljava/lang/String;Ljava/util/List;I)V

    .line 172
    .line 173
    .line 174
    :cond_5
    :goto_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 175
    .line 176
    check-cast p1, Ll/sgm0;

    .line 177
    .line 178
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-virtual {p1, p0}, Ll/sgm0;->z(Ljava/util/List;)V

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method private final U0(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Ljava/util/Collection;

    .line 3
    .line 4
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    move v2, v1

    .line 10
    :goto_0
    const/4 v3, 0x1

    .line 11
    if-ge v2, v0, :cond_2

    .line 12
    .line 13
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    check-cast v4, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

    .line 18
    .line 19
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

    .line 20
    .line 21
    new-instance v6, Ll/bgm0;

    .line 22
    .line 23
    invoke-direct {v6, v4}, Ll/bgm0;-><init>(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v5, v6}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-nez v5, :cond_1

    .line 31
    .line 32
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

    .line 33
    .line 34
    new-instance v6, Ll/cfm0;

    .line 35
    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    move v3, v1

    .line 40
    :goto_1
    invoke-direct {v6, v4, v3}, Ll/cfm0;-><init>(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/s;->N4()Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

    .line 64
    .line 65
    new-instance v0, Ll/cfm0;

    .line 66
    .line 67
    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    iget p1, p1, Lcom/p1/mobile/putong/data/VisitorCounter;->totalCnt:I

    .line 73
    .line 74
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {p1, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const-string v1, "%s\u4eba\u770b\u8fc7\u6211 \u00b7 \u5f00\u901a\u9ed1\u91d1\u4f1a\u5458\u4e00\u952e\u89e3\u9501"

    .line 87
    .line 88
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-direct {v0, p1, v3}, Ll/cfm0;-><init>(Ljava/lang/String;Z)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    :cond_3
    return-void
.end method

.method private final V0(Ljava/lang/String;Ljava/util/List;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "+",
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

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
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

    .line 38
    .line 39
    new-instance v1, Ll/egm0;

    .line 40
    .line 41
    invoke-direct {v1, p2}, Ll/egm0;-><init>(Lcom/p1/mobile/putong/data/Visitor;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

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
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    return-void
.end method

.method public static e0(ZLcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Ll/pf60;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->s5()Lrx/c;

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->b:Z

    .line 11
    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    iget-object p0, p1, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/sgm0;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Ll/sgm0;->C(Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->S0(Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static f0(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "visitor_update_time"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->H0(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->getData()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static g0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static h0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static i0(ZLcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Ll/pf60;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->s5()Lrx/c;

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->b:Z

    .line 11
    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    iget-object p0, p1, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/sgm0;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Ll/sgm0;->C(Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->S0(Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static j0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static k0(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Ll/cfm0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/cfm0;->d:Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p1, Ll/cfm0;->d:Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->userId:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->userId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static l0(Ljava/lang/String;)Ljava/lang/Boolean;
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
    const-string v0, "visitor"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "visitor_update_time"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static m0(Lcom/p1/mobile/putong/data/Visitor;Ll/cfm0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p1, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Visitor;->userId:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Visitor;->userId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static n0(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->b:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->getData()V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Ll/sgm0;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p1, v0}, Ll/sgm0;->C(Z)V

    .line 15
    .line 16
    .line 17
    :goto_0
    invoke-static {}, Ll/joa;->G3()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Ll/sgm0;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-virtual {p0, p1}, Ll/sgm0;->H(Z)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public static o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static p0(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Lcom/p1/mobile/putong/data/VisitorCounter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->G3()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->g:Ll/pf60;

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
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static q0(Z)Lrx/c;
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
    const-string v3, ""

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/enb;->a4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static s0(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Lcom/p1/mobile/putong/core/data/VisitorSetting;)V
    .locals 1

    .line 1
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/VisitorSetting;->visitorPermission:Z

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->b:Z

    .line 4
    .line 5
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/sgm0;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p1, "\u6ed1\u5361\u8ba9\u66f4\u591a\u4eba\u770b\u5230\u6211"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p1, "\u5f00\u542f\u540e\u53ef\u67e5\u770b\u8c01\u770b\u8fc7\u6211"

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, p1}, Ll/sgm0;->A(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->b:Z

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->getData()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/sgm0;

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    invoke-virtual {p0, p1}, Ll/sgm0;->C(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static t0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static u0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static x0(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Ll/pf60;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->d:Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VisitorInfo;->nullCheck()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/data/NewVisitors;->visitors:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    add-int/2addr v0, v2

    .line 44
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/data/RecommendVisitors;->visitors:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    add-int/2addr v0, v2

    .line 53
    const/16 v2, 0xa

    .line 54
    .line 55
    const/4 v3, 0x1

    .line 56
    if-gt v0, v2, :cond_0

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->d:Lcom/p1/mobile/putong/data/Links;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->J0(Lcom/p1/mobile/putong/data/Links;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_0

    .line 65
    .line 66
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->f:I

    .line 67
    .line 68
    if-ge v0, v2, :cond_0

    .line 69
    .line 70
    add-int/2addr v0, v3

    .line 71
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->f:I

    .line 72
    .line 73
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->Q0()V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->f:I

    .line 78
    .line 79
    :goto_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->L0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    const/4 v1, -0x3

    .line 84
    const-string v2, "\u5168\u90e8"

    .line 85
    .line 86
    const-string v4, ""

    .line 87
    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/data/NewVisitors;->visitors:Ljava/util/List;

    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    const/4 v5, -0x1

    .line 98
    invoke-direct {p0, v4, v0, v5}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->V0(Ljava/lang/String;Ljava/util/List;I)V

    .line 99
    .line 100
    .line 101
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->I0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_4

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 110
    .line 111
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    invoke-direct {p0, v2, p1, v1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->V0(Ljava/lang/String;Ljava/util/List;I)V

    .line 115
    .line 116
    .line 117
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->e:Z

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->I0(Lcom/p1/mobile/putong/data/VisitorInfo;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_4

    .line 125
    .line 126
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->e:Z

    .line 127
    .line 128
    if-eqz v0, :cond_2

    .line 129
    .line 130
    move-object v2, v4

    .line 131
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 132
    .line 133
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AllVisitors;->visitors:Ljava/util/List;

    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 136
    .line 137
    .line 138
    invoke-direct {p0, v2, p1, v1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->V0(Ljava/lang/String;Ljava/util/List;I)V

    .line 139
    .line 140
    .line 141
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->e:Z

    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_3
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->f:I

    .line 145
    .line 146
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 147
    .line 148
    check-cast p1, Ll/sgm0;

    .line 149
    .line 150
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

    .line 151
    .line 152
    invoke-virtual {p1, p0}, Ll/sgm0;->z(Ljava/util/List;)V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public static y0(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->f:I

    .line 3
    .line 4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p1, Ll/sgm0;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ll/sgm0;->z(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static z0(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Lcom/p1/mobile/putong/data/VisitorCounter;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->b:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/sgm0;

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Ll/sgm0;->C(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->g:Ll/pf60;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->S0(Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method


# virtual methods
.method public final H0(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/joa;->G3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/ufm0;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/ufm0;-><init>(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/vfm0;

    .line 17
    .line 18
    invoke-direct {v1, p1, p0}, Ll/vfm0;-><init>(ZLcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Ll/wfm0;

    .line 22
    .line 23
    invoke-direct {p0}, Ll/wfm0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    new-instance v0, Ll/xfm0;

    .line 35
    .line 36
    invoke-direct {v0, p1}, Ll/xfm0;-><init>(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/zfm0;

    .line 44
    .line 45
    invoke-direct {v1, p1, p0}, Ll/zfm0;-><init>(ZLcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V

    .line 46
    .line 47
    .line 48
    new-instance p0, Ll/agm0;

    .line 49
    .line 50
    invoke-direct {p0}, Ll/agm0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final J0(Lcom/p1/mobile/putong/data/Links;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/Links;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    return p0
.end method

.method public final P0()V
    .locals 0

    .line 1
    return-void
.end method

.method public final R0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->f:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->d:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->getData()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/enb;->S:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/nfm0;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/nfm0;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/kgm0;

    .line 17
    .line 18
    invoke-direct {v2, v1}, Ll/kgm0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v2}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/lgm0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/lgm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/mgm0;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/mgm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Ll/ofm0;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/ofm0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 48
    .line 49
    .line 50
    sget-object v0, Ll/e7d0;->Companion:Ll/e7d0$a;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/e7d0$a;->b()Ll/e7d0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ll/e7d0;->d()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Ll/pfm0;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/pfm0;-><init>()V

    .line 67
    .line 68
    .line 69
    new-instance v3, Ll/qfm0;

    .line 70
    .line 71
    invoke-direct {v3, v2}, Ll/qfm0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    new-instance v2, Ll/rfm0;

    .line 79
    .line 80
    invoke-direct {v2, p0}, Ll/rfm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V

    .line 81
    .line 82
    .line 83
    new-instance v3, Ll/sfm0;

    .line 84
    .line 85
    invoke-direct {v3}, Ll/sfm0;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isNewMainActContext(Landroid/app/Activity;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_0

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/e7d0$a;->d()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_0

    .line 114
    .line 115
    new-instance v0, Ll/tfm0;

    .line 116
    .line 117
    invoke-direct {v0}, Ll/tfm0;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    new-instance v1, Ll/yfm0;

    .line 129
    .line 130
    invoke-direct {v1, p0}, Ll/yfm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V

    .line 131
    .line 132
    .line 133
    new-instance v2, Ll/fgm0;

    .line 134
    .line 135
    invoke-direct {v2, v1}, Ll/fgm0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    new-instance v1, Ll/ggm0;

    .line 143
    .line 144
    invoke-direct {v1, p0}, Ll/ggm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V

    .line 145
    .line 146
    .line 147
    new-instance v2, Ll/hgm0;

    .line 148
    .line 149
    invoke-direct {v2}, Ll/hgm0;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 157
    .line 158
    .line 159
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 160
    .line 161
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 162
    .line 163
    const-string v1, "oDiamond"

    .line 164
    .line 165
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    sget-object v1, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter$initSubscription$12;->INSTANCE:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter$initSubscription$12;

    .line 178
    .line 179
    new-instance v2, Ll/igm0;

    .line 180
    .line 181
    invoke-direct {v2, v1}, Ll/igm0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    const/4 v1, 0x1

    .line 193
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    new-instance v1, Ll/jgm0;

    .line 198
    .line 199
    invoke-direct {v1, p0}, Ll/jgm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V

    .line 200
    .line 201
    .line 202
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-lez p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->d:Lcom/p1/mobile/putong/data/Links;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->J0(Lcom/p1/mobile/putong/data/Links;)Z

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
    if-eqz p1, :cond_1

    .line 46
    .line 47
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->f:I

    .line 48
    .line 49
    if-nez p1, :cond_1

    .line 50
    .line 51
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->Q0()V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public getData()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->H0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
