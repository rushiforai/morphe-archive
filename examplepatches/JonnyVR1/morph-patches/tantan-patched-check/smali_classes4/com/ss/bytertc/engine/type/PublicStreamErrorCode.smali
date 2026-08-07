.class public final enum Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

.field public static final enum ERROR_CODE_PULL_NO_PUSH_STREAM:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

.field public static final enum ERROR_CODE_PUSH_ERROR:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

.field public static final enum ERROR_CODE_PUSH_INTERNAL_ERROR:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

.field public static final enum ERROR_CODE_PUSH_PARAM_ERROR:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

.field public static final enum ERROR_CODE_PUSH_STATE_ERROR:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

.field public static final enum ERROR_CODE_PUSH_TIMEOUT:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

.field public static final enum ERROR_CODE_SUCCESS:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 2
    .line 3
    const-string v1, "ERROR_CODE_SUCCESS"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->ERROR_CODE_SUCCESS:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/16 v3, 0x4a7

    .line 15
    .line 16
    const-string v4, "ERROR_CODE_PUSH_PARAM_ERROR"

    .line 17
    .line 18
    invoke-direct {v1, v4, v2, v3}, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->ERROR_CODE_PUSH_PARAM_ERROR:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 22
    .line 23
    new-instance v2, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    const/16 v4, 0x4a8

    .line 27
    .line 28
    const-string v5, "ERROR_CODE_PUSH_STATE_ERROR"

    .line 29
    .line 30
    invoke-direct {v2, v5, v3, v4}, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;-><init>(Ljava/lang/String;II)V

    .line 31
    .line 32
    .line 33
    sput-object v2, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->ERROR_CODE_PUSH_STATE_ERROR:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 34
    .line 35
    new-instance v3, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 36
    .line 37
    const/4 v4, 0x3

    .line 38
    const/16 v5, 0x4a9

    .line 39
    .line 40
    const-string v6, "ERROR_CODE_PUSH_INTERNAL_ERROR"

    .line 41
    .line 42
    invoke-direct {v3, v6, v4, v5}, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;-><init>(Ljava/lang/String;II)V

    .line 43
    .line 44
    .line 45
    sput-object v3, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->ERROR_CODE_PUSH_INTERNAL_ERROR:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 46
    .line 47
    new-instance v4, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 48
    .line 49
    const/4 v5, 0x4

    .line 50
    const/16 v6, 0x4ab

    .line 51
    .line 52
    const-string v7, "ERROR_CODE_PUSH_ERROR"

    .line 53
    .line 54
    invoke-direct {v4, v7, v5, v6}, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;-><init>(Ljava/lang/String;II)V

    .line 55
    .line 56
    .line 57
    sput-object v4, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->ERROR_CODE_PUSH_ERROR:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 58
    .line 59
    new-instance v5, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 60
    .line 61
    const/4 v6, 0x5

    .line 62
    const/16 v7, 0x4ac

    .line 63
    .line 64
    const-string v8, "ERROR_CODE_PUSH_TIMEOUT"

    .line 65
    .line 66
    invoke-direct {v5, v8, v6, v7}, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v5, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->ERROR_CODE_PUSH_TIMEOUT:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 70
    .line 71
    new-instance v6, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 72
    .line 73
    const/4 v7, 0x6

    .line 74
    const/16 v8, 0x514

    .line 75
    .line 76
    const-string v9, "ERROR_CODE_PULL_NO_PUSH_STREAM"

    .line 77
    .line 78
    invoke-direct {v6, v9, v7, v8}, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;-><init>(Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    sput-object v6, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->ERROR_CODE_PULL_NO_PUSH_STREAM:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 82
    .line 83
    filled-new-array/range {v0 .. v6}, [Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    sput-object v0, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->$VALUES:[Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 88
    .line 89
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
    iput p3, p0, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->values()[Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->value()I

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
    sget-object p0, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->ERROR_CODE_SUCCESS:Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->$VALUES:[Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;->value:I

    .line 2
    .line 3
    return p0
.end method
