.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$b;,
        Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$a;,
        Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->b:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->c:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->d:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->e:Ljava/util/List;

    .line 31
    .line 32
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->f:Ljava/util/List;

    .line 38
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->g:Ljava/util/List;

    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->a:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->L(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->j0(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->u(Ll/bkj0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->f0(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->n(Ll/bkj0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic E(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->M(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->q(Ll/bkj0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->g0(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->o(Ll/bkj0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->i0(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->r(Ll/bkj0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private J(Ljava/lang/String;Ljava/util/Map;)F
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
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->H(Ljava/lang/String;)F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->p(Ll/bkj0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->K(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public final synthetic K(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->p(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->f:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->j(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x2

    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->f(I)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x3

    .line 19
    const/4 p2, 0x0

    .line 20
    invoke-virtual {p1, p0, p2, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->n(IZI)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ll/bkj0;)V
    .locals 4

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->d:Ljava/util/List;

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
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 21
    .line 22
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v3, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 27
    .line 28
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->beautyParameterMap:Ljava/util/Map;

    .line 29
    .line 30
    invoke-direct {p0, v2, v3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->J(Ljava/lang/String;Ljava/util/Map;)F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iput v2, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->l()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ll/bkj0;)V
    .locals 4

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->e:Ljava/util/List;

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
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 21
    .line 22
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v3, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 27
    .line 28
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->beautyParameterMap:Ljava/util/Map;

    .line 29
    .line 30
    invoke-direct {p0, v2, v3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->J(Ljava/lang/String;Ljava/util/Map;)F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iput v2, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->l()V

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
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;",
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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->b:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->b:Ljava/util/List;

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

.method public final O(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/feed/api/a;->Q2(Ljava/lang/String;)Lrx/c;

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
    new-instance v0, Ll/zdh;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Ll/zdh;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/aeh;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/aeh;-><init>()V

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

.method public final P(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->v()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/tdh;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/tdh;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->setOnItemClicked(Ll/a30;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->f(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->c:Ljava/util/List;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->j(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    invoke-virtual {p1, p0, p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->n(IZI)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;I)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->j()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance p2, Ll/wdh;

    .line 12
    .line 13
    invoke-direct {p2}, Ll/wdh;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->setOnItemClicked(Ll/a30;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->d:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->j(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    const/4 p2, 0x1

    .line 25
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->f(I)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p1, p2, p2, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->n(IZI)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->l()Ll/s120;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->a:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    new-instance v1, Ll/xdh;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1}, Ll/xdh;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0, v1}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final R(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->s(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->k(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->B(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final S(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;I)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->o()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance p2, Ll/udh;

    .line 12
    .line 13
    invoke-direct {p2}, Ll/udh;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->setOnItemClicked(Ll/a30;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->e:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->j(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    const/4 p2, 0x1

    .line 25
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->f(I)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    invoke-virtual {p1, v0, p2, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->n(IZI)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->l()Ll/s120;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->a:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    new-instance v1, Ll/vdh;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1}, Ll/vdh;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0, v1}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final T(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;I)V
    .locals 0

    .line 1
    new-instance p3, Ll/ydh;

    .line 2
    .line 3
    invoke-direct {p3}, Ll/ydh;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->setOnItemClicked(Ll/a30;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p3}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->M()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->f:Ljava/util/List;

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
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->O(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->f:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->j(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x2

    .line 37
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->f(I)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x3

    .line 41
    const/4 p2, 0x0

    .line 42
    invoke-virtual {p1, p0, p2, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->n(IZI)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->b:Ljava/util/List;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 8
    .line 9
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$b;

    .line 10
    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$b;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

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
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;->extType:I

    .line 25
    .line 26
    const/16 v2, 0x3e8

    .line 27
    .line 28
    if-ne v1, v2, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->P(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->Q(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;I)V

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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->S(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;I)V

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
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->T(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$a;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$a;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;

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
    new-instance p2, Ll/rdh;

    .line 74
    .line 75
    invoke-direct {p2}, Ll/rdh;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->setOnCategoryClicked(Ll/a30;)V

    .line 79
    .line 80
    .line 81
    new-instance p2, Ll/sdh;

    .line 82
    .line 83
    invoke-direct {p2}, Ll/sdh;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->setOnItemClicked(Ll/a30;)V

    .line 87
    .line 88
    .line 89
    iget-object p2, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;->subMenu:Ljava/util/List;

    .line 90
    .line 91
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->R(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;Ljava/util/List;)V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->a:Lcom/p1/mobile/android/app/Act;

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
    sget p2, Ll/tec0;->V:I

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 17
    .line 18
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$b;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$b;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

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
    sget p2, Ll/tec0;->R:I

    .line 29
    .line 30
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;

    .line 35
    .line 36
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$a;

    .line 37
    .line 38
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;)V

    .line 39
    .line 40
    .line 41
    return-object p1
.end method
