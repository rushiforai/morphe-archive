.class public final enum Lcom/momo/xengine/media/types/AudioChannelLayout;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/xengine/media/types/AudioChannelLayout;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/xengine/media/types/AudioChannelLayout;

.field public static final enum CHANNELS_2POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

.field public static final enum CHANNELS_4POINT0:Lcom/momo/xengine/media/types/AudioChannelLayout;

.field public static final enum CHANNELS_4POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

.field public static final enum CHANNELS_5POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

.field public static final enum CHANNELS_7POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

.field public static final enum CHANNELS_MONO:Lcom/momo/xengine/media/types/AudioChannelLayout;

.field public static final enum CHANNELS_STEREO:Lcom/momo/xengine/media/types/AudioChannelLayout;

.field public static final enum CHANNELS_UNKNOWN:Lcom/momo/xengine/media/types/AudioChannelLayout;


# instance fields
.field private final channelNum:I

.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    new-instance v0, Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 2
    .line 3
    const-string v1, "CHANNELS_UNKNOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2, v2}, Lcom/momo/xengine/media/types/AudioChannelLayout;-><init>(Ljava/lang/String;III)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_UNKNOWN:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 12
    .line 13
    const-string v2, "CHANNELS_MONO"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3, v3}, Lcom/momo/xengine/media/types/AudioChannelLayout;-><init>(Ljava/lang/String;III)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_MONO:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 20
    .line 21
    new-instance v2, Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 22
    .line 23
    const-string v3, "CHANNELS_STEREO"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4, v4}, Lcom/momo/xengine/media/types/AudioChannelLayout;-><init>(Ljava/lang/String;III)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_STEREO:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 30
    .line 31
    new-instance v3, Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 32
    .line 33
    const-string v4, "CHANNELS_2POINT1"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5, v5}, Lcom/momo/xengine/media/types/AudioChannelLayout;-><init>(Ljava/lang/String;III)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_2POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 40
    .line 41
    new-instance v4, Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 42
    .line 43
    const-string v5, "CHANNELS_4POINT0"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6, v6}, Lcom/momo/xengine/media/types/AudioChannelLayout;-><init>(Ljava/lang/String;III)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_4POINT0:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 50
    .line 51
    new-instance v5, Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 52
    .line 53
    const-string v6, "CHANNELS_4POINT1"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7, v7, v7}, Lcom/momo/xengine/media/types/AudioChannelLayout;-><init>(Ljava/lang/String;III)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_4POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 60
    .line 61
    new-instance v6, Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 62
    .line 63
    const-string v7, "CHANNELS_5POINT1"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v6, v7, v8, v8, v8}, Lcom/momo/xengine/media/types/AudioChannelLayout;-><init>(Ljava/lang/String;III)V

    .line 67
    .line 68
    .line 69
    sput-object v6, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_5POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 70
    .line 71
    new-instance v7, Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 72
    .line 73
    const/4 v8, 0x7

    .line 74
    const/16 v9, 0x8

    .line 75
    .line 76
    const-string v10, "CHANNELS_7POINT1"

    .line 77
    .line 78
    invoke-direct {v7, v10, v8, v8, v9}, Lcom/momo/xengine/media/types/AudioChannelLayout;-><init>(Ljava/lang/String;III)V

    .line 79
    .line 80
    .line 81
    sput-object v7, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_7POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 82
    .line 83
    filled-new-array/range {v0 .. v7}, [Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    sput-object v0, Lcom/momo/xengine/media/types/AudioChannelLayout;->$VALUES:[Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 88
    .line 89
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->value:I

    .line 5
    .line 6
    iput p4, p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->channelNum:I

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(I)Lcom/momo/xengine/media/types/AudioChannelLayout;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_UNKNOWN:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 5
    .line 6
    return-object p0

    .line 7
    :pswitch_0
    sget-object p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_7POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 8
    .line 9
    return-object p0

    .line 10
    :pswitch_1
    sget-object p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_5POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_2
    sget-object p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_4POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_3
    sget-object p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_4POINT0:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_4
    sget-object p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_2POINT1:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_5
    sget-object p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_STEREO:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_6
    sget-object p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_MONO:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 26
    .line 27
    return-object p0

    .line 28
    nop

    .line 29
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/xengine/media/types/AudioChannelLayout;
    .locals 1

    .line 29
    const-class v0, Lcom/momo/xengine/media/types/AudioChannelLayout;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/momo/xengine/media/types/AudioChannelLayout;

    return-object p0
.end method

.method public static values()[Lcom/momo/xengine/media/types/AudioChannelLayout;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xengine/media/types/AudioChannelLayout;->$VALUES:[Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/xengine/media/types/AudioChannelLayout;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getChannelNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->channelNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/AudioChannelLayout;->value:I

    .line 2
    .line 3
    return p0
.end method
