.class public Lcom/p1/mobile/putong/core/data/MemberZoneFilter;
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
            "Lcom/p1/mobile/putong/core/data/MemberZoneFilter;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MemberZoneFilter;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "memberzonefilter"


# instance fields
.field public certification:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public matched:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public max_age:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public min_age:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public nearby:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public online:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public popular:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public radius:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public realFace:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public richMedia:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/MemberZoneFilter;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->nullCheck()V

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

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->clone()Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MemberZoneFilter;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->realFace:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->realFace:Z

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->online:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->online:Z

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->popular:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->popular:Z

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->certification:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->certification:Z

    .line 33
    .line 34
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->nearby:Z

    .line 35
    .line 36
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->nearby:Z

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->richMedia:Z

    .line 39
    .line 40
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->richMedia:Z

    .line 41
    .line 42
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->matched:Z

    .line 43
    .line 44
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->matched:Z

    .line 45
    .line 46
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->clone()Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->realFace:Z

    .line 32
    .line 33
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->realFace:Z

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->online:Z

    .line 38
    .line 39
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->online:Z

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->popular:Z

    .line 44
    .line 45
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->popular:Z

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->certification:Z

    .line 50
    .line 51
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->certification:Z

    .line 52
    .line 53
    if-ne v1, v3, :cond_2

    .line 54
    .line 55
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->nearby:Z

    .line 56
    .line 57
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->nearby:Z

    .line 58
    .line 59
    if-ne v1, v3, :cond_2

    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->richMedia:Z

    .line 62
    .line 63
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->richMedia:Z

    .line 64
    .line 65
    if-ne v1, v3, :cond_2

    .line 66
    .line 67
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->matched:Z

    .line 68
    .line 69
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->matched:Z

    .line 70
    .line 71
    if-ne p0, p1, :cond_2

    .line 72
    .line 73
    return v0

    .line 74
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "memberzonefilter"

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
    if-nez v0, :cond_7

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->realFace:Z

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->online:Z

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    move v1, v3

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    move v1, v2

    .line 43
    :goto_1
    add-int/2addr v0, v1

    .line 44
    mul-int/lit8 v0, v0, 0x29

    .line 45
    .line 46
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->popular:Z

    .line 47
    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    move v1, v3

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    move v1, v2

    .line 53
    :goto_2
    add-int/2addr v0, v1

    .line 54
    mul-int/lit8 v0, v0, 0x29

    .line 55
    .line 56
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->certification:Z

    .line 57
    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    move v1, v3

    .line 61
    goto :goto_3

    .line 62
    :cond_3
    move v1, v2

    .line 63
    :goto_3
    add-int/2addr v0, v1

    .line 64
    mul-int/lit8 v0, v0, 0x29

    .line 65
    .line 66
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->nearby:Z

    .line 67
    .line 68
    if-eqz v1, :cond_4

    .line 69
    .line 70
    move v1, v3

    .line 71
    goto :goto_4

    .line 72
    :cond_4
    move v1, v2

    .line 73
    :goto_4
    add-int/2addr v0, v1

    .line 74
    mul-int/lit8 v0, v0, 0x29

    .line 75
    .line 76
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->richMedia:Z

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    move v1, v3

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v2

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->matched:Z

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
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
