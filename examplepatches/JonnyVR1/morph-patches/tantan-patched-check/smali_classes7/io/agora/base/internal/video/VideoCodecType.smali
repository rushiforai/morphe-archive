.class final enum Lio/agora/base/internal/video/VideoCodecType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/base/internal/video/VideoCodecType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/base/internal/video/VideoCodecType;

.field public static final enum H264:Lio/agora/base/internal/video/VideoCodecType;

.field public static final enum H265:Lio/agora/base/internal/video/VideoCodecType;

.field public static final enum UNKNOWN:Lio/agora/base/internal/video/VideoCodecType;

.field public static final enum VP8:Lio/agora/base/internal/video/VideoCodecType;

.field public static final enum VP9:Lio/agora/base/internal/video/VideoCodecType;

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
.field private final mimeType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lio/agora/base/internal/video/VideoCodecType;

    .line 2
    .line 3
    const-string v1, "video/x-vnd.on2.vp8"

    .line 4
    .line 5
    const-string v2, "VP8"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-direct {v0, v2, v3, v1}, Lio/agora/base/internal/video/VideoCodecType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lio/agora/base/internal/video/VideoCodecType;->VP8:Lio/agora/base/internal/video/VideoCodecType;

    .line 12
    .line 13
    new-instance v1, Lio/agora/base/internal/video/VideoCodecType;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v4, "video/x-vnd.on2.vp9"

    .line 17
    .line 18
    const-string v5, "VP9"

    .line 19
    .line 20
    invoke-direct {v1, v5, v2, v4}, Lio/agora/base/internal/video/VideoCodecType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lio/agora/base/internal/video/VideoCodecType;->VP9:Lio/agora/base/internal/video/VideoCodecType;

    .line 24
    .line 25
    new-instance v2, Lio/agora/base/internal/video/VideoCodecType;

    .line 26
    .line 27
    const/4 v4, 0x2

    .line 28
    const-string v5, "video/avc"

    .line 29
    .line 30
    const-string v6, "H264"

    .line 31
    .line 32
    invoke-direct {v2, v6, v4, v5}, Lio/agora/base/internal/video/VideoCodecType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lio/agora/base/internal/video/VideoCodecType;->H264:Lio/agora/base/internal/video/VideoCodecType;

    .line 36
    .line 37
    new-instance v4, Lio/agora/base/internal/video/VideoCodecType;

    .line 38
    .line 39
    const/4 v5, 0x3

    .line 40
    const-string v6, "video/hevc"

    .line 41
    .line 42
    const-string v7, "H265"

    .line 43
    .line 44
    invoke-direct {v4, v7, v5, v6}, Lio/agora/base/internal/video/VideoCodecType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v4, Lio/agora/base/internal/video/VideoCodecType;->H265:Lio/agora/base/internal/video/VideoCodecType;

    .line 48
    .line 49
    new-instance v5, Lio/agora/base/internal/video/VideoCodecType;

    .line 50
    .line 51
    const/4 v6, 0x4

    .line 52
    const-string v7, "video/unknown"

    .line 53
    .line 54
    const-string v8, "UNKNOWN"

    .line 55
    .line 56
    invoke-direct {v5, v8, v6, v7}, Lio/agora/base/internal/video/VideoCodecType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lio/agora/base/internal/video/VideoCodecType;->UNKNOWN:Lio/agora/base/internal/video/VideoCodecType;

    .line 60
    .line 61
    filled-new-array {v0, v1, v2, v4, v5}, [Lio/agora/base/internal/video/VideoCodecType;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lio/agora/base/internal/video/VideoCodecType;->$VALUES:[Lio/agora/base/internal/video/VideoCodecType;

    .line 66
    .line 67
    new-instance v0, Ljava/util/HashSet;

    .line 68
    .line 69
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 70
    .line 71
    .line 72
    sput-object v0, Lio/agora/base/internal/video/VideoCodecType;->_values:Ljava/util/Set;

    .line 73
    .line 74
    invoke-static {}, Lio/agora/base/internal/video/VideoCodecType;->values()[Lio/agora/base/internal/video/VideoCodecType;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    array-length v1, v0

    .line 79
    :goto_0
    if-ge v3, v1, :cond_0

    .line 80
    .line 81
    aget-object v2, v0, v3

    .line 82
    .line 83
    sget-object v4, Lio/agora/base/internal/video/VideoCodecType;->_values:Ljava/util/Set;

    .line 84
    .line 85
    invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    add-int/lit8 v3, v3, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
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
    iput-object p3, p0, Lio/agora/base/internal/video/VideoCodecType;->mimeType:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static contains(Ljava/lang/String;)Z
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/video/VideoCodecType;->_values:Ljava/util/Set;

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

.method public static valueOf(Ljava/lang/String;)Lio/agora/base/internal/video/VideoCodecType;
    .locals 1

    .line 1
    const-class v0, Lio/agora/base/internal/video/VideoCodecType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lio/agora/base/internal/video/VideoCodecType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lio/agora/base/internal/video/VideoCodecType;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/video/VideoCodecType;->$VALUES:[Lio/agora/base/internal/video/VideoCodecType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lio/agora/base/internal/video/VideoCodecType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lio/agora/base/internal/video/VideoCodecType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public mimeType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoCodecType;->mimeType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
