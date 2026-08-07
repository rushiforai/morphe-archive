.class public Lcom/p1/mobile/putong/core/api/CoreAutoPay;
.super Ll/dy6;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;
    }
.end annotation


# instance fields
.field public R:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

.field public final S:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;",
            ">;"
        }
    .end annotation
.end field

.field public T:Z

.field public U:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;->none:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->R:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 7
    .line 8
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->S:Lrx/subjects/a;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->T:Z

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->Q2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0
.end method

.method public static synthetic b3(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->r1(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/api/CoreAutoPay;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->A3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/oz6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/oz6;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/pz6;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/pz6;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/core/api/CoreAutoPay;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->z3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->W1(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/PaymentOrder;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public static synthetic h3(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->R2(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic i3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/PaymentOrder;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public static synthetic j3(Lcom/p1/mobile/putong/core/api/CoreAutoPay;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->y3(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/wz6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wz6;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/xz6;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/xz6;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic l3(Lcom/p1/mobile/putong/core/api/CoreAutoPay;Lcom/p1/mobile/putong/data/Envelope;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->x3(Lcom/p1/mobile/putong/data/Envelope;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic A3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/qz6;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qz6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/rz6;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/rz6;-><init>(Lcom/p1/mobile/putong/core/api/CoreAutoPay;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public B3()V
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->T()Lrx/c;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/nz6;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/nz6;-><init>(Lcom/p1/mobile/putong/core/api/CoreAutoPay;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "payment_refreshStatus"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public D3()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->w3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "yes"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "no"

    .line 11
    .line 12
    return-object p0
.end method

.method public E3()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->w3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "yes"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "no"

    .line 11
    .line 12
    return-object p0
.end method

.method public m3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n3()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->w3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->T:Z

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public o3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PaymentOrder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "autopayment_order_state"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/tz6;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Ll/tz6;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final p3(Lcom/p1/mobile/putong/core/data/ContractInfo;)Lcom/p1/mobile/putong/core/data/ContractInfo;
    .locals 0

    .line 1
    return-object p1
.end method

.method public final q3(Lcom/p1/mobile/putong/core/data/OrderInfo;)Lcom/p1/mobile/putong/core/data/OrderInfo;
    .locals 0

    .line 1
    return-object p1
.end method

.method public r3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PaymentOrder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "payment_status_"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/yz6;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Ll/yz6;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public s3()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/core/data/OrderInfo;",
            "Lcom/p1/mobile/putong/core/data/ContractInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->t3(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public t3(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/core/data/OrderInfo;",
            "Lcom/p1/mobile/putong/core/data/ContractInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "get_renewable_contract_infos_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/sz6;

    .line 18
    .line 19
    invoke-direct {v2, p0, p1}, Ll/sz6;-><init>(Lcom/p1/mobile/putong/core/api/CoreAutoPay;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-virtual {v0, v1, p0, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public u3(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->w3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->U:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->U:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public v3()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->T:Z

    .line 2
    .line 3
    return p0
.end method

.method public w3()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->R:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;->ali:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic x3(Lcom/p1/mobile/putong/data/Envelope;)Landroid/util/Pair;
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->p3(Lcom/p1/mobile/putong/core/data/ContractInfo;)Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    move-object v0, v3

    .line 39
    :goto_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->q3(Lcom/p1/mobile/putong/core/data/OrderInfo;)Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    :cond_1
    invoke-static {v3, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public final synthetic y3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/uz6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/uz6;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/vz6;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/vz6;-><init>(Lcom/p1/mobile/putong/core/api/CoreAutoPay;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic z3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_4

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;->none:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->R:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    move v0, v1

    .line 58
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_2

    .line 63
    .line 64
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    check-cast v2, Lcom/p1/mobile/putong/core/data/AutoDeducts;

    .line 69
    .line 70
    const-string v3, "signing"

    .line 71
    .line 72
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/AutoDeducts;->autoDeductStatus:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_1

    .line 79
    .line 80
    iget-boolean v0, v2, Lcom/p1/mobile/putong/core/data/AutoDeducts;->rateLimitReached:Z

    .line 81
    .line 82
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->T:Z

    .line 83
    .line 84
    const/4 v0, 0x1

    .line 85
    goto :goto_0

    .line 86
    :cond_2
    if-eqz v0, :cond_3

    .line 87
    .line 88
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;->ali:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 89
    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->R:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;->none:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 94
    .line 95
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->R:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 96
    .line 97
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->T:Z

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;->none:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 101
    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->R:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 103
    .line 104
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->T:Z

    .line 105
    .line 106
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->S:Lrx/subjects/a;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->R:Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    .line 109
    .line 110
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 114
    .line 115
    return-object p0
.end method
