.class public final synthetic Lcom/google/common/graph/AbstractBaseGraph$4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Supplier;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/graph/AbstractBaseGraph$4;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/google/common/graph/AbstractBaseGraph$4;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object v0, p0, Lcom/google/common/graph/AbstractBaseGraph$4;->f$0:Ljava/lang/Object;

    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$4;->f$1:Ljava/lang/Object;

    invoke-static {v0, p0}, Lcom/google/common/graph/AbstractBaseGraph;->lambda$nodePairInvalidatableSet$1(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
