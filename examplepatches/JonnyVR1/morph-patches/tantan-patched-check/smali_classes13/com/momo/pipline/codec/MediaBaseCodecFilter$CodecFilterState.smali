.class public final enum Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/pipline/codec/MediaBaseCodecFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CodecFilterState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

.field public static final enum FILTER_ERROR:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

.field public static final enum FILTER_IDLE:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

.field public static final enum FILTER_PLAY:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

.field public static final enum FILTER_RECONNECTTING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

.field public static final enum FILTER_STARTING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

.field public static final enum FILTER_STOPPING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;


# direct methods
.method private static synthetic $values()[Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;
    .locals 6

    .line 1
    sget-object v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_IDLE:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 2
    .line 3
    sget-object v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_STARTING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 4
    .line 5
    sget-object v2, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_PLAY:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 6
    .line 7
    sget-object v3, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_STOPPING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 8
    .line 9
    sget-object v4, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_ERROR:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 10
    .line 11
    sget-object v5, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_RECONNECTTING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 2
    .line 3
    const-string v1, "FILTER_IDLE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_IDLE:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 12
    .line 13
    const-string v1, "FILTER_STARTING"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_STARTING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 20
    .line 21
    new-instance v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 22
    .line 23
    const-string v1, "FILTER_PLAY"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_PLAY:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 30
    .line 31
    new-instance v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 32
    .line 33
    const-string v1, "FILTER_STOPPING"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_STOPPING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 40
    .line 41
    new-instance v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 42
    .line 43
    const-string v1, "FILTER_ERROR"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_ERROR:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 50
    .line 51
    new-instance v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 52
    .line 53
    const-string v1, "FILTER_RECONNECTTING"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_RECONNECTTING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 60
    .line 61
    invoke-static {}, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->$values()[Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->$VALUES:[Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 66
    .line 67
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->$VALUES:[Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 8
    .line 9
    return-object v0
.end method
