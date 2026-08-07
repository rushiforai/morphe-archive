.class public final synthetic Ll/mop0;
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

    iput-object p1, p0, Ll/mop0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mop0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    check-cast p1, Lcom/p1/mobile/putong/data/Order;

    invoke-static {p0, p1}, Ll/nop0;->i(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Lcom/p1/mobile/putong/data/Order;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
