.class final enum Lio/agora/base/internal/video/VideoCodecProfile;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/base/internal/video/VideoCodecProfile;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/base/internal/video/VideoCodecProfile;

.field public static final enum HEVCMain10:Lio/agora/base/internal/video/VideoCodecProfile;

.field public static final enum HEVCMain10HDR10:Lio/agora/base/internal/video/VideoCodecProfile;

.field public static final enum HEVCMain10HDR10Plus:Lio/agora/base/internal/video/VideoCodecProfile;

.field public static final enum UNKNOWN:Lio/agora/base/internal/video/VideoCodecProfile;

.field private static _values:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final profile:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lio/agora/base/internal/video/VideoCodecProfile;

    .line 2
    .line 3
    const-string v1, "profile/2"

    .line 4
    .line 5
    const-string v2, "HEVCMain10"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-direct {v0, v2, v3, v1}, Lio/agora/base/internal/video/VideoCodecProfile;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lio/agora/base/internal/video/VideoCodecProfile;->HEVCMain10:Lio/agora/base/internal/video/VideoCodecProfile;

    .line 12
    .line 13
    new-instance v1, Lio/agora/base/internal/video/VideoCodecProfile;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v4, "profile/4096"

    .line 17
    .line 18
    const-string v5, "HEVCMain10HDR10"

    .line 19
    .line 20
    invoke-direct {v1, v5, v2, v4}, Lio/agora/base/internal/video/VideoCodecProfile;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lio/agora/base/internal/video/VideoCodecProfile;->HEVCMain10HDR10:Lio/agora/base/internal/video/VideoCodecProfile;

    .line 24
    .line 25
    new-instance v2, Lio/agora/base/internal/video/VideoCodecProfile;

    .line 26
    .line 27
    const/4 v4, 0x2

    .line 28
    const-string v5, "profile/8192"

    .line 29
    .line 30
    const-string v6, "HEVCMain10HDR10Plus"

    .line 31
    .line 32
    invoke-direct {v2, v6, v4, v5}, Lio/agora/base/internal/video/VideoCodecProfile;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lio/agora/base/internal/video/VideoCodecProfile;->HEVCMain10HDR10Plus:Lio/agora/base/internal/video/VideoCodecProfile;

    .line 36
    .line 37
    new-instance v4, Lio/agora/base/internal/video/VideoCodecProfile;

    .line 38
    .line 39
    const/4 v5, 0x3

    .line 40
    const-string v6, "profile/0"

    .line 41
    .line 42
    const-string v7, "UNKNOWN"

    .line 43
    .line 44
    invoke-direct {v4, v7, v5, v6}, Lio/agora/base/internal/video/VideoCodecProfile;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v4, Lio/agora/base/internal/video/VideoCodecProfile;->UNKNOWN:Lio/agora/base/internal/video/VideoCodecProfile;

    .line 48
    .line 49
    filled-new-array {v0, v1, v2, v4}, [Lio/agora/base/internal/video/VideoCodecProfile;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lio/agora/base/internal/video/VideoCodecProfile;->$VALUES:[Lio/agora/base/internal/video/VideoCodecProfile;

    .line 54
    .line 55
    new-instance v0, Ljava/util/HashSet;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lio/agora/base/internal/video/VideoCodecProfile;->_values:Ljava/util/Set;

    .line 61
    .line 62
    invoke-static {}, Lio/agora/base/internal/video/VideoCodecProfile;->values()[Lio/agora/base/internal/video/VideoCodecProfile;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    array-length v1, v0

    .line 67
    :goto_0
    if-ge v3, v1, :cond_0

    .line 68
    .line 69
    aget-object v2, v0, v3

    .line 70
    .line 71
    sget-object v4, Lio/agora/base/internal/video/VideoCodecProfile;->_values:Ljava/util/Set;

    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    add-int/lit8 v3, v3, 0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lio/agora/base/internal/video/VideoCodecProfile;->profile:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static contains(Ljava/lang/String;)Z
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/video/VideoCodecProfile;->_values:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/base/internal/video/VideoCodecProfile;
    .locals 1

    .line 1
    const-class v0, Lio/agora/base/internal/video/VideoCodecProfile;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lio/agora/base/internal/video/VideoCodecProfile;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lio/agora/base/internal/video/VideoCodecProfile;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/video/VideoCodecProfile;->$VALUES:[Lio/agora/base/internal/video/VideoCodecProfile;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lio/agora/base/internal/video/VideoCodecProfile;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lio/agora/base/internal/video/VideoCodecProfile;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public profile()I
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/VideoCodecProfile;->profile:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    if-le v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lio/agora/base/internal/video/VideoCodecProfile;->profile:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method
