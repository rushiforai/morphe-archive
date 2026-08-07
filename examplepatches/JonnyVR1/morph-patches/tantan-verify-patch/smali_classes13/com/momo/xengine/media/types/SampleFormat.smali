.class public final enum Lcom/momo/xengine/media/types/SampleFormat;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/xengine/media/types/SampleFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/xengine/media/types/SampleFormat;

.field public static final enum AUDIO_FORMAT_16BIT:Lcom/momo/xengine/media/types/SampleFormat;

.field public static final enum AUDIO_FORMAT_16BIT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

.field public static final enum AUDIO_FORMAT_32BIT:Lcom/momo/xengine/media/types/SampleFormat;

.field public static final enum AUDIO_FORMAT_32BIT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

.field public static final enum AUDIO_FORMAT_FLOAT:Lcom/momo/xengine/media/types/SampleFormat;

.field public static final enum AUDIO_FORMAT_FLOAT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

.field public static final enum AUDIO_FORMAT_U8BIT:Lcom/momo/xengine/media/types/SampleFormat;

.field public static final enum AUDIO_FORMAT_U8BIT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

.field public static final enum AUDIO_FORMAT_UNKNOWN:Lcom/momo/xengine/media/types/SampleFormat;


# instance fields
.field private final sampleByte:I

