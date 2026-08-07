.class public Lcom/p1/mobile/putong/core/data/CardModel;
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
            "Lcom/p1/mobile/putong/core/data/CardModel;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/CardModel;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "cardmodel"


# instance fields
.field public boostLikeYou:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public cardType:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public dynamicLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public friendSenseExamLikeCnt:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public meetAgain:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public momentLikedYou:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public newUser:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public payCardStyle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public selectionUser:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardModel$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CardModel$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/CardModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardModel$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CardModel$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/CardModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/CardModel;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardModel;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CardModel;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/CardModel;->nullCheck()V

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

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardModel;->clone()Lcom/p1/mobile/putong/core/data/CardModel;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/CardModel;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardModel;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CardModel;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BorderModel;->clone()Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 19
    .line 20
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->cardType:I

    .line 21
    .line 22
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardModel;->cardType:I

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CardExtraData;->clone()Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 33
    .line 34
    :cond_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->momentLikedYou:Z

    .line 35
    .line 36
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardModel;->momentLikedYou:Z

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->boostLikeYou:Z

    .line 39
    .line 40
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardModel;->boostLikeYou:Z

    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->newUser:Z

    .line 43
    .line 44
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardModel;->newUser:Z

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 49
    .line 50
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->meetAgain:Z

    .line 51
    .line 52
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardModel;->meetAgain:Z

    .line 53
    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->friendSenseExamLikeCnt:I

    .line 55
    .line 56
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardModel;->friendSenseExamLikeCnt:I

    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->selectionUser:Z

    .line 59
    .line 60
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardModel;->selectionUser:Z

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 63
    .line 64
    if-eqz p0, :cond_2

    .line 65
    .line 66
    new-instance v1, Ll/am4;

    .line 67
    .line 68
    invoke-direct {v1}, Ll/am4;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 76
    .line 77
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

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardModel;->clone()Lcom/p1/mobile/putong/core/data/CardModel;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/CardModel;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardModel;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->cardType:I

    .line 34
    .line 35
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CardModel;->cardType:I

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->momentLikedYou:Z

    .line 50
    .line 51
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CardModel;->momentLikedYou:Z

    .line 52
    .line 53
    if-ne v1, v3, :cond_2

    .line 54
    .line 55
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->boostLikeYou:Z

    .line 56
    .line 57
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CardModel;->boostLikeYou:Z

    .line 58
    .line 59
    if-ne v1, v3, :cond_2

    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->newUser:Z

    .line 62
    .line 63
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CardModel;->newUser:Z

    .line 64
    .line 65
    if-ne v1, v3, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->meetAgain:Z

    .line 78
    .line 79
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CardModel;->meetAgain:Z

    .line 80
    .line 81
    if-ne v1, v3, :cond_2

    .line 82
    .line 83
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->friendSenseExamLikeCnt:I

    .line 84
    .line 85
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CardModel;->friendSenseExamLikeCnt:I

    .line 86
    .line 87
    if-ne v1, v3, :cond_2

    .line 88
    .line 89
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->selectionUser:Z

    .line 90
    .line 91
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CardModel;->selectionUser:Z

    .line 92
    .line 93
    if-ne v1, v3, :cond_2

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 98
    .line 99
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-eqz p0, :cond_2

    .line 104
    .line 105
    return v0

    .line 106
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "cardmodel"

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
    if-nez v0, :cond_a

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BorderModel;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->cardType:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CardExtraData;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->momentLikedYou:Z

    .line 53
    .line 54
    const/16 v3, 0x4d5

    .line 55
    .line 56
    const/16 v4, 0x4cf

    .line 57
    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    move v1, v4

    .line 61
    goto :goto_3

    .line 62
    :cond_3
    move v1, v3

    .line 63
    :goto_3
    add-int/2addr v0, v1

    .line 64
    mul-int/lit8 v0, v0, 0x29

    .line 65
    .line 66
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->boostLikeYou:Z

    .line 67
    .line 68
    if-eqz v1, :cond_4

    .line 69
    .line 70
    move v1, v4

    .line 71
    goto :goto_4

    .line 72
    :cond_4
    move v1, v3

    .line 73
    :goto_4
    add-int/2addr v0, v1

    .line 74
    mul-int/lit8 v0, v0, 0x29

    .line 75
    .line 76
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->newUser:Z

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    move v1, v4

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v3

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    goto :goto_6

    .line 95
    :cond_6
    move v1, v2

    .line 96
    :goto_6
    add-int/2addr v0, v1

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->meetAgain:Z

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    move v1, v4

    .line 104
    goto :goto_7

    .line 105
    :cond_7
    move v1, v3

    .line 106
    :goto_7
    add-int/2addr v0, v1

    .line 107
    mul-int/lit8 v0, v0, 0x29

    .line 108
    .line 109
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->friendSenseExamLikeCnt:I

    .line 110
    .line 111
    add-int/2addr v0, v1

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->selectionUser:Z

    .line 115
    .line 116
    if-eqz v1, :cond_8

    .line 117
    .line 118
    move v3, v4

    .line 119
    :cond_8
    add-int/2addr v0, v3

    .line 120
    mul-int/lit8 v0, v0, 0x29

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 123
    .line 124
    if-eqz v1, :cond_9

    .line 125
    .line 126
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    :cond_9
    add-int/2addr v0, v2

    .line 131
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 132
    .line 133
    :cond_a
    return v0
.end method

.method public isRecommendMomentCard()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->cardType:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BorderModel;->new_()Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardExtraData;->new_()Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 34
    .line 35
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 36
    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 45
    .line 46
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
