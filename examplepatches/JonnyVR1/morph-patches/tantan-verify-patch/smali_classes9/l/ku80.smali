.class public final synthetic Ll/ku80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ou80;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;


# direct methods
.method public synthetic constructor <init>(Ll/ou80;Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ku80;->a:Ll/ou80;

    iput-object p2, p0, Ll/ku80;->b:Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ku80;->a:Ll/ou80;

    iget-object p0, p0, Ll/ku80;->b:Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;

    invoke-static {v0, p0, p1}, Ll/ou80;->E(Ll/ou80;Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;Landroid/view/View;)V

    return-void
.end method
