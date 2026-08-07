.class public final enum Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

.field public static final enum NONE:Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

.field public static final enum REUSE_AUDIO_PROCESSING:Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;->NONE:Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

    .line 13
    .line 14
    const-string v2, "REUSE_AUDIO_PROCESSING"

    .line 15
    .line 16
    const v4, 0x8000

    .line 17
    .line 18
    .line 19
    invoke-direct {v1, v2, v3, v4}, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;-><init>(Ljava/lang/String;II)V

    .line 20
    .line 21
    .line 22
    sput-object v1, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;->REUSE_AUDIO_PROCESSING:Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

    .line 23
    .line 24
    filled-new-array {v0, v1}, [Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;->$VALUES:[Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

    .line 29
    .line 30
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
    iput p3, p0, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;->values()[Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;->$VALUES:[Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;->NONE:Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const-string p0, "kEarMonitorAudioFilterNone"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "kEarMonitorAudioFilterReuseAudioProcessing"

    .line 9
    .line 10
    return-object p0
.end method

.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/EarMonitorAudioFilter;->value:I

    .line 2
    .line 3
    return p0
.end method
