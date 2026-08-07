.class public Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;
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
            "Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "quickchatpartycampaignpage"


# instance fields
.field public beginHour:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public endHour:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public partyType:Lcom/p1/mobile/putong/core/data/QuickChatPartyType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public show:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public weekDay:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->clone()Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->show:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->show:Z

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->weekDay:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->weekDay:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->beginHour:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->beginHour:I

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->endHour:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->endHour:I

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->partyType:Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 23
    .line 24
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->partyType:Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->clone()Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->show:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->show:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->weekDay:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->weekDay:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->beginHour:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->beginHour:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->endHour:I

    .line 32
    .line 33
    iget v3, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->endHour:I

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->partyType:Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->partyType:Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 40
    .line 41
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_2

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
    const-string p0, "quickchatpartycampaignpage"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->show:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/16 v1, 0x4cf

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/16 v1, 0x4d5

    .line 15
    .line 16
    :goto_0
    add-int/2addr v0, v1

    .line 17
    mul-int/lit8 v0, v0, 0x29

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->weekDay:I

    .line 20
    .line 21
    add-int/2addr v0, v1

    .line 22
    mul-int/lit8 v0, v0, 0x29

    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->beginHour:I

    .line 25
    .line 26
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x29

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->endHour:I

    .line 30
    .line 31
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->partyType:Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    const/4 v1, 0x0

    .line 44
    :goto_1
    add-int/2addr v0, v1

    .line 45
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 46
    .line 47
    :cond_2
    return v0
.end method

.method public isValueAvailable()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->weekDay:I

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x6

    .line 6
    if-gt v0, v1, :cond_0

    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->beginHour:I

    .line 9
    .line 10
    if-ltz v0, :cond_0

    .line 11
    .line 12
    const/16 v1, 0x18

    .line 13
    .line 14
    if-gt v0, v1, :cond_0

    .line 15
    .line 16
    iget p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->endHour:I

    .line 17
    .line 18
    if-ltz p0, :cond_0

    .line 19
    .line 20
    if-gt p0, v1, :cond_0

    .line 21
    .line 22
    if-le p0, v0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->partyType:Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->partyType:Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
