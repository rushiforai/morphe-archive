.class public final Lcom/p1/mobile/putong/api/api/PaymentApi;
.super Ll/xi5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;,
        Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0094\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001:\u0002BCB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001b\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000b2\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001b\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000b2\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0010\u0010\u000eJ\u0015\u0010\u0013\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0013\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u000b\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J+\u0010\u001b\u001a\u0010\u0012\u000c\u0012\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u00190\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0018\u001a\u00020\u0017\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ+\u0010 \u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u001d\u001a\u00020\u001a2\u0006\u0010\u001f\u001a\u00020\u001e\u00a2\u0006\u0004\u0008 \u0010!J+\u0010\"\u001a\u0010\u0012\u000c\u0012\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u00190\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0018\u001a\u00020\u0017\u00a2\u0006\u0004\u0008\"\u0010\u001cJ\r\u0010#\u001a\u00020\u0006\u00a2\u0006\u0004\u0008#\u0010\u0003J\'\u0010\'\u001a\u001c\u0012\u0018\u0012\u0016\u0012\u0004\u0012\u00020%\u0018\u00010$j\n\u0012\u0004\u0012\u00020%\u0018\u0001`&0\u000b\u00a2\u0006\u0004\u0008\'\u0010\u0016J\u001b\u0010*\u001a\u0008\u0012\u0004\u0012\u00020)0\u000b2\u0006\u0010(\u001a\u00020\u0017\u00a2\u0006\u0004\u0008*\u0010+R\u0014\u0010.\u001a\u00020\u00178\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008,\u0010-R\u0016\u00102\u001a\u00020/8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0006\n\u0004\u00080\u00101R\u0016\u00106\u001a\u0002038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0006\n\u0004\u00084\u00105R\u001a\u0010:\u001a\u0008\u0012\u0004\u0012\u00020\u0011078\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00088\u00109R.\u0010>\u001a\u001c\u0012\u0018\u0012\u0016\u0012\u0004\u0012\u00020%\u0018\u00010$j\n\u0012\u0004\u0012\u00020%\u0018\u0001`&0;8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008<\u0010=R\u0017\u0010A\u001a\u0008\u0012\u0004\u0012\u00020?0\u000b8F\u00a2\u0006\u0006\u001a\u0004\u0008@\u0010\u0016\u00a8\u0006D"
    }
    d2 = {
        "Lcom/p1/mobile/putong/api/api/PaymentApi;",
        "Ll/xi5;",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/data/GPTransaction;",
        "gpTransaction",
        "",
        "a0",
        "(Lcom/p1/mobile/putong/data/GPTransaction;)V",
        "Lcom/p1/mobile/putong/data/PaymentParam;",
        "paymentParam",
        "Lrx/c;",
        "Lcom/p1/mobile/putong/data/OrderData;",
        "V",
        "(Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;",
        "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
        "b0",
        "Lcom/p1/mobile/putong/data/Order;",
        "order",
        "Z",
        "(Lcom/p1/mobile/putong/data/Order;)V",
        "Y",
        "()Lrx/c;",
        "",
        "url",
        "",
        "Lcom/p1/mobile/putong/data/GooglePlayOrders;",
        "W",
        "(Lcom/p1/mobile/putong/data/GPTransaction;Ljava/lang/String;)Lrx/c;",
        "orders",
        "",
        "times",
        "U",
        "(Lcom/p1/mobile/putong/data/GPTransaction;Lcom/p1/mobile/putong/data/GooglePlayOrders;I)Lrx/c;",
        "X",
        "R",
        "Ljava/util/ArrayList;",
        "Lcom/p1/mobile/putong/data/Contract;",
        "Lkotlin/collections/ArrayList;",
        "S",
        "id",
        "Lcom/p1/mobile/putong/data/ContractEnvelope;",
        "Q",
        "(Ljava/lang/String;)Lrx/c;",
        "a",
        "Ljava/lang/String;",
        "STATUS_PROCESSED",
        "Ll/jxd0;",
        "b",
        "Ll/jxd0;",
        "retryRestore",
        "Ll/vxd0;",
        "c",
        "Ll/vxd0;",
        "retryRestoreCount",
        "Lrx/subjects/b;",
        "d",
        "Lrx/subjects/b;",
        "resultSub",
        "Lrx/subjects/a;",
        "e",
        "Lrx/subjects/a;",
        "subscriptions",
        "Ll/uxj0;",
        "T",
        "contracts",
        "PaymentResultStatus",
        "SignResultStatus",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Ll/jxd0;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public c:Ll/vxd0;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final d:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/data/Order;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final e:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/xi5;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "processed"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->a:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ll/jxd0;

    .line 9
    .line 10
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 11
    .line 12
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v3, "retry_restore"

    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->b:Ll/jxd0;

    .line 36
    .line 37
    new-instance v0, Ll/vxd0;

    .line 38
    .line 39
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 40
    .line 41
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    new-instance v2, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v3, "retry_restore_count"

    .line 48
    .line 49
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const/4 v2, 0x0

    .line 60
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->c:Ll/vxd0;

    .line 64
    .line 65
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->d:Lrx/subjects/b;

    .line 73
    .line 74
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->e:Lrx/subjects/a;

    .line 82
    .line 83
    return-void
.end method

.method public static A(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 6
    .line 7
    return-object p0
.end method

.method public static B(Lcom/p1/mobile/putong/data/OrderData;)Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 7
    .line 8
    const-string v0, "success"

    .line 9
    .line 10
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 20
    .line 21
    return-object p0
.end method

.method public static C(Lcom/p1/mobile/putong/data/PaymentParam;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1}, Ll/xi5;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/PaymentParam;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static D(Lcom/p1/mobile/putong/data/GPTransaction;)Lkotlin/Unit;
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/hdata/android/MDevice;->getMMuidV3(Landroid/content/Context;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iput-object v0, p0, Lcom/p1/mobile/putong/data/GPTransaction;->mmuid:Ljava/lang/String;

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 20
    .line 21
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Lcom/immomo/hdata/android/MDevice;->getmmuid(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/data/GPTransaction;->mmuid:Ljava/lang/String;

    .line 30
    .line 31
    :goto_1
    invoke-static {}, Ll/r8f0;->f()Ll/r8f0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/r8f0;->g()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/data/GPTransaction;->smid:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    :catchall_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 42
    .line 43
    return-object p0
.end method

.method public static E(Lcom/p1/mobile/putong/data/ContractIds;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/contracts/cancel"

    .line 8
    .line 9
    invoke-static {v1}, Ll/xi5;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/ContractIds;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static F()Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/contracts/query"

    .line 8
    .line 9
    invoke-static {v1}, Ll/xi5;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    const-string v2, ""

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    return-object v0
.end method

.method public static G(Lcom/p1/mobile/putong/api/api/PaymentApi;Lcom/p1/mobile/putong/data/GPResult;)Ljava/util/List;
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/GPResult;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 5
    .line 6
    iget v1, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 7
    .line 8
    const/16 v2, 0xc8

    .line 9
    .line 10
    if-ne v1, v2, :cond_2

    .line 11
    .line 12
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->subCode:I

    .line 13
    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/data/GPResult;->data:Lcom/p1/mobile/putong/data/GooglePlayOrdersData;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/GooglePlayOrdersData;->googlePlayOrders:Ljava/util/List;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    check-cast p1, Ljava/lang/Iterable;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    move-object v2, v1

    .line 45
    check-cast v2, Lcom/p1/mobile/putong/data/GooglePlayOrders;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/data/GooglePlayOrders;->status:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->a:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_0

    .line 56
    .line 57
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-object v0

    .line 62
    :cond_2
    const/4 p0, 0x0

    .line 63
    return-object p0
.end method

.method public static H(Lcom/p1/mobile/putong/data/PaymentParam;Lcom/p1/mobile/putong/data/PaymentParam;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Ll/xi5;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PaymentParam;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static I(Ljava/lang/String;Lcom/p1/mobile/putong/data/GPTransaction;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Ll/xi5;->s(Ljava/lang/String;)Ljava/lang/String;

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
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/GPTransaction;->toJson()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static J(Lcom/p1/mobile/putong/api/api/PaymentApi;ILcom/p1/mobile/putong/data/GPTransaction;Lcom/p1/mobile/putong/data/GooglePlayOrders;Lcom/p1/mobile/putong/data/GPResult;)Lrx/c;
    .locals 3

    .line 1
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p4, Lcom/p1/mobile/putong/data/GPResult;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 5
    .line 6
    iget v1, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 7
    .line 8
    const/16 v2, 0xc8

    .line 9
    .line 10
    if-ne v1, v2, :cond_4

    .line 11
    .line 12
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->subCode:I

    .line 13
    .line 14
    if-nez v0, :cond_4

    .line 15
    .line 16
    iget-object v0, p4, Lcom/p1/mobile/putong/data/GPResult;->data:Lcom/p1/mobile/putong/data/GooglePlayOrdersData;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/GooglePlayOrdersData;->googlePlayOrders:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_3

    .line 25
    .line 26
    iget-object p4, p4, Lcom/p1/mobile/putong/data/GPResult;->data:Lcom/p1/mobile/putong/data/GooglePlayOrdersData;

    .line 27
    .line 28
    iget-object p4, p4, Lcom/p1/mobile/putong/data/GooglePlayOrdersData;->googlePlayOrders:Ljava/util/List;

    .line 29
    .line 30
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    invoke-static {p4}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    check-cast p4, Lcom/p1/mobile/putong/data/GooglePlayOrders;

    .line 38
    .line 39
    if-eqz p4, :cond_0

    .line 40
    .line 41
    iget-object p4, p4, Lcom/p1/mobile/putong/data/GooglePlayOrders;->status:Ljava/lang/String;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 p4, 0x0

    .line 45
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->a:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p4

    .line 51
    if-eqz p4, :cond_1

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    const/4 p4, 0x5

    .line 55
    if-ge p1, p4, :cond_2

    .line 56
    .line 57
    add-int/lit8 p1, p1, 0x1

    .line 58
    .line 59
    invoke-virtual {p0, p2, p3, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->U(Lcom/p1/mobile/putong/data/GPTransaction;Lcom/p1/mobile/putong/data/GooglePlayOrders;I)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 65
    .line 66
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_3
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 72
    .line 73
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0

    .line 78
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 79
    .line 80
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0
.end method

.method public static K(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static L(Lcom/p1/mobile/putong/api/api/PaymentApi;Ljava/lang/String;Lcom/p1/mobile/putong/data/ContractEnvelope;)Lcom/p1/mobile/putong/data/ContractEnvelope;
    .locals 5

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->e:Lrx/subjects/a;

    .line 5
    .line 6
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    iget-object v1, p2, Lcom/p1/mobile/putong/data/ContractEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 13
    .line 14
    iget v1, v1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 15
    .line 16
    const/16 v2, 0xc8

    .line 17
    .line 18
    if-ne v1, v2, :cond_3

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    check-cast v3, Lcom/p1/mobile/putong/data/Contract;

    .line 45
    .line 46
    iget-object v4, v3, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v4, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-eqz v4, :cond_0

    .line 53
    .line 54
    move-object v2, v3

    .line 55
    goto :goto_0

    .line 56
    :cond_1
    if-eqz v2, :cond_2

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->e:Lrx/subjects/a;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    return-object p2
.end method

.method public static M(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/p1/mobile/putong/data/ContractEnvelope;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/data/ContractEnvelope;

    .line 6
    .line 7
    return-object p0
.end method

.method public static N(Ljava/lang/String;Lcom/p1/mobile/putong/data/GPTransaction;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Ll/xi5;->s(Ljava/lang/String;)Ljava/lang/String;

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
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/GPTransaction;->toJson()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static O(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 2
    .line 3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static P(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/util/List;

    .line 6
    .line 7
    return-object p0
.end method

.method public static x(Lcom/p1/mobile/putong/api/api/PaymentApi;Lcom/p1/mobile/putong/data/GPResult;)Ljava/util/List;
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/GPResult;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 5
    .line 6
    iget v1, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 7
    .line 8
    const/16 v2, 0xc8

    .line 9
    .line 10
    if-ne v1, v2, :cond_2

    .line 11
    .line 12
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->subCode:I

    .line 13
    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/data/GPResult;->data:Lcom/p1/mobile/putong/data/GooglePlayOrdersData;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/GooglePlayOrdersData;->googlePlayOrders:Ljava/util/List;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    check-cast p1, Ljava/lang/Iterable;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    move-object v2, v1

    .line 45
    check-cast v2, Lcom/p1/mobile/putong/data/GooglePlayOrders;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/data/GooglePlayOrders;->status:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->a:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_0

    .line 56
    .line 57
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-object v0

    .line 62
    :cond_2
    const/4 p0, 0x0

    .line 63
    return-object p0
.end method

.method public static y(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Ll/xi5;->s(Ljava/lang/String;)Ljava/lang/String;

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

.method public static z(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/util/List;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public final Q(Ljava/lang/String;)Lrx/c;
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/ContractEnvelope;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/data/ContractIds;->new_()Lcom/p1/mobile/putong/data/ContractIds;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, v0, Lcom/p1/mobile/putong/data/ContractIds;->ids:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/yk60;

    .line 14
    .line 15
    invoke-direct {v1, v0}, Ll/yk60;-><init>(Lcom/p1/mobile/putong/data/ContractIds;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/si20;

    .line 19
    .line 20
    sget-object v2, Lcom/p1/mobile/putong/data/ContractEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/zk60;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1}, Ll/zk60;-><init>(Lcom/p1/mobile/putong/api/api/PaymentApi;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/al60;

    .line 39
    .line 40
    invoke-direct {p0, v1}, Ll/al60;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    return-object p0
.end method

.method public final R()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->e:Lrx/subjects/a;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final S()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->e:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->T()Lrx/c;

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->e:Lrx/subjects/a;

    .line 13
    .line 14
    return-object p0
.end method

.method public final T()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/uk60;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/uk60;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->e:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-interface {v1, v0, p0}, Ll/bn5;->z5(Ll/pcj;Lrx/subjects/a;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public final U(Lcom/p1/mobile/putong/data/GPTransaction;Lcom/p1/mobile/putong/data/GooglePlayOrders;I)Lrx/c;
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/data/GPTransaction;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/GooglePlayOrders;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/GPTransaction;",
            "Lcom/p1/mobile/putong/data/GooglePlayOrders;",
            "I)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/data/GooglePlayOrders;->status:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 18
    .line 19
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->a0(Lcom/p1/mobile/putong/data/GPTransaction;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p2, Lcom/p1/mobile/putong/data/GooglePlayOrders;->transactionId:Ljava/lang/String;

    .line 31
    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v2, "/googleplay/orders/"

    .line 35
    .line 36
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/si20;

    .line 47
    .line 48
    new-instance v2, Ll/il60;

    .line 49
    .line 50
    invoke-direct {v2, v0}, Ll/il60;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sget-object v0, Lcom/p1/mobile/putong/data/GPResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 54
    .line 55
    invoke-direct {v1, v2, v0}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Ll/jl60;

    .line 59
    .line 60
    invoke-direct {v0}, Ll/jl60;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-wide/16 v1, 0x1

    .line 68
    .line 69
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 70
    .line 71
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/kl60;

    .line 76
    .line 77
    invoke-direct {v1, p0, p3, p1, p2}, Ll/kl60;-><init>(Lcom/p1/mobile/putong/api/api/PaymentApi;ILcom/p1/mobile/putong/data/GPTransaction;Lcom/p1/mobile/putong/data/GooglePlayOrders;)V

    .line 78
    .line 79
    .line 80
    new-instance p0, Ll/ll60;

    .line 81
    .line 82
    invoke-direct {p0, v1}, Ll/ll60;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, p0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    return-object p0
.end method

.method public final V(Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/data/PaymentParam;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/PaymentParam;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/OrderData;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PaymentParam;->clone()Lcom/p1/mobile/putong/data/PaymentParam;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/hl60;

    .line 12
    .line 13
    invoke-direct {v0, p1, p0}, Ll/hl60;-><init>(Lcom/p1/mobile/putong/data/PaymentParam;Lcom/p1/mobile/putong/data/PaymentParam;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/si20;

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/data/OrderData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    .line 20
    invoke-direct {p0, v0, p1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method public final W(Lcom/p1/mobile/putong/data/GPTransaction;Ljava/lang/String;)Lrx/c;
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/data/GPTransaction;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/GPTransaction;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/GooglePlayOrders;",
            ">;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->a0(Lcom/p1/mobile/putong/data/GPTransaction;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/si20;

    .line 11
    .line 12
    new-instance v1, Ll/el60;

    .line 13
    .line 14
    invoke-direct {v1, p2, p1}, Ll/el60;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/GPTransaction;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/data/GPResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    .line 19
    invoke-direct {v0, v1, p1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Ll/fl60;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Ll/fl60;-><init>(Lcom/p1/mobile/putong/api/api/PaymentApi;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/gl60;

    .line 28
    .line 29
    invoke-direct {p0, p1}, Ll/gl60;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    return-object p0
.end method

.method public final X(Lcom/p1/mobile/putong/data/GPTransaction;Ljava/lang/String;)Lrx/c;
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/data/GPTransaction;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/GPTransaction;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/GooglePlayOrders;",
            ">;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->a0(Lcom/p1/mobile/putong/data/GPTransaction;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/si20;

    .line 11
    .line 12
    new-instance v1, Ll/vk60;

    .line 13
    .line 14
    invoke-direct {v1, p2, p1}, Ll/vk60;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/GPTransaction;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/data/GPResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    .line 19
    invoke-direct {v0, v1, p1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Ll/wk60;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Ll/wk60;-><init>(Lcom/p1/mobile/putong/api/api/PaymentApi;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/xk60;

    .line 28
    .line 29
    invoke-direct {p0, p1}, Ll/xk60;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    return-object p0
.end method

.method public final Y()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Order;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->d:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final Z(Lcom/p1/mobile/putong/data/Order;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/Order;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/PaymentApi;->d:Lrx/subjects/b;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final a0(Lcom/p1/mobile/putong/data/GPTransaction;)V
    .locals 0

    .line 1
    new-instance p0, Ll/ml60;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/ml60;-><init>(Lcom/p1/mobile/putong/data/GPTransaction;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final b0(Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/data/PaymentParam;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/PaymentParam;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/bl60;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Ll/bl60;-><init>(Lcom/p1/mobile/putong/data/PaymentParam;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/si20;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/data/OrderData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    invoke-direct {p1, p0, v0}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/cl60;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/cl60;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/dl60;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/dl60;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    return-object p0
.end method
