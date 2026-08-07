.class public final enum Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/l$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "VoiceLiveMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;",
        ">;",
        "Lcom/google/protobuf/l$c;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

.field public static final enum UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

.field public static final enum auction:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

.field public static final auction_VALUE:I = 0x1

.field public static final enum boss:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

.field public static final boss_VALUE:I = 0x2

.field public static final enum commercialRoom:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

.field public static final commercialRoom_VALUE:I = 0x5

.field private static final internalValueMap:Lcom/google/protobuf/l$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum normal:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

.field public static final normal_VALUE:I = 0x0

.field public static final enum radio3:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

.field public static final radio3_VALUE:I = 0x6

.field public static final enum radio5:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

.field public static final radio5_VALUE:I = 0x7

.field public static final enum virtualAvatar:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

.field public static final virtualAvatar_VALUE:I = 0x4


# instance fields
.field private final value:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->normal:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->auction:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->boss:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->virtualAvatar:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->commercialRoom:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->radio3:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 12
    .line 13
    sget-object v6, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->radio5:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 14
    .line 15
    sget-object v7, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 16
    .line 17
    filled-new-array/range {v0 .. v7}, [Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 2
    .line 3
    const-string v1, "normal"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->normal:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 12
    .line 13
    const-string v1, "auction"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->auction:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 22
    .line 23
    const-string v1, "boss"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->boss:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 32
    .line 33
    const-string v1, "virtualAvatar"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    const/4 v3, 0x4

    .line 37
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->virtualAvatar:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 43
    .line 44
    const-string v1, "commercialRoom"

    .line 45
    .line 46
    const/4 v2, 0x5

    .line 47
    invoke-direct {v0, v1, v3, v2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->commercialRoom:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 51
    .line 52
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 53
    .line 54
    const-string v1, "radio3"

    .line 55
    .line 56
    const/4 v3, 0x6

    .line 57
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->radio3:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 61
    .line 62
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 63
    .line 64
    const-string v1, "radio5"

    .line 65
    .line 66
    const/4 v2, 0x7

    .line 67
    invoke-direct {v0, v1, v3, v2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;-><init>(Ljava/lang/String;II)V

    .line 68
    .line 69
    .line 70
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->radio5:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 71
    .line 72
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 73
    .line 74
    const-string v1, "UNRECOGNIZED"

    .line 75
    .line 76
    const/4 v3, -0x1

    .line 77
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;-><init>(Ljava/lang/String;II)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->$values()[Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->$VALUES:[Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 87
    .line 88
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode$1;

    .line 89
    .line 90
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode$1;-><init>()V

    .line 91
    .line 92
    .line 93
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 94
    .line 95
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
    iput p3, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;
    .locals 1

    .line 1
    if-eqz p0, :cond_6

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_5

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_4

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x5

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x6

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x7

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :cond_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->radio5:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->radio3:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->commercialRoom:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_3
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->virtualAvatar:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_4
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->boss:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_5
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->auction:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->normal:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 42
    .line 43
    return-object p0
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/l$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->$VALUES:[Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;->value:I

    .line 2
    .line 3
    return p0
.end method
