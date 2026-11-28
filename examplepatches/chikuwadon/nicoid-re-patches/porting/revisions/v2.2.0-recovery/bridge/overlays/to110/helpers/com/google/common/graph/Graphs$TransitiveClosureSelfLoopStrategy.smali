.class public final enum Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;
.super Ljava/lang/Enum;
.source "Graphs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/graph/Graphs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TransitiveClosureSelfLoopStrategy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

.field public static final enum ADD_SELF_LOOPS_ALWAYS:Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

.field public static final enum ADD_SELF_LOOPS_FOR_CYCLES:Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;


# direct methods
.method private static synthetic $values()[Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;
    .registers 2

    .line 244
    sget-object v0, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;->ADD_SELF_LOOPS_ALWAYS:Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    sget-object v1, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;->ADD_SELF_LOOPS_FOR_CYCLES:Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    filled-new-array {v0, v1}, [Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 250
    new-instance v0, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    const-string v1, "ADD_SELF_LOOPS_ALWAYS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;->ADD_SELF_LOOPS_ALWAYS:Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    .line 255
    new-instance v0, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    const-string v1, "ADD_SELF_LOOPS_FOR_CYCLES"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;->ADD_SELF_LOOPS_FOR_CYCLES:Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    .line 244
    invoke-static {}, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;->$values()[Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    move-result-object v0

    sput-object v0, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;->$VALUES:[Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

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

    .line 244
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 244
    const-class v0, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    return-object p0
.end method

.method public static values()[Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;
    .registers 1

    .line 244
    sget-object v0, Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;->$VALUES:[Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    invoke-virtual {v0}, [Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/graph/Graphs$TransitiveClosureSelfLoopStrategy;

    return-object v0
.end method
