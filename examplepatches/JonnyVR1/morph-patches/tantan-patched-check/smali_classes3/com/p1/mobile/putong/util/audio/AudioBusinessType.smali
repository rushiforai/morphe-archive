.class public final enum Lcom/p1/mobile/putong/util/audio/AudioBusinessType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/util/audio/AudioBusinessType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

.field public static final enum BUZZ:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

.field public static final enum CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

.field public static final enum LIVE_IN_ROOM:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

.field public static final enum NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

.field public static final enum PHONE:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

.field public static final enum QUICK_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

.field public static final enum VIDEO_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;


# instance fields
.field private businessMsg:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/util/audio/AudioBusinessType;
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->PHONE:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->QUICK_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->BUZZ:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->LIVE_IN_ROOM:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 12
    .line 13
    sget-object v6, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->VIDEO_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, ""

    .line 5
    .line 6
    const-string v3, "NORMAL"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 14
    .line 15
    sget v1, Lcom/p1/mobile/putong/common/R$string;->D0:I

    .line 16
    .line 17
    invoke-static {v1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "CHAT_ROOM_WINDOW"

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 28
    .line 29
    new-instance v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 30
    .line 31
    sget v1, Lcom/p1/mobile/putong/common/R$string;->f0:I

    .line 32
    .line 33
    invoke-static {v1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "PHONE"

    .line 38
    .line 39
    const/4 v3, 0x2

    .line 40
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sput-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->PHONE:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 44
    .line 45
    new-instance v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 46
    .line 47
    const/4 v1, 0x3

    .line 48
    const-string v2, "\u6b63\u5728\u8bed\u97f3\u95ea\u804a\u5339\u914d\u4e2d"

    .line 49
    .line 50
    const-string v3, "QUICK_CHAT"

    .line 51
    .line 52
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->QUICK_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 56
    .line 57
    new-instance v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 58
    .line 59
    sget v1, Lcom/p1/mobile/putong/common/R$string;->g0:I

    .line 60
    .line 61
    invoke-static {v1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "BUZZ"

    .line 66
    .line 67
    const/4 v3, 0x4

    .line 68
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->BUZZ:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 72
    .line 73
    new-instance v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 74
    .line 75
    const/4 v1, 0x5

    .line 76
    const-string v2, "\u5f53\u524d\u6b63\u5728\u89c2\u770b\u76f4\u64ad\uff0c\u65e0\u6cd5\u8fdb\u884c\u8be5\u64cd\u4f5c"

    .line 77
    .line 78
    const-string v3, "LIVE_IN_ROOM"

    .line 79
    .line 80
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sput-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->LIVE_IN_ROOM:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 84
    .line 85
    new-instance v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 86
    .line 87
    const/4 v1, 0x6

    .line 88
    const-string v2, "\u5f53\u524d\u6b63\u5728\u89c6\u9891\u804a\u5929\uff0c\u65e0\u6cd5\u8fdb\u884c\u8be5\u64cd\u4f5c"

    .line 89
    .line 90
    const-string v3, "VIDEO_CHAT"

    .line 91
    .line 92
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->VIDEO_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->$values()[Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sput-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->$VALUES:[Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 102
    .line 103
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
    iput-object p3, p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->businessMsg:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/util/audio/AudioBusinessType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/util/audio/AudioBusinessType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->$VALUES:[Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getBusinessMsg()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->businessMsg:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isHighLevelBusiness()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public setBusinessMsg(Ljava/lang/String;)Lcom/p1/mobile/putong/util/audio/AudioBusinessType;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->businessMsg:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
