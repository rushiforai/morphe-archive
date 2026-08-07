.class public final enum Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/l$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;",
        ">;",
        "Lcom/google/protobuf/l$c;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

.field public static final enum UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

.field private static final internalValueMap:Lcom/google/protobuf/l$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum upgrade:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

.field public static final upgrade_VALUE:I


# instance fields
.field private final value:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->upgrade:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 2
    .line 3
    const-string v1, "upgrade"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->upgrade:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    const/4 v2, -0x1

    .line 15
    const-string v3, "UNRECOGNIZED"

    .line 16
    .line 17
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->$values()[Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->$VALUES:[Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 27
    .line 28
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type$1;

    .line 29
    .line 30
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type$1;-><init>()V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 34
    .line 35
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
    iput p3, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->upgrade:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 6
    .line 7
    return-object p0
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/l$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->$VALUES:[Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->value:I

    .line 2
    .line 3
    return p0
.end method
