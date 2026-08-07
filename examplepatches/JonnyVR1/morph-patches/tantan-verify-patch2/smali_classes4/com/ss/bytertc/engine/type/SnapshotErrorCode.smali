.class public final enum Lcom/ss/bytertc/engine/type/SnapshotErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/SnapshotErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

.field public static final enum CREATE_FAIL:Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

.field public static final enum FILE_SAVE_ERROR:Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

.field public static final enum OK:Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

.field public static final enum STREAM_INVALID:Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

.field public static final enum TIMEOUT:Lcom/ss/bytertc/engine/type/SnapshotErrorCode;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 2
    .line 3
    const-string v1, "OK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->OK:Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, -0x1

    .line 15
    const-string v4, "CREATE_FAIL"

    .line 16
    .line 17
    invoke-direct {v1, v4, v2, v3}, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->CREATE_FAIL:Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 21
    .line 22
    new-instance v2, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 23
    .line 24
    const/4 v3, 0x2

    .line 25
    const/4 v4, -0x2

    .line 26
    const-string v5, "STREAM_INVALID"

    .line 27
    .line 28
    invoke-direct {v2, v5, v3, v4}, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v2, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->STREAM_INVALID:Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 32
    .line 33
    new-instance v3, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 34
    .line 35
    const/4 v4, 0x3

    .line 36
    const/4 v5, -0x3

    .line 37
    const-string v6, "TIMEOUT"

    .line 38
    .line 39
    invoke-direct {v3, v6, v4, v5}, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;-><init>(Ljava/lang/String;II)V

    .line 40
    .line 41
    .line 42
    sput-object v3, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->TIMEOUT:Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 43
    .line 44
    new-instance v4, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 45
    .line 46
    const/4 v5, 0x4

    .line 47
    const/4 v6, -0x4

    .line 48
    const-string v7, "FILE_SAVE_ERROR"

    .line 49
    .line 50
    invoke-direct {v4, v7, v5, v6}, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;-><init>(Ljava/lang/String;II)V

    .line 51
    .line 52
    .line 53
    sput-object v4, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->FILE_SAVE_ERROR:Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 54
    .line 55
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->$VALUES:[Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 60
    .line 61
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
    iput p3, p0, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/type/SnapshotErrorCode;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->values()[Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/SnapshotErrorCode;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/SnapshotErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->$VALUES:[Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/SnapshotErrorCode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/SnapshotErrorCode;->value:I

    .line 2
    .line 3
    return p0
.end method
