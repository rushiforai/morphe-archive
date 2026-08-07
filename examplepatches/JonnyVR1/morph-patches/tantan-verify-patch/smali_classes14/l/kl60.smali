.class public final synthetic Ll/kl60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/PaymentApi;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/data/GPTransaction;

.field public final synthetic d:Lcom/p1/mobile/putong/data/GooglePlayOrders;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/PaymentApi;ILcom/p1/mobile/putong/data/GPTransaction;Lcom/p1/mobile/putong/data/GooglePlayOrders;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kl60;->a:Lcom/p1/mobile/putong/api/api/PaymentApi;

    iput p2, p0, Ll/kl60;->b:I

    iput-object p3, p0, Ll/kl60;->c:Lcom/p1/mobile/putong/data/GPTransaction;

    iput-object p4, p0, Ll/kl60;->d:Lcom/p1/mobile/putong/data/GooglePlayOrders;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kl60;->a:Lcom/p1/mobile/putong/api/api/PaymentApi;

    iget v1, p0, Ll/kl60;->b:I

    iget-object v2, p0, Ll/kl60;->c:Lcom/p1/mobile/putong/data/GPTransaction;

    iget-object p0, p0, Ll/kl60;->d:Lcom/p1/mobile/putong/data/GooglePlayOrders;

    check-cast p1, Lcom/p1/mobile/putong/data/GPResult;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->J(Lcom/p1/mobile/putong/api/api/PaymentApi;ILcom/p1/mobile/putong/data/GPTransaction;Lcom/p1/mobile/putong/data/GooglePlayOrders;Lcom/p1/mobile/putong/data/GPResult;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
