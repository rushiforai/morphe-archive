.class public final enum Lcom/ss/bytertc/engine/data/AudioRoute;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/data/AudioRoute;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/data/AudioRoute;

.field public static final enum AUDIO_ROUTE_DEFAULT:Lcom/ss/bytertc/engine/data/AudioRoute;

.field public static final enum AUDIO_ROUTE_EARPIECE:Lcom/ss/bytertc/engine/data/AudioRoute;

.field public static final enum AUDIO_ROUTE_HEADSET:Lcom/ss/bytertc/engine/data/AudioRoute;

.field public static final enum AUDIO_ROUTE_HEADSET_BLUETOOTH:Lcom/ss/bytertc/engine/data/AudioRoute;

.field public static final enum AUDIO_ROUTE_HEADSET_USB:Lcom/ss/bytertc/engine/data/AudioRoute;

.field public static final enum AUDIO_ROUTE_SPEAKERPHONE:Lcom/ss/bytertc/engine/data/AudioRoute;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    const-string v3, "AUDIO_ROUTE_DEFAULT"

    .line 6
    .line 7
    invoke-direct {v0, v3, v1, v2}, Lcom/ss/bytertc/engine/data/AudioRoute;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/engine/data/AudioRoute;->AUDIO_ROUTE_DEFAULT:Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 13
    .line 14
    const-string v2, "AUDIO_ROUTE_HEADSET"

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/data/AudioRoute;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/engine/data/AudioRoute;->AUDIO_ROUTE_HEADSET:Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 21
    .line 22
    new-instance v2, Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 23
    .line 24
    const-string v3, "AUDIO_ROUTE_EARPIECE"

    .line 25
    .line 26
    const/4 v4, 0x2

    .line 27
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/data/AudioRoute;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/ss/bytertc/engine/data/AudioRoute;->AUDIO_ROUTE_EARPIECE:Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 31
    .line 32
    new-instance v3, Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 33
    .line 34
    const-string v4, "AUDIO_ROUTE_SPEAKERPHONE"

    .line 35
    .line 36
    const/4 v5, 0x3

    .line 37
    invoke-direct {v3, v4, v5, v5}, Lcom/ss/bytertc/engine/data/AudioRoute;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/ss/bytertc/engine/data/AudioRoute;->AUDIO_ROUTE_SPEAKERPHONE:Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 41
    .line 42
    new-instance v4, Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 43
    .line 44
    const-string v5, "AUDIO_ROUTE_HEADSET_BLUETOOTH"

    .line 45
    .line 46
    const/4 v6, 0x4

    .line 47
    invoke-direct {v4, v5, v6, v6}, Lcom/ss/bytertc/engine/data/AudioRoute;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v4, Lcom/ss/bytertc/engine/data/AudioRoute;->AUDIO_ROUTE_HEADSET_BLUETOOTH:Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 51
    .line 52
    new-instance v5, Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 53
    .line 54
    const-string v6, "AUDIO_ROUTE_HEADSET_USB"

    .line 55
    .line 56
    const/4 v7, 0x5

    .line 57
    invoke-direct {v5, v6, v7, v7}, Lcom/ss/bytertc/engine/data/AudioRoute;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v5, Lcom/ss/bytertc/engine/data/AudioRoute;->AUDIO_ROUTE_HEADSET_USB:Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 61
    .line 62
    filled-new-array/range {v0 .. v5}, [Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Lcom/ss/bytertc/engine/data/AudioRoute;->$VALUES:[Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 67
    .line 68
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
    iput p3, p0, Lcom/ss/bytertc/engine/data/AudioRoute;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/data/AudioRoute;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/data/AudioRoute;->values()[Lcom/ss/bytertc/engine/data/AudioRoute;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/AudioRoute;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/data/AudioRoute;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/data/AudioRoute;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioRoute;->$VALUES:[Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/data/AudioRoute;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/data/AudioRoute;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioRoute$1;->$SwitchMap$com$ss$bytertc$engine$data$AudioRoute:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const-string v0, "AUDIO_ROUTE_DEFAULT"

    .line 10
    .line 11
    packed-switch p0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    return-object v0

    .line 15
    :pswitch_0
    const-string p0, "AUDIO_ROUTE_HEADSET_BLUETOOTH"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "AUDIO_ROUTE_HEADSET_USB"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "AUDIO_ROUTE_HEADSET"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "AUDIO_ROUTE_SPEAKERPHONE"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "AUDIO_ROUTE_EARPIECE"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    return-object v0

    .line 31
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/AudioRoute;->value:I

    .line 2
    .line 3
    return p0
.end method
