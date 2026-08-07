.class public Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;
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
            "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "virtualvoicegroupconversationiteminfo"


# instance fields
.field public dissolveReason:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public isDissolved:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public isEntrance:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public isGuest:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public isOnTop:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public isRemind:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public isRemoved:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public isShow:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->nullCheck()V

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

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->clone()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isShow:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isShow:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemoved:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemoved:Z

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 33
    .line 34
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 35
    .line 36
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 37
    .line 38
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->clone()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isShow:Z

    .line 20
    .line 21
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isShow:Z

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemoved:Z

    .line 26
    .line 27
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemoved:Z

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 32
    .line 33
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 38
    .line 39
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 54
    .line 55
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 56
    .line 57
    if-ne v1, v3, :cond_2

    .line 58
    .line 59
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 60
    .line 61
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 62
    .line 63
    if-ne p0, p1, :cond_2

    .line 64
    .line 65
    return v0

    .line 66
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "virtualvoicegroupconversationiteminfo"

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
    if-nez v0, :cond_8

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isShow:Z

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    move v1, v3

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move v1, v2

    .line 28
    :goto_1
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemoved:Z

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    move v1, v3

    .line 36
    goto :goto_2

    .line 37
    :cond_2
    move v1, v2

    .line 38
    :goto_2
    add-int/2addr v0, v1

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    move v1, v3

    .line 46
    goto :goto_3

    .line 47
    :cond_3
    move v1, v2

    .line 48
    :goto_3
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 52
    .line 53
    if-eqz v1, :cond_4

    .line 54
    .line 55
    move v1, v3

    .line 56
    goto :goto_4

    .line 57
    :cond_4
    move v1, v2

    .line 58
    :goto_4
    add-int/2addr v0, v1

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v1, :cond_5

    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    goto :goto_5

    .line 70
    :cond_5
    const/4 v1, 0x0

    .line 71
    :goto_5
    add-int/2addr v0, v1

    .line 72
    mul-int/lit8 v0, v0, 0x29

    .line 73
    .line 74
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 75
    .line 76
    if-eqz v1, :cond_6

    .line 77
    .line 78
    move v1, v3

    .line 79
    goto :goto_6

    .line 80
    :cond_6
    move v1, v2

    .line 81
    :goto_6
    add-int/2addr v0, v1

    .line 82
    mul-int/lit8 v0, v0, 0x29

    .line 83
    .line 84
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 85
    .line 86
    if-eqz v1, :cond_7

    .line 87
    .line 88
    move v2, v3

    .line 89
    :cond_7
    add-int/2addr v0, v2

    .line 90
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 91
    .line 92
    :cond_8
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
