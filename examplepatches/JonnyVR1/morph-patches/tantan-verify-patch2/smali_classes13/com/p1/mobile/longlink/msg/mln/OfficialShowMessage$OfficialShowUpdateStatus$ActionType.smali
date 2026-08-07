.class public final enum Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/l$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ActionType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;",
        ">;",
        "Lcom/google/protobuf/l$c;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

.field public static final enum UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

.field private static final internalValueMap:Lcom/google/protobuf/l$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum livePause:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

.field public static final livePause_VALUE:I = 0x3

.field public static final enum liveRecover:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

.field public static final liveRecover_VALUE:I = 0x4

.field public static final enum unknown:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

.field public static final unknown_VALUE:I = 0x0

.field public static final enum updateAnchor:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

.field public static final updateAnchor_VALUE:I = 0x1

.field public static final enum updateShowList:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

.field public static final updateShowList_VALUE:I = 0x2


# instance fields
.field private final value:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->unknown:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->updateAnchor:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->updateShowList:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->livePause:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->liveRecover:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 2
    .line 3
    const-string v1, "unknown"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->unknown:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 12
    .line 13
    const-string v1, "updateAnchor"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->updateAnchor:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 22
    .line 23
    const-string v1, "updateShowList"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->updateShowList:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 32
    .line 33
    const-string v1, "livePause"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->livePause:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 42
    .line 43
    const-string v1, "liveRecover"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->liveRecover:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 52
    .line 53
    const/4 v1, 0x5

    .line 54
    const/4 v2, -0x1

    .line 55
    const-string v3, "UNRECOGNIZED"

    .line 56
    .line 57
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->$values()[Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->$VALUES:[Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 67
    .line 68
    new-instance v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType$1;

    .line 69
    .line 70
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType$1;-><init>()V

    .line 71
    .line 72
    .line 73
    sput-object v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 74
    .line 75
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
    iput p3, p0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static forNumber(I)Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;
    .locals 1

    .line 1
    if-eqz p0, :cond_4

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_3

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_2

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p0, v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    if-eq p0, v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->liveRecover:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_1
    sget-object p0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->livePause:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->updateShowList:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_3
    sget-object p0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->updateAnchor:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_4
    sget-object p0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->unknown:Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 30
    .line 31
    return-object p0
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/l$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(I)Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->forNumber(I)Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->$VALUES:[Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus$ActionType;->value:I

    .line 2
    .line 3
    return p0
.end method
