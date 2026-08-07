.class public final enum Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

.field public static final enum VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_API_OFF:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

.field public static final enum VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_API_ON:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

.field public static final enum VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_DEVICE_NOT_SUPPORT:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

.field public static final enum VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_DYNAMIC_CLOSE:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

.field public static final enum VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_NO_COMPONENT:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

.field public static final enum VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_OTHER_SETTING_DISABLED:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

.field public static final enum VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_OTHER_SETTING_ENABLED:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

.field public static final enum VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_OVER_USE:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

.field public static final enum VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_RESOLUTION_EXCEED:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

.field public static final enum VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_STREAM_NOT_EXIST:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 2
    .line 3
    const-string v1, "VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_API_OFF"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_API_OFF:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 12
    .line 13
    const-string v2, "VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_API_ON"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_API_ON:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 22
    .line 23
    const-string v3, "VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_RESOLUTION_EXCEED"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_RESOLUTION_EXCEED:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 30
    .line 31
    new-instance v3, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 32
    .line 33
    const-string v4, "VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_OVER_USE"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_OVER_USE:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 40
    .line 41
    new-instance v4, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 42
    .line 43
    const-string v5, "VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_DEVICE_NOT_SUPPORT"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_DEVICE_NOT_SUPPORT:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 50
    .line 51
    new-instance v5, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 52
    .line 53
    const-string v6, "VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_DYNAMIC_CLOSE"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7, v7}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_DYNAMIC_CLOSE:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 60
    .line 61
    new-instance v6, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 62
    .line 63
    const-string v7, "VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_OTHER_SETTING_DISABLED"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v6, v7, v8, v8}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v6, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_OTHER_SETTING_DISABLED:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 70
    .line 71
    new-instance v7, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 72
    .line 73
    const-string v8, "VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_OTHER_SETTING_ENABLED"

    .line 74
    .line 75
    const/4 v9, 0x7

    .line 76
    invoke-direct {v7, v8, v9, v9}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;-><init>(Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    sput-object v7, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_OTHER_SETTING_ENABLED:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 80
    .line 81
    new-instance v8, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 82
    .line 83
    const-string v9, "VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_NO_COMPONENT"

    .line 84
    .line 85
    const/16 v10, 0x8

    .line 86
    .line 87
    invoke-direct {v8, v9, v10, v10}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;-><init>(Ljava/lang/String;II)V

    .line 88
    .line 89
    .line 90
    sput-object v8, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_NO_COMPONENT:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 91
    .line 92
    new-instance v9, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 93
    .line 94
    const-string v10, "VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_STREAM_NOT_EXIST"

    .line 95
    .line 96
    const/16 v11, 0x9

    .line 97
    .line 98
    invoke-direct {v9, v10, v11, v11}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;-><init>(Ljava/lang/String;II)V

    .line 99
    .line 100
    .line 101
    sput-object v9, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->VIDEO_SUPER_RESOLUTION_MODE_CHANGED_REASON_STREAM_NOT_EXIST:Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 102
    .line 103
    filled-new-array/range {v0 .. v9}, [Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    sput-object v0, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->$VALUES:[Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 108
    .line 109
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
    iput p3, p0, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->values()[Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->$VALUES:[Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->value:I

    .line 2
    .line 3
    if-eqz p0, :cond_8

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p0, v0, :cond_7

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p0, v0, :cond_6

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    if-eq p0, v0, :cond_5

    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    if-eq p0, v0, :cond_4

    .line 16
    .line 17
    const/4 v0, 0x5

    .line 18
    if-eq p0, v0, :cond_3

    .line 19
    .line 20
    const/16 v0, 0x64

    .line 21
    .line 22
    if-eq p0, v0, :cond_2

    .line 23
    .line 24
    const/16 v0, 0x65

    .line 25
    .line 26
    if-eq p0, v0, :cond_1

    .line 27
    .line 28
    const/16 v0, 0xc8

    .line 29
    .line 30
    if-eq p0, v0, :cond_0

    .line 31
    .line 32
    const-string p0, ""

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_0
    const-string p0, "kVideoSuperResolutionModeChangedReasonOther"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    const-string p0, "kVideoSuperResolutionModeChangedReasonStreamNotExist"

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    const-string p0, "kVideoSuperResolutionModeChangedReasonNoComponent"

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_3
    const-string p0, "kVideoSuperResolutionModeChangedReasonDynamicClose"

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_4
    const-string p0, "kVideoSuperResolutionModeChangedReasonDeviceNotSupport"

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_5
    const-string p0, "kVideoSuperResolutionModeChangedReasonOverUse"

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_6
    const-string p0, "kVideoSuperResolutionModeChangedReasonResolutionExceed"

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_7
    const-string p0, "kVideoSuperResolutionModeChangedReasonAPIOn"

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_8
    const-string p0, "kVideoSuperResolutionModeChangedReasonAPIOff"

    .line 60
    .line 61
    return-object p0
.end method

.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;->value:I

    .line 2
    .line 3
    return p0
.end method
