.class public Ll/fp60$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fp60;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public b:Lcom/p1/mobile/putong/data/Contract;

.field public c:Lcom/p1/mobile/putong/data/PaymentParam;

.field public d:Lcom/p1/mobile/putong/core/data/PaymentOrder;

.field public e:Lcom/p1/mobile/putong/core/data/Privilege;

.field public f:Z

.field public g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/data/Contract;Lcom/p1/mobile/putong/core/data/PaymentOrder;Lcom/p1/mobile/putong/data/PaymentParam;Lcom/p1/mobile/putong/core/data/Privilege;ZLjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fp60$a;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fp60$a;->b:Lcom/p1/mobile/putong/data/Contract;

    .line 7
    .line 8
    iput-object p4, p0, Ll/fp60$a;->c:Lcom/p1/mobile/putong/data/PaymentParam;

    .line 9
    .line 10
    iput-object p3, p0, Ll/fp60$a;->d:Lcom/p1/mobile/putong/core/data/PaymentOrder;

    .line 11
    .line 12
    iput-object p5, p0, Ll/fp60$a;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 13
    .line 14
    iput-boolean p6, p0, Ll/fp60$a;->f:Z

    .line 15
    .line 16
    iput-object p7, p0, Ll/fp60$a;->g:Ljava/lang/Object;

    .line 17
    .line 18
    return-void
.end method
