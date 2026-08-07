.class public Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;
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
            "Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "spryemojiargsconfig"


# instance fields
.field public hint_emoji_array:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public hint_emoji_show_max:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public spry_emoji_array:Lcom/p1/mobile/putong/core/data/SpryEmojiData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public spry_emoji_show_max:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->nullCheck()V

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

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->clone()Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_show_max:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_show_max:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_array:Lcom/p1/mobile/putong/core/data/SpryEmojiData;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SpryEmojiData;->clone()Lcom/p1/mobile/putong/core/data/SpryEmojiData;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_array:Lcom/p1/mobile/putong/core/data/SpryEmojiData;

    .line 19
    .line 20
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_show_max:I

    .line 21
    .line 22
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_show_max:I

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_array:Ljava/util/List;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    new-instance v1, Ll/kzf0;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/kzf0;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_array:Ljava/util/List;

    .line 38
    .line 39
    :cond_1
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->clone()Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_show_max:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_show_max:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_array:Lcom/p1/mobile/putong/core/data/SpryEmojiData;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_array:Lcom/p1/mobile/putong/core/data/SpryEmojiData;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_show_max:I

    .line 30
    .line 31
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_show_max:I

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_array:Ljava/util/List;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_array:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    return v0

    .line 46
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "spryemojiargsconfig"

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
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_show_max:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_array:Lcom/p1/mobile/putong/core/data/SpryEmojiData;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SpryEmojiData;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_show_max:I

    .line 27
    .line 28
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_array:Ljava/util/List;

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    :cond_1
    add-int/2addr v0, v2

    .line 40
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 41
    .line 42
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_array:Lcom/p1/mobile/putong/core/data/SpryEmojiData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SpryEmojiData;->new_()Lcom/p1/mobile/putong/core/data/SpryEmojiData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->spry_emoji_array:Lcom/p1/mobile/putong/core/data/SpryEmojiData;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_array:Ljava/util/List;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_array:Ljava/util/List;

    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
