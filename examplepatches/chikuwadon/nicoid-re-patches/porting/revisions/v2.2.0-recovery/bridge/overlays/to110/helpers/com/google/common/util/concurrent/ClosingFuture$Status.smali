.class final enum Lcom/google/common/util/concurrent/ClosingFuture$Status;
.super Ljava/lang/Enum;
.source "ClosingFuture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ClosingFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/common/util/concurrent/ClosingFuture$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/common/util/concurrent/ClosingFuture$Status;

.field public static final enum CLOSED:Lcom/google/common/util/concurrent/ClosingFuture$Status;

.field public static final enum CLOSING:Lcom/google/common/util/concurrent/ClosingFuture$Status;

.field public static final enum OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

.field public static final enum SUBSUMED:Lcom/google/common/util/concurrent/ClosingFuture$Status;

.field public static final enum WILL_CLOSE:Lcom/google/common/util/concurrent/ClosingFuture$Status;

.field public static final enum WILL_CREATE_VALUE_AND_CLOSER:Lcom/google/common/util/concurrent/ClosingFuture$Status;


# direct methods
.method private static synthetic $values()[Lcom/google/common/util/concurrent/ClosingFuture$Status;
    .registers 6

    .line 2306
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->SUBSUMED:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v2, Lcom/google/common/util/concurrent/ClosingFuture$Status;->WILL_CLOSE:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v3, Lcom/google/common/util/concurrent/ClosingFuture$Status;->CLOSING:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v4, Lcom/google/common/util/concurrent/ClosingFuture$Status;->CLOSED:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v5, Lcom/google/common/util/concurrent/ClosingFuture$Status;->WILL_CREATE_VALUE_AND_CLOSER:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    filled-new-array/range {v0 .. v5}, [Lcom/google/common/util/concurrent/ClosingFuture$Status;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 2308
    new-instance v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    const-string v1, "OPEN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ClosingFuture$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    .line 2314
    new-instance v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    const-string v1, "SUBSUMED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ClosingFuture$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->SUBSUMED:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    .line 2320
    new-instance v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    const-string v1, "WILL_CLOSE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ClosingFuture$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->WILL_CLOSE:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    .line 2326
    new-instance v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    const-string v1, "CLOSING"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ClosingFuture$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->CLOSING:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    .line 2329
    new-instance v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    const-string v1, "CLOSED"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ClosingFuture$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->CLOSED:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    .line 2335
    new-instance v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    const-string v1, "WILL_CREATE_VALUE_AND_CLOSER"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ClosingFuture$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->WILL_CREATE_VALUE_AND_CLOSER:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    .line 2306
    invoke-static {}, Lcom/google/common/util/concurrent/ClosingFuture$Status;->$values()[Lcom/google/common/util/concurrent/ClosingFuture$Status;

    move-result-object v0

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->$VALUES:[Lcom/google/common/util/concurrent/ClosingFuture$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2306
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/util/concurrent/ClosingFuture$Status;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 2306
    const-class v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    return-object p0
.end method

.method public static values()[Lcom/google/common/util/concurrent/ClosingFuture$Status;
    .registers 1

    .line 2306
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->$VALUES:[Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {v0}, [Lcom/google/common/util/concurrent/ClosingFuture$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/util/concurrent/ClosingFuture$Status;

    return-object v0
.end method
