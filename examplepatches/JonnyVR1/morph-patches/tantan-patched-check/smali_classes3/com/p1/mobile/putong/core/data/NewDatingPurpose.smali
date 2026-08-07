.class public Lcom/p1/mobile/putong/core/data/NewDatingPurpose;
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
            "Lcom/p1/mobile/putong/core/data/NewDatingPurpose;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/NewDatingPurpose;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "newdatingpurpose"


# instance fields
.field public idealType:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public information:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public introduction:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public livingHabit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public myAssets:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public others:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public picture:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public pictureExtendedText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public question:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public socialPersonalityTest:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/NewDatingPurpose;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->nullCheck()V

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

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->clone()Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/NewDatingPurpose;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/ou20;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/ou20;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->introduction:I

    .line 22
    .line 23
    iput v1, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->introduction:I

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->question:I

    .line 26
    .line 27
    iput v1, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->question:I

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->socialPersonalityTest:I

    .line 30
    .line 31
    iput v1, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->socialPersonalityTest:I

    .line 32
    .line 33
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->information:I

    .line 34
    .line 35
    iput v1, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->information:I

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

    .line 38
    .line 39
    iput v1, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->myAssets:I

    .line 42
    .line 43
    iput v1, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->myAssets:I

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->idealType:I

    .line 46
    .line 47
    iput v1, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->idealType:I

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->others:I

    .line 50
    .line 51
    iput v1, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->others:I

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 54
    .line 55
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 56
    .line 57
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->clone()Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->introduction:I

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->introduction:I

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->question:I

    .line 30
    .line 31
    iget v3, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->question:I

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->socialPersonalityTest:I

    .line 36
    .line 37
    iget v3, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->socialPersonalityTest:I

    .line 38
    .line 39
    if-ne v1, v3, :cond_2

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->information:I

    .line 42
    .line 43
    iget v3, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->information:I

    .line 44
    .line 45
    if-ne v1, v3, :cond_2

    .line 46
    .line 47
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

    .line 48
    .line 49
    iget v3, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

    .line 50
    .line 51
    if-ne v1, v3, :cond_2

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->myAssets:I

    .line 54
    .line 55
    iget v3, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->myAssets:I

    .line 56
    .line 57
    if-ne v1, v3, :cond_2

    .line 58
    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->idealType:I

    .line 60
    .line 61
    iget v3, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->idealType:I

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->others:I

    .line 66
    .line 67
    iget v3, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->others:I

    .line 68
    .line 69
    if-ne v1, v3, :cond_2

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_2

    .line 80
    .line 81
    return v0

    .line 82
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "newdatingpurpose"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->introduction:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->question:I

    .line 27
    .line 28
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->socialPersonalityTest:I

    .line 32
    .line 33
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->information:I

    .line 37
    .line 38
    add-int/2addr v0, v1

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

    .line 42
    .line 43
    add-int/2addr v0, v1

    .line 44
    mul-int/lit8 v0, v0, 0x29

    .line 45
    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->myAssets:I

    .line 47
    .line 48
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->idealType:I

    .line 52
    .line 53
    add-int/2addr v0, v1

    .line 54
    mul-int/lit8 v0, v0, 0x29

    .line 55
    .line 56
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->others:I

    .line 57
    .line 58
    add-int/2addr v0, v1

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    :cond_1
    add-int/2addr v0, v2

    .line 70
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 71
    .line 72
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string v0, ""

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