.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/momo/xengine/media/types/SampleFormat;

    .line 2
    .line 3
    const-string v1, "AUDIO_FORMAT_UNKNOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2, v2}, Lcom/momo/xengine/media/types/SampleFormat;-><init>(Ljava/lang/String;III)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_UNKNOWN:Lcom/momo/xengine/media/types/SampleFormat;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/xengine/media/types/SampleFormat;

    .line 12
    .line 13
    const-string v2, "AUDIO_FORMAT_U8BIT"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3, v3}, Lcom/momo/xengine/media/types/SampleFormat;-><init>(Ljava/lang/String;III)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_U8BIT:Lcom/momo/xengine/media/types/SampleFormat;

    .line 20
    .line 21
    new-instance v2, Lcom/momo/xengine/media/types/SampleFormat;

    .line 22
    .line 23
    const-string v4, "AUDIO_FORMAT_16BIT"

    .line 24
    .line 25
    const/4 v5, 0x2

    .line 26
    invoke-direct {v2, v4, v5, v5, v5}, Lcom/momo/xengine/media/types/SampleFormat;-><init>(Ljava/lang/String;III)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_16BIT:Lcom/momo/xengine/media/types/SampleFormat;

    .line 30
    .line 31
    move v4, v3

    .line 32
    new-instance v3, Lcom/momo/xengine/media/types/SampleFormat;

    .line 33
    .line 34
    const-string v6, "AUDIO_FORMAT_32BIT"

    .line 35
    .line 36
    const/4 v7, 0x3

    .line 37
    const/4 v8, 0x4

    .line 38
    invoke-direct {v3, v6, v7, v7, v8}, Lcom/momo/xengine/media/types/SampleFormat;-><init>(Ljava/lang/String;III)V

    .line 39
    .line 40
    .line 41
    sput-object v3, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_32BIT:Lcom/momo/xengine/media/types/SampleFormat;

    .line 42
    .line 43
    move v6, v4

    .line 44
    new-instance v4, Lcom/momo/xengine/media/types/SampleFormat;

    .line 45
    .line 46
    const-string v7, "AUDIO_FORMAT_FLOAT"

    .line 47
    .line 48
    invoke-direct {v4, v7, v8, v8, v8}, Lcom/momo/xengine/media/types/SampleFormat;-><init>(Ljava/lang/String;III)V

    .line 49
    .line 50
    .line 51
    sput-object v4, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_FLOAT:Lcom/momo/xengine/media/types/SampleFormat;

    .line 52
    .line 53
    move v7, v5

    .line 54
    new-instance v5, Lcom/momo/xengine/media/types/SampleFormat;

    .line 55
    .line 56
    const-string v9, "AUDIO_FORMAT_U8BIT_PLANAR"

    .line 57
    .line 58
    const/4 v10, 0x5

    .line 59
    invoke-direct {v5, v9, v10, v10, v6}, Lcom/momo/xengine/media/types/SampleFormat;-><init>(Ljava/lang/String;III)V

    .line 60
    .line 61
    .line 62
    sput-object v5, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_U8BIT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

    .line 63
    .line 64
    new-instance v6, Lcom/momo/xengine/media/types/SampleFormat;

    .line 65
    .line 66
    const-string v9, "AUDIO_FORMAT_16BIT_PLANAR"

    .line 67
    .line 68
    const/4 v10, 0x6

    .line 69
    invoke-direct {v6, v9, v10, v10, v7}, Lcom/momo/xengine/media/types/SampleFormat;-><init>(Ljava/lang/String;III)V

    .line 70
    .line 71
    .line 72
    sput-object v6, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_16BIT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

    .line 73
    .line 74
    new-instance v7, Lcom/momo/xengine/media/types/SampleFormat;

    .line 75
    .line 76
    const-string v9, "AUDIO_FORMAT_32BIT_PLANAR"

    .line 77
    .line 78
    const/4 v10, 0x7

    .line 79
    invoke-direct {v7, v9, v10, v10, v8}, Lcom/momo/xengine/media/types/SampleFormat;-><init>(Ljava/lang/String;III)V

    .line 80
    .line 81
    .line 82
    sput-object v7, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_32BIT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

    .line 83
    .line 84
    move v9, v8

    .line 85
    new-instance v8, Lcom/momo/xengine/media/types/SampleFormat;

    .line 86
    .line 87
    const-string v10, "AUDIO_FORMAT_FLOAT_PLANAR"

    .line 88
    .line 89
    const/16 v11, 0x8

    .line 90
    .line 91
    invoke-direct {v8, v10, v11, v11, v9}, Lcom/momo/xengine/media/types/SampleFormat;-><init>(Ljava/lang/String;III)V

    .line 92
    .line 93
    .line 94
    sput-object v8, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_FLOAT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

    .line 95
    .line 96
    filled-new-array/range {v0 .. v8}, [Lcom/momo/xengine/media/types/SampleFormat;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    sput-object v0, Lcom/momo/xengine/media/types/SampleFormat;->$VALUES:[Lcom/momo/xengine/media/types/SampleFormat;

    .line 101
    .line 102
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
    iput p3, p0, Lcom/momo/xengine/media/types/SampleFormat;->value:I

    .line 5
    .line 6
    iput p4, p0, Lcom/momo/xengine/media/types/SampleFormat;->sampleByte:I

    .line 7
    .line 8
    return-void
.end method

.method public static getAudioFormat(I)Lcom/momo/xengine/media/types/SampleFormat;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_UNKNOWN:Lcom/momo/xengine/media/types/SampleFormat;

    .line 5
    .line 6
    return-object p0

    .line 7
    :pswitch_0
    sget-object p0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_FLOAT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

    .line 8
    .line 9
    return-object p0

    .line 10
    :pswitch_1
    sget-object p0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_32BIT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_2
    sget-object p0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_16BIT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_3
    sget-object p0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_U8BIT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_4
    sget-object p0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_FLOAT:Lcom/momo/xengine/media/types/SampleFormat;

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_5
    sget-object p0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_32BIT:Lcom/momo/xengine/media/types/SampleFormat;

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_6
    sget-object p0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_16BIT:Lcom/momo/xengine/media/types/SampleFormat;

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_7
    sget-object p0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_U8BIT:Lcom/momo/xengine/media/types/SampleFormat;

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/xengine/media/types/SampleFormat;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/xengine/media/types/SampleFormat;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/xengine/media/types/SampleFormat;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/xengine/media/types/SampleFormat;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xengine/media/types/SampleFormat;->$VALUES:[Lcom/momo/xengine/media/types/SampleFormat;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/xengine/media/types/SampleFormat;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/xengine/media/types/SampleFormat;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getSampleBit()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/SampleFormat;->sampleByte:I

    .line 2
    .line 3
    return p0
.end method

.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/SampleFormat;->value:I

    .line 2
    .line 3
    return p0
.end method
