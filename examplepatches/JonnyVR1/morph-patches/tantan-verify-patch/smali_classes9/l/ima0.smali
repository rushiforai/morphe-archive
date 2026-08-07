.class public Ll/ima0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/cla0;",
        ">;"
    }
.end annotation


# instance fields
.field public final A:Landroidx/recyclerview/widget/RecyclerView$t;

.field public final B:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public a:Lv/VFrame;

.field public b:Lv/VFrame;

.field public c:Lv/VProgressBar;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/ParallaxView;

.field public e:Landroidx/recyclerview/widget/RecyclerView;

.field public f:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

.field public i:Landroid/view/View;

.field public final j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

.field public k:Ll/cla0;

.field public final l:Ll/mw90;

.field public m:Ll/hr90;

.field public n:Ll/hr90;

.field public o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

.field public p:Ll/no90;

.field public q:Ll/lp90;

.field public r:Ll/zq90;

.field public s:Ll/sz90;

.field public t:Ll/b43;

.field public u:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public final v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;",
            ">;"
        }
    .end annotation
.end field

.field public w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

.field public final x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/on2<",
            "*>;>;"
        }
    .end annotation
.end field

.field public y:Ll/q1a0;

.field public z:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;Ll/zq90;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/ima0;->q:Ll/lp90;

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ima0;->v:Ljava/util/List;

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/ima0;->x:Ljava/util/List;

    .line 20
    .line 21
    new-instance v0, Ll/q1a0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/q1a0;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/ima0;->y:Ll/q1a0;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput v0, p0, Ll/ima0;->z:I

    .line 30
    .line 31
    new-instance v0, Ll/ima0$c;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/ima0$c;-><init>(Ll/ima0;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/ima0;->A:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 37
    .line 38
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Ll/ima0;->B:Lrx/subjects/a;

    .line 43
    .line 44
    iput-object p1, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 45
    .line 46
    iput-object p2, p0, Ll/ima0;->r:Ll/zq90;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->B:Ll/mw90;

    .line 49
    .line 50
    iput-object p1, p0, Ll/ima0;->l:Ll/mw90;

    .line 51
    .line 52
    return-void
.end method

.method public static synthetic A(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->j0()V

    return-void
.end method

.method public static synthetic B()Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->tranceHash:I

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->CARD_CLICK:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->endTrance()V

    .line 17
    .line 18
    .line 19
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    return-object v0
.end method

.method public static synthetic C(Ll/ima0;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ima0;->s0(Landroid/widget/LinearLayout;)V

    return-void
.end method

.method public static synthetic E(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->q0()V

    return-void
.end method

.method public static synthetic F(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->D0()V

    return-void
.end method

.method public static synthetic G(Ll/oma0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oma0;->Y(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->k0()V

    return-void
.end method

.method private H0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ima0;->b:Lv/VFrame;

    .line 2
    .line 3
    new-instance v0, Ll/hla0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/hla0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic I(Ll/ima0;)Landroidx/recyclerview/widget/LinearLayoutManager;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->u:Landroidx/recyclerview/widget/LinearLayoutManager;

    return-object p0
.end method

.method public static bridge synthetic J(Ll/ima0;)Ll/cla0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    return-object p0
.end method

.method public static bridge synthetic K(Ll/ima0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ima0;->z:I

    return p0
.end method

.method public static bridge synthetic L(Ll/ima0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ima0;->z:I

    return-void
.end method

.method public static bridge synthetic M(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->Q()V

    return-void
.end method

.method public static bridge synthetic N(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->M0()V

    return-void
.end method

.method public static bridge synthetic O(Ll/ima0;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ima0;->N0(Z)V

    return-void
.end method

.method private V(Ll/zq90;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ima0;->v:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;->a(Ll/zq90;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iput-object v1, p0, Ll/ima0;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "init Button Strategy : "

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v0, "[core][profile]"

    .line 42
    .line 43
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/ima0;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method private X(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->q:Ll/lp90;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lp90;->e(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private Z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ima0;->v:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/ao70;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ima0;->r:Ll/zq90;

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ll/ao70;-><init>(Ll/zq90;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/ima0;->v:Ljava/util/List;

    .line 14
    .line 15
    new-instance v1, Ll/erc0;

    .line 16
    .line 17
    iget-object v2, p0, Ll/ima0;->r:Ll/zq90;

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ll/erc0;-><init>(Ll/zq90;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/ima0;->v:Ljava/util/List;

    .line 26
    .line 27
    new-instance v1, Ll/hhr;

    .line 28
    .line 29
    iget-object v2, p0, Ll/ima0;->r:Ll/zq90;

    .line 30
    .line 31
    invoke-direct {v1, v2}, Ll/hhr;-><init>(Ll/zq90;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/ima0;->v:Ljava/util/List;

    .line 38
    .line 39
    new-instance v1, Ll/kmb0;

    .line 40
    .line 41
    iget-object v2, p0, Ll/ima0;->r:Ll/zq90;

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ll/kmb0;-><init>(Ll/zq90;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/ima0;->v:Ljava/util/List;

    .line 50
    .line 51
    new-instance v1, Ll/h55;

    .line 52
    .line 53
    iget-object v2, p0, Ll/ima0;->r:Ll/zq90;

    .line 54
    .line 55
    invoke-direct {v1, v2}, Ll/h55;-><init>(Ll/zq90;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/ima0;->v:Ljava/util/List;

    .line 62
    .line 63
    new-instance v1, Ll/lgl0;

    .line 64
    .line 65
    iget-object v2, p0, Ll/ima0;->r:Ll/zq90;

    .line 66
    .line 67
    invoke-direct {v1, v2}, Ll/lgl0;-><init>(Ll/zq90;)V

    .line 68
    .line 69
    .line 70
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/ima0;->v:Ljava/util/List;

    .line 74
    .line 75
    new-instance v1, Ll/v7l;

    .line 76
    .line 77
    iget-object v2, p0, Ll/ima0;->r:Ll/zq90;

    .line 78
    .line 79
    invoke-direct {v1, v2}, Ll/v7l;-><init>(Ll/zq90;)V

    .line 80
    .line 81
    .line 82
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/ima0;->v:Ljava/util/List;

    .line 86
    .line 87
    new-instance v1, Ll/im5;

    .line 88
    .line 89
    iget-object p0, p0, Ll/ima0;->r:Ll/zq90;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/im5;-><init>(Ll/zq90;)V

    .line 92
    .line 93
    .line 94
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/ima0;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ima0;->v0(Landroid/widget/LinearLayout;)V

    return-void
.end method

.method private b0()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/ima0;->Z()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/ima0;->V(Ll/zq90;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/ima0;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/a;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ima0;->C0()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/ima0;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/a;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;)Ll/lp90;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/ima0;->q:Ll/lp90;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "generate button layout : "

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "[core][profile]"

    .line 44
    .line 45
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/ima0;->q:Ll/lp90;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/lp90;->k()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Ll/ima0;->g:Landroid/widget/FrameLayout;

    .line 55
    .line 56
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 57
    .line 58
    const/high16 v3, 0x43240000    # 164.0f

    .line 59
    .line 60
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    const/4 v4, -0x1

    .line 65
    invoke-direct {v2, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/ima0;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 72
    .line 73
    iget-object v1, p0, Ll/ima0;->q:Ll/lp90;

    .line 74
    .line 75
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;->d(Ll/lp90;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/ima0;->k:Ll/cla0;

    .line 79
    .line 80
    iget-object v0, v0, Ll/cla0;->b:Lrx/subjects/a;

    .line 81
    .line 82
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/ima0;->q:Ll/lp90;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/lp90;->d()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->a()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->None:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 98
    .line 99
    if-eq v0, v1, :cond_0

    .line 100
    .line 101
    iget-object v0, p0, Ll/ima0;->t:Ll/b43;

    .line 102
    .line 103
    new-instance v1, Ll/gla0;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/gla0;-><init>(Ll/ima0;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ll/on2;->a(Ll/x20;)V

    .line 109
    .line 110
    .line 111
    :cond_0
    return-void
.end method

.method public static synthetic c(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->w0()V

    return-void
.end method

.method private c0()V
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 31
    .line 32
    invoke-interface {v0, v1}, Ll/eu9;->h(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 36
    .line 37
    new-instance v1, Ll/ama0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/ama0;-><init>(Ll/ima0;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->setBackCallBack(Ll/x20;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/zq90;->K()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    invoke-static {}, Ll/lik0;->a()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget-object v1, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    new-instance v0, Ll/bma0;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/bma0;-><init>(Ll/ima0;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->setMoreCallBack(Ll/x20;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 70
    .line 71
    new-instance v1, Ll/cma0;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/cma0;-><init>(Ll/ima0;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ll/on2;->a(Ll/x20;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/zq90;->o()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_1

    .line 86
    .line 87
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 88
    .line 89
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 90
    .line 91
    const-string v1, "share_profile"

    .line 92
    .line 93
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_1

    .line 98
    .line 99
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 100
    .line 101
    invoke-virtual {v0}, Ll/zq90;->F()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_4

    .line 106
    .line 107
    :cond_1
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 108
    .line 109
    new-instance v1, Ll/dma0;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/dma0;-><init>(Ll/ima0;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ll/on2;->a(Ll/x20;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_2
    new-instance v0, Ll/ema0;

    .line 119
    .line 120
    invoke-direct {v0, p0}, Ll/ema0;-><init>(Ll/ima0;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->setMoreCallBack(Ll/x20;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 127
    .line 128
    new-instance v1, Ll/fma0;

    .line 129
    .line 130
    invoke-direct {v1, p0}, Ll/fma0;-><init>(Ll/ima0;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ll/on2;->a(Ll/x20;)V

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_3
    new-instance v0, Ll/gma0;

    .line 138
    .line 139
    invoke-direct {v0, p0}, Ll/gma0;-><init>(Ll/ima0;)V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 143
    .line 144
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->setEditCallBack(Ll/x20;)V

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 148
    .line 149
    new-instance v2, Ll/hma0;

    .line 150
    .line 151
    invoke-direct {v2, p0, v0}, Ll/hma0;-><init>(Ll/ima0;Ll/x20;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1, v2}, Ll/on2;->a(Ll/x20;)V

    .line 155
    .line 156
    .line 157
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/ima0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 158
    .line 159
    new-instance v1, Ll/ima0$b;

    .line 160
    .line 161
    invoke-direct {v1, p0}, Ll/ima0$b;-><init>(Ll/ima0;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public static synthetic d(Ll/ima0;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ima0;->n0(Ll/x20;)V

    return-void
.end method

.method private d0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zq90;->e:Ll/zq90$a;

    .line 4
    .line 5
    iget v0, v0, Ll/zq90$a;->l:I

    .line 6
    .line 7
    if-ltz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/ima0;->l:Ll/mw90;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, v0, v2}, Ll/mw90;->m2(IZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/SmoothScrollLinearLayoutManager;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ima0;->C0()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/SmoothScrollLinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/ima0;->u:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 25
    .line 26
    iget-object v0, p0, Ll/ima0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/ima0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 33
    .line 34
    iget-object v1, p0, Ll/ima0;->u:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/ima0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 40
    .line 41
    iget-object v1, p0, Ll/ima0;->y:Ll/q1a0;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/ima0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .line 48
    iget-object v1, p0, Ll/ima0;->A:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/zq90;->E()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, Ll/ima0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 62
    .line 63
    new-instance v1, Ll/ila0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/ila0;-><init>(Ll/ima0;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object v0, p0, Ll/ima0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/ima0$a;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/ima0$a;-><init>(Ll/ima0;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public static synthetic e(Ll/ima0;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ima0;->E0(Landroid/widget/LinearLayout;)V

    return-void
.end method

.method public static synthetic f(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->r0()V

    return-void
.end method

.method private f0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/spl0;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/zq90;->o()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/zq90;->F()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/dkb;->c8()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    invoke-static {}, Ll/a5i0;->v0()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-lez v0, :cond_1

    .line 52
    .line 53
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v0, v0, Ll/p6d0;->j:Ljava/util/Set;

    .line 58
    .line 59
    iget-object v1, p0, Ll/ima0;->r:Ll/zq90;

    .line 60
    .line 61
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_1

    .line 68
    .line 69
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Ll/p6d0;->f0()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_1

    .line 78
    .line 79
    iget-object v0, p0, Ll/ima0;->q:Ll/lp90;

    .line 80
    .line 81
    instance-of v0, v0, Ll/tu40;

    .line 82
    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/rla0;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/rla0;-><init>(Ll/ima0;)V

    .line 92
    .line 93
    .line 94
    const-wide/16 v2, 0x3e8

    .line 95
    .line 96
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 97
    .line 98
    .line 99
    :cond_1
    return-void
.end method

.method public static synthetic i(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ima0;->o0()V

    return-void
.end method

.method public static synthetic j(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->y0()V

    return-void
.end method

.method public static synthetic k(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->h0()V

    return-void
.end method

.method public static synthetic l(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->l0()V

    return-void
.end method

.method public static synthetic m(Ll/ima0;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ima0;->x0(Landroid/widget/LinearLayout;)V

    return-void
.end method

.method public static synthetic n(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->z0()V

    return-void
.end method

.method private synthetic o0()V
    .locals 1

    .line 1
    const-string v0, "button"

    .line 2
    .line 3
    invoke-static {v0}, Ll/pza0;->h(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/cla0;->U2()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic p(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->B0()V

    return-void
.end method

.method public static synthetic q(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->m0()V

    return-void
.end method

.method public static synthetic s(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->u0()V

    return-void
.end method

.method public static synthetic u(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->t0()V

    return-void
.end method

.method public static synthetic v(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->p0()V

    return-void
.end method

.method public static synthetic w()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "share_tip"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic x(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->A0()V

    return-void
.end method

.method public static synthetic y(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->i0()V

    return-void
.end method

.method public static synthetic z(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ima0;->G0()V

    return-void
.end method


# virtual methods
.method public final synthetic A0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->y1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic B0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->z1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic D0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->A1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic E0(Landroid/widget/LinearLayout;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ima0;->k:Ll/cla0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->V()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "\u70b9\u51fb\u63a8\u8350\u7ed9\u597d\u53cb"

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Ll/ima0;->W0(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->R()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic G0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    new-instance v1, Ll/xla0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/xla0;-><init>(Ll/ima0;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->I1(Ll/y20;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public I0()V
    .locals 3

    .line 1
    const-string v0, "[core][profile]"

    .line 2
    .line 3
    const-string v1, "onEnterAnimEnd"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-boolean v2, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->E:Z

    .line 12
    .line 13
    new-instance v0, Ljava/lang/Object;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->CUSTOM:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 23
    .line 24
    invoke-static {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/ima0;->B:Lrx/subjects/a;

    .line 28
    .line 29
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 35
    .line 36
    new-instance v1, Ll/yla0;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/yla0;-><init>(Ll/ima0;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/on2;->a(Ll/x20;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 45
    .line 46
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->F:Z

    .line 47
    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/cla0;->W2()V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public J0()V
    .locals 3

    .line 1
    const-string v0, "[core][profile]"

    .line 2
    .line 3
    const-string v1, "onEnterAnimStart"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/Object;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->CUSTOM:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 18
    .line 19
    const-string v2, "preEnterAnimStart"

    .line 20
    .line 21
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->E:Z

    .line 28
    .line 29
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 30
    .line 31
    new-instance v1, Ll/vla0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/vla0;-><init>(Ll/ima0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/on2;->a(Ll/x20;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public K0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->E:Z

    .line 5
    .line 6
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 7
    .line 8
    new-instance v1, Ll/zla0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/zla0;-><init>(Ll/ima0;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/on2;->a(Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public L0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    new-instance p1, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->PRE_CREATE_VIEW:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 11
    .line 12
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v1, v2}, Landroidx/fragment/app/Fragment;->setHasOptionsMenu(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ima0;->a0()V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final M0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ima0;->p:Ll/no90;

    .line 2
    .line 3
    iget-object v1, v0, Ll/no90;->v:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/on2;->u()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-array v0, v2, [I

    .line 20
    .line 21
    iget-object v1, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 24
    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    aget v0, v0, v1

    .line 28
    .line 29
    iget-object v3, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    add-int/2addr v0, v3

    .line 36
    int-to-float v0, v0

    .line 37
    new-array v2, v2, [I

    .line 38
    .line 39
    iget-object v3, p0, Ll/ima0;->p:Ll/no90;

    .line 40
    .line 41
    iget-object v3, v3, Ll/no90;->v:Landroid/widget/RelativeLayout;

    .line 42
    .line 43
    invoke-virtual {v3, v2}, Landroid/view/View;->getLocationInWindow([I)V

    .line 44
    .line 45
    .line 46
    aget v1, v2, v1

    .line 47
    .line 48
    int-to-float v1, v1

    .line 49
    sub-float/2addr v0, v1

    .line 50
    iget-object v1, p0, Ll/ima0;->p:Ll/no90;

    .line 51
    .line 52
    iget-object v1, v1, Ll/no90;->v:Landroid/widget/RelativeLayout;

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    int-to-float v1, v1

    .line 59
    div-float/2addr v0, v1

    .line 60
    iget-object p0, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->g(F)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/ima0;->u:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-le v0, v2, :cond_2

    .line 73
    .line 74
    iget-object p0, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 75
    .line 76
    const/high16 v0, 0x3f800000    # 1.0f

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->g(F)V

    .line 79
    .line 80
    .line 81
    :cond_2
    return-void
.end method

.method public final N0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->H:Lv/VImage;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->K:Lv/VImage;

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
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->L:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/on2;->u()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Ll/ima0;->k:Ll/cla0;

    .line 44
    .line 45
    iget-object v1, p0, Ll/ima0;->r:Ll/zq90;

    .line 46
    .line 47
    iget-object v1, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/cla0;->V1(Lcom/p1/mobile/putong/data/User;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->J:Lv/VText;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iget-object p0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->x1(Z)V

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_0
    return-void
.end method

.method public O0()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ima0;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public P(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jma0;->b(Ll/ima0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public P0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 8
    .line 9
    iget-object v1, p0, Ll/ima0;->r:Ll/zq90;

    .line 10
    .line 11
    iget-object v2, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v3, v1, Ll/zq90;->b:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/zq90;->L()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    instance-of p0, p0, Lcom/p1/mobile/putong/core/newui/container/NewUI1ContainerActivity;

    .line 24
    .line 25
    invoke-virtual {v0, v2, v3, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->k(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZZ)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final Q()V
    .locals 4

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ula0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/ula0;-><init>(Ll/ima0;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x1f4

    .line 11
    .line 12
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public Q0()V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/ima0;->b:Lv/VFrame;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    iget-object v1, p0, Ll/ima0;->r:Ll/zq90;

    .line 15
    .line 16
    iget-object v1, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_3

    .line 23
    .line 24
    iget-object v1, p0, Ll/ima0;->r:Ll/zq90;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/zq90;->e()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_3

    .line 31
    .line 32
    iget-object v1, p0, Ll/ima0;->b:Lv/VFrame;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x0

    .line 39
    move v3, v2

    .line 40
    :goto_0
    if-ge v3, v1, :cond_2

    .line 41
    .line 42
    iget-object v4, p0, Ll/ima0;->b:Lv/VFrame;

    .line 43
    .line 44
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    iget-object v5, p0, Ll/ima0;->d:Lcom/p1/mobile/putong/core/ui/profile/ParallaxView;

    .line 49
    .line 50
    if-eq v4, v5, :cond_1

    .line 51
    .line 52
    iget-object v5, p0, Ll/ima0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 53
    .line 54
    if-ne v4, v5, :cond_0

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_0
    move v5, v2

    .line 58
    goto :goto_2

    .line 59
    :cond_1
    :goto_1
    const/4 v5, 0x1

    .line 60
    :goto_2
    invoke-static {v4, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    add-int/lit8 v3, v3, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    iget-object v1, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 67
    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ll/ima0;->p:Ll/no90;

    .line 72
    .line 73
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_3
    iget-object v0, p0, Ll/ima0;->x:Ljava/util/List;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ll/ima0;->T(Ljava/util/List;)Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    :goto_3
    iget-object p0, p0, Ll/ima0;->y:Ll/q1a0;

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ll/q1a0;->M(Ljava/util/List;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public R(Ll/cla0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ima0;->k:Ll/cla0;

    .line 2
    .line 3
    return-void
.end method

.method public R0(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ima0;->s:Ll/sz90;

    .line 2
    .line 3
    const-class v0, Ll/oma0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/sz90;->d(Ljava/lang/Class;)Ll/on2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/oma0;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/nla0;

    .line 18
    .line 19
    invoke-direct {v0, p0, p1}, Ll/nla0;-><init>(Ll/oma0;I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/oma0;->a(Ll/x20;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public S()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->N0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public S0(Z)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/ima0;->f:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/ima0;->f:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->u()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v2, p0, Ll/ima0;->r:Ll/zq90;

    .line 38
    .line 39
    iget-object v2, v2, Ll/zq90;->d:Ljava/lang/String;

    .line 40
    .line 41
    const-string v3, "p_suggest_user_profile_info_view"

    .line 42
    .line 43
    invoke-virtual {v1, v2, p1, v0, v3}, Ll/bpe0;->c(Ljava/lang/String;IZLjava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->SuperLike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 47
    .line 48
    invoke-direct {p0, p1}, Ll/ima0;->X(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->a()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Landroid/view/ViewGroup;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/ima0;->r:Ll/zq90;

    .line 78
    .line 79
    iget-object p1, p1, Ll/zq90;->d:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    iget-object v2, v2, Ll/z5h0;->m:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    iget-object v2, p0, Ll/ima0;->f:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 92
    .line 93
    invoke-static {v2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Ll/ima0;->f:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 97
    .line 98
    iget-object v3, p0, Ll/ima0;->r:Ll/zq90;

    .line 99
    .line 100
    iget-object v3, v3, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-eqz v3, :cond_1

    .line 107
    .line 108
    iget-object p0, p0, Ll/ima0;->r:Ll/zq90;

    .line 109
    .line 110
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    goto :goto_0

    .line 117
    :cond_1
    iget-object v3, p0, Ll/ima0;->k:Ll/cla0;

    .line 118
    .line 119
    invoke-virtual {v3}, Ll/cla0;->R2()Lcom/p1/mobile/putong/data/User;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-eqz v3, :cond_2

    .line 128
    .line 129
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/cla0;->R2()Lcom/p1/mobile/putong/data/User;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-nez p0, :cond_2

    .line 140
    .line 141
    move v0, v1

    .line 142
    :cond_2
    :goto_0
    invoke-virtual {v2, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->r(ZZZ)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public final T(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/on2<",
            "*>;>;)",
            "Ljava/util/List<",
            "Ll/on2<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-eqz v3, :cond_7

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Ll/on2;

    .line 23
    .line 24
    invoke-virtual {v3}, Ll/on2;->l()Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    invoke-virtual {v3}, Ll/on2;->k()Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_6

    .line 35
    .line 36
    add-int/lit8 v2, v2, 0x1

    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    if-le v2, v4, :cond_6

    .line 40
    .line 41
    instance-of v4, v1, Ll/cza0;

    .line 42
    .line 43
    if-eqz v4, :cond_1

    .line 44
    .line 45
    new-instance v1, Ll/hr90;

    .line 46
    .line 47
    iget-object v4, p0, Ll/ima0;->l:Ll/mw90;

    .line 48
    .line 49
    iget-object v5, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 50
    .line 51
    invoke-direct {v1, v4, v5}, Ll/hr90;-><init>(Ll/t3m;Ll/ner;)V

    .line 52
    .line 53
    .line 54
    iput-object v1, p0, Ll/ima0;->n:Ll/hr90;

    .line 55
    .line 56
    const/high16 v4, 0x40800000    # 4.0f

    .line 57
    .line 58
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    invoke-virtual {v1, v4}, Ll/on2;->v(I)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/ima0;->n:Ll/hr90;

    .line 66
    .line 67
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    goto/16 :goto_1

    .line 71
    .line 72
    :cond_1
    instance-of v4, v1, Ll/jz90;

    .line 73
    .line 74
    const/high16 v5, 0x41100000    # 9.0f

    .line 75
    .line 76
    if-eqz v4, :cond_2

    .line 77
    .line 78
    new-instance v1, Ll/hr90;

    .line 79
    .line 80
    iget-object v4, p0, Ll/ima0;->l:Ll/mw90;

    .line 81
    .line 82
    iget-object v6, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 83
    .line 84
    invoke-direct {v1, v4, v6}, Ll/hr90;-><init>(Ll/t3m;Ll/ner;)V

    .line 85
    .line 86
    .line 87
    iput-object v1, p0, Ll/ima0;->n:Ll/hr90;

    .line 88
    .line 89
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    invoke-virtual {v1, v4}, Ll/on2;->v(I)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Ll/ima0;->n:Ll/hr90;

    .line 97
    .line 98
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_2
    instance-of v4, v1, Ll/fy90;

    .line 103
    .line 104
    if-eqz v4, :cond_3

    .line 105
    .line 106
    new-instance v1, Ll/hr90;

    .line 107
    .line 108
    iget-object v4, p0, Ll/ima0;->l:Ll/mw90;

    .line 109
    .line 110
    iget-object v5, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 111
    .line 112
    invoke-direct {v1, v4, v5}, Ll/hr90;-><init>(Ll/t3m;Ll/ner;)V

    .line 113
    .line 114
    .line 115
    iput-object v1, p0, Ll/ima0;->n:Ll/hr90;

    .line 116
    .line 117
    const/high16 v4, 0x41800000    # 16.0f

    .line 118
    .line 119
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    invoke-virtual {v1, v4}, Ll/on2;->v(I)V

    .line 124
    .line 125
    .line 126
    iget-object v1, p0, Ll/ima0;->n:Ll/hr90;

    .line 127
    .line 128
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_3
    instance-of v4, v1, Ll/y1b0;

    .line 133
    .line 134
    if-eqz v4, :cond_4

    .line 135
    .line 136
    new-instance v1, Ll/hr90;

    .line 137
    .line 138
    iget-object v4, p0, Ll/ima0;->l:Ll/mw90;

    .line 139
    .line 140
    iget-object v6, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 141
    .line 142
    invoke-direct {v1, v4, v6}, Ll/hr90;-><init>(Ll/t3m;Ll/ner;)V

    .line 143
    .line 144
    .line 145
    iput-object v1, p0, Ll/ima0;->n:Ll/hr90;

    .line 146
    .line 147
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    invoke-virtual {v1, v4}, Ll/on2;->v(I)V

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Ll/ima0;->n:Ll/hr90;

    .line 155
    .line 156
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_4
    instance-of v1, v1, Ll/oz90;

    .line 161
    .line 162
    if-eqz v1, :cond_5

    .line 163
    .line 164
    new-instance v1, Ll/hr90;

    .line 165
    .line 166
    iget-object v4, p0, Ll/ima0;->l:Ll/mw90;

    .line 167
    .line 168
    iget-object v5, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 169
    .line 170
    invoke-direct {v1, v4, v5}, Ll/hr90;-><init>(Ll/t3m;Ll/ner;)V

    .line 171
    .line 172
    .line 173
    iput-object v1, p0, Ll/ima0;->n:Ll/hr90;

    .line 174
    .line 175
    const/high16 v4, 0x41c00000    # 24.0f

    .line 176
    .line 177
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    invoke-virtual {v1, v4}, Ll/on2;->v(I)V

    .line 182
    .line 183
    .line 184
    iget-object v1, p0, Ll/ima0;->n:Ll/hr90;

    .line 185
    .line 186
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_5
    iget-object v1, p0, Ll/ima0;->m:Ll/hr90;

    .line 191
    .line 192
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    :cond_6
    :goto_1
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-object v1, v3

    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :cond_7
    return-object v0
.end method

.method public T0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ima0;->c:Lv/VProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ima0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/ima0;->d:Lcom/p1/mobile/putong/core/ui/profile/ParallaxView;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public U(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ima0;->q:Ll/lp90;

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
    iget-object p0, p0, Ll/ima0;->q:Ll/lp90;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/lp90;->e(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public U0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ima0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ima0;->d:Lcom/p1/mobile/putong/core/ui/profile/ParallaxView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ima0;->c:Lv/VProgressBar;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public V0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    new-instance v1, Ll/lla0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/lla0;-><init>(Ll/ima0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/on2;->a(Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public W()Ll/lp90;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->q:Ll/lp90;

    .line 2
    .line 3
    return-object p0
.end method

.method public final W0(Ljava/lang/String;Landroid/widget/LinearLayout;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "share_tip"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 34
    .line 35
    iget-object p0, p0, Ll/ima0;->r:Ll/zq90;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const/high16 p1, 0x40000000    # 2.0f

    .line 49
    .line 50
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const/high16 p1, 0x41100000    # 9.0f

    .line 59
    .line 60
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const/16 p1, 0x4b

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const/high16 p1, 0x41500000    # 13.0f

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const/high16 p1, 0x40a00000    # 5.0f

    .line 81
    .line 82
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-wide/16 v2, 0x1388

    .line 91
    .line 92
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const/4 p1, 0x0

    .line 97
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    new-instance p1, Ll/wla0;

    .line 102
    .line 103
    invoke-direct {p1}, Ll/wla0;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    sget p1, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 111
    .line 112
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->R:I

    .line 113
    .line 114
    or-int/2addr p1, v0

    .line 115
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p1, p0, p2, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public X0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ima0;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

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
    iget-object p0, p0, Ll/ima0;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;->b(I)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public Y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->g1:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->g1:Landroid/view/View;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->V0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final a0()V
    .locals 3

    .line 1
    new-instance v0, Ll/hr90;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ima0;->l:Ll/mw90;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/hr90;-><init>(Ll/t3m;Ll/ner;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ima0;->m:Ll/hr90;

    .line 11
    .line 12
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/zq90;->K()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/ima0;->k:Ll/cla0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/cla0;->Z2()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/ima0;->k:Ll/cla0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/cla0;->Z2()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    new-instance v0, Ll/l43;

    .line 45
    .line 46
    iget-object v1, p0, Ll/ima0;->l:Ll/mw90;

    .line 47
    .line 48
    iget-object v2, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 49
    .line 50
    invoke-direct {v0, v1, v2}, Ll/l43;-><init>(Ll/u3m;Ll/ner;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ll/ima0;->s:Ll/sz90;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    new-instance v0, Ll/iw40;

    .line 57
    .line 58
    iget-object v1, p0, Ll/ima0;->l:Ll/mw90;

    .line 59
    .line 60
    iget-object v2, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 61
    .line 62
    invoke-direct {v0, v1, v2}, Ll/iw40;-><init>(Ll/u3m;Ll/ner;)V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Ll/ima0;->s:Ll/sz90;

    .line 66
    .line 67
    :goto_0
    iget-object v0, p0, Ll/ima0;->x:Ljava/util/List;

    .line 68
    .line 69
    iget-object v1, p0, Ll/ima0;->s:Ll/sz90;

    .line 70
    .line 71
    invoke-virtual {v1}, Ll/sz90;->c()Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/ima0;->s:Ll/sz90;

    .line 79
    .line 80
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ll/sz90;->d(Ljava/lang/Class;)Ll/on2;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 87
    .line 88
    iput-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 89
    .line 90
    iget-object v0, p0, Ll/ima0;->s:Ll/sz90;

    .line 91
    .line 92
    const-class v1, Ll/ap90;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Ll/sz90;->d(Ljava/lang/Class;)Ll/on2;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Ll/no90;

    .line 99
    .line 100
    iput-object v0, p0, Ll/ima0;->p:Ll/no90;

    .line 101
    .line 102
    iget-object v0, p0, Ll/ima0;->s:Ll/sz90;

    .line 103
    .line 104
    const-class v1, Ll/b43;

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ll/sz90;->d(Ljava/lang/Class;)Ll/on2;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Ll/b43;

    .line 111
    .line 112
    iput-object v0, p0, Ll/ima0;->t:Ll/b43;

    .line 113
    .line 114
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "share_profile"

    .line 8
    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 12
    .line 13
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/zq90;->F()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 31
    .line 32
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, "p_game_cp"

    .line 35
    .line 36
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 43
    .line 44
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 45
    .line 46
    const-string v2, "p_game_cp_msg"

    .line 47
    .line 48
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    :cond_1
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 55
    .line 56
    new-instance v2, Ll/kla0;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/kla0;-><init>(Ll/ima0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ll/on2;->a(Ll/x20;)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/ima0;->k:Ll/cla0;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->Q()V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/ima0;->k:Ll/cla0;

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->W()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_3

    .line 85
    .line 86
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 87
    .line 88
    new-instance v2, Ll/jla0;

    .line 89
    .line 90
    invoke-direct {v2, p0}, Ll/jla0;-><init>(Ll/ima0;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v2}, Ll/on2;->a(Ll/x20;)V

    .line 94
    .line 95
    .line 96
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 97
    .line 98
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_5

    .line 103
    .line 104
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 105
    .line 106
    invoke-virtual {v0}, Ll/zq90;->o()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_4

    .line 111
    .line 112
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 113
    .line 114
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_5

    .line 121
    .line 122
    :cond_4
    iget-object p0, p0, Ll/ima0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 123
    .line 124
    sget v0, Ll/adc0;->U8:I

    .line 125
    .line 126
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    check-cast p0, Lv/VImage;

    .line 131
    .line 132
    sget v0, Ll/dbc0;->Wp:I

    .line 133
    .line 134
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 135
    .line 136
    .line 137
    :cond_5
    return-void
.end method

.method public final g0(Ljava/lang/Class;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Ll/on2<",
            "Ll/t3m;",
            ">;>;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ima0;->s:Ll/sz90;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sz90;->d(Ljava/lang/Class;)Ll/on2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ep90;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/on2;->l()Z

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
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final synthetic h0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "from_auto_scroll_to_question"

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
    const-class v0, Ll/mpe;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/ima0;->g0(Ljava/lang/Class;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 23
    .line 24
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 25
    .line 26
    const-string v1, "p_game_cp"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 35
    .line 36
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 37
    .line 38
    const-string v1, "p_game_cp_msg"

    .line 39
    .line 40
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    :cond_1
    const-class v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/ima0;->g0(Ljava/lang/Class;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const/4 v0, 0x0

    .line 56
    :goto_0
    if-nez v0, :cond_3

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    iget-object v1, p0, Ll/ima0;->y:Ll/q1a0;

    .line 60
    .line 61
    invoke-virtual {v1, v0}, Ll/q1a0;->I(Ljava/lang/Class;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iget-object v1, p0, Ll/ima0;->y:Ll/q1a0;

    .line 66
    .line 67
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    if-ltz v0, :cond_4

    .line 74
    .line 75
    iget-object v1, p0, Ll/ima0;->y:Ll/q1a0;

    .line 76
    .line 77
    invoke-virtual {v1}, Ll/q1a0;->C()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-ge v0, v1, :cond_4

    .line 82
    .line 83
    new-instance v1, Ll/ima0$d;

    .line 84
    .line 85
    iget-object v2, p0, Ll/ima0;->r:Ll/zq90;

    .line 86
    .line 87
    invoke-virtual {v2}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-direct {v1, p0, v2}, Ll/ima0$d;-><init>(Ll/ima0;Landroid/content/Context;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$z;->setTargetPosition(I)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/ima0;->u:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 98
    .line 99
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->startSmoothScroll(Landroidx/recyclerview/widget/RecyclerView$z;)V

    .line 100
    .line 101
    .line 102
    :cond_4
    :goto_1
    return-void
.end method

.method public final synthetic i0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ima0;->t:Ll/b43;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/on2;->u()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Ll/ima0;->q:Ll/lp90;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/lp90;->d()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->a()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->None:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 24
    .line 25
    if-eq v1, v2, :cond_0

    .line 26
    .line 27
    const/high16 v1, 0x43240000    # 164.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v1, 0x0

    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    :goto_0
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 40
    .line 41
    iget-object p0, p0, Ll/ima0;->t:Ll/b43;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/on2;->u()Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/cla0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ima0;->R(Ll/cla0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->INFLATE_VIEW:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Ll/ima0;->P(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic j0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->N()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic k0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->N()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic l0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    new-instance v1, Ll/mla0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/mla0;-><init>(Ll/ima0;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->L1(Ll/x20;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic m0()V
    .locals 5

    .line 1
    invoke-static {}, Ll/ml70;->b()Ll/ml70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/ml70;->d(Lcom/p1/mobile/android/app/Act;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p0, p0, Ll/ima0;->r:Ll/zq90;

    .line 19
    .line 20
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x1

    .line 24
    const-string v4, "profile_frag_menu"

    .line 25
    .line 26
    invoke-static {v1, p0, v4, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic n0(Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->K1(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic p0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->O()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic q0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->O()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->INIT_VIEW:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Ll/ima0;->r:Ll/zq90;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/zq90;->K()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, p0, Ll/ima0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 28
    .line 29
    sget v4, Lcom/p1/mobile/putong/core/R$string;->zi:I

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-direct {p0}, Ll/ima0;->c0()V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Ll/ima0;->b0()V

    .line 42
    .line 43
    .line 44
    invoke-direct {p0}, Ll/ima0;->H0()V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0}, Ll/ima0;->f0()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ima0;->e0()V

    .line 51
    .line 52
    .line 53
    invoke-direct {p0}, Ll/ima0;->d0()V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/zq90;->L()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    iget-object v0, p0, Ll/ima0;->r:Ll/zq90;

    .line 68
    .line 69
    iget-object v0, v0, Ll/zq90;->e:Ll/zq90$a;

    .line 70
    .line 71
    iget-object v0, v0, Ll/zq90$a;->k:Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    if-nez v0, :cond_1

    .line 74
    .line 75
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public final synthetic r0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    new-instance v1, Ll/sla0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/sla0;-><init>(Ll/ima0;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/tla0;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/tla0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->L1(Ll/x20;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic s0(Landroid/widget/LinearLayout;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ima0;->k:Ll/cla0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->V()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "\u70b9\u51fb\u63a8\u8350\u7ed9\u597d\u53cb"

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Ll/ima0;->W0(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->R()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic t0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    new-instance v1, Ll/qla0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/qla0;-><init>(Ll/ima0;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x7d0

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->I1(Ll/y20;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic u0()V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/ima0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    sget v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->k1:I

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic v0(Landroid/widget/LinearLayout;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ima0;->k:Ll/cla0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->V()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "\u70b9\u51fb\u63a8\u8350\u7ed9\u597d\u53cb"

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Ll/ima0;->W0(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->R()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic w0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    new-instance v1, Ll/pla0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pla0;-><init>(Ll/ima0;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->I1(Ll/y20;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic x0(Landroid/widget/LinearLayout;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ima0;->k:Ll/cla0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->w()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "\u5206\u4eab\u7528\u6237\uff0c\u4e00\u8d77\u7ec4\u961f\u6253\u6e38\u620f"

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Ll/ima0;->W0(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/ima0;->k:Ll/cla0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/cla0;->N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->P()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic y0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    new-instance v1, Ll/ola0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ola0;-><init>(Ll/ima0;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->I1(Ll/y20;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic z0()V
    .locals 1

    .line 1
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/p6d0;->j:Ljava/util/Set;

    .line 6
    .line 7
    iget-object p0, p0, Ll/ima0;->r:Ll/zq90;

    .line 8
    .line 9
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/p6d0;->l0()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
