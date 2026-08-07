.class public final enum Lcom/ss/bytertc/engine/video/FrameRate;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/video/FrameRate;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/video/FrameRate;

.field public static final enum FRAME_RATE_FPS_1:Lcom/ss/bytertc/engine/video/FrameRate;

.field public static final enum FRAME_RATE_FPS_10:Lcom/ss/bytertc/engine/video/FrameRate;

.field public static final enum FRAME_RATE_FPS_15:Lcom/ss/bytertc/engine/video/FrameRate;

.field public static final enum FRAME_RATE_FPS_24:Lcom/ss/bytertc/engine/video/FrameRate;

.field public static final enum FRAME_RATE_FPS_30:Lcom/ss/bytertc/engine/video/FrameRate;

.field public static final enum FRAME_RATE_FPS_7:Lcom/ss/bytertc/engine/video/FrameRate;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/video/FrameRate;

    .line 2
    .line 3
    const-string v1, "FRAME_RATE_FPS_1"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/video/FrameRate;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/engine/video/FrameRate;->FRAME_RATE_FPS_1:Lcom/ss/bytertc/engine/video/FrameRate;

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/engine/video/FrameRate;

    .line 13
    .line 14
    const-string v2, "FRAME_RATE_FPS_7"

    .line 15
    .line 16
    const/4 v4, 0x7

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/ss/bytertc/engine/video/FrameRate;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/engine/video/FrameRate;->FRAME_RATE_FPS_7:Lcom/ss/bytertc/engine/video/FrameRate;

    .line 21
    .line 22
    new-instance v2, Lcom/ss/bytertc/engine/video/FrameRate;

    .line 23
    .line 24
    const/4 v3, 0x2

    .line 25
    const/16 v4, 0xa

    .line 26
    .line 27
    const-string v5, "FRAME_RATE_FPS_10"

    .line 28
    .line 29
    invoke-direct {v2, v5, v3, v4}, Lcom/ss/bytertc/engine/video/FrameRate;-><init>(Ljava/lang/String;II)V

    .line 30
    .line 31
    .line 32
    sput-object v2, Lcom/ss/bytertc/engine/video/FrameRate;->FRAME_RATE_FPS_10:Lcom/ss/bytertc/engine/video/FrameRate;

    .line 33
    .line 34
    new-instance v3, Lcom/ss/bytertc/engine/video/FrameRate;

    .line 35
    .line 36
    const/4 v4, 0x3

    .line 37
    const/16 v5, 0xf

    .line 38
    .line 39
    const-string v6, "FRAME_RATE_FPS_15"

    .line 40
    .line 41
    invoke-direct {v3, v6, v4, v5}, Lcom/ss/bytertc/engine/video/FrameRate;-><init>(Ljava/lang/String;II)V

    .line 42
    .line 43
    .line 44
    sput-object v3, Lcom/ss/bytertc/engine/video/FrameRate;->FRAME_RATE_FPS_15:Lcom/ss/bytertc/engine/video/FrameRate;

    .line 45
    .line 46
    new-instance v4, Lcom/ss/bytertc/engine/video/FrameRate;

    .line 47
    .line 48
    const/4 v5, 0x4

    .line 49
    const/16 v6, 0x18

    .line 50
    .line 51
    const-string v7, "FRAME_RATE_FPS_24"

    .line 52
    .line 53
    invoke-direct {v4, v7, v5, v6}, Lcom/ss/bytertc/engine/video/FrameRate;-><init>(Ljava/lang/String;II)V

    .line 54
    .line 55
    .line 56
    sput-object v4, Lcom/ss/bytertc/engine/video/FrameRate;->FRAME_RATE_FPS_24:Lcom/ss/bytertc/engine/video/FrameRate;

    .line 57
    .line 58
    new-instance v5, Lcom/ss/bytertc/engine/video/FrameRate;

    .line 59
    .line 60
    const/4 v6, 0x5

    .line 61
    const/16 v7, 0x1e

    .line 62
    .line 63
    const-string v8, "FRAME_RATE_FPS_30"

    .line 64
    .line 65
    invoke-direct {v5, v8, v6, v7}, Lcom/ss/bytertc/engine/video/FrameRate;-><init>(Ljava/lang/String;II)V

    .line 66
    .line 67
    .line 68
    sput-object v5, Lcom/ss/bytertc/engine/video/FrameRate;->FRAME_RATE_FPS_30:Lcom/ss/bytertc/engine/video/FrameRate;

    .line 69
    .line 70
    filled-new-array/range {v0 .. v5}, [Lcom/ss/bytertc/engine/video/FrameRate;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sput-object v0, Lcom/ss/bytertc/engine/video/FrameRate;->$VALUES:[Lcom/ss/bytertc/engine/video/FrameRate;

    .line 75
    .line 76
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
    iput p3, p0, Lcom/ss/bytertc/engine/video/FrameRate;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/video/FrameRate;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/video/FrameRate;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/video/FrameRate;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/video/FrameRate;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/video/FrameRate;->$VALUES:[Lcom/ss/bytertc/engine/video/FrameRate;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/video/FrameRate;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/video/FrameRate;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/FrameRate;->value:I

    .line 2
    .line 3
    return p0
.end method
