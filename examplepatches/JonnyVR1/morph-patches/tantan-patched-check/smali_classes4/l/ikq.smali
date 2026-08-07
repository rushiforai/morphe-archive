.class public final synthetic Ll/ikq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/PurchasePaymentParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ikq;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikq;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    check-cast p1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    invoke-static {p0, p1}, Ll/kkq;->h(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
