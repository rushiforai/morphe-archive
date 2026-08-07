.class public Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public fromSign:Z

.field public purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public tag:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->tag:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method
