.class public Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;
.super Lv/VRecyclerView;
.source "SourceFile"

# interfaces
.implements Ll/ugb0;


# instance fields
.field public final c:Z

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/app/PutongFrag;

.field public f:Ll/o3i0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 80
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 79
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Ll/r97;->c()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;->c:Z

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 21
    .line 22
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets_extra:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_greet_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 29
    .line 30
    filled-new-array {p1, p2, p3, v0, v1}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance p2, Ll/je5;

    .line 39
    .line 40
    invoke-direct {p2}, Ll/je5;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, p2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 49
    .line 50
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 51
    .line 52
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->see_greet_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 55
    .line 56
    filled-new-array {p1, p2, p3, v0}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance p2, Ll/je5;

    .line 65
    .line 66
    invoke-direct {p2}, Ll/je5;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {p1, p2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;->d:Ljava/util/List;

    .line 74
    .line 75
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;->init()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method private init()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setOverScrollMode(I)V

    .line 3
    .line 4
    .line 5
    const/high16 v0, 0x41200000    # 10.0f

    .line 6
    .line 7
    invoke-static {}, Ll/vnb;->m1()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    mul-float/2addr v1, v0

    .line 12
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public w(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x2

    .line 10
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/o3i0;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;->d:Ljava/util/List;

    .line 19
    .line 20
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;->c:Z

    .line 21
    .line 22
    invoke-direct {v0, p1, v1, v2}, Ll/o3i0;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;Ljava/util/List;Z)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;->f:Ll/o3i0;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
