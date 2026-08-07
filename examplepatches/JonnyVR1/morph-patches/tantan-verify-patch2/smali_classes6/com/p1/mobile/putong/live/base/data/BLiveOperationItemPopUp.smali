.class public Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveoperationitempopup"


# instance fields
.field public fadingSeconds:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public h5Drawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public h5PopUp:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public isFirstPriority:Z

.field public isOpened:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->nullCheck()V

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

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->fadingSeconds:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->fadingSeconds:J

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->isOpened:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->isOpened:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5Drawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5Drawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 37
    .line 38
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5PopUp:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 39
    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5PopUp:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 47
    .line 48
    :cond_2
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->fadingSeconds:J

    .line 24
    .line 25
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->fadingSeconds:J

    .line 26
    .line 27
    cmp-long v1, v3, v5

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->isOpened:Z

    .line 32
    .line 33
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->isOpened:Z

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 40
    .line 41
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5Drawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5Drawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 50
    .line 51
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5PopUp:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5PopUp:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 60
    .line 61
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    return v0

    .line 68
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveoperationitempopup"

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
    if-nez v0, :cond_5

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->fadingSeconds:J

    .line 22
    .line 23
    const/16 v1, 0x20

    .line 24
    .line 25
    ushr-long v5, v3, v1

    .line 26
    .line 27
    xor-long/2addr v3, v5

    .line 28
    long-to-int v1, v3

    .line 29
    add-int/2addr v0, v1

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->isOpened:Z

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    const/16 v1, 0x4cf

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    const/16 v1, 0x4d5

    .line 40
    .line 41
    :goto_1
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x29

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->hashCode()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    move v1, v2

    .line 54
    :goto_2
    add-int/2addr v0, v1

    .line 55
    mul-int/lit8 v0, v0, 0x29

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5Drawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 58
    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->hashCode()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    goto :goto_3

    .line 66
    :cond_3
    move v1, v2

    .line 67
    :goto_3
    add-int/2addr v0, v1

    .line 68
    mul-int/lit8 v0, v0, 0x29

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5PopUp:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->hashCode()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    :cond_4
    add-int/2addr v0, v2

    .line 79
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 80
    .line 81
    :cond_5
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
