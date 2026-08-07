.class public final enum Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

.field public static final enum CHECKING:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

.field public static final enum COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

.field public static final enum WAITING:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;


# direct methods
.method private static synthetic $values()[Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;
    .locals 3

    .line 1
    sget-object v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->WAITING:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 2
    .line 3
    sget-object v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->CHECKING:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 4
    .line 5
    sget-object v2, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

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
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 2
    .line 3
    const-string v1, "WAITING"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->WAITING:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 10
    .line 11
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 12
    .line 13
    const-string v1, "CHECKING"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->CHECKING:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 20
    .line 21
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 22
    .line 23
    const-string v1, "COMPLETED"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 30
    .line 31
    invoke-static {}, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->$values()[Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->$VALUES:[Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

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

.method public static valueOf(Ljava/lang/String;)Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;
    .locals 1

    .line 1
    const-class v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;
    .locals 1

    .line 1
    sget-object v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->$VALUES:[Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, [Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 8
    .line 9
    return-object v0
.end method
