.class public Ll/l1k;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/l1k$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/NewGiftWall;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewGiftWall;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/l1k$a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E(Ll/l1k;Landroid/view/View;ILcom/p1/mobile/putong/core/data/NewGiftWall;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/l1k;->H(Landroid/view/View;ILcom/p1/mobile/putong/core/data/NewGiftWall;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/NewGiftWall;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/l1k;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/NewGiftWall;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l1k;->c:Ljava/util/List;

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
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/qec0;->x4:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/NewGiftWall;II)V
    .locals 0

    .line 1
    instance-of p3, p1, Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptItemVIew;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    move-object p3, p1

    .line 6
    check-cast p3, Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptItemVIew;

    .line 7
    .line 8
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptItemVIew;->b(Lcom/p1/mobile/putong/core/data/NewGiftWall;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    new-instance p3, Ll/k1k;

    .line 12
    .line 13
    invoke-direct {p3, p0, p1, p4, p2}, Ll/k1k;-><init>(Ll/l1k;Landroid/view/View;ILcom/p1/mobile/putong/core/data/NewGiftWall;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/core/data/NewGiftWall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l1k;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic H(Landroid/view/View;ILcom/p1/mobile/putong/core/data/NewGiftWall;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p4, p0, Ll/l1k;->d:Ll/l1k$a;

    .line 2
    .line 3
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l1k;->d:Ll/l1k$a;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2, p3}, Ll/l1k$a;->a(Landroid/view/View;ILcom/p1/mobile/putong/core/data/NewGiftWall;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public I(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewGiftWall;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/l1k;->c:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public J(Ll/l1k$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l1k;->d:Ll/l1k$a;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l1k;->G(I)Lcom/p1/mobile/putong/core/data/NewGiftWall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
