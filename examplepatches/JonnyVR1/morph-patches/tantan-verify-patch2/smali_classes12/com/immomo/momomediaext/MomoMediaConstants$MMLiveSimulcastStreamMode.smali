.class public final enum Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

.field public static final enum AUTO_SIMULCAST_STREAM:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

.field public static final enum DISABLE_SIMULCAST_STREAM:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

.field public static final enum ENABLE_SIMULCAST_STREAM:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

.field public static final enum NO_SET:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;
    .locals 4

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->NO_SET:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->AUTO_SIMULCAST_STREAM:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 4
    .line 5
    sget-object v2, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->DISABLE_SIMULCAST_STREAM:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 6
    .line 7
    sget-object v3, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->ENABLE_SIMULCAST_STREAM:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    const-string v2, "NO_SET"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v2, v3, v1}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->NO_SET:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 11
    .line 12
    new-instance v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    const-string v2, "AUTO_SIMULCAST_STREAM"

    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    invoke-direct {v0, v2, v4, v1}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->AUTO_SIMULCAST_STREAM:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 22
    .line 23
    new-instance v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 24
    .line 25
    const-string v1, "DISABLE_SIMULCAST_STREAM"

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    invoke-direct {v0, v1, v2, v3}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->DISABLE_SIMULCAST_STREAM:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 32
    .line 33
    new-instance v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 34
    .line 35
    const-string v1, "ENABLE_SIMULCAST_STREAM"

    .line 36
    .line 37
    const/4 v2, 0x3

    .line 38
    invoke-direct {v0, v1, v2, v4}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->ENABLE_SIMULCAST_STREAM:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 42
    .line 43
    invoke-static {}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->$values()[Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->$VALUES:[Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 48
    .line 49
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
    iput p3, p0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->$VALUES:[Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->value:I

    .line 2
    .line 3
    return p0
.end method
