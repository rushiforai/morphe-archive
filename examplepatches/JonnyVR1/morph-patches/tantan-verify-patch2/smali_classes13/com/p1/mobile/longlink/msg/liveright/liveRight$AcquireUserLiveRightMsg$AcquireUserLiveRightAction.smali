.class public final enum Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/l$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AcquireUserLiveRightAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;",
        ">;",
        "Lcom/google/protobuf/l$c;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

.field public static final enum UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

.field public static final enum equip:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

.field public static final equip_VALUE:I = 0x0

.field private static final internalValueMap:Lcom/google/protobuf/l$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum unequip:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

.field public static final unequip_VALUE:I = 0x1


# instance fields
.field private final value:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->equip:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->unequip:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 2
    .line 3
    const-string v1, "equip"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->equip:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 12
    .line 13
    const-string v1, "unequip"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->unequip:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    const/4 v2, -0x1

    .line 25
    const-string v3, "UNRECOGNIZED"

    .line 26
    .line 27
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->$values()[Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->$VALUES:[Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 37
    .line 38
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction$1;

    .line 39
    .line 40
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction$1;-><init>()V

    .line 41
    .line 42
    .line 43
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 44
    .line 45
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
    iput p3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static forNumber(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->unequip:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->equip:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 12
    .line 13
    return-object p0
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/l$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->$VALUES:[Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->value:I

    .line 2
    .line 3
    return p0
.end method
