.class public Lcom/p1/mobile/putong/data/LiveFansClubLevel;
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
            "Lcom/p1/mobile/putong/data/LiveFansClubLevel;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/LiveFansClubLevel;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "livefansclublevel"


# instance fields
.field public gap:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public grade:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public iconUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public memberCount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public shadingBackUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public shadingFrontUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public textColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public updatedTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public userType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public wealth:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public wealthRatio:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveFansClubLevel$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveFansClubLevel$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/LiveFansClubLevel;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->nullCheck()V

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

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->clone()Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/LiveFansClubLevel;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->grade:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->grade:J

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->memberCount:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->memberCount:J

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealth:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealth:J

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->gap:J

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->gap:J

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->updatedTime:J

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->updatedTime:J

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 41
    .line 42
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealthRatio:D

    .line 43
    .line 44
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealthRatio:D

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 51
    .line 52
    iput-object p0, v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 53
    .line 54
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->clone()Lcom/p1/mobile/putong/data/LiveFansClubLevel;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;

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
    check-cast p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->grade:J

    .line 24
    .line 25
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->grade:J

    .line 26
    .line 27
    cmp-long v1, v3, v5

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->memberCount:J

    .line 32
    .line 33
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->memberCount:J

    .line 34
    .line 35
    cmp-long v1, v3, v5

    .line 36
    .line 37
    if-nez v1, :cond_2

    .line 38
    .line 39
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealth:J

    .line 40
    .line 41
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealth:J

    .line 42
    .line 43
    cmp-long v1, v3, v5

    .line 44
    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->gap:J

    .line 48
    .line 49
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->gap:J

    .line 50
    .line 51
    cmp-long v1, v3, v5

    .line 52
    .line 53
    if-nez v1, :cond_2

    .line 54
    .line 55
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->updatedTime:J

    .line 56
    .line 57
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->updatedTime:J

    .line 58
    .line 59
    cmp-long v1, v3, v5

    .line 60
    .line 61
    if-nez v1, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealthRatio:D

    .line 94
    .line 95
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealthRatio:D

    .line 96
    .line 97
    cmpl-double v1, v3, v5

    .line 98
    .line 99
    if-nez v1, :cond_2

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-eqz p0, :cond_2

    .line 120
    .line 121
    return v0

    .line 122
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "livefansclublevel"

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
    if-nez v0, :cond_6

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->grade:J

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
    long-to-int v3, v3

    .line 29
    add-int/2addr v0, v3

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->memberCount:J

    .line 33
    .line 34
    ushr-long v5, v3, v1

    .line 35
    .line 36
    xor-long/2addr v3, v5

    .line 37
    long-to-int v3, v3

    .line 38
    add-int/2addr v0, v3

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealth:J

    .line 42
    .line 43
    ushr-long v5, v3, v1

    .line 44
    .line 45
    xor-long/2addr v3, v5

    .line 46
    long-to-int v3, v3

    .line 47
    add-int/2addr v0, v3

    .line 48
    mul-int/lit8 v0, v0, 0x29

    .line 49
    .line 50
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->gap:J

    .line 51
    .line 52
    ushr-long v5, v3, v1

    .line 53
    .line 54
    xor-long/2addr v3, v5

    .line 55
    long-to-int v3, v3

    .line 56
    add-int/2addr v0, v3

    .line 57
    mul-int/lit8 v0, v0, 0x29

    .line 58
    .line 59
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->updatedTime:J

    .line 60
    .line 61
    ushr-long v5, v3, v1

    .line 62
    .line 63
    xor-long/2addr v3, v5

    .line 64
    long-to-int v3, v3

    .line 65
    add-int/2addr v0, v3

    .line 66
    mul-int/lit8 v0, v0, 0x29

    .line 67
    .line 68
    iget-object v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v3, :cond_1

    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    move v3, v2

    .line 78
    :goto_1
    add-int/2addr v0, v3

    .line 79
    mul-int/lit8 v0, v0, 0x29

    .line 80
    .line 81
    iget-object v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v3, :cond_2

    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    goto :goto_2

    .line 90
    :cond_2
    move v3, v2

    .line 91
    :goto_2
    add-int/2addr v0, v3

    .line 92
    mul-int/lit8 v0, v0, 0x29

    .line 93
    .line 94
    iget-object v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz v3, :cond_3

    .line 97
    .line 98
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    goto :goto_3

    .line 103
    :cond_3
    move v3, v2

    .line 104
    :goto_3
    add-int/2addr v0, v3

    .line 105
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealthRatio:D

    .line 106
    .line 107
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 108
    .line 109
    .line 110
    move-result-wide v3

    .line 111
    mul-int/lit8 v0, v0, 0x29

    .line 112
    .line 113
    ushr-long v5, v3, v1

    .line 114
    .line 115
    xor-long/2addr v3, v5

    .line 116
    long-to-int v1, v3

    .line 117
    add-int/2addr v0, v1

    .line 118
    mul-int/lit8 v0, v0, 0x29

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz v1, :cond_4

    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    goto :goto_4

    .line 129
    :cond_4
    move v1, v2

    .line 130
    :goto_4
    add-int/2addr v0, v1

    .line 131
    mul-int/lit8 v0, v0, 0x29

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 134
    .line 135
    if-eqz v1, :cond_5

    .line 136
    .line 137
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    :cond_5
    add-int/2addr v0, v2

    .line 142
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 143
    .line 144
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
