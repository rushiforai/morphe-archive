.class public Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;
.super Lcom/tantanapp/common/data/BaseData;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "migratedlgconfig"


# instance fields
.field public homepageURL:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public ignoreHw:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public migrateDlgClosable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public picUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public showDialog:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public type:Ljava/lang/String;
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
    new-instance v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/BaseData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->nullCheck()V

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

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->clone()Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->showDialog:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->showDialog:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;->clone()Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 27
    .line 28
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->migrateDlgClosable:Z

    .line 29
    .line 30
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->migrateDlgClosable:Z

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 35
    .line 36
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->ignoreHw:Z

    .line 37
    .line 38
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->ignoreHw:Z

    .line 39
    .line 40
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->clone()Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;

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
    check-cast v1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;

    .line 13
    .line 14
    if-eq p0, p1, :cond_2

    .line 15
    .line 16
    return v2

    .line 17
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->showDialog:Z

    .line 18
    .line 19
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->showDialog:Z

    .line 20
    .line 21
    if-ne p1, v3, :cond_3

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_3

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 44
    .line 45
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 46
    .line 47
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->migrateDlgClosable:Z

    .line 54
    .line 55
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->migrateDlgClosable:Z

    .line 56
    .line 57
    if-ne p1, v3, :cond_3

    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->ignoreHw:Z

    .line 70
    .line 71
    iget-boolean p1, v1, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->ignoreHw:Z

    .line 72
    .line 73
    if-ne p0, p1, :cond_3

    .line 74
    .line 75
    return v0

    .line 76
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "migratedlgconfig"

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
    if-nez v0, :cond_7

    .line 4
    .line 5
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->showDialog:Z

    .line 12
    .line 13
    const/16 v2, 0x4d5

    .line 14
    .line 15
    const/16 v3, 0x4cf

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    move v1, v3

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 26
    .line 27
    const/4 v4, 0x0

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
    move v1, v4

    .line 36
    :goto_1
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

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
    move v1, v4

    .line 49
    :goto_2
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v4

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->migrateDlgClosable:Z

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    move v1, v3

    .line 70
    goto :goto_4

    .line 71
    :cond_4
    move v1, v2

    .line 72
    :goto_4
    add-int/2addr v0, v1

    .line 73
    mul-int/lit8 v0, v0, 0x29

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz v1, :cond_5

    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    :cond_5
    add-int/2addr v0, v4

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->ignoreHw:Z

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    move v2, v3

    .line 91
    :cond_6
    add-int/2addr v0, v2

    .line 92
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 93
    .line 94
    :cond_7
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->type:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->picUrl:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;->new_()Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->texts:Lcom/p1/mobile/putong/core/data/MigrateDlgTextConfig;

    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 29
    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->homepageURL:Ljava/lang/String;

    .line 33
    .line 34
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MigrateDlgConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
