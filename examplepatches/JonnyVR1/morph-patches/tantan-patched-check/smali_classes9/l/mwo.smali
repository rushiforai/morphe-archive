.class public final synthetic Ll/mwo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/text/NumberFormat;


# direct methods
.method public synthetic constructor <init>(Ljava/text/NumberFormat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mwo;->a:Ljava/text/NumberFormat;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mwo;->a:Ljava/text/NumberFormat;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/intlpage/IntlPremiumDiscountPurchaseContentView;->K(Ljava/text/NumberFormat;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method
