.class public Lcom/p1/mobile/putong/core/ui/purchase/f$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/purchase/f;->A()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/f;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->i(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ll/ig40;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/ig40;->K(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/purchase/f;->l:Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->i(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ll/ig40;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Ll/ig40;->C(I)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 32
    .line 33
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/f;->d:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->h(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->j(Lcom/p1/mobile/putong/core/ui/purchase/f;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/purchase/f;->a:Landroid/widget/FrameLayout;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 61
    .line 62
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->k(Lcom/p1/mobile/putong/core/ui/purchase/f;I)V

    .line 63
    .line 64
    .line 65
    :cond_1
    sget-object v0, Ll/i9b0;->INSTANCE:Ll/i9b0;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$c;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 68
    .line 69
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->h(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Ll/i9b0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method
