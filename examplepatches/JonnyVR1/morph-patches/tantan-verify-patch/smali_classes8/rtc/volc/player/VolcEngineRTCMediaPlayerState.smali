.class public final enum Lrtc/volc/player/VolcEngineRTCMediaPlayerState;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lrtc/volc/player/VolcEngineRTCMediaPlayerState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

.field public static final enum ERROR:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

.field public static final enum OPEN_COMPLETED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

.field public static final enum PAUSED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

.field public static final enum PLAYING:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

.field public static final enum PLAY_COMPLETED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

.field public static final enum PLAY_FAILED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

.field public static final enum STOPPED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lrtc/volc/player/VolcEngineRTCMediaPlayerState;
    .locals 7

    .line 1
    sget-object v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->STOPPED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 2
    .line 3
    sget-object v1, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->PLAYING:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 4
    .line 5
    sget-object v2, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->PAUSED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 6
    .line 7
    sget-object v3, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->ERROR:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 8
    .line 9
    sget-object v4, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->PLAY_COMPLETED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 10
    .line 11
    sget-object v5, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->OPEN_COMPLETED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 12
    .line 13
    sget-object v6, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->PLAY_FAILED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 2
    .line 3
    const-string v1, "STOPPED"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->STOPPED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 10
    .line 11
    new-instance v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 12
    .line 13
    const-string v1, "PLAYING"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->PLAYING:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 20
    .line 21
    new-instance v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 22
    .line 23
    const-string v1, "PAUSED"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->PAUSED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 30
    .line 31
    new-instance v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 32
    .line 33
    const-string v1, "ERROR"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2, v2}, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->ERROR:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 40
    .line 41
    new-instance v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 42
    .line 43
    const-string v1, "PLAY_COMPLETED"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2, v2}, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->PLAY_COMPLETED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 50
    .line 51
    new-instance v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 52
    .line 53
    const-string v1, "OPEN_COMPLETED"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2, v2}, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->OPEN_COMPLETED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 60
    .line 61
    new-instance v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 62
    .line 63
    const-string v1, "PLAY_FAILED"

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-direct {v0, v1, v2, v2}, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->PLAY_FAILED:Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 70
    .line 71
    invoke-static {}, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->$values()[Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->$VALUES:[Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 76
    .line 77
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lrtc/volc/player/VolcEngineRTCMediaPlayerState;
    .locals 5

    .line 1
    invoke-static {}, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->values()[Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->value()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lrtc/volc/player/VolcEngineRTCMediaPlayerState;
    .locals 1

    .line 1
    const-class v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lrtc/volc/player/VolcEngineRTCMediaPlayerState;
    .locals 1

    .line 1
    sget-object v0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->$VALUES:[Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lrtc/volc/player/VolcEngineRTCMediaPlayerState;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lrtc/volc/player/VolcEngineRTCMediaPlayerState;->value:I

    .line 2
    .line 3
    return p0
.end method
