.class public Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bn50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->invokeGpCoinPay(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$a;->c:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$a;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/k;->v3()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/bkj0;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const/4 v3, -0x1

    .line 17
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$a;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {v1, v2, v3, p0}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Yp:I

    .line 30
    .line 31
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/k;->v3()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/bkj0;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$a;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 17
    .line 18
    iget v3, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 19
    .line 20
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$a;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-direct {v1, v2, v3, p0}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Kl:I

    .line 33
    .line 34
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
