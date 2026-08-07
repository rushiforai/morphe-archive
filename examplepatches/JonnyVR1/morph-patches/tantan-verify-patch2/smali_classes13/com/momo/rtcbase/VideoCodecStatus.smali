.class public final enum Lcom/momo/rtcbase/VideoCodecStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/rtcbase/VideoCodecStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum ERROR:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum ERR_PARAMETER:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum ERR_REQUEST_SLI:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum ERR_SIZE:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum FALLBACK_SOFTWARE:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum LEVEL_EXCEEDED:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum MEMORY:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum OK:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum REQUEST_SLI:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum TARGET_BITRATE_OVERSHOOT:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum TIMEOUT:Lcom/momo/rtcbase/VideoCodecStatus;

.field public static final enum UNINITIALIZED:Lcom/momo/rtcbase/VideoCodecStatus;


# instance fields
.field private final number:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 1
    new-instance v0, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 2
    .line 3
    const-string v1, "REQUEST_SLI"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x2

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/momo/rtcbase/VideoCodecStatus;->REQUEST_SLI:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 11
    .line 12
    new-instance v1, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 13
    .line 14
    const-string v4, "NO_OUTPUT"

    .line 15
    .line 16
    const/4 v5, 0x1

    .line 17
    invoke-direct {v1, v4, v5, v5}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 21
    .line 22
    move v4, v2

    .line 23
    new-instance v2, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 24
    .line 25
    const-string v5, "OK"

    .line 26
    .line 27
    invoke-direct {v2, v5, v3, v4}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 31
    .line 32
    new-instance v3, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 33
    .line 34
    const/4 v4, 0x3

    .line 35
    const/4 v5, -0x1

    .line 36
    const-string v6, "ERROR"

    .line 37
    .line 38
    invoke-direct {v3, v6, v4, v5}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v3, Lcom/momo/rtcbase/VideoCodecStatus;->ERROR:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 42
    .line 43
    new-instance v4, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 44
    .line 45
    const/4 v5, 0x4

    .line 46
    const/4 v6, -0x2

    .line 47
    const-string v7, "LEVEL_EXCEEDED"

    .line 48
    .line 49
    invoke-direct {v4, v7, v5, v6}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 50
    .line 51
    .line 52
    sput-object v4, Lcom/momo/rtcbase/VideoCodecStatus;->LEVEL_EXCEEDED:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 53
    .line 54
    new-instance v5, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 55
    .line 56
    const/4 v6, 0x5

    .line 57
    const/4 v7, -0x3

    .line 58
    const-string v8, "MEMORY"

    .line 59
    .line 60
    invoke-direct {v5, v8, v6, v7}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 61
    .line 62
    .line 63
    sput-object v5, Lcom/momo/rtcbase/VideoCodecStatus;->MEMORY:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 64
    .line 65
    new-instance v6, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 66
    .line 67
    const/4 v7, 0x6

    .line 68
    const/4 v8, -0x4

    .line 69
    const-string v9, "ERR_PARAMETER"

    .line 70
    .line 71
    invoke-direct {v6, v9, v7, v8}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 72
    .line 73
    .line 74
    sput-object v6, Lcom/momo/rtcbase/VideoCodecStatus;->ERR_PARAMETER:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 75
    .line 76
    new-instance v7, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 77
    .line 78
    const/4 v8, 0x7

    .line 79
    const/4 v9, -0x5

    .line 80
    const-string v10, "ERR_SIZE"

    .line 81
    .line 82
    invoke-direct {v7, v10, v8, v9}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 83
    .line 84
    .line 85
    sput-object v7, Lcom/momo/rtcbase/VideoCodecStatus;->ERR_SIZE:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 86
    .line 87
    new-instance v8, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 88
    .line 89
    const/16 v9, 0x8

    .line 90
    .line 91
    const/4 v10, -0x6

    .line 92
    const-string v11, "TIMEOUT"

    .line 93
    .line 94
    invoke-direct {v8, v11, v9, v10}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 95
    .line 96
    .line 97
    sput-object v8, Lcom/momo/rtcbase/VideoCodecStatus;->TIMEOUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 98
    .line 99
    new-instance v9, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 100
    .line 101
    const/16 v10, 0x9

    .line 102
    .line 103
    const/4 v11, -0x7

    .line 104
    const-string v12, "UNINITIALIZED"

    .line 105
    .line 106
    invoke-direct {v9, v12, v10, v11}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 107
    .line 108
    .line 109
    sput-object v9, Lcom/momo/rtcbase/VideoCodecStatus;->UNINITIALIZED:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 110
    .line 111
    new-instance v10, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 112
    .line 113
    const/16 v11, 0xa

    .line 114
    .line 115
    const/16 v12, -0xc

    .line 116
    .line 117
    const-string v13, "ERR_REQUEST_SLI"

    .line 118
    .line 119
    invoke-direct {v10, v13, v11, v12}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 120
    .line 121
    .line 122
    sput-object v10, Lcom/momo/rtcbase/VideoCodecStatus;->ERR_REQUEST_SLI:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 123
    .line 124
    new-instance v11, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 125
    .line 126
    const/16 v12, 0xb

    .line 127
    .line 128
    const/16 v13, -0xd

    .line 129
    .line 130
    const-string v14, "FALLBACK_SOFTWARE"

    .line 131
    .line 132
    invoke-direct {v11, v14, v12, v13}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 133
    .line 134
    .line 135
    sput-object v11, Lcom/momo/rtcbase/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 136
    .line 137
    new-instance v12, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 138
    .line 139
    const/16 v13, 0xc

    .line 140
    .line 141
    const/16 v14, -0xe

    .line 142
    .line 143
    const-string v15, "TARGET_BITRATE_OVERSHOOT"

    .line 144
    .line 145
    invoke-direct {v12, v15, v13, v14}, Lcom/momo/rtcbase/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 146
    .line 147
    .line 148
    sput-object v12, Lcom/momo/rtcbase/VideoCodecStatus;->TARGET_BITRATE_OVERSHOOT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 149
    .line 150
    filled-new-array/range {v0 .. v12}, [Lcom/momo/rtcbase/VideoCodecStatus;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    sput-object v0, Lcom/momo/rtcbase/VideoCodecStatus;->$VALUES:[Lcom/momo/rtcbase/VideoCodecStatus;

    .line 155
    .line 156
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
    iput p3, p0, Lcom/momo/rtcbase/VideoCodecStatus;->number:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/rtcbase/VideoCodecStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/VideoCodecStatus;->$VALUES:[Lcom/momo/rtcbase/VideoCodecStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/rtcbase/VideoCodecStatus;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/rtcbase/VideoCodecStatus;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/VideoCodecStatus;->number:I

    .line 2
    .line 3
    return p0
.end method
