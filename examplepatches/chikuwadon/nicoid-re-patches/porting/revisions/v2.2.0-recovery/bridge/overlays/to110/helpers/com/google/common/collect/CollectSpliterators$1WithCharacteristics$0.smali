.class public final synthetic Lcom/google/common/collect/CollectSpliterators$1WithCharacteristics$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/IntConsumer;


# instance fields
.field public final synthetic f$0:Ljava/util/function/Consumer;

.field public final synthetic f$1:Ljava/util/function/IntFunction;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/Consumer;Ljava/util/function/IntFunction;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/CollectSpliterators$1WithCharacteristics$0;->f$0:Ljava/util/function/Consumer;

    iput-object p2, p0, Lcom/google/common/collect/CollectSpliterators$1WithCharacteristics$0;->f$1:Ljava/util/function/IntFunction;

    return-void
.end method


# virtual methods
.method public final accept(I)V
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$1WithCharacteristics$0;->f$0:Ljava/util/function/Consumer;

    iget-object p0, p0, Lcom/google/common/collect/CollectSpliterators$1WithCharacteristics$0;->f$1:Ljava/util/function/IntFunction;

    invoke-static {v0, p0, p1}, Lcom/google/common/collect/CollectSpliterators$1WithCharacteristics;->lambda$forEachRemaining$0(Ljava/util/function/Consumer;Ljava/util/function/IntFunction;I)V

    return-void
.end method
