.class public Ll/lq60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e2m;


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public d:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public e:Lcom/p1/mobile/putong/data/PayMethod;

.field public f:Ll/mq60;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lq60;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lq60;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/lq60;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    iput-object p4, p0, Ll/lq60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 11
    .line 12
    iput-object p5, p0, Ll/lq60;->e:Lcom/p1/mobile/putong/data/PayMethod;

    .line 13
    .line 14
    invoke-static {p1, p3}, Ll/mq60;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/mq60;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/lq60;->f:Ll/mq60;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lq60;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lq60;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/data/PayMethod;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lq60;->e:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/purchase/d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lq60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ll/mq60;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lq60;->f:Ll/mq60;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lq60;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-object p0
.end method
