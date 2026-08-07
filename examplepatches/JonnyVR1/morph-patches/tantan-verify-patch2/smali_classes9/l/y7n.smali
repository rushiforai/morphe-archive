.class public Ll/y7n;
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

.field public g:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/z20;)V
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
            ">;)V"
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
    iput-object v0, p0, Ll/y7n;->d:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/y7n;->g:I

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ll/y7n;->I(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/y7n;->e:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    iput-object p3, p0, Ll/y7n;->f:Ll/z20;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic E(Ll/y7n;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y7n;->H(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method

.method private synthetic H(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y7n;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

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
    iget-object v0, p0, Ll/y7n;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iput-object p1, p0, Ll/y7n;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/y7n;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/purchase/d;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7n;->d:Ljava/util/List;

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
    iget-object p0, p0, Ll/y7n;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/rec0;->q:I

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
    .locals 1

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
    iput-object p2, p0, Ll/y7n;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 8
    .line 9
    iget p3, p0, Ll/y7n;->g:I

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    if-ne p3, v0, :cond_0

    .line 13
    .line 14
    iput p4, p0, Ll/y7n;->g:I

    .line 15
    .line 16
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/IntlCoinPurchaseSheetItemView;

    .line 17
    .line 18
    new-instance p3, Ll/x7n;

    .line 19
    .line 20
    invoke-direct {p3, p0}, Ll/x7n;-><init>(Ll/y7n;)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Ll/y7n;->g:I

    .line 24
    .line 25
    invoke-virtual {p1, p2, p4, p3, v0}, Lcom/p1/mobile/putong/core/ui/purchase/IntlCoinPurchaseSheetItemView;->c(Lcom/p1/mobile/putong/core/ui/purchase/d;ILl/y20;I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/y7n;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Ll/y7n;->f:Ll/z20;

    .line 37
    .line 38
    iget-object p0, p0, Ll/y7n;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 39
    .line 40
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-interface {p1, p0, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/core/ui/purchase/d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7n;->d:Ljava/util/List;

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
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/y7n;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/y7n;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7n;->G(I)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
