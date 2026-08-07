.class public final synthetic Ll/gi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qi0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

.field public final synthetic c:Z

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/qi0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;ZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gi0;->a:Ll/qi0;

    iput-object p2, p0, Ll/gi0;->b:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    iput-boolean p3, p0, Ll/gi0;->c:Z

    iput-object p4, p0, Ll/gi0;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gi0;->a:Ll/qi0;

    iget-object v1, p0, Ll/gi0;->b:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    iget-boolean v2, p0, Ll/gi0;->c:Z

    iget-object p0, p0, Ll/gi0;->d:Ll/x20;

    check-cast p1, Lcom/p1/mobile/putong/data/OrderData;

    invoke-static {v0, v1, v2, p0, p1}, Ll/qi0;->d(Ll/qi0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;ZLl/x20;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
