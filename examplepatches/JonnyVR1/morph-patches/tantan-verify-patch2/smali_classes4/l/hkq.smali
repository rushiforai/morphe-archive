.class public final synthetic Ll/hkq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/kkq;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/kkq;Ljava/lang/String;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hkq;->a:Ll/kkq;

    iput-object p2, p0, Ll/hkq;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/hkq;->c:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    iput-object p4, p0, Ll/hkq;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hkq;->a:Ll/kkq;

    iget-object v1, p0, Ll/hkq;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/hkq;->c:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    iget-object p0, p0, Ll/hkq;->d:Ll/x20;

    check-cast p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    invoke-static {v0, v1, v2, p0, p1}, Ll/kkq;->d(Ll/kkq;Ljava/lang/String;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
