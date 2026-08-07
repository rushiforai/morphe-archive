.class public final enum Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

.field public static final enum KEY_IS_EMPTY:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

.field public static final enum KEY_IS_NULL:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

.field public static final enum KEY_TOO_LONG:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

.field public static final enum NOT_JOIN_ROOM:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

.field public static final enum SERVER_ERROR:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

.field public static final enum SILENT_USER:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

.field public static final enum SUCCESS:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

.field public static final enum TOO_OFTEN:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

.field public static final enum UNKNOW:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

.field public static final enum VALUE_IS_NULL:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

.field public static final enum VALUE_TOO_LONG:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 2
    .line 3
    const-string v1, "SUCCESS"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->SUCCESS:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, -0x1

    .line 15
    const-string v4, "NOT_JOIN_ROOM"

    .line 16
    .line 17
    invoke-direct {v1, v4, v2, v3}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->NOT_JOIN_ROOM:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 21
    .line 22
    new-instance v2, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 23
    .line 24
    const/4 v3, 0x2

    .line 25
    const/4 v4, -0x2

    .line 26
    const-string v5, "KEY_IS_NULL"

    .line 27
    .line 28
    invoke-direct {v2, v5, v3, v4}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v2, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->KEY_IS_NULL:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 32
    .line 33
    new-instance v3, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 34
    .line 35
    const/4 v4, 0x3

    .line 36
    const/4 v5, -0x3

    .line 37
    const-string v6, "VALUE_IS_NULL"

    .line 38
    .line 39
    invoke-direct {v3, v6, v4, v5}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;-><init>(Ljava/lang/String;II)V

    .line 40
    .line 41
    .line 42
    sput-object v3, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->VALUE_IS_NULL:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 43
    .line 44
    new-instance v4, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 45
    .line 46
    const/4 v5, 0x4

    .line 47
    const/16 v6, -0x63

    .line 48
    .line 49
    const-string v7, "UNKNOW"

    .line 50
    .line 51
    invoke-direct {v4, v7, v5, v6}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;-><init>(Ljava/lang/String;II)V

    .line 52
    .line 53
    .line 54
    sput-object v4, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->UNKNOW:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 55
    .line 56
    new-instance v5, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 57
    .line 58
    const/4 v6, 0x5

    .line 59
    const/16 v7, -0x190

    .line 60
    .line 61
    const-string v8, "KEY_IS_EMPTY"

    .line 62
    .line 63
    invoke-direct {v5, v8, v6, v7}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;-><init>(Ljava/lang/String;II)V

    .line 64
    .line 65
    .line 66
    sput-object v5, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->KEY_IS_EMPTY:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 67
    .line 68
    new-instance v6, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 69
    .line 70
    const/4 v7, 0x6

    .line 71
    const/16 v8, -0x196

    .line 72
    .line 73
    const-string v9, "TOO_OFTEN"

    .line 74
    .line 75
    invoke-direct {v6, v9, v7, v8}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;-><init>(Ljava/lang/String;II)V

    .line 76
    .line 77
    .line 78
    sput-object v6, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->TOO_OFTEN:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 79
    .line 80
    new-instance v7, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 81
    .line 82
    const/4 v8, 0x7

    .line 83
    const/16 v9, -0x19c

    .line 84
    .line 85
    const-string v10, "SILENT_USER"

    .line 86
    .line 87
    invoke-direct {v7, v10, v8, v9}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;-><init>(Ljava/lang/String;II)V

    .line 88
    .line 89
    .line 90
    sput-object v7, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->SILENT_USER:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 91
    .line 92
    new-instance v8, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 93
    .line 94
    const/16 v9, 0x8

    .line 95
    .line 96
    const/16 v10, -0x19d

    .line 97
    .line 98
    const-string v11, "KEY_TOO_LONG"

    .line 99
    .line 100
    invoke-direct {v8, v11, v9, v10}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;-><init>(Ljava/lang/String;II)V

    .line 101
    .line 102
    .line 103
    sput-object v8, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->KEY_TOO_LONG:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 104
    .line 105
    new-instance v9, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 106
    .line 107
    const/16 v10, 0x9

    .line 108
    .line 109
    const/16 v11, -0x19e

    .line 110
    .line 111
    const-string v12, "VALUE_TOO_LONG"

    .line 112
    .line 113
    invoke-direct {v9, v12, v10, v11}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;-><init>(Ljava/lang/String;II)V

    .line 114
    .line 115
    .line 116
    sput-object v9, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->VALUE_TOO_LONG:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 117
    .line 118
    new-instance v10, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 119
    .line 120
    const/16 v11, 0xa

    .line 121
    .line 122
    const/16 v12, -0x1f4

    .line 123
    .line 124
    const-string v13, "SERVER_ERROR"

    .line 125
    .line 126
    invoke-direct {v10, v13, v11, v12}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;-><init>(Ljava/lang/String;II)V

    .line 127
    .line 128
    .line 129
    sput-object v10, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->SERVER_ERROR:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 130
    .line 131
    filled-new-array/range {v0 .. v10}, [Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    sput-object v0, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->$VALUES:[Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 136
    .line 137
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
    iput p1, p0, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->value:I

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
    iput p3, p0, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->value:I

    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;
    .locals 5

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->values()[Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->value()I

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
    sget-object p0, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->UNKNOW:Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->$VALUES:[Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->value:I

    .line 2
    .line 3
    return p0
.end method
