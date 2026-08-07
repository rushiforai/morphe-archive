.class public final enum Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

.field public static final enum BASE:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

.field public static final enum INVALID_PARAM_BY_SERVER:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

.field public static final enum JOIN_DEST_ROOM_FAIED:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

.field public static final enum NOT_SURPORT_CODEC:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

.field public static final enum OK:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

.field public static final enum RECEIVE_SRC_STREAM_TIMEOUT:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

.field public static final enum REMOTE_KICKED:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

.field public static final enum SIGNAL_REQUEST_TIMEOUT:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

.field public static final enum UNKNOWN_BY_SERVER:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 2
    .line 3
    const-string v1, "OK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->OK:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/16 v3, 0x442

    .line 15
    .line 16
    const-string v4, "BASE"

    .line 17
    .line 18
    invoke-direct {v1, v4, v2, v3}, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->BASE:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 22
    .line 23
    new-instance v2, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    const/16 v4, 0x443

    .line 27
    .line 28
    const-string v5, "UNKNOWN_BY_SERVER"

    .line 29
    .line 30
    invoke-direct {v2, v5, v3, v4}, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;-><init>(Ljava/lang/String;II)V

    .line 31
    .line 32
    .line 33
    sput-object v2, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->UNKNOWN_BY_SERVER:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 34
    .line 35
    new-instance v3, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 36
    .line 37
    const/4 v4, 0x3

    .line 38
    const/16 v5, 0x444

    .line 39
    .line 40
    const-string v6, "SIGNAL_REQUEST_TIMEOUT"

    .line 41
    .line 42
    invoke-direct {v3, v6, v4, v5}, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;-><init>(Ljava/lang/String;II)V

    .line 43
    .line 44
    .line 45
    sput-object v3, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->SIGNAL_REQUEST_TIMEOUT:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 46
    .line 47
    new-instance v4, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 48
    .line 49
    const/4 v5, 0x4

    .line 50
    const/16 v6, 0x445

    .line 51
    .line 52
    const-string v7, "INVALID_PARAM_BY_SERVER"

    .line 53
    .line 54
    invoke-direct {v4, v7, v5, v6}, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;-><init>(Ljava/lang/String;II)V

    .line 55
    .line 56
    .line 57
    sput-object v4, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->INVALID_PARAM_BY_SERVER:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 58
    .line 59
    new-instance v5, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 60
    .line 61
    const/4 v6, 0x5

    .line 62
    const/16 v7, 0x446

    .line 63
    .line 64
    const-string v8, "REMOTE_KICKED"

    .line 65
    .line 66
    invoke-direct {v5, v8, v6, v7}, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v5, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->REMOTE_KICKED:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 70
    .line 71
    new-instance v6, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 72
    .line 73
    const/4 v7, 0x6

    .line 74
    const/16 v8, 0x447

    .line 75
    .line 76
    const-string v9, "JOIN_DEST_ROOM_FAIED"

    .line 77
    .line 78
    invoke-direct {v6, v9, v7, v8}, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;-><init>(Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    sput-object v6, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->JOIN_DEST_ROOM_FAIED:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 82
    .line 83
    new-instance v7, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 84
    .line 85
    const/4 v8, 0x7

    .line 86
    const/16 v9, 0x448

    .line 87
    .line 88
    const-string v10, "RECEIVE_SRC_STREAM_TIMEOUT"

    .line 89
    .line 90
    invoke-direct {v7, v10, v8, v9}, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;-><init>(Ljava/lang/String;II)V

    .line 91
    .line 92
    .line 93
    sput-object v7, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->RECEIVE_SRC_STREAM_TIMEOUT:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 94
    .line 95
    new-instance v8, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 96
    .line 97
    const/16 v9, 0x8

    .line 98
    .line 99
    const/16 v10, 0x449

    .line 100
    .line 101
    const-string v11, "NOT_SURPORT_CODEC"

    .line 102
    .line 103
    invoke-direct {v8, v11, v9, v10}, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;-><init>(Ljava/lang/String;II)V

    .line 104
    .line 105
    .line 106
    sput-object v8, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->NOT_SURPORT_CODEC:Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 107
    .line 108
    filled-new-array/range {v0 .. v8}, [Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    sput-object v0, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->$VALUES:[Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 113
    .line 114
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
    iput p3, p0, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->values()[Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->$VALUES:[Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode$1;->$SwitchMap$com$ss$bytertc$engine$live$SingleStreamTaskErrorCode:[I

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
    const-string p0, "NOT_SURPORT_CODEC"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "RECEIVE_SRC_STREAM_TIMEOUT"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "JOIN_DEST_ROOM_FAIED"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "REMOTE_KICKED"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "INVALID_PARAM_BY_SERVER"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    const-string p0, "SIGNAL_REQUEST_TIMEOUT"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_6
    const-string p0, "UNKNOWN_BY_SERVER"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_7
    const-string p0, "BASE"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_8
    const-string p0, "OK"

    .line 40
    .line 41
    return-object p0

    .line 42
    nop

    .line 43
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
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
    iget p0, p0, Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;->value:I

    .line 2
    .line 3
    return p0
.end method
