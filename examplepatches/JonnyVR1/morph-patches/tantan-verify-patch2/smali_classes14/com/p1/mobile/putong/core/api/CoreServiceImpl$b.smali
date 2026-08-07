.class public Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bn50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/api/CoreServiceImpl;->onCoinPay(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/PayMethod;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/data/PayMethod;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Lcom/p1/mobile/putong/core/api/CoreServiceImpl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/CoreServiceImpl;Ll/x20;Lcom/p1/mobile/putong/data/PayMethod;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;->d:Lcom/p1/mobile/putong/core/api/CoreServiceImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;->a:Ll/x20;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;->b:Lcom/p1/mobile/putong/data/PayMethod;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;->c:Ll/x20;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;->c:Ll/x20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;->c:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;->a:Ll/x20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;->a:Ll/x20;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;->b:Lcom/p1/mobile/putong/data/PayMethod;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/a5i0;->N0(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
