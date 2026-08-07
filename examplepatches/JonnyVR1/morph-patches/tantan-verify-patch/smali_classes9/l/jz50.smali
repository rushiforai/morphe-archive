.class public Ll/jz50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/iz50;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRecyclerView;

.field public b:Ll/iz50;

.field public c:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

.field public d:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

.field public e:Ll/zzk;

.field public f:Ll/ez50;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jz50;->c:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jz50;->c:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kz50;->b(Ll/jz50;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jz50;->c:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/iz50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jz50;->b:Ll/iz50;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationBanner;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationArticles;",
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
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/jz50;->e:Ll/zzk;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/zzk;->D()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Ll/jz50;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/jz50;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->C(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    iget-object p0, p0, Ll/jz50;->f:Ll/ez50;

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ll/ez50;->I(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/iz50;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jz50;->b(Ll/iz50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jz50;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/jz50;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->H9:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/ez50;

    .line 11
    .line 12
    iget-object v1, p0, Ll/jz50;->c:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/ez50;-><init>(Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/jz50;->f:Ll/ez50;

    .line 18
    .line 19
    new-instance v1, Ll/zzk;

    .line 20
    .line 21
    invoke-direct {v1, v0}, Ll/zzk;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Ll/jz50;->e:Ll/zzk;

    .line 25
    .line 26
    iget-object v0, p0, Ll/jz50;->c:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 27
    .line 28
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget v1, Ll/kec0;->x8:I

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 41
    .line 42
    iput-object v0, p0, Ll/jz50;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 43
    .line 44
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 45
    .line 46
    const/4 v1, -0x1

    .line 47
    const/4 v2, -0x2

    .line 48
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/jz50;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/jz50;->e:Ll/zzk;

    .line 57
    .line 58
    iget-object v1, p0, Ll/jz50;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ll/zzk;->H(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/jz50;->a:Lv/VRecyclerView;

    .line 64
    .line 65
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 66
    .line 67
    iget-object v2, p0, Ll/jz50;->c:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 68
    .line 69
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/jz50;->a:Lv/VRecyclerView;

    .line 76
    .line 77
    iget-object p0, p0, Ll/jz50;->e:Ll/zzk;

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method
