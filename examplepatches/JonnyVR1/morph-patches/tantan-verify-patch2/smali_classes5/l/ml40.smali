.class public final synthetic Ll/ml40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

.field public final synthetic b:Ll/a30;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;Ll/a30;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ml40;->a:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    iput-object p2, p0, Ll/ml40;->b:Ll/a30;

    iput-object p3, p0, Ll/ml40;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p4, p0, Ll/ml40;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ml40;->a:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    iget-object v1, p0, Ll/ml40;->b:Ll/a30;

    iget-object v2, p0, Ll/ml40;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iget-object p0, p0, Ll/ml40;->d:Ljava/util/List;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->e(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;Ll/a30;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method
