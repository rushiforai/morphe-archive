.class public Lcom/p1/mobile/putong/core/data/SignPaymentParam;
.super Lcom/p1/mobile/putong/data/PaymentParam;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/SignPaymentParam;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/SignPaymentParam;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "signpaymentparam"


# instance fields
.field public addHuaZhi:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public contractId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public delayCharge:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public reSignAfterFail:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SignPaymentParam$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SignPaymentParam$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/PaymentParam;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/SignPaymentParam;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SignPaymentParam;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->clone()Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/SignPaymentParam;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SignPaymentParam;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->useAutoDeduct:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->useAutoDeduct:Z

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->signAndPay:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->signAndPay:Z

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PaymentParamExtra;->clone()Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 39
    .line 40
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 43
    .line 44
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->addHuaZhi:Z

    .line 45
    .line 46
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->addHuaZhi:Z

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 51
    .line 52
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->delayCharge:Z

    .line 53
    .line 54
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->delayCharge:Z

    .line 55
    .line 56
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->reSignAfterFail:Z

    .line 57
    .line 58
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->reSignAfterFail:Z

    .line 59
    .line 60
    return-object v0
.end method

.method public bridge synthetic clone()Lcom/p1/mobile/putong/data/PaymentParam;
    .locals 0

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->clone()Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->clone()Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/data/PaymentParam;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    return v2

    .line 21
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->addHuaZhi:Z

    .line 22
    .line 23
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->addHuaZhi:Z

    .line 24
    .line 25
    if-ne p1, v3, :cond_3

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->delayCharge:Z

    .line 38
    .line 39
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->delayCharge:Z

    .line 40
    .line 41
    if-ne p1, v3, :cond_3

    .line 42
    .line 43
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->reSignAfterFail:Z

    .line 44
    .line 45
    iget-boolean p1, v1, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->reSignAfterFail:Z

    .line 46
    .line 47
    if-ne p0, p1, :cond_3

    .line 48
    .line 49
    return v0

    .line 50
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "signpaymentparam"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 4

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    invoke-super {p0}, Lcom/p1/mobile/putong/data/PaymentParam;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->addHuaZhi:Z

    .line 12
    .line 13
    const/16 v2, 0x4d5

    .line 14
    .line 15
    const/16 v3, 0x4cf

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    move v1, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v2

    .line 22
    :goto_0
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    const/4 v1, 0x0

    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->delayCharge:Z

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    move v1, v3

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v1, v2

    .line 45
    :goto_2
    add-int/2addr v0, v1

    .line 46
    mul-int/lit8 v0, v0, 0x29

    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->reSignAfterFail:Z

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    move v2, v3

    .line 53
    :cond_3
    add-int/2addr v0, v2

    .line 54
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 55
    .line 56
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/data/PaymentParam;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
