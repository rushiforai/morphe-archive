.class public final enum Lcom/ss/bytertc/engine/type/ChannelProfile;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/ChannelProfile;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFIEL_MEETING:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_CALL:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_CHAT_ROOM:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_CHORUS:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_CLASSROOM:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_CLOUD_GAME:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_COMMUNICATION:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_GAME:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_GAME_STREAMING:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_INTERACTIVE_PODCAST:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_LIVE:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_LOW_LATENCY:Lcom/ss/bytertc/engine/type/ChannelProfile;

.field public static final enum CHANNEL_PROFILE_MEETING_ROOM:Lcom/ss/bytertc/engine/type/ChannelProfile;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 2
    .line 3
    const-string v1, "CHANNEL_PROFILE_COMMUNICATION"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_COMMUNICATION:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 12
    .line 13
    const-string v2, "CHANNEL_PROFILE_GAME"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_GAME:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 21
    .line 22
    new-instance v2, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 23
    .line 24
    const-string v3, "CHANNEL_PROFILE_CLOUD_GAME"

    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    invoke-direct {v2, v3, v4, v5}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_CLOUD_GAME:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 31
    .line 32
    new-instance v3, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 33
    .line 34
    const-string v4, "CHANNEL_PROFILE_LOW_LATENCY"

    .line 35
    .line 36
    const/4 v6, 0x4

    .line 37
    invoke-direct {v3, v4, v5, v6}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_LOW_LATENCY:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 41
    .line 42
    new-instance v4, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 43
    .line 44
    const-string v5, "CHANNEL_PROFILE_CHAT_ROOM"

    .line 45
    .line 46
    const/4 v7, 0x6

    .line 47
    invoke-direct {v4, v5, v6, v7}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v4, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_CHAT_ROOM:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 51
    .line 52
    new-instance v5, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 53
    .line 54
    const-string v6, "CHANNEL_PROFILE_INTERACTIVE_PODCAST"

    .line 55
    .line 56
    const/4 v8, 0x5

    .line 57
    const/16 v9, 0xa

    .line 58
    .line 59
    invoke-direct {v5, v6, v8, v9}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 60
    .line 61
    .line 62
    sput-object v5, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_INTERACTIVE_PODCAST:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 63
    .line 64
    new-instance v6, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 65
    .line 66
    const-string v8, "CHANNEL_PROFILE_CHORUS"

    .line 67
    .line 68
    const/16 v10, 0xc

    .line 69
    .line 70
    invoke-direct {v6, v8, v7, v10}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 71
    .line 72
    .line 73
    sput-object v6, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_CHORUS:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 74
    .line 75
    new-instance v7, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 76
    .line 77
    const/4 v8, 0x7

    .line 78
    const/16 v11, 0xe

    .line 79
    .line 80
    const-string v12, "CHANNEL_PROFILE_GAME_STREAMING"

    .line 81
    .line 82
    invoke-direct {v7, v12, v8, v11}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 83
    .line 84
    .line 85
    sput-object v7, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_GAME_STREAMING:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 86
    .line 87
    new-instance v8, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 88
    .line 89
    const/16 v11, 0x8

    .line 90
    .line 91
    const/16 v12, 0x10

    .line 92
    .line 93
    const-string v13, "CHANNEL_PROFIEL_MEETING"

    .line 94
    .line 95
    invoke-direct {v8, v13, v11, v12}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 96
    .line 97
    .line 98
    sput-object v8, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFIEL_MEETING:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 99
    .line 100
    move v11, v9

    .line 101
    new-instance v9, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 102
    .line 103
    const/16 v12, 0x9

    .line 104
    .line 105
    const/16 v13, 0x11

    .line 106
    .line 107
    const-string v14, "CHANNEL_PROFILE_MEETING_ROOM"

    .line 108
    .line 109
    invoke-direct {v9, v14, v12, v13}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 110
    .line 111
    .line 112
    sput-object v9, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_MEETING_ROOM:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 113
    .line 114
    move v12, v10

    .line 115
    new-instance v10, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 116
    .line 117
    const-string v13, "CHANNEL_PROFILE_CLASSROOM"

    .line 118
    .line 119
    const/16 v14, 0x12

    .line 120
    .line 121
    invoke-direct {v10, v13, v11, v14}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 122
    .line 123
    .line 124
    sput-object v10, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_CLASSROOM:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 125
    .line 126
    new-instance v11, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 127
    .line 128
    const/16 v13, 0xb

    .line 129
    .line 130
    const/16 v14, 0x13

    .line 131
    .line 132
    const-string v15, "CHANNEL_PROFILE_CALL"

    .line 133
    .line 134
    invoke-direct {v11, v15, v13, v14}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 135
    .line 136
    .line 137
    sput-object v11, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_CALL:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 138
    .line 139
    move v13, v12

    .line 140
    new-instance v12, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 141
    .line 142
    const-string v14, "CHANNEL_PROFILE_LIVE"

    .line 143
    .line 144
    const/16 v15, 0x14

    .line 145
    .line 146
    invoke-direct {v12, v14, v13, v15}, Lcom/ss/bytertc/engine/type/ChannelProfile;-><init>(Ljava/lang/String;II)V

    .line 147
    .line 148
    .line 149
    sput-object v12, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_LIVE:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 150
    .line 151
    filled-new-array/range {v0 .. v12}, [Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    sput-object v0, Lcom/ss/bytertc/engine/type/ChannelProfile;->$VALUES:[Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 156
    .line 157
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
    iput p3, p0, Lcom/ss/bytertc/engine/type/ChannelProfile;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/type/ChannelProfile;
    .locals 5

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/type/ChannelProfile;->values()[Lcom/ss/bytertc/engine/type/ChannelProfile;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/type/ChannelProfile;->value()I

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
    sget-object p0, Lcom/ss/bytertc/engine/type/ChannelProfile;->CHANNEL_PROFILE_COMMUNICATION:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/ChannelProfile;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/ChannelProfile;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/ChannelProfile;->$VALUES:[Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/ChannelProfile;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/ChannelProfile;->value:I

    .line 2
    .line 3
    return p0
.end method
