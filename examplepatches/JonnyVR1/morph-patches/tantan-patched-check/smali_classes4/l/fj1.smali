.class public Ll/fj1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/data/PaymentParam;

.field public b:Z

.field public c:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public d:Z

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/PaymentParam;ZLcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/fj1;->d:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/fj1;->a:Lcom/p1/mobile/putong/data/PaymentParam;

    .line 8
    .line 9
    iput-boolean p2, p0, Ll/fj1;->b:Z

    .line 10
    .line 11
    iput-object p3, p0, Ll/fj1;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    return-void
.end method
