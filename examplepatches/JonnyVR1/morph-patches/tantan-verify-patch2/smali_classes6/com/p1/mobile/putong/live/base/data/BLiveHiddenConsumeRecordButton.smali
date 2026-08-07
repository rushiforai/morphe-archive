.class public Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivehiddenconsumerecordbutton"


# instance fields
.field public anchorHiddenConsumeRecordOn:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public hiddenAnchorHierarchyOn:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public hideGroupConsumptionRankStatus:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public userHiddenConsumeRecordOn:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->nullCheck()V

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

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->anchorHiddenConsumeRecordOn:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->anchorHiddenConsumeRecordOn:Z

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->userHiddenConsumeRecordOn:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->userHiddenConsumeRecordOn:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->hideGroupConsumptionRankStatus:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->hideGroupConsumptionRankStatus:Z

    .line 17
    .line 18
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->hiddenAnchorHierarchyOn:Z

    .line 19
    .line 20
    iput-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->hiddenAnchorHierarchyOn:Z

    .line 21
    .line 22
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->anchorHiddenConsumeRecordOn:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->anchorHiddenConsumeRecordOn:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->userHiddenConsumeRecordOn:Z

    .line 20
    .line 21
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->userHiddenConsumeRecordOn:Z

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->hideGroupConsumptionRankStatus:Z

    .line 26
    .line 27
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->hideGroupConsumptionRankStatus:Z

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->hiddenAnchorHierarchyOn:Z

    .line 32
    .line 33
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->hiddenAnchorHierarchyOn:Z

    .line 34
    .line 35
    if-ne p0, p1, :cond_2

    .line 36
    .line 37
    return v0

    .line 38
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivehiddenconsumerecordbutton"

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
    if-nez v0, :cond_4

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->anchorHiddenConsumeRecordOn:Z

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->userHiddenConsumeRecordOn:Z

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->hideGroupConsumptionRankStatus:Z

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->hiddenAnchorHierarchyOn:Z

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    move v2, v3

    .line 46
    :cond_3
    add-int/2addr v0, v2

    .line 47
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 48
    .line 49
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
