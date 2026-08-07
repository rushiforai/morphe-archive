.class public final synthetic Ll/jib0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jib0;->a:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    iput p2, p0, Ll/jib0;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jib0;->a:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    iget p0, p0, Ll/jib0;->b:I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->a(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;ILandroid/view/View;)V

    return-void
.end method
