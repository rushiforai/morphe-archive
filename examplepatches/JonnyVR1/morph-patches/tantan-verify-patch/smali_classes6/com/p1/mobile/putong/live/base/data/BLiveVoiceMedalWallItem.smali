.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoicemedalwallitem"


# instance fields
.field public bgPicUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public cardColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public gifts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public id:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public subTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public textColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->nullCheck()V

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

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->id:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->id:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->title:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->title:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->subTitle:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->subTitle:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->bgPicUrl:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->bgPicUrl:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->cardColor:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->cardColor:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->textColor:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->textColor:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 43
    .line 44
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 45
    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    new-instance v1, Ll/m92;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/m92;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 58
    .line 59
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

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->id:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->id:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->title:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->subTitle:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->subTitle:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->bgPicUrl:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->bgPicUrl:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->cardColor:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->cardColor:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->textColor:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->textColor:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 80
    .line 81
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 82
    .line 83
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_2

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 92
    .line 93
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-eqz p0, :cond_2

    .line 98
    .line 99
    return v0

    .line 100
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoicemedalwallitem"

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
    if-nez v0, :cond_8

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->id:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v1, v2

    .line 36
    :goto_1
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->subTitle:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move v1, v2

    .line 49
    :goto_2
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->bgPicUrl:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v2

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->cardColor:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    goto :goto_4

    .line 74
    :cond_4
    move v1, v2

    .line 75
    :goto_4
    add-int/2addr v0, v1

    .line 76
    mul-int/lit8 v0, v0, 0x29

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->textColor:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz v1, :cond_5

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    goto :goto_5

    .line 87
    :cond_5
    move v1, v2

    .line 88
    :goto_5
    add-int/2addr v0, v1

    .line 89
    mul-int/lit8 v0, v0, 0x29

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 92
    .line 93
    if-eqz v1, :cond_6

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;->hashCode()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    goto :goto_6

    .line 100
    :cond_6
    move v1, v2

    .line 101
    :goto_6
    add-int/2addr v0, v1

    .line 102
    mul-int/lit8 v0, v0, 0x29

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 105
    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    :cond_7
    add-int/2addr v0, v2

    .line 113
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 114
    .line 115
    :cond_8
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->title:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->title:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->subTitle:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->subTitle:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->bgPicUrl:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->bgPicUrl:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->cardColor:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->cardColor:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->textColor:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->textColor:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    new-instance v0, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 59
    .line 60
    :cond_7
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
