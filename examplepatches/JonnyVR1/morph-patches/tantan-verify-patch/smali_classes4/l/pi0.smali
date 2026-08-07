.class public final synthetic Ll/pi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qi0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Lcom/p1/mobile/putong/data/PurchasePaymentParam;


# direct methods
.method public synthetic constructor <init>(Ll/qi0;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pi0;->a:Ll/qi0;

    iput-object p2, p0, Ll/pi0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/pi0;->c:Ll/x20;

    iput-object p4, p0, Ll/pi0;->d:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pi0;->a:Ll/qi0;

    iget-object v1, p0, Ll/pi0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/pi0;->c:Ll/x20;

    iget-object p0, p0, Ll/pi0;->d:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    check-cast p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    invoke-static {v0, v1, v2, p0, p1}, Ll/qi0;->h(Ll/qi0;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
