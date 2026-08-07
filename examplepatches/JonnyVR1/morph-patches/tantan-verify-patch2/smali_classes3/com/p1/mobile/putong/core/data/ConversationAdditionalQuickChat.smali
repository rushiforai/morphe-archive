.class public Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;
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
            "Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "conversationadditionalquickchat"


# instance fields
.field public avatarBlurred:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public expire:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public guideFakeToGood:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public progress:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->nullCheck()V

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

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->clone()Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/QuickChatBell;->clone()Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 19
    .line 20
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->expire:D

    .line 21
    .line 22
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->expire:D

    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->progress:I

    .line 25
    .line 26
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->progress:I

    .line 27
    .line 28
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->guideFakeToGood:Z

    .line 29
    .line 30
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->guideFakeToGood:Z

    .line 31
    .line 32
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->clone()Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->expire:D

    .line 30
    .line 31
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->expire:D

    .line 32
    .line 33
    cmpl-double v1, v3, v5

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->progress:I

    .line 38
    .line 39
    iget v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->progress:I

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->guideFakeToGood:Z

    .line 44
    .line 45
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->guideFakeToGood:Z

    .line 46
    .line 47
    if-ne p0, p1, :cond_2

    .line 48
    .line 49
    return v0

    .line 50
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "conversationadditionalquickchat"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 8

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 8
    .line 9
    const/16 v2, 0x4d5

    .line 10
    .line 11
    const/16 v3, 0x4cf

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move v1, v3

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    add-int/2addr v0, v1

    .line 19
    mul-int/lit8 v0, v0, 0x29

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/QuickChatBell;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const/4 v1, 0x0

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->expire:D

    .line 33
    .line 34
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    const/16 v1, 0x20

    .line 41
    .line 42
    ushr-long v6, v4, v1

    .line 43
    .line 44
    xor-long/2addr v4, v6

    .line 45
    long-to-int v1, v4

    .line 46
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->progress:I

    .line 50
    .line 51
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->guideFakeToGood:Z

    .line 55
    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    move v2, v3

    .line 59
    :cond_2
    add-int/2addr v0, v2

    .line 60
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 61
    .line 62
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuickChatBell;->new_()Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
