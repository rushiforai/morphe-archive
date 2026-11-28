.class abstract enum Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;
.super Ljava/lang/Enum;
.source "ClosingFuture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ClosingFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x440a
    name = "ReachabilityFenceCaller"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

.field public static final enum NO_OP_CALLER:Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

.field public static final enum REAL_CALLER:Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;


# direct methods
.method private static synthetic $values()[Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;
    .registers 2

    .line 2371
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;->REAL_CALLER:Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;->NO_OP_CALLER:Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

    filled-new-array {v0, v1}, [Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 2372
    new-instance v0, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller$1;

    const-string v1, "REAL_CALLER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;->REAL_CALLER:Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

    .line 2390
    new-instance v0, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller$2;

    const-string v1, "NO_OP_CALLER"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;->NO_OP_CALLER:Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

    .line 2371
    invoke-static {}, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;->$values()[Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

    move-result-object v0

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;->$VALUES:[Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

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

    .line 2371
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/google/common/util/concurrent/ClosingFuture$1;)V
    .registers 4

    .line 2371
    invoke-direct {p0, p1, p2}, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 2371
    const-class v0, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

    return-object p0
.end method

.method public static values()[Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;
    .registers 1

    .line 2371
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;->$VALUES:[Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

    invoke-virtual {v0}, [Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;

    return-object v0
.end method


# virtual methods
.method abstract reachabilityFence(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation
.end method
