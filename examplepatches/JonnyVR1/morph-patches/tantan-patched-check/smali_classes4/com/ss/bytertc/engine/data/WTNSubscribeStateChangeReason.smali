.class public final enum Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

.field public static final enum OVER_CLIENT_SUBSCRIBE_STREAM_LIMIT:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

.field public static final enum OVER_STREAM_SUBSCRIBE_REQUEST_LIMIT:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

.field public static final enum OVER_STREAM_SUBSCRIBE_USER_LIMIT:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

.field public static final enum REMOTE_UNPUBLISH:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

.field public static final enum SUBSCRIBE:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

.field public static final enum UNSUBSCRIBE:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 2
    .line 3
    const-string v1, "SUBSCRIBE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->SUBSCRIBE:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/16 v3, 0x514

    .line 15
    .line 16
    const-string v4, "UNSUBSCRIBE"

    .line 17
    .line 18
    invoke-direct {v1, v4, v2, v3}, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->UNSUBSCRIBE:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 22
    .line 23
    new-instance v2, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    const/16 v4, 0x515

    .line 27
    .line 28
    const-string v5, "REMOTE_UNPUBLISH"

    .line 29
    .line 30
    invoke-direct {v2, v5, v3, v4}, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 31
    .line 32
    .line 33
    sput-object v2, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->REMOTE_UNPUBLISH:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 34
    .line 35
    new-instance v3, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 36
    .line 37
    const/4 v4, 0x3

    .line 38
    const/16 v5, 0x51e

    .line 39
    .line 40
    const-string v6, "OVER_CLIENT_SUBSCRIBE_STREAM_LIMIT"

    .line 41
    .line 42
    invoke-direct {v3, v6, v4, v5}, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 43
    .line 44
    .line 45
    sput-object v3, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->OVER_CLIENT_SUBSCRIBE_STREAM_LIMIT:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 46
    .line 47
    new-instance v4, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 48
    .line 49
    const/4 v5, 0x4

    .line 50
    const/16 v6, 0x51f

    .line 51
    .line 52
    const-string v7, "OVER_STREAM_SUBSCRIBE_USER_LIMIT"

    .line 53
    .line 54
    invoke-direct {v4, v7, v5, v6}, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 55
    .line 56
    .line 57
    sput-object v4, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->OVER_STREAM_SUBSCRIBE_USER_LIMIT:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 58
    .line 59
    new-instance v5, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 60
    .line 61
    const/4 v6, 0x5

    .line 62
    const/16 v7, 0x520

    .line 63
    .line 64
    const-string v8, "OVER_STREAM_SUBSCRIBE_REQUEST_LIMIT"

    .line 65
    .line 66
    invoke-direct {v5, v8, v6, v7}, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v5, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->OVER_STREAM_SUBSCRIBE_REQUEST_LIMIT:Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 70
    .line 71
    filled-new-array/range {v0 .. v5}, [Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->$VALUES:[Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 76
    .line 77
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
    iput p3, p0, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->values()[Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->$VALUES:[Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason$1;->$SwitchMap$com$ss$bytertc$engine$data$WTNSubscribeStateChangeReason:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, ""

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_0
    const-string p0, "kWTNSubscribeStateChangeReasonOverStreamSubscribeRequestLimit"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "kWTNSubscribeStateChangeReasonOverStreamSubscribeUserLimit"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "kWTNSubscribeStateChangeReasonOverClientSubscribeStreamLimit"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "kWTNSubscribeStateChangeReasonRemoteUnpublish"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "kWTNSubscribeStateChangeReasonUnsubscribe"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    const-string p0, "kWTNSubscribeStateChangeReasonSubscribe"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;->value:I

    .line 2
    .line 3
    return p0
.end method
