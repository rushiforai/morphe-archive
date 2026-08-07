.class public final synthetic Ll/ngb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/promotion/a$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;Lcom/p1/mobile/putong/core/ui/promotion/a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ngb0;->a:Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;

    iput-object p2, p0, Ll/ngb0;->b:Lcom/p1/mobile/putong/core/ui/promotion/a$a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ngb0;->a:Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;

    iget-object p0, p0, Ll/ngb0;->b:Lcom/p1/mobile/putong/core/ui/promotion/a$a;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->j0(Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;Lcom/p1/mobile/putong/core/ui/promotion/a$a;Landroid/view/View;)V

    return-void
.end method
