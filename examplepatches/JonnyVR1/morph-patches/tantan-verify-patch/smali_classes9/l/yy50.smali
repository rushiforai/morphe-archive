.class public final synthetic Ll/yy50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;

.field public final synthetic b:Lcom/p1/mobile/putong/data/IntlOperationBanner;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;Lcom/p1/mobile/putong/data/IntlOperationBanner;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yy50;->a:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;

    iput-object p2, p0, Ll/yy50;->b:Lcom/p1/mobile/putong/data/IntlOperationBanner;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yy50;->a:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;

    iget-object p0, p0, Ll/yy50;->b:Lcom/p1/mobile/putong/data/IntlOperationBanner;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;->j(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;Lcom/p1/mobile/putong/data/IntlOperationBanner;Landroid/view/View;)V

    return-void
.end method
