.class abstract enum Lcom/google/common/graph/Traverser$InsertionOrder;
.super Ljava/lang/Enum;
.source "Traverser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/graph/Traverser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x440a
    name = "InsertionOrder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/common/graph/Traverser$InsertionOrder;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/common/graph/Traverser$InsertionOrder;

.field public static final enum BACK:Lcom/google/common/graph/Traverser$InsertionOrder;

.field public static final enum FRONT:Lcom/google/common/graph/Traverser$InsertionOrder;


# direct methods
.method private static synthetic $values()[Lcom/google/common/graph/Traverser$InsertionOrder;
    .registers 2

    .line 480
    sget-object v0, Lcom/google/common/graph/Traverser$InsertionOrder;->FRONT:Lcom/google/common/graph/Traverser$InsertionOrder;

    sget-object v1, Lcom/google/common/graph/Traverser$InsertionOrder;->BACK:Lcom/google/common/graph/Traverser$InsertionOrder;

    filled-new-array {v0, v1}, [Lcom/google/common/graph/Traverser$InsertionOrder;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 481
    new-instance v0, Lcom/google/common/graph/Traverser$InsertionOrder$1;

    const-string v1, "FRONT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/graph/Traverser$InsertionOrder$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/graph/Traverser$InsertionOrder;->FRONT:Lcom/google/common/graph/Traverser$InsertionOrder;

    .line 487
    new-instance v0, Lcom/google/common/graph/Traverser$InsertionOrder$2;

    const-string v1, "BACK"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/common/graph/Traverser$InsertionOrder$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/graph/Traverser$InsertionOrder;->BACK:Lcom/google/common/graph/Traverser$InsertionOrder;

    .line 480
    invoke-static {}, Lcom/google/common/graph/Traverser$InsertionOrder;->$values()[Lcom/google/common/graph/Traverser$InsertionOrder;

    move-result-object v0

    sput-object v0, Lcom/google/common/graph/Traverser$InsertionOrder;->$VALUES:[Lcom/google/common/graph/Traverser$InsertionOrder;

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

    .line 480
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/google/common/graph/Traverser$1;)V
    .registers 4

    .line 480
    invoke-direct {p0, p1, p2}, Lcom/google/common/graph/Traverser$InsertionOrder;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/graph/Traverser$InsertionOrder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 480
    const-class v0, Lcom/google/common/graph/Traverser$InsertionOrder;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/common/graph/Traverser$InsertionOrder;

    return-object p0
.end method

.method public static values()[Lcom/google/common/graph/Traverser$InsertionOrder;
    .registers 1

    .line 480
    sget-object v0, Lcom/google/common/graph/Traverser$InsertionOrder;->$VALUES:[Lcom/google/common/graph/Traverser$InsertionOrder;

    invoke-virtual {v0}, [Lcom/google/common/graph/Traverser$InsertionOrder;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/graph/Traverser$InsertionOrder;

    return-object v0
.end method


# virtual methods
.method abstract insertInto(Ljava/util/Deque;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "deque",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Deque<",
            "TT;>;TT;)V"
        }
    .end annotation
.end method
