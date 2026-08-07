.class public Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$b;,
        Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$a;,
        Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->b:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->c:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->d:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->e:Ljava/util/List;

    .line 31
    .line 32
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->f:Ljava/util/List;

    .line 38
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->g:Ljava/util/List;

    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->a:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->M(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->X()Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/bkj0;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1, p2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;->p(Ll/bkj0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->i0(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->X()Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/bkj0;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1, p2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;->r(Ll/bkj0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->g0(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->X()Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/bkj0;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1, p2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;->o(Ll/bkj0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->j0(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->X()Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/bkj0;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1, p2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;->u(Ll/bkj0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->K(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic H(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->f0(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->X()Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/bkj0;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1, p2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;->n(Ll/bkj0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->L(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->X()Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/bkj0;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1, p2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;->q(Ll/bkj0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final J(Ljava/lang/String;Ljava/util/Map;)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;)F"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Float;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->H(Ljava/lang/String;)F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->p(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->f:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->j(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x2

    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->f(I)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x3

    .line 19
    const/4 p2, 0x0

    .line 20
    invoke-virtual {p1, p0, p2, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->n(IZI)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ll/bkj0;)V
    .locals 4

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 21
    .line 22
    iget-object v2, v1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v3, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v3, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 27
    .line 28
    iget-object v3, v3, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->beautyParameterMap:Ljava/util/Map;

    .line 29
    .line 30
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->J(Ljava/lang/String;Ljava/util/Map;)F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iput v2, v1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->all:F

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->l()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ll/bkj0;)V
    .locals 4

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->e:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 21
    .line 22
    iget-object v2, v1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v3, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v3, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 27
    .line 28
    iget-object v3, v3, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->beautyParameterMap:Ljava/util/Map;

    .line 29
    .line 30
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->J(Ljava/lang/String;Ljava/util/Map;)F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iput v2, v1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->all:F

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->l()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public N(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;",
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
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->b:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->b:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->c:Ll/lh;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ll/lh;->M(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    new-instance v0, Ll/es;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Ll/es;-><init>(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/fs;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/fs;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final P(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->v()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/bs;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/bs;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->setOnItemClicked(Ll/a30;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->f(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->c:Ljava/util/List;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->j(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    invoke-virtual {p1, p0, p0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->n(IZI)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;I)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->j()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance p2, Ll/zr;

    .line 12
    .line 13
    invoke-direct {p2}, Ll/zr;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->setOnItemClicked(Ll/a30;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->d:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->j(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    const/4 p2, 0x1

    .line 25
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->f(I)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p1, p2, p2, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->n(IZI)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->X()Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;->l()Ll/s120;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->a:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    new-instance v1, Ll/as;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1}, Ll/as;-><init>(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0, v1}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final R(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;->s(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;->k(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;->B(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final S(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;I)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->o()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance p2, Ll/cs;

    .line 12
    .line 13
    invoke-direct {p2}, Ll/cs;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->setOnItemClicked(Ll/a30;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->e:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->j(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    const/4 p2, 0x1

    .line 25
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->f(I)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    invoke-virtual {p1, v0, p2, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->n(IZI)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->X()Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;->l()Ll/s120;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->a:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    new-instance v1, Ll/ds;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1}, Ll/ds;-><init>(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0, v1}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final T(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;I)V
    .locals 0

    .line 1
    new-instance p3, Ll/yr;

    .line 2
    .line 3
    invoke-direct {p3}, Ll/yr;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->setOnItemClicked(Ll/a30;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p3}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->M()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    iput-object p3, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->f:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/account/data/CameraCategory;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->O(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->f:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->j(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x2

    .line 37
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->f(I)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x3

    .line 41
    const/4 p2, 0x0

    .line 42
    invoke-virtual {p1, p0, p2, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->n(IZI)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemViewType(I)I
    .locals 0

    const/4 p0, 0x4

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 3
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;

    .line 8
    .line 9
    instance-of v1, p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$b;

    .line 10
    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$b;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$b;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;

    .line 16
    .line 17
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p1, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget v1, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->extType:I

    .line 25
    .line 26
    const/16 v2, 0x3e8

    .line 27
    .line 28
    if-ne v1, v2, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->P(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const/16 v2, 0x3e9

    .line 35
    .line 36
    if-ne v1, v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->Q(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const/16 v2, 0x3ea

    .line 43
    .line 44
    if-ne v1, v2, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->S(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;I)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    const/16 v2, 0x3eb

    .line 51
    .line 52
    if-ne v1, v2, :cond_4

    .line 53
    .line 54
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->T(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    instance-of v1, p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$a;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    check-cast p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$a;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;

    .line 65
    .line 66
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    new-instance p2, Ll/wr;

    .line 74
    .line 75
    invoke-direct {p2}, Ll/wr;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;->setOnCategoryClicked(Ll/a30;)V

    .line 79
    .line 80
    .line 81
    new-instance p2, Ll/xr;

    .line 82
    .line 83
    invoke-direct {p2}, Ll/xr;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;->setOnItemClicked(Ll/a30;)V

    .line 87
    .line 88
    .line 89
    iget-object p2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->subMenu:Ljava/util/List;

    .line 90
    .line 91
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->R(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;Ljava/util/List;)V

    .line 92
    .line 93
    .line 94
    :cond_4
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 1
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget p2, Ll/hec0;->g:I

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;

    .line 17
    .line 18
    new-instance p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$b;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$b;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;)V

    .line 21
    .line 22
    .line 23
    return-object p1

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget p2, Ll/hec0;->c:I

    .line 29
    .line 30
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;

    .line 35
    .line 36
    new-instance p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$a;

    .line 37
    .line 38
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$a;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;)V

    .line 39
    .line 40
    .line 41
    return-object p1
.end method
