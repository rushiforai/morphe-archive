.class public Ll/xxm;
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

.field public h:I


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
    iput-object v0, p0, Ll/xxm;->d:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/xxm;->g:I

    .line 13
    .line 14
    iput v0, p0, Ll/xxm;->h:I

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ll/xxm;->I(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/xxm;->e:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    iput-object p3, p0, Ll/xxm;->f:Ll/z20;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic E(Ll/xxm;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xxm;->H(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method

.method private synthetic H(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xxm;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

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
    iget-object v0, p0, Ll/xxm;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iput-object p1, p0, Ll/xxm;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

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
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xxm;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/purchase/d;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxm;->d:Ljava/util/List;

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
    iget-object p0, p0, Ll/xxm;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/rec0;->x:I

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
    const/4 v0, -0x1

    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    iput-object p2, p0, Ll/xxm;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 9
    .line 10
    iget p3, p0, Ll/xxm;->g:I

    .line 11
    .line 12
    if-ne p3, v0, :cond_0

    .line 13
    .line 14
    iput p4, p0, Ll/xxm;->g:I

    .line 15
    .line 16
    :cond_0
    iget p3, p0, Ll/xxm;->h:I

    .line 17
    .line 18
    if-ne p3, v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xxm;->C()I

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    add-int/lit8 p3, p3, -0x1

    .line 25
    .line 26
    iput p3, p0, Ll/xxm;->h:I

    .line 27
    .line 28
    :cond_1
    move-object v0, p1

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;

    .line 30
    .line 31
    new-instance v3, Ll/wxm;

    .line 32
    .line 33
    invoke-direct {v3, p0}, Ll/wxm;-><init>(Ll/xxm;)V

    .line 34
    .line 35
    .line 36
    iget v4, p0, Ll/xxm;->g:I

    .line 37
    .line 38
    iget v5, p0, Ll/xxm;->h:I

    .line 39
    .line 40
    move-object v1, p2

    .line 41
    move v2, p4

    .line 42
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;->c(Lcom/p1/mobile/putong/core/ui/purchase/d;ILl/y20;II)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/xxm;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    iget-object p1, p0, Ll/xxm;->f:Ll/z20;

    .line 54
    .line 55
    iget-object p0, p0, Ll/xxm;->c:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 56
    .line 57
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-interface {p1, p0, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/core/ui/purchase/d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxm;->d:Ljava/util/List;

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
    iget-object v0, p0, Ll/xxm;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xxm;->d:Ljava/util/List;

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
    invoke-virtual {p0, p1}, Ll/xxm;->G(I)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
