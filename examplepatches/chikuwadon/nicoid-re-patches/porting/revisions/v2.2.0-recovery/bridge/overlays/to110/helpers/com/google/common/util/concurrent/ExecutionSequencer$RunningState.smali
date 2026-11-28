.class final enum Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;
.super Ljava/lang/Enum;
.source "ExecutionSequencer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ExecutionSequencer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "RunningState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

.field public static final enum NOT_RUN:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

.field public static final enum STARTED:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

.field public static final enum WILL_NOT_RUN:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;


# direct methods
.method private static synthetic $values()[Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;
    .registers 3

    .line 269
    sget-object v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->NOT_RUN:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    sget-object v1, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->WILL_NOT_RUN:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    sget-object v2, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->STARTED:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    filled-new-array {v0, v1, v2}, [Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 270
    new-instance v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    const-string v1, "NOT_RUN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->NOT_RUN:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    .line 271
    new-instance v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    const-string v1, "WILL_NOT_RUN"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->WILL_NOT_RUN:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    .line 272
    new-instance v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    const-string v1, "STARTED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->STARTED:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    .line 269
    invoke-static {}, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->$values()[Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    move-result-object v0

    sput-object v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->$VALUES:[Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

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

    .line 269
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 269
    const-class v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    return-object p0
.end method

.method public static values()[Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;
    .registers 1

    .line 269
    sget-object v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->$VALUES:[Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    invoke-virtual {v0}, [Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    return-object v0
.end method
