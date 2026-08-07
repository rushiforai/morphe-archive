.class public Lcom/p1/mobile/putong/data/VerifyDataV2;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/VerifyDataV2;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/VerifyDataV2;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "verifydatav2"


# instance fields
.field public action:Lcom/p1/mobile/putong/data/VerifyReason;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public category:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public clientId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public code:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public codeLength:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public countryCode:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public device:Lcom/p1/mobile/putong/data/Device;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public email:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public language:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public mobileNumber:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public ttt_signin_token:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyDataV2$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyDataV2$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyDataV2$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyDataV2$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/data/VerifyDataV2;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyDataV2;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyDataV2;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/VerifyDataV2;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static v1ConvertV2(Lcom/p1/mobile/putong/data/VerifyData;)Lcom/p1/mobile/putong/data/VerifyDataV2;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/VerifyDataV2;->new_()Lcom/p1/mobile/putong/data/VerifyDataV2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 6
    .line 7
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->countryCode:I

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 14
    .line 15
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 26
    .line 27
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->codeLength:I

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyData;->clientId:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VerifyData;->category:Ljava/lang/String;

    .line 38
    .line 39
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 40
    .line 41
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 42
    .line 43
    invoke-interface {p0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 48
    .line 49
    return-object v0
.end method

.method public static v2ConvertV1(Lcom/p1/mobile/putong/data/VerifyDataV2;)Lcom/p1/mobile/putong/data/VerifyData;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/VerifyData;->new_()Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->countryCode:I

    .line 6
    .line 7
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 14
    .line 15
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->codeLength:I

    .line 26
    .line 27
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->clientId:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->category:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 42
    .line 43
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VerifyData;->ttt_signin_token:Ljava/lang/String;

    .line 44
    .line 45
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

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerifyDataV2;->clone()Lcom/p1/mobile/putong/data/VerifyDataV2;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/VerifyDataV2;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyDataV2;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyDataV2;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->countryCode:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->countryCode:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->codeLength:I

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->codeLength:I

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Device;->clone()Lcom/p1/mobile/putong/data/Device;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 39
    .line 40
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 57
    .line 58
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 59
    .line 60
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerifyDataV2;->clone()Lcom/p1/mobile/putong/data/VerifyDataV2;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;

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
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyDataV2;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->countryCode:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->countryCode:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 30
    .line 31
    iget v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 48
    .line 49
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->codeLength:I

    .line 56
    .line 57
    iget v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->codeLength:I

    .line 58
    .line 59
    if-ne v1, v3, :cond_2

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 64
    .line 65
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_2

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-eqz p0, :cond_2

    .line 120
    .line 121
    return v0

    .line 122
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "verifydatav2"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_9

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->countryCode:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v1, v2

    .line 23
    :goto_0
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 27
    .line 28
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move v1, v2

    .line 41
    :goto_1
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x29

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    move v1, v2

    .line 54
    :goto_2
    add-int/2addr v0, v1

    .line 55
    mul-int/lit8 v0, v0, 0x29

    .line 56
    .line 57
    iget v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->codeLength:I

    .line 58
    .line 59
    add-int/2addr v0, v1

    .line 60
    mul-int/lit8 v0, v0, 0x29

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Device;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    goto :goto_3

    .line 71
    :cond_3
    move v1, v2

    .line 72
    :goto_3
    add-int/2addr v0, v1

    .line 73
    mul-int/lit8 v0, v0, 0x29

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz v1, :cond_4

    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    goto :goto_4

    .line 84
    :cond_4
    move v1, v2

    .line 85
    :goto_4
    add-int/2addr v0, v1

    .line 86
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz v1, :cond_5

    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    goto :goto_5

    .line 97
    :cond_5
    move v1, v2

    .line 98
    :goto_5
    add-int/2addr v0, v1

    .line 99
    mul-int/lit8 v0, v0, 0x29

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz v1, :cond_6

    .line 104
    .line 105
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    goto :goto_6

    .line 110
    :cond_6
    move v1, v2

    .line 111
    :goto_6
    add-int/2addr v0, v1

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz v1, :cond_7

    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    goto :goto_7

    .line 123
    :cond_7
    move v1, v2

    .line 124
    :goto_7
    add-int/2addr v0, v1

    .line 125
    mul-int/lit8 v0, v0, 0x29

    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz v1, :cond_8

    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    :cond_8
    add-int/2addr v0, v2

    .line 136
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 137
    .line 138
    :cond_9
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/data/VerifyReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/data/Device;->new_()Lcom/p1/mobile/putong/data/Device;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v0, :cond_8

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 68
    .line 69
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/VerifyDataV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
