.class public final enum Lcom/immomo/momomediaext/utils/MMLivePushStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/momomediaext/utils/MMLivePushStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/momomediaext/utils/MMLivePushStatus;

.field public static final enum MMLivePushStatusStarted:Lcom/immomo/momomediaext/utils/MMLivePushStatus;

.field public static final enum MMLivePushStatusStoped:Lcom/immomo/momomediaext/utils/MMLivePushStatus;

.field public static final enum MMLivePushStatusWait:Lcom/immomo/momomediaext/utils/MMLivePushStatus;


# direct methods
.method private static synthetic $values()[Lcom/immomo/momomediaext/utils/MMLivePushStatus;
    .locals 3

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLivePushStatus;->MMLivePushStatusWait:Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLivePushStatus;->MMLivePushStatusStarted:Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 4
    .line 5
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLivePushStatus;->MMLivePushStatusStoped:Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 2
    .line 3
    const-string v1, "MMLivePushStatusWait"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/immomo/momomediaext/utils/MMLivePushStatus;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLivePushStatus;->MMLivePushStatusWait:Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 10
    .line 11
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 12
    .line 13
    const-string v1, "MMLivePushStatusStarted"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/immomo/momomediaext/utils/MMLivePushStatus;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLivePushStatus;->MMLivePushStatusStarted:Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 20
    .line 21
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 22
    .line 23
    const-string v1, "MMLivePushStatusStoped"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/immomo/momomediaext/utils/MMLivePushStatus;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLivePushStatus;->MMLivePushStatusStoped:Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 30
    .line 31
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLivePushStatus;->$values()[Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLivePushStatus;->$VALUES:[Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 36
    .line 37
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/momomediaext/utils/MMLivePushStatus;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/momomediaext/utils/MMLivePushStatus;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLivePushStatus;->$VALUES:[Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/momomediaext/utils/MMLivePushStatus;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/momomediaext/utils/MMLivePushStatus;

    .line 8
    .line 9
    return-object v0
.end method
