.class public final enum Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/utils/MMLiveRoomParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MMLiveAudioScenario"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

.field public static final enum MMLiveAudioScenarioCommunication:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

.field public static final enum MMLiveAudioScenarioMedia:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

.field public static final enum MMLiveAudioScenarioNone:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;
    .locals 3

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->MMLiveAudioScenarioNone:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->MMLiveAudioScenarioMedia:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 4
    .line 5
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->MMLiveAudioScenarioCommunication:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

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
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-string v2, "MMLiveAudioScenarioNone"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v2, v3, v1}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->MMLiveAudioScenarioNone:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 11
    .line 12
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 13
    .line 14
    const-string v1, "MMLiveAudioScenarioMedia"

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, v1, v2, v3}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->MMLiveAudioScenarioMedia:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 21
    .line 22
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 23
    .line 24
    const-string v1, "MMLiveAudioScenarioCommunication"

    .line 25
    .line 26
    const/4 v3, 0x2

    .line 27
    invoke-direct {v0, v1, v3, v2}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->MMLiveAudioScenarioCommunication:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 31
    .line 32
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->$values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->$VALUES:[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 37
    .line 38
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
    iput p3, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;
    .locals 5

    .line 1
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

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
    invoke-virtual {v3}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->$VALUES:[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->value:I

    .line 2
    .line 3
    return p0
.end method
