.class public final enum Lcom/ss/bytertc/engine/device/DeviceError;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/device/DeviceError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum AUDIO_DEVICE_OCCUPIED:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum AUDIO_DEVICE_PERMISSION:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum AUDIO_DEVICE_REMOVED:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum AUDIO_DEVICE_UNKNOWN_ERROR:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum AUDIO_PARAM_NOSUPPORT:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum DEVICE_NO_ERROR:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum DEVICE_UNKNOWN:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum NO_AUDIO_DEVICE:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum NO_VIDEO_DEVICE:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum VIDEO_DEVICE_OCCUPIED:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum VIDEO_DEVICE_PERMISSION:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum VIDEO_DEVICE_REMOVED:Lcom/ss/bytertc/engine/device/DeviceError;

.field public static final enum VIDEO_DEVICE_UNKNOWN_ERROR:Lcom/ss/bytertc/engine/device/DeviceError;

.field static hash:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/ss/bytertc/engine/device/DeviceError;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field errorCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 2
    .line 3
    const-string v1, "DEVICE_NO_ERROR"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/device/DeviceError;->DEVICE_NO_ERROR:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 12
    .line 13
    const-string v2, "NO_VIDEO_DEVICE"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/device/DeviceError;->NO_VIDEO_DEVICE:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 22
    .line 23
    const-string v3, "NO_AUDIO_DEVICE"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/engine/device/DeviceError;->NO_AUDIO_DEVICE:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 30
    .line 31
    new-instance v3, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 32
    .line 33
    const-string v4, "AUDIO_DEVICE_REMOVED"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/ss/bytertc/engine/device/DeviceError;->AUDIO_DEVICE_REMOVED:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 40
    .line 41
    new-instance v4, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 42
    .line 43
    const-string v5, "VIDEO_DEVICE_REMOVED"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/ss/bytertc/engine/device/DeviceError;->VIDEO_DEVICE_REMOVED:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 50
    .line 51
    new-instance v5, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 52
    .line 53
    const-string v6, "AUDIO_PARAM_NOSUPPORT"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7, v7}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/ss/bytertc/engine/device/DeviceError;->AUDIO_PARAM_NOSUPPORT:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 60
    .line 61
    new-instance v6, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 62
    .line 63
    const-string v7, "VIDEO_DEVICE_PERMISSION"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v6, v7, v8, v8}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v6, Lcom/ss/bytertc/engine/device/DeviceError;->VIDEO_DEVICE_PERMISSION:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 70
    .line 71
    new-instance v7, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 72
    .line 73
    const-string v8, "AUDIO_DEVICE_PERMISSION"

    .line 74
    .line 75
    const/4 v9, 0x7

    .line 76
    invoke-direct {v7, v8, v9, v9}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    sput-object v7, Lcom/ss/bytertc/engine/device/DeviceError;->AUDIO_DEVICE_PERMISSION:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 80
    .line 81
    new-instance v8, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 82
    .line 83
    const-string v9, "VIDEO_DEVICE_OCCUPIED"

    .line 84
    .line 85
    const/16 v10, 0x8

    .line 86
    .line 87
    invoke-direct {v8, v9, v10, v10}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 88
    .line 89
    .line 90
    sput-object v8, Lcom/ss/bytertc/engine/device/DeviceError;->VIDEO_DEVICE_OCCUPIED:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 91
    .line 92
    new-instance v9, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 93
    .line 94
    const-string v10, "AUDIO_DEVICE_OCCUPIED"

    .line 95
    .line 96
    const/16 v11, 0x9

    .line 97
    .line 98
    invoke-direct {v9, v10, v11, v11}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 99
    .line 100
    .line 101
    sput-object v9, Lcom/ss/bytertc/engine/device/DeviceError;->AUDIO_DEVICE_OCCUPIED:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 102
    .line 103
    new-instance v10, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 104
    .line 105
    const-string v11, "VIDEO_DEVICE_UNKNOWN_ERROR"

    .line 106
    .line 107
    const/16 v12, 0xa

    .line 108
    .line 109
    invoke-direct {v10, v11, v12, v12}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 110
    .line 111
    .line 112
    sput-object v10, Lcom/ss/bytertc/engine/device/DeviceError;->VIDEO_DEVICE_UNKNOWN_ERROR:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 113
    .line 114
    new-instance v11, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 115
    .line 116
    const-string v12, "AUDIO_DEVICE_UNKNOWN_ERROR"

    .line 117
    .line 118
    const/16 v13, 0xb

    .line 119
    .line 120
    invoke-direct {v11, v12, v13, v13}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 121
    .line 122
    .line 123
    sput-object v11, Lcom/ss/bytertc/engine/device/DeviceError;->AUDIO_DEVICE_UNKNOWN_ERROR:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 124
    .line 125
    new-instance v12, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 126
    .line 127
    const/16 v13, 0xc

    .line 128
    .line 129
    const v14, 0xf4240

    .line 130
    .line 131
    .line 132
    const-string v15, "DEVICE_UNKNOWN"

    .line 133
    .line 134
    invoke-direct {v12, v15, v13, v14}, Lcom/ss/bytertc/engine/device/DeviceError;-><init>(Ljava/lang/String;II)V

    .line 135
    .line 136
    .line 137
    sput-object v12, Lcom/ss/bytertc/engine/device/DeviceError;->DEVICE_UNKNOWN:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 138
    .line 139
    filled-new-array/range {v0 .. v12}, [Lcom/ss/bytertc/engine/device/DeviceError;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    sput-object v0, Lcom/ss/bytertc/engine/device/DeviceError;->$VALUES:[Lcom/ss/bytertc/engine/device/DeviceError;

    .line 144
    .line 145
    new-instance v0, Ljava/util/HashMap;

    .line 146
    .line 147
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 148
    .line 149
    .line 150
    sput-object v0, Lcom/ss/bytertc/engine/device/DeviceError;->hash:Ljava/util/Map;

    .line 151
    .line 152
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
    iput p3, p0, Lcom/ss/bytertc/engine/device/DeviceError;->errorCode:I

    .line 5
    .line 6
    return-void
.end method

.method public static get(I)Lcom/ss/bytertc/engine/device/DeviceError;
    .locals 6

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/device/DeviceError;->hash:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/ss/bytertc/engine/device/DeviceError;->values()[Lcom/ss/bytertc/engine/device/DeviceError;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    array-length v1, v0

    .line 14
    const/4 v2, 0x0

    .line 15
    :goto_0
    if-ge v2, v1, :cond_0

    .line 16
    .line 17
    aget-object v3, v0, v2

    .line 18
    .line 19
    sget-object v4, Lcom/ss/bytertc/engine/device/DeviceError;->hash:Ljava/util/Map;

    .line 20
    .line 21
    iget v5, v3, Lcom/ss/bytertc/engine/device/DeviceError;->errorCode:I

    .line 22
    .line 23
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget-object v0, Lcom/ss/bytertc/engine/device/DeviceError;->hash:Ljava/util/Map;

    .line 34
    .line 35
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    sget-object v0, Lcom/ss/bytertc/engine/device/DeviceError;->hash:Ljava/util/Map;

    .line 46
    .line 47
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/device/DeviceError;->DEVICE_UNKNOWN:Lcom/ss/bytertc/engine/device/DeviceError;

    .line 59
    .line 60
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/device/DeviceError;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/device/DeviceError;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/device/DeviceError;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/device/DeviceError;->$VALUES:[Lcom/ss/bytertc/engine/device/DeviceError;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/device/DeviceError;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/device/DeviceError;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/device/DeviceError;->errorCode:I

    .line 2
    .line 3
    return p0
.end method
