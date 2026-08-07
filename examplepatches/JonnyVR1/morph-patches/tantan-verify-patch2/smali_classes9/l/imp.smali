.class public Ll/imp;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Lcom/p1/mobile/android/app/Act;

.field public final f:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public h:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/z20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

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
    iput-object v0, p0, Ll/imp;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/imp;->I(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/imp;->e:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    iput-object p3, p0, Ll/imp;->f:Ll/z20;

    .line 17
    .line 18
    iput-object p4, p0, Ll/imp;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 19
    .line 20
    iput-boolean p5, p0, Ll/imp;->h:Z

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic E(Ll/imp;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/imp;->H(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method

.method private synthetic H(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "upgrade_sku_duration"

    .line 40
    .line 41
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "upgrade_sku_amount"

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    filled-new-array {v1, v0}, [Ll/sfj0$a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "e_select_upgrade_duration_sku"

    .line 60
    .line 61
    const-string v2, "p_select_upgrade_duration_pop"

    .line 62
    .line 63
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/imp;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 67
    .line 68
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    iget-object v0, p0, Ll/imp;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 75
    .line 76
    const/4 v1, 0x0

    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 78
    .line 79
    .line 80
    :cond_1
    iput-object p1, p0, Ll/imp;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 81
    .line 82
    const/4 v0, 0x1

    .line 83
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/imp;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 90
    .line 91
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    iget-object p1, p0, Ll/imp;->f:Ll/z20;

    .line 98
    .line 99
    iget-object p0, p0, Ll/imp;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 100
    .line 101
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 102
    .line 103
    invoke-interface {p1, p0, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/imp;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/purchase/d;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imp;->d:Ljava/util/List;

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

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/imp;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/rec0;->i0:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/purchase/d;II)V
    .locals 6

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iput-object p2, p0, Ll/imp;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 8
    .line 9
    :cond_0
    move-object v0, p1

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;

    .line 11
    .line 12
    new-instance v3, Ll/hmp;

    .line 13
    .line 14
    invoke-direct {v3, p0}, Ll/hmp;-><init>(Ll/imp;)V

    .line 15
    .line 16
    .line 17
    iget-object v4, p0, Ll/imp;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    iget-boolean v5, p0, Ll/imp;->h:Z

    .line 20
    .line 21
    move-object v1, p2

    .line 22
    move v2, p4

    .line 23
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->c(Lcom/p1/mobile/putong/core/ui/purchase/d;ILl/y20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/core/ui/purchase/d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imp;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 8
    .line 9
    return-object p0
.end method

.method public I(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/imp;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/imp;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/imp;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    iput-object v0, p0, Ll/imp;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/imp;->G(I)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
