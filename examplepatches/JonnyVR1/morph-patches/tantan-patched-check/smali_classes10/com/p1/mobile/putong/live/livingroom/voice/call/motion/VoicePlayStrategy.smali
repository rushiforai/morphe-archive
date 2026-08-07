.class public abstract enum Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

.field public static final enum ALL_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

.field public static final enum BOTTOM_EIGHT_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

.field public static final enum BOTTOM_NINE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

.field public static final enum BOTTOM_TEN_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

.field public static final enum EIGHT_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

.field public static final enum FIVE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

.field public static final enum NINE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

.field public static final enum TEN_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

.field public static final enum THREE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;


# instance fields
.field private type:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->EIGHT_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->NINE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->TEN_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->ALL_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->BOTTOM_EIGHT_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->BOTTOM_NINE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 12
    .line 13
    sget-object v6, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->BOTTOM_TEN_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 14
    .line 15
    sget-object v7, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->THREE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 16
    .line 17
    sget-object v8, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->FIVE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$1;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->EIGHT_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "EIGHT_DEPUTY"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x0

    .line 9
    invoke-direct {v0, v2, v3, v1, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$1;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->EIGHT_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$2;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 18
    .line 19
    const-string v3, "NINE_DEPUTY"

    .line 20
    .line 21
    invoke-direct {v0, v3, v1, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$2;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V

    .line 22
    .line 23
    .line 24
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->NINE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 25
    .line 26
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$3;

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 30
    .line 31
    const-string v3, "TEN_DEPUTY"

    .line 32
    .line 33
    invoke-direct {v0, v3, v1, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$3;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V

    .line 34
    .line 35
    .line 36
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->TEN_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 37
    .line 38
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$4;

    .line 39
    .line 40
    const/4 v1, 0x3

    .line 41
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->ALL_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 42
    .line 43
    const-string v3, "ALL_DEPUTY"

    .line 44
    .line 45
    invoke-direct {v0, v3, v1, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$4;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V

    .line 46
    .line 47
    .line 48
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->ALL_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 49
    .line 50
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$5;

    .line 51
    .line 52
    const/4 v1, 0x4

    .line 53
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_EIGHT_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 54
    .line 55
    const-string v3, "BOTTOM_EIGHT_DEPUTY"

    .line 56
    .line 57
    invoke-direct {v0, v3, v1, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$5;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->BOTTOM_EIGHT_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 61
    .line 62
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$6;

    .line 63
    .line 64
    const/4 v1, 0x5

    .line 65
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 66
    .line 67
    const-string v3, "BOTTOM_NINE_DEPUTY"

    .line 68
    .line 69
    invoke-direct {v0, v3, v1, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$6;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V

    .line 70
    .line 71
    .line 72
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->BOTTOM_NINE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 73
    .line 74
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$7;

    .line 75
    .line 76
    const/4 v1, 0x6

    .line 77
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 78
    .line 79
    const-string v3, "BOTTOM_TEN_DEPUTY"

    .line 80
    .line 81
    invoke-direct {v0, v3, v1, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$7;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V

    .line 82
    .line 83
    .line 84
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->BOTTOM_TEN_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 85
    .line 86
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$8;

    .line 87
    .line 88
    const/4 v1, 0x7

    .line 89
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->THREE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 90
    .line 91
    const-string v3, "THREE_DEPUTY"

    .line 92
    .line 93
    invoke-direct {v0, v3, v1, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$8;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V

    .line 94
    .line 95
    .line 96
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->THREE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 97
    .line 98
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$9;

    .line 99
    .line 100
    const/16 v1, 0x8

    .line 101
    .line 102
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->FIVE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 103
    .line 104
    const-string v3, "FIVE_DEPUTY"

    .line 105
    .line 106
    invoke-direct {v0, v3, v1, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy$9;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V

    .line 107
    .line 108
    .line 109
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->FIVE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->$values()[Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 116
    .line 117
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->type:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILjava/lang/String;Ll/fho0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 13
    .line 14
    return-object p0
.end method

.method public static getStrategy(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->values()[Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/eho0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/eho0;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->s([Ljava/lang/Object;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 15
    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->NINE_DEPUTY:Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 19
    .line 20
    :cond_0
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public abstract getDeputyCount()I
.end method

.method public abstract getPlayStrategyView()Ll/sam;
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/motion/VoicePlayStrategy;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
