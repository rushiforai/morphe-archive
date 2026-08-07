.class public Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;
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
            "Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "diamondvipprivatematch"


# instance fields
.field public beauty:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public enthusiasm:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public habbit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public profile:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public serious:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public styleForFemale:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public styleForFemaleIdealType:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public styleForFemalePriority:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public styleForMale:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public styleForMaleIdealType:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public styleForMalePriority:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->nullCheck()V

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

    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->clone()Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/h2e;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/h2e;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    new-instance v2, Ll/i2e;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/i2e;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 35
    .line 36
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->beauty:I

    .line 37
    .line 38
    iput v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->beauty:I

    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->enthusiasm:I

    .line 41
    .line 42
    iput v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->enthusiasm:I

    .line 43
    .line 44
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->serious:I

    .line 45
    .line 46
    iput v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->serious:I

    .line 47
    .line 48
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->profile:I

    .line 49
    .line 50
    iput v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->profile:I

    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->habbit:I

    .line 53
    .line 54
    iput v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->habbit:I

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    new-instance v2, Ll/j2e;

    .line 61
    .line 62
    invoke-direct {v2}, Ll/j2e;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 70
    .line 71
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 72
    .line 73
    if-eqz v1, :cond_3

    .line 74
    .line 75
    new-instance v2, Ll/k2e;

    .line 76
    .line 77
    invoke-direct {v2}, Ll/k2e;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 85
    .line 86
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 87
    .line 88
    if-eqz v1, :cond_4

    .line 89
    .line 90
    new-instance v2, Ll/l2e;

    .line 91
    .line 92
    invoke-direct {v2}, Ll/l2e;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 100
    .line 101
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 102
    .line 103
    if-eqz p0, :cond_5

    .line 104
    .line 105
    new-instance v1, Ll/m2e;

    .line 106
    .line 107
    invoke-direct {v1}, Ll/m2e;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    iput-object p0, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 115
    .line 116
    :cond_5
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->clone()Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

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
    check-cast p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->beauty:I

    .line 34
    .line 35
    iget v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->beauty:I

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->enthusiasm:I

    .line 40
    .line 41
    iget v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->enthusiasm:I

    .line 42
    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->serious:I

    .line 46
    .line 47
    iget v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->serious:I

    .line 48
    .line 49
    if-ne v1, v3, :cond_2

    .line 50
    .line 51
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->profile:I

    .line 52
    .line 53
    iget v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->profile:I

    .line 54
    .line 55
    if-ne v1, v3, :cond_2

    .line 56
    .line 57
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->habbit:I

    .line 58
    .line 59
    iget v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->habbit:I

    .line 60
    .line 61
    if-ne v1, v3, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 96
    .line 97
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-eqz p0, :cond_2

    .line 102
    .line 103
    return v0

    .line 104
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "diamondvipprivatematch"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->beauty:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->enthusiasm:I

    .line 40
    .line 41
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x29

    .line 43
    .line 44
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->serious:I

    .line 45
    .line 46
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->profile:I

    .line 50
    .line 51
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->habbit:I

    .line 55
    .line 56
    add-int/2addr v0, v1

    .line 57
    mul-int/lit8 v0, v0, 0x29

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    goto :goto_2

    .line 68
    :cond_2
    move v1, v2

    .line 69
    :goto_2
    add-int/2addr v0, v1

    .line 70
    mul-int/lit8 v0, v0, 0x29

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 73
    .line 74
    if-eqz v1, :cond_3

    .line 75
    .line 76
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    goto :goto_3

    .line 81
    :cond_3
    move v1, v2

    .line 82
    :goto_3
    add-int/2addr v0, v1

    .line 83
    mul-int/lit8 v0, v0, 0x29

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 86
    .line 87
    if-eqz v1, :cond_4

    .line 88
    .line 89
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    goto :goto_4

    .line 94
    :cond_4
    move v1, v2

    .line 95
    :goto_4
    add-int/2addr v0, v1

    .line 96
    mul-int/lit8 v0, v0, 0x29

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 99
    .line 100
    if-eqz v1, :cond_5

    .line 101
    .line 102
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    :cond_5
    add-int/2addr v0, v2

    .line 107
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 108
    .line 109
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 44
    .line 45
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 46
    .line 47
    if-nez v0, :cond_4

    .line 48
    .line 49
    new-instance v0, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 55
    .line 56
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 57
    .line 58
    if-nez v0, :cond_5

    .line 59
    .line 60
    new-instance v0, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 66
    .line 67
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
