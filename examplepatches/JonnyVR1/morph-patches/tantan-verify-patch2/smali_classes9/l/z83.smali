.class public final synthetic Ll/z83;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/boost/component/BoostIapPaymentComponent;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/boost/component/BoostIapPaymentComponent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z83;->a:Lcom/p1/mobile/putong/core/ui/purchase/boost/component/BoostIapPaymentComponent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z83;->a:Lcom/p1/mobile/putong/core/ui/purchase/boost/component/BoostIapPaymentComponent;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/boost/component/BoostIapPaymentComponent;->a(Lcom/p1/mobile/putong/core/ui/purchase/boost/component/BoostIapPaymentComponent;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
