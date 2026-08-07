.class public Ll/qeb0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

.field public b:Ll/bn50;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ll/peb0;
    .locals 2

    .line 1
    new-instance v0, Ll/peb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qeb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/peb0;-><init>(Lcom/p1/mobile/putong/data/PurchasePaymentParam;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/qeb0;->b:Ll/bn50;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ll/peb0;->a(Ll/bn50;)Ll/peb0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Ll/qeb0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qeb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/bn50;)Ll/qeb0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qeb0;->b:Ll/bn50;

    .line 2
    .line 3
    return-object p0
.end method
