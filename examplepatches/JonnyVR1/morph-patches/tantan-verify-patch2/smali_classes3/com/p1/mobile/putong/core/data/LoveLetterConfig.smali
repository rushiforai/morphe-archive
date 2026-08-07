.class public Lcom/p1/mobile/putong/core/data/LoveLetterConfig;
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
            "Lcom/p1/mobile/putong/core/data/LoveLetterConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/LoveLetterConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "loveletterconfig"


# instance fields
.field public chat_guide_interval:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public chat_guide_trigger_message_count:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public chat_guide_trigger_mm:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public chat_guide_trigger_time_no_response:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public chat_guide_trigger_time_window:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public enable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public letter_min_count:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public received_guide_show_limit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveLetterConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveLetterConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/LoveLetterConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->clone()Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/LoveLetterConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_interval:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_interval:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_message_count:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_message_count:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_window:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_window:I

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_mm:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_mm:I

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_no_response:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_no_response:I

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->received_guide_show_limit:I

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->received_guide_show_limit:I

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->enable:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->enable:Z

    .line 33
    .line 34
    iget p0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->letter_min_count:I

    .line 35
    .line 36
    iput p0, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->letter_min_count:I

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->clone()Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_interval:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_interval:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_message_count:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_message_count:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_window:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_window:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_mm:I

    .line 32
    .line 33
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_mm:I

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_no_response:I

    .line 38
    .line 39
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_no_response:I

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->received_guide_show_limit:I

    .line 44
    .line 45
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->received_guide_show_limit:I

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->enable:Z

    .line 50
    .line 51
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->enable:Z

    .line 52
    .line 53
    if-ne v1, v3, :cond_2

    .line 54
    .line 55
    iget p0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->letter_min_count:I

    .line 56
    .line 57
    iget p1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->letter_min_count:I

    .line 58
    .line 59
    if-ne p0, p1, :cond_2

    .line 60
    .line 61
    return v0

    .line 62
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "loveletterconfig"

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
    if-nez v0, :cond_1

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_interval:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_message_count:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_window:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_mm:I

    .line 23
    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_no_response:I

    .line 28
    .line 29
    add-int/2addr v0, v1

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->received_guide_show_limit:I

    .line 33
    .line 34
    add-int/2addr v0, v1

    .line 35
    mul-int/lit8 v0, v0, 0x29

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->enable:Z

    .line 38
    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    const/16 v1, 0x4cf

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/16 v1, 0x4d5

    .line 45
    .line 46
    :goto_0
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->letter_min_count:I

    .line 50
    .line 51
    add-int/2addr v0, v1

    .line 52
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 53
    .line 54
    :cond_1
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
