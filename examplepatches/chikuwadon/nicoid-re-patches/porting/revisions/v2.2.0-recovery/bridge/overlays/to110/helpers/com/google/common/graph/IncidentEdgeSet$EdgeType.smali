.class final enum Lcom/google/common/graph/IncidentEdgeSet$EdgeType;
.super Ljava/lang/Enum;
.source "IncidentEdgeSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/graph/IncidentEdgeSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "EdgeType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/common/graph/IncidentEdgeSet$EdgeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

.field public static final enum BOTH:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

.field public static final enum INCOMING:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

.field public static final enum OUTGOING:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;


# direct methods
.method private static synthetic $values()[Lcom/google/common/graph/IncidentEdgeSet$EdgeType;
    .registers 3

    .line 33
    sget-object v0, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->INCOMING:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    sget-object v1, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->OUTGOING:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    sget-object v2, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->BOTH:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    filled-new-array {v0, v1, v2}, [Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 34
    new-instance v0, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    const-string v1, "INCOMING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->INCOMING:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    .line 35
    new-instance v0, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    const-string v1, "OUTGOING"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->OUTGOING:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    .line 36
    new-instance v0, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    const-string v1, "BOTH"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->BOTH:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    .line 33
    invoke-static {}, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->$values()[Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    move-result-object v0

    sput-object v0, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->$VALUES:[Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

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

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/graph/IncidentEdgeSet$EdgeType;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 33
    const-class v0, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    return-object p0
.end method

.method public static values()[Lcom/google/common/graph/IncidentEdgeSet$EdgeType;
    .registers 1

    .line 33
    sget-object v0, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->$VALUES:[Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    invoke-virtual {v0}, [Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    return-object v0
.end method
