.class public final enum Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/l$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "VoiceLiveRankingAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;",
        ">;",
        "Lcom/google/protobuf/l$c;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

.field public static final enum UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

.field public static final enum all:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

.field public static final all_VALUE:I = 0x0

.field public static final enum current:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

.field public static final current_VALUE:I = 0x1

.field private static final internalValueMap:Lcom/google/protobuf/l$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum top:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

.field public static final top_VALUE:I = 0x2


# instance fields
.field private final value:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->all:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->current:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->top:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 2
    .line 3
    const-string v1, "all"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->all:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 12
    .line 13
    const-string v1, "current"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->current:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 22
    .line 23
    const-string v1, "top"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->top:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 32
    .line 33
    const/4 v1, 0x3

    .line 34
    const/4 v2, -0x1

    .line 35
    const-string v3, "UNRECOGNIZED"

    .line 36
    .line 37
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->$values()[Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->$VALUES:[Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 47
    .line 48
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction$1;

    .line 49
    .line 50
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction$1;-><init>()V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 54
    .line 55
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
    iput p3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static forNumber(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->top:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_1
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->current:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->all:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 18
    .line 19
    return-object p0
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/l$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->forNumber(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->$VALUES:[Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->value:I

    .line 2
    .line 3
    return p0
.end method
