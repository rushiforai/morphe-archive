.class public Lcom/p1/mobile/putong/account/data/AccountTestGroup;
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
            "Lcom/p1/mobile/putong/account/data/AccountTestGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/account/data/AccountTestGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "accounttestgroup"


# instance fields
.field public accountKitEntry:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public chinaUnicomEntry:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public facebookEntry:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public googleEntry:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public thirdPartyValidation:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/AccountTestGroup$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/AccountTestGroup$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/account/data/AccountTestGroup;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/AccountTestGroup;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->nullCheck()V

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

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->clone()Lcom/p1/mobile/putong/account/data/AccountTestGroup;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/account/data/AccountTestGroup;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/AccountTestGroup;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->thirdPartyValidation:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->thirdPartyValidation:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->facebookEntry:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->facebookEntry:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->accountKitEntry:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->accountKitEntry:Z

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->chinaUnicomEntry:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->chinaUnicomEntry:Z

    .line 21
    .line 22
    iget-boolean p0, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->googleEntry:Z

    .line 23
    .line 24
    iput-boolean p0, v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->googleEntry:Z

    .line 25
    .line 26
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->clone()Lcom/p1/mobile/putong/account/data/AccountTestGroup;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/account/data/AccountTestGroup;

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
    check-cast p1, Lcom/p1/mobile/putong/account/data/AccountTestGroup;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->thirdPartyValidation:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->thirdPartyValidation:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->facebookEntry:Z

    .line 24
    .line 25
    iget-boolean v3, p1, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->facebookEntry:Z

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->accountKitEntry:Z

    .line 30
    .line 31
    iget-boolean v3, p1, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->accountKitEntry:Z

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->chinaUnicomEntry:Z

    .line 36
    .line 37
    iget-boolean v3, p1, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->chinaUnicomEntry:Z

    .line 38
    .line 39
    if-ne v1, v3, :cond_2

    .line 40
    .line 41
    iget-boolean p0, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->googleEntry:Z

    .line 42
    .line 43
    iget-boolean p1, p1, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->googleEntry:Z

    .line 44
    .line 45
    if-ne p0, p1, :cond_2

    .line 46
    .line 47
    return v0

    .line 48
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "accounttestgroup"

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
    if-nez v0, :cond_5

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->thirdPartyValidation:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    :goto_0
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x29

    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->facebookEntry:Z

    .line 21
    .line 22
    const/16 v2, 0x4d5

    .line 23
    .line 24
    const/16 v3, 0x4cf

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    move v1, v3

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->accountKitEntry:Z

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    move v1, v3

    .line 39
    goto :goto_2

    .line 40
    :cond_2
    move v1, v2

    .line 41
    :goto_2
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x29

    .line 43
    .line 44
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->chinaUnicomEntry:Z

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    move v1, v3

    .line 49
    goto :goto_3

    .line 50
    :cond_3
    move v1, v2

    .line 51
    :goto_3
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->googleEntry:Z

    .line 55
    .line 56
    if-eqz v1, :cond_4

    .line 57
    .line 58
    move v2, v3

    .line 59
    :cond_4
    add-int/2addr v0, v2

    .line 60
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 61
    .line 62
    :cond_5
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->thirdPartyValidation:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->thirdPartyValidation:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
