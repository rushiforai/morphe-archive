.class public final enum Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

.field public static final enum AUDIO_RECORDING_ERROR_CODE_ALREADY_STARTED:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

.field public static final enum AUDIO_RECORDING_ERROR_CODE_NOT_IN_ROOM:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

.field public static final enum AUDIO_RECORDING_ERROR_CODE_NOT_STARTED:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

.field public static final enum AUDIO_RECORDING_ERROR_CODE_NOT_SUPPORT:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

.field public static final enum AUDIO_RECORDING_ERROR_CODE_NO_PERMISSION:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

.field public static final enum AUDIO_RECORDING_ERROR_CODE_OK:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

.field public static final enum AUDIO_RECORDING_ERROR_CODE_OTHER:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 2
    .line 3
    const-string v1, "AUDIO_RECORDING_ERROR_CODE_OK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->AUDIO_RECORDING_ERROR_CODE_OK:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, -0x1

    .line 15
    const-string v4, "AUDIO_RECORDING_ERROR_CODE_NO_PERMISSION"

    .line 16
    .line 17
    invoke-direct {v1, v4, v2, v3}, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->AUDIO_RECORDING_ERROR_CODE_NO_PERMISSION:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 21
    .line 22
    new-instance v2, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 23
    .line 24
    const/4 v3, 0x2

    .line 25
    const/4 v4, -0x2

    .line 26
    const-string v5, "AUDIO_RECORDING_ERROR_CODE_NOT_IN_ROOM"

    .line 27
    .line 28
    invoke-direct {v2, v5, v3, v4}, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v2, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->AUDIO_RECORDING_ERROR_CODE_NOT_IN_ROOM:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 32
    .line 33
    new-instance v3, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 34
    .line 35
    const/4 v4, 0x3

    .line 36
    const/4 v5, -0x3

    .line 37
    const-string v6, "AUDIO_RECORDING_ERROR_CODE_ALREADY_STARTED"

    .line 38
    .line 39
    invoke-direct {v3, v6, v4, v5}, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;-><init>(Ljava/lang/String;II)V

    .line 40
    .line 41
    .line 42
    sput-object v3, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->AUDIO_RECORDING_ERROR_CODE_ALREADY_STARTED:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 43
    .line 44
    new-instance v4, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 45
    .line 46
    const/4 v5, 0x4

    .line 47
    const/4 v6, -0x4

    .line 48
    const-string v7, "AUDIO_RECORDING_ERROR_CODE_NOT_STARTED"

    .line 49
    .line 50
    invoke-direct {v4, v7, v5, v6}, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;-><init>(Ljava/lang/String;II)V

    .line 51
    .line 52
    .line 53
    sput-object v4, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->AUDIO_RECORDING_ERROR_CODE_NOT_STARTED:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 54
    .line 55
    new-instance v5, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 56
    .line 57
    const/4 v6, 0x5

    .line 58
    const/4 v7, -0x5

    .line 59
    const-string v8, "AUDIO_RECORDING_ERROR_CODE_NOT_SUPPORT"

    .line 60
    .line 61
    invoke-direct {v5, v8, v6, v7}, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;-><init>(Ljava/lang/String;II)V

    .line 62
    .line 63
    .line 64
    sput-object v5, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->AUDIO_RECORDING_ERROR_CODE_NOT_SUPPORT:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 65
    .line 66
    new-instance v6, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 67
    .line 68
    const/4 v7, 0x6

    .line 69
    const/4 v8, -0x6

    .line 70
    const-string v9, "AUDIO_RECORDING_ERROR_CODE_OTHER"

    .line 71
    .line 72
    invoke-direct {v6, v9, v7, v8}, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;-><init>(Ljava/lang/String;II)V

    .line 73
    .line 74
    .line 75
    sput-object v6, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->AUDIO_RECORDING_ERROR_CODE_OTHER:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 76
    .line 77
    filled-new-array/range {v0 .. v6}, [Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sput-object v0, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->$VALUES:[Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 82
    .line 83
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
    iput p3, p0, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;
    .locals 5

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->values()[Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->value()I

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
    sget-object p0, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->AUDIO_RECORDING_ERROR_CODE_OTHER:Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->$VALUES:[Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;->value:I

    .line 2
    .line 3
    return p0
.end method
