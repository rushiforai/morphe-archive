.class public Lcom/p1/mobile/putong/live/base/data/BLiveRoom;
.super Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRoom;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveroom"


# instance fields
.field public callSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public liveStickerIds:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mTempTitle:Ljava/lang/String;

.field public sign:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom$1;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom$1;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;-><init>()V

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->nullCheck()V

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

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
    .locals 0

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->owner:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->owner:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->type:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->type:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->liveStickerIds:Ljava/util/List;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    new-instance v2, Ll/i52;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/i52;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->liveStickerIds:Ljava/util/List;

    .line 52
    .line 53
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->callSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

    .line 54
    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->callSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

    .line 62
    .line 63
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->sign:Ljava/lang/String;

    .line 64
    .line 65
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->sign:Ljava/lang/String;

    .line 66
    .line 67
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

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
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->equals(Ljava/lang/Object;)Z

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->liveStickerIds:Ljava/util/List;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->liveStickerIds:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->callSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->callSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->sign:Ljava/lang/String;

    .line 42
    .line 43
    iget-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->sign:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    return v0

    .line 52
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveroom"

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
    if-nez v0, :cond_3

    .line 4
    .line 5
    invoke-super {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->liveStickerIds:Ljava/util/List;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->callSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v2

    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->sign:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    :cond_2
    add-int/2addr v0, v2

    .line 47
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 48
    .line 49
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->callSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->callSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
