.class public Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;
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
            "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "virtualvoicegroupconversationitemchat"


# instance fields
.field public commonMsg:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public currentMsg:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public currentSenderName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public currentSeq:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public currentTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public unreadedCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->nullCheck()V

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

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->clone()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentTime:J

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentTime:J

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 29
    .line 30
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->clone()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

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
    check-cast p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentTime:J

    .line 46
    .line 47
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentTime:J

    .line 48
    .line 49
    cmp-long v1, v3, v5

    .line 50
    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_2

    .line 62
    .line 63
    return v0

    .line 64
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "virtualvoicegroupconversationitemchat"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 7

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
    iget v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v1, v2

    .line 28
    :goto_0
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentTime:J

    .line 45
    .line 46
    const/16 v1, 0x20

    .line 47
    .line 48
    ushr-long v5, v3, v1

    .line 49
    .line 50
    xor-long/2addr v3, v5

    .line 51
    long-to-int v1, v3

    .line 52
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x29

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    :cond_2
    add-int/2addr v0, v2

    .line 64
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 65
    .line 66
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
