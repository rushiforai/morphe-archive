.class public final enum Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/SimulcastConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "StreamLayerIndex"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

.field public static final enum STREAM_LAYER_1:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

.field public static final enum STREAM_LAYER_2:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

.field public static final enum STREAM_LAYER_3:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

.field public static final enum STREAM_LAYER_4:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

.field public static final enum STREAM_LAYER_5:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

.field public static final enum STREAM_LAYER_6:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

.field public static final enum STREAM_LAYER_COUNT_MAX:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

.field public static final enum STREAM_LOW:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    new-instance v0, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    const-string v1, "STREAM_LAYER_1"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->STREAM_LAYER_1:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    new-instance v1, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    const-string v2, "STREAM_LAYER_2"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->STREAM_LAYER_2:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    new-instance v2, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    const-string v3, "STREAM_LAYER_3"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->STREAM_LAYER_3:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    new-instance v3, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    const-string v4, "STREAM_LAYER_4"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->STREAM_LAYER_4:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    new-instance v4, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    const-string v5, "STREAM_LAYER_5"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v6}, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->STREAM_LAYER_5:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    new-instance v5, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    const-string v6, "STREAM_LAYER_6"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7, v7}, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->STREAM_LAYER_6:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    new-instance v6, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    const-string v7, "STREAM_LOW"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8, v8}, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->STREAM_LOW:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    new-instance v7, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    const-string v8, "STREAM_LAYER_COUNT_MAX"

    const/4 v9, 0x7

    invoke-direct {v7, v8, v9, v9}, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->STREAM_LAYER_COUNT_MAX:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    filled-new-array/range {v0 .. v7}, [Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->$VALUES:[Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;
    .locals 1

    const-class v0, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;
    .locals 1

    sget-object v0, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->$VALUES:[Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    invoke-virtual {v0}, [Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->value:I

    return p0
.end method
