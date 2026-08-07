.class public final enum Lcom/ss/bytertc/engine/type/StreamRemoveReason;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/StreamRemoveReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/StreamRemoveReason;

.field public static final enum STREAM_REMOVE_REASON_CLIENT_DISCONNECTED:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

.field public static final enum STREAM_REMOVE_REASON_KEEP_LIVE_FAILED:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

.field public static final enum STREAM_REMOVE_REASON_OTHER:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

.field public static final enum STREAM_REMOVE_REASON_PUBLISH_FAILED:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

.field public static final enum STREAM_REMOVE_REASON_PUBLISH_PRIVILEGE_TOKEN_EXPIRED:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

.field public static final enum STREAM_REMOVE_REASON_REPUBLISH:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

.field public static final enum STREAM_REMOVE_REASON_UNPUBLISH:Lcom/ss/bytertc/engine/type/StreamRemoveReason;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 2
    .line 3
    const-string v1, "STREAM_REMOVE_REASON_UNPUBLISH"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->STREAM_REMOVE_REASON_UNPUBLISH:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 12
    .line 13
    const-string v2, "STREAM_REMOVE_REASON_PUBLISH_FAILED"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->STREAM_REMOVE_REASON_PUBLISH_FAILED:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 22
    .line 23
    const-string v3, "STREAM_REMOVE_REASON_KEEP_LIVE_FAILED"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->STREAM_REMOVE_REASON_KEEP_LIVE_FAILED:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 30
    .line 31
    new-instance v3, Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 32
    .line 33
    const-string v4, "STREAM_REMOVE_REASON_CLIENT_DISCONNECTED"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->STREAM_REMOVE_REASON_CLIENT_DISCONNECTED:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 40
    .line 41
    new-instance v4, Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 42
    .line 43
    const-string v5, "STREAM_REMOVE_REASON_REPUBLISH"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->STREAM_REMOVE_REASON_REPUBLISH:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 50
    .line 51
    new-instance v5, Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 52
    .line 53
    const-string v6, "STREAM_REMOVE_REASON_OTHER"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7, v7}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->STREAM_REMOVE_REASON_OTHER:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 60
    .line 61
    new-instance v6, Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 62
    .line 63
    const-string v7, "STREAM_REMOVE_REASON_PUBLISH_PRIVILEGE_TOKEN_EXPIRED"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v6, v7, v8, v8}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v6, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->STREAM_REMOVE_REASON_PUBLISH_PRIVILEGE_TOKEN_EXPIRED:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 70
    .line 71
    filled-new-array/range {v0 .. v6}, [Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->$VALUES:[Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 76
    .line 77
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->value:I

    .line 6
    .line 7
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 9
    iput p3, p0, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->value:I

    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/type/StreamRemoveReason;
    .locals 5

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->values()[Lcom/ss/bytertc/engine/type/StreamRemoveReason;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->value()I

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
    sget-object p0, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->STREAM_REMOVE_REASON_UNPUBLISH:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/StreamRemoveReason;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/StreamRemoveReason;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->$VALUES:[Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/StreamRemoveReason;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->value:I

    .line 2
    .line 3
    return p0
.end method
