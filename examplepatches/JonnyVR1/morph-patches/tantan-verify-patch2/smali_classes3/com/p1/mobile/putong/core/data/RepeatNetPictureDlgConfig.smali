.class public Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;
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
            "Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "repeatnetpicturedlgconfig"


# instance fields
.field public aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public enable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->nullCheck()V

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

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->clone()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->clone()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->clone()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->clone()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->clone()Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 45
    .line 46
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 47
    .line 48
    if-eqz v1, :cond_4

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->clone()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 55
    .line 56
    :cond_4
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->enable:Z

    .line 57
    .line 58
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->enable:Z

    .line 59
    .line 60
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->clone()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 26
    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 36
    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->enable:Z

    .line 64
    .line 65
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->enable:Z

    .line 66
    .line 67
    if-ne p0, p1, :cond_2

    .line 68
    .line 69
    return v0

    .line 70
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "repeatnetpicturedlgconfig"

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
    if-nez v0, :cond_6

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move v1, v2

    .line 57
    :goto_3
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    :cond_4
    add-int/2addr v0, v2

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->enable:Z

    .line 72
    .line 73
    if-eqz v1, :cond_5

    .line 74
    .line 75
    const/16 v1, 0x4cf

    .line 76
    .line 77
    goto :goto_4

    .line 78
    :cond_5
    const/16 v1, 0x4d5

    .line 79
    .line 80
    :goto_4
    add-int/2addr v0, v1

    .line 81
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 82
    .line 83
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 50
    .line 51
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
