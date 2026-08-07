.class public Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;
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
            "Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "ttcmigrateguideconfig"


# instance fields
.field public dlgType:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public frequency:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public homepageURL:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public ignoreHw:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public migrateDlgClosable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public skipTime:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->nullCheck()V

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

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->clone()Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->frequency:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->frequency:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->dlgType:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->dlgType:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->skipTime:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->skipTime:I

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->migrateDlgClosable:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->migrateDlgClosable:Z

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->homepageURL:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->homepageURL:Ljava/lang/String;

    .line 25
    .line 26
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->ignoreHw:Z

    .line 27
    .line 28
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->ignoreHw:Z

    .line 29
    .line 30
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->clone()Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->frequency:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->frequency:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->dlgType:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->dlgType:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->skipTime:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->skipTime:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->migrateDlgClosable:Z

    .line 32
    .line 33
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->migrateDlgClosable:Z

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->homepageURL:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->homepageURL:Ljava/lang/String;

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
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->ignoreHw:Z

    .line 48
    .line 49
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->ignoreHw:Z

    .line 50
    .line 51
    if-ne p0, p1, :cond_2

    .line 52
    .line 53
    return v0

    .line 54
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "ttcmigrateguideconfig"

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
    if-nez v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->frequency:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->dlgType:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->skipTime:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->migrateDlgClosable:Z

    .line 23
    .line 24
    const/16 v2, 0x4d5

    .line 25
    .line 26
    const/16 v3, 0x4cf

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    move v1, v3

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v1, v2

    .line 33
    :goto_0
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->homepageURL:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    const/4 v1, 0x0

    .line 46
    :goto_1
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->ignoreHw:Z

    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    move v2, v3

    .line 54
    :cond_2
    add-int/2addr v0, v2

    .line 55
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 56
    .line 57
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->homepageURL:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->homepageURL:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
