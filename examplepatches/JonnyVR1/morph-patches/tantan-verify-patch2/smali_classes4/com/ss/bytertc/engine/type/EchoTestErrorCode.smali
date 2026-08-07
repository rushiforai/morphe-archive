.class public final enum Lcom/ss/bytertc/engine/type/EchoTestErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/EchoTestErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

.field public static final enum ECHO_TEST_RESULT_AUDIO_DEVICE_ERROR:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

.field public static final enum ECHO_TEST_RESULT_AUDIO_RECEIVE_ERROR:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

.field public static final enum ECHO_TEST_RESULT_INTERNAL_ERROR:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

.field public static final enum ECHO_TEST_RESULT_SHORT_INTERVAL:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

.field public static final enum ECHO_TEST_RESULT_SUCCESS:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

.field public static final enum ECHO_TEST_RESULT_TIMEOUT:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

.field public static final enum ECHO_TEST_RESULT_VIDEO_DEVICE_ERROR:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

.field public static final enum ECHO_TEST_RESULT_VIDEO_RECEIVE_ERROR:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 2
    .line 3
    const-string v1, "ECHO_TEST_RESULT_SUCCESS"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->ECHO_TEST_RESULT_SUCCESS:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 12
    .line 13
    const-string v2, "ECHO_TEST_RESULT_TIMEOUT"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->ECHO_TEST_RESULT_TIMEOUT:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 22
    .line 23
    const-string v3, "ECHO_TEST_RESULT_SHORT_INTERVAL"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->ECHO_TEST_RESULT_SHORT_INTERVAL:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 30
    .line 31
    new-instance v3, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 32
    .line 33
    const-string v4, "ECHO_TEST_RESULT_AUDIO_DEVICE_ERROR"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->ECHO_TEST_RESULT_AUDIO_DEVICE_ERROR:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 40
    .line 41
    new-instance v4, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 42
    .line 43
    const-string v5, "ECHO_TEST_RESULT_VIDEO_DEVICE_ERROR"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6}, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->ECHO_TEST_RESULT_VIDEO_DEVICE_ERROR:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 50
    .line 51
    new-instance v5, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 52
    .line 53
    const-string v6, "ECHO_TEST_RESULT_AUDIO_RECEIVE_ERROR"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7, v7}, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->ECHO_TEST_RESULT_AUDIO_RECEIVE_ERROR:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 60
    .line 61
    new-instance v6, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 62
    .line 63
    const-string v7, "ECHO_TEST_RESULT_VIDEO_RECEIVE_ERROR"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v6, v7, v8, v8}, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v6, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->ECHO_TEST_RESULT_VIDEO_RECEIVE_ERROR:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 70
    .line 71
    new-instance v7, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 72
    .line 73
    const-string v8, "ECHO_TEST_RESULT_INTERNAL_ERROR"

    .line 74
    .line 75
    const/4 v9, 0x7

    .line 76
    invoke-direct {v7, v8, v9, v9}, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;-><init>(Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    sput-object v7, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->ECHO_TEST_RESULT_INTERNAL_ERROR:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 80
    .line 81
    filled-new-array/range {v0 .. v7}, [Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sput-object v0, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->$VALUES:[Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 86
    .line 87
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
    iput p3, p0, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/type/EchoTestErrorCode;
    .locals 5

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->values()[Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->value()I

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
    sget-object p0, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->ECHO_TEST_RESULT_SUCCESS:Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/EchoTestErrorCode;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/EchoTestErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->$VALUES:[Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/EchoTestErrorCode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/EchoTestErrorCode;->value:I

    .line 2
    .line 3
    return p0
.end method
