.class public final synthetic Ll/qci0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qci0;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qci0;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    invoke-static {p0, p1}, Ll/vci0;->Q(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
