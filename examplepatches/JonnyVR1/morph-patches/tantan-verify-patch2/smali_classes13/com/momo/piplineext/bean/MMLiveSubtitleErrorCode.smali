.class public final enum Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

.field public static final enum SUBTITLE_ERROR_CODE_ALREADY_ON:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

.field public static final enum SUBTITLE_ERROR_CODE_ASR_CONNECTION_ERROR:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

.field public static final enum SUBTITLE_ERROR_CODE_ASR_SERVICE_ERROR:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

.field public static final enum SUBTITLE_ERROR_CODE_BEFORE_JOIN_ROOM:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

.field public static final enum SUBTITLE_ERROR_CODE_ERROR_PARAMETER:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

.field public static final enum SUBTITLE_ERROR_CODE_ERROR_PPOST_PROCESS_TIMEOUT:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

.field public static final enum SUBTITLE_ERROR_CODE_POST_PROCESS_ERROR:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

.field public static final enum SUBTITLE_ERROR_CODE_SUCCESS:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

.field public static final enum SUBTITLE_ERROR_CODE_UNKNOW:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

.field public static final enum SUBTITLE_ERROR_CODE_UNSUPPORTED_LANGUAGE:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;
    .locals 10

    .line 1
    sget-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_UNKNOW:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 2
    .line 3
    sget-object v1, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_SUCCESS:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 4
    .line 5
    sget-object v2, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_POST_PROCESS_ERROR:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 6
    .line 7
    sget-object v3, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_ASR_CONNECTION_ERROR:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 8
    .line 9
    sget-object v4, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_ASR_SERVICE_ERROR:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 10
    .line 11
    sget-object v5, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_BEFORE_JOIN_ROOM:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 12
    .line 13
    sget-object v6, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_ALREADY_ON:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 14
    .line 15
    sget-object v7, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_UNSUPPORTED_LANGUAGE:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 16
    .line 17
    sget-object v8, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_ERROR_PPOST_PROCESS_TIMEOUT:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 18
    .line 19
    sget-object v9, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_ERROR_PARAMETER:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 20
    .line 21
    filled-new-array/range {v0 .. v9}, [Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-string v2, "SUBTITLE_ERROR_CODE_UNKNOW"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v2, v3, v1}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_UNKNOW:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 11
    .line 12
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 13
    .line 14
    const-string v1, "SUBTITLE_ERROR_CODE_SUCCESS"

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_SUCCESS:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 21
    .line 22
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 23
    .line 24
    const-string v1, "SUBTITLE_ERROR_CODE_POST_PROCESS_ERROR"

    .line 25
    .line 26
    const/4 v3, 0x2

    .line 27
    invoke-direct {v0, v1, v3, v2}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_POST_PROCESS_ERROR:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 31
    .line 32
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 33
    .line 34
    const-string v1, "SUBTITLE_ERROR_CODE_ASR_CONNECTION_ERROR"

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_ASR_CONNECTION_ERROR:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 41
    .line 42
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 43
    .line 44
    const-string v1, "SUBTITLE_ERROR_CODE_ASR_SERVICE_ERROR"

    .line 45
    .line 46
    const/4 v3, 0x4

    .line 47
    invoke-direct {v0, v1, v3, v2}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_ASR_SERVICE_ERROR:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 51
    .line 52
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 53
    .line 54
    const-string v1, "SUBTITLE_ERROR_CODE_BEFORE_JOIN_ROOM"

    .line 55
    .line 56
    const/4 v2, 0x5

    .line 57
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_BEFORE_JOIN_ROOM:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 61
    .line 62
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 63
    .line 64
    const-string v1, "SUBTITLE_ERROR_CODE_ALREADY_ON"

    .line 65
    .line 66
    const/4 v3, 0x6

    .line 67
    invoke-direct {v0, v1, v3, v2}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;-><init>(Ljava/lang/String;II)V

    .line 68
    .line 69
    .line 70
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_ALREADY_ON:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 71
    .line 72
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 73
    .line 74
    const-string v1, "SUBTITLE_ERROR_CODE_UNSUPPORTED_LANGUAGE"

    .line 75
    .line 76
    const/4 v2, 0x7

    .line 77
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;-><init>(Ljava/lang/String;II)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_UNSUPPORTED_LANGUAGE:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 81
    .line 82
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 83
    .line 84
    const-string v1, "SUBTITLE_ERROR_CODE_ERROR_PPOST_PROCESS_TIMEOUT"

    .line 85
    .line 86
    const/16 v3, 0x8

    .line 87
    .line 88
    invoke-direct {v0, v1, v3, v2}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;-><init>(Ljava/lang/String;II)V

    .line 89
    .line 90
    .line 91
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_ERROR_PPOST_PROCESS_TIMEOUT:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 92
    .line 93
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 94
    .line 95
    const-string v1, "SUBTITLE_ERROR_CODE_ERROR_PARAMETER"

    .line 96
    .line 97
    const/16 v2, 0x9

    .line 98
    .line 99
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;-><init>(Ljava/lang/String;II)V

    .line 100
    .line 101
    .line 102
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_ERROR_PARAMETER:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 103
    .line 104
    invoke-static {}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->$values()[Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->$VALUES:[Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 109
    .line 110
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
    iput p3, p0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;
    .locals 5

    .line 1
    invoke-static {}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->values()[Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

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
    invoke-virtual {v3}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->value()I

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
    sget-object p0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->SUBTITLE_ERROR_CODE_UNKNOW:Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->$VALUES:[Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->value:I

    .line 2
    .line 3
    return p0
.end method
