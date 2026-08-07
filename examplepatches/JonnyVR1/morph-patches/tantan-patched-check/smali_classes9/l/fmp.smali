.class public Ll/fmp;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fmp$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/view/CorePayMaxHeightRecyclerView;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Ll/jic0;

.field public d:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public e:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fmp;->b:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fmp;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/fmp;->e:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gmp;->a(Ll/fmp;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p2, p0, Ll/fmp;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/rec0;->j0:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/fmp;->a(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/fmp;->a:Lcom/p1/mobile/putong/core/ui/view/CorePayMaxHeightRecyclerView;

    .line 18
    .line 19
    const/high16 p2, 0x43fa0000    # 500.0f

    .line 20
    .line 21
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/view/CorePayMaxHeightRecyclerView;->setMaxHeight(I)V

    .line 26
    .line 27
    .line 28
    return-object p1
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Ljava/util/List;Ll/z20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fmp;->e(Ljava/util/List;Ll/z20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e(Ljava/util/List;Ll/z20;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fmp;->b:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v1, v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/fmp$a;

    .line 11
    .line 12
    const/high16 v2, 0x41800000    # 16.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-direct {v1, p0, v2}, Ll/fmp$a;-><init>(Ll/fmp;I)V

    .line 19
    .line 20
    .line 21
    new-instance v3, Ll/imp;

    .line 22
    .line 23
    iget-object v4, p0, Ll/fmp;->b:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    iget-object v7, p0, Ll/fmp;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    iget-boolean v8, p0, Ll/fmp;->e:Z

    .line 28
    .line 29
    move-object v5, p1

    .line 30
    move-object v6, p2

    .line 31
    invoke-direct/range {v3 .. v8}, Ll/imp;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/z20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 32
    .line 33
    .line 34
    iput-object v3, p0, Ll/fmp;->c:Ll/jic0;

    .line 35
    .line 36
    iget-object p1, p0, Ll/fmp;->a:Lcom/p1/mobile/putong/core/ui/view/CorePayMaxHeightRecyclerView;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/fmp;->a:Lcom/p1/mobile/putong/core/ui/view/CorePayMaxHeightRecyclerView;

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/fmp;->a:Lcom/p1/mobile/putong/core/ui/view/CorePayMaxHeightRecyclerView;

    .line 47
    .line 48
    iget-object p0, p0, Ll/fmp;->c:Ll/jic0;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
