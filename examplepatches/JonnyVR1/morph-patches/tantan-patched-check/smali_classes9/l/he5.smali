.class public final synthetic Ll/he5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/purchase/d;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/he5;->a:Ll/y20;

    iput-object p2, p0, Ll/he5;->b:Lcom/p1/mobile/putong/core/ui/purchase/d;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/he5;->a:Ll/y20;

    iget-object p0, p0, Ll/he5;->b:Lcom/p1/mobile/putong/core/ui/purchase/d;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->a(Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d;Landroid/view/View;)V

    return-void
.end method
