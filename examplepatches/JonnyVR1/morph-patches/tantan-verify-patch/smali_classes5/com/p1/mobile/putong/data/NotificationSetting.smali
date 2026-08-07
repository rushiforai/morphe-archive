.class public Lcom/p1/mobile/putong/data/NotificationSetting;
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
            "Lcom/p1/mobile/putong/data/NotificationSetting;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/NotificationSetting;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "notificationsetting"


# instance fields
.field public chatPartners:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public conversation:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public extremePick:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public greeting:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public group:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public match:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public momentComment:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MomentNotifyBlockType;",
            ">;"
        }
    .end annotation
.end field

.field public momentLike:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MomentNotifyBlockType;",
            ">;"
        }
    .end annotation
.end field

.field public momentLiked:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public momentUpdate:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MomentNotifyBlockType;",
            ">;"
        }
    .end annotation
.end field

.field public status:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public teamAccount:Ljava/util/List;
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


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/NotificationSetting$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NotificationSetting$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/NotificationSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/NotificationSetting$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NotificationSetting$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/NotificationSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/data/MomentNotifyBlockType;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/MomentNotifyBlockType;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/MomentNotifyBlockType;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/NotificationSetting;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NotificationSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/NotificationSetting;->nullCheck()V

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

    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/NotificationSetting;->clone()Lcom/p1/mobile/putong/data/NotificationSetting;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/NotificationSetting;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NotificationSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->match:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->match:Z

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->conversation:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->conversation:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->greeting:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->greeting:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v2, Ll/z150;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/z150;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 32
    .line 33
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    new-instance v2, Ll/a250;

    .line 38
    .line 39
    invoke-direct {v2}, Ll/a250;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 47
    .line 48
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 49
    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    new-instance v2, Ll/b250;

    .line 53
    .line 54
    invoke-direct {v2}, Ll/b250;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 62
    .line 63
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 64
    .line 65
    if-eqz v1, :cond_3

    .line 66
    .line 67
    new-instance v2, Ll/c250;

    .line 68
    .line 69
    invoke-direct {v2}, Ll/c250;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 77
    .line 78
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLiked:Z

    .line 79
    .line 80
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLiked:Z

    .line 81
    .line 82
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->extremePick:Z

    .line 83
    .line 84
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->extremePick:Z

    .line 85
    .line 86
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->status:Z

    .line 87
    .line 88
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->status:Z

    .line 89
    .line 90
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->group:Z

    .line 91
    .line 92
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->group:Z

    .line 93
    .line 94
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->chatPartners:Z

    .line 95
    .line 96
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->chatPartners:Z

    .line 97
    .line 98
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/NotificationSetting;->clone()Lcom/p1/mobile/putong/data/NotificationSetting;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;

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
    check-cast p1, Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->match:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->match:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->conversation:Z

    .line 20
    .line 21
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->conversation:Z

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->greeting:Z

    .line 26
    .line 27
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->greeting:Z

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 44
    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 54
    .line 55
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 64
    .line 65
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLiked:Z

    .line 72
    .line 73
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLiked:Z

    .line 74
    .line 75
    if-ne v1, v3, :cond_2

    .line 76
    .line 77
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->extremePick:Z

    .line 78
    .line 79
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->extremePick:Z

    .line 80
    .line 81
    if-ne v1, v3, :cond_2

    .line 82
    .line 83
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->status:Z

    .line 84
    .line 85
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->status:Z

    .line 86
    .line 87
    if-ne v1, v3, :cond_2

    .line 88
    .line 89
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->group:Z

    .line 90
    .line 91
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->group:Z

    .line 92
    .line 93
    if-ne v1, v3, :cond_2

    .line 94
    .line 95
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->chatPartners:Z

    .line 96
    .line 97
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->chatPartners:Z

    .line 98
    .line 99
    if-ne p0, p1, :cond_2

    .line 100
    .line 101
    return v0

    .line 102
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "notificationsetting"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_c

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->match:Z

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->conversation:Z

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->greeting:Z

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    goto :goto_3

    .line 51
    :cond_3
    move v1, v4

    .line 52
    :goto_3
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x29

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 56
    .line 57
    if-eqz v1, :cond_4

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    goto :goto_4

    .line 64
    :cond_4
    move v1, v4

    .line 65
    :goto_4
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x29

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 69
    .line 70
    if-eqz v1, :cond_5

    .line 71
    .line 72
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    goto :goto_5

    .line 77
    :cond_5
    move v1, v4

    .line 78
    :goto_5
    add-int/2addr v0, v1

    .line 79
    mul-int/lit8 v0, v0, 0x29

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 82
    .line 83
    if-eqz v1, :cond_6

    .line 84
    .line 85
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    :cond_6
    add-int/2addr v0, v4

    .line 90
    mul-int/lit8 v0, v0, 0x29

    .line 91
    .line 92
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLiked:Z

    .line 93
    .line 94
    if-eqz v1, :cond_7

    .line 95
    .line 96
    move v1, v3

    .line 97
    goto :goto_6

    .line 98
    :cond_7
    move v1, v2

    .line 99
    :goto_6
    add-int/2addr v0, v1

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->extremePick:Z

    .line 103
    .line 104
    if-eqz v1, :cond_8

    .line 105
    .line 106
    move v1, v3

    .line 107
    goto :goto_7

    .line 108
    :cond_8
    move v1, v2

    .line 109
    :goto_7
    add-int/2addr v0, v1

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->status:Z

    .line 113
    .line 114
    if-eqz v1, :cond_9

    .line 115
    .line 116
    move v1, v3

    .line 117
    goto :goto_8

    .line 118
    :cond_9
    move v1, v2

    .line 119
    :goto_8
    add-int/2addr v0, v1

    .line 120
    mul-int/lit8 v0, v0, 0x29

    .line 121
    .line 122
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->group:Z

    .line 123
    .line 124
    if-eqz v1, :cond_a

    .line 125
    .line 126
    move v1, v3

    .line 127
    goto :goto_9

    .line 128
    :cond_a
    move v1, v2

    .line 129
    :goto_9
    add-int/2addr v0, v1

    .line 130
    mul-int/lit8 v0, v0, 0x29

    .line 131
    .line 132
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->chatPartners:Z

    .line 133
    .line 134
    if-eqz v1, :cond_b

    .line 135
    .line 136
    move v2, v3

    .line 137
    :cond_b
    add-int/2addr v0, v2

    .line 138
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 139
    .line 140
    :cond_c
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    new-instance v0, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 44
    .line 45
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/NotificationSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
