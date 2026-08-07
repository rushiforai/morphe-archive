.class public Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static final READUTIL:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static final RETRYCOUNT:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;",
            "Lcom/p1/mobile/putong/core/data/ConversationPatchState;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "conversationpatchrecord"

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public readUtil:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public retryCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$3;

    .line 16
    .line 17
    const-string v1, "_id"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$3;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$4;

    .line 25
    .line 26
    const-string v1, "id_c"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$4;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$5;

    .line 34
    .line 35
    const-string v1, "readUtil_c"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$5;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->READUTIL:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$6;

    .line 43
    .line 44
    const-string v1, "state_c"

    .line 45
    .line 46
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationPatchState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 47
    .line 48
    const-string v3, "str_state_c"

    .line 49
    .line 50
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$6;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->STATE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 54
    .line 55
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$7;

    .line 56
    .line 57
    const-string v1, "retryCount_c"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$7;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->RETRYCOUNT:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 63
    .line 64
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$8;

    .line 65
    .line 66
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$8;-><init>()V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->DB_ADAPTER:Ll/vzf0;

    .line 70
    .line 71
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/DbObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->clone()Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 21
    .line 22
    iget p0, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->retryCount:I

    .line 23
    .line 24
    iput p0, v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->retryCount:I

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->clone()Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    move-result-object p0

    return-object p0
.end method

.method public createConversation()Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Conversation;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    return-object v0
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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

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
    check-cast v1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 34
    .line 35
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget p0, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->retryCount:I

    .line 42
    .line 43
    iget p1, v1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->retryCount:I

    .line 44
    .line 45
    if-ne p0, p1, :cond_3

    .line 46
    .line 47
    return v0

    .line 48
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "conversationpatchrecord"

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
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-super {p0}, Lcom/tantanapp/common/data/DbObject;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    :cond_1
    add-int/2addr v0, v2

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->retryCount:I

    .line 37
    .line 38
    add-int/2addr v0, v1

    .line 39
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 40
    .line 41
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
