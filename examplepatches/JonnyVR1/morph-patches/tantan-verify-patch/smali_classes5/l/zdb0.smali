.class public final synthetic Ll/zdb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePageTabsContainerView;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePageTabsContainerView;Ljava/util/List;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zdb0;->a:Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePageTabsContainerView;

    iput-object p2, p0, Ll/zdb0;->b:Ljava/util/List;

    iput p3, p0, Ll/zdb0;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zdb0;->a:Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePageTabsContainerView;

    iget-object v1, p0, Ll/zdb0;->b:Ljava/util/List;

    iget p0, p0, Ll/zdb0;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePageTabsContainerView;->a(Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePageTabsContainerView;Ljava/util/List;ILandroid/view/View;)V

    return-void
.end method
