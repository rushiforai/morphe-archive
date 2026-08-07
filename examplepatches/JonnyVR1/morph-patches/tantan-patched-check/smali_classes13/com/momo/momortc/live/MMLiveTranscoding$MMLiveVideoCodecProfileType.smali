.class public final enum Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/momortc/live/MMLiveTranscoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MMLiveVideoCodecProfileType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

.field public static final enum MMLiveVideoCodecProfileTypeBaseLine:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

.field public static final enum MMLiveVideoCodecProfileTypeHigh:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

.field public static final enum MMLiveVideoCodecProfileTypeMain:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0x42

    .line 5
    .line 6
    const-string v3, "MMLiveVideoCodecProfileTypeBaseLine"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;-><init>(Ljava/lang/String;II)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;->MMLiveVideoCodecProfileTypeBaseLine:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 12
    .line 13
    new-instance v1, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const/16 v3, 0x4d

    .line 17
    .line 18
    const-string v4, "MMLiveVideoCodecProfileTypeMain"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;-><init>(Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;->MMLiveVideoCodecProfileTypeMain:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 24
    .line 25
    new-instance v2, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const/16 v4, 0x64

    .line 29
    .line 30
    const-string v5, "MMLiveVideoCodecProfileTypeHigh"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;-><init>(Ljava/lang/String;II)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;->MMLiveVideoCodecProfileTypeHigh:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 36
    .line 37
    filled-new-array {v0, v1, v2}, [Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;->$VALUES:[Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 42
    .line 43
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
    iput p3, p0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;->$VALUES:[Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;->value:I

    .line 2
    .line 3
    return p0
.end method
