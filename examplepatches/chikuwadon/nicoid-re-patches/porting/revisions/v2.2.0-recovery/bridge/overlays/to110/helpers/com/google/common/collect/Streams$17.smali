.class public final synthetic Lcom/google/common/collect/Streams$17;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic f$0:Ljava/util/function/BiConsumer;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/BiConsumer;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Streams$17;->f$0:Ljava/util/function/BiConsumer;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/Streams$17;->f$0:Ljava/util/function/BiConsumer;

    check-cast p1, Lcom/google/common/collect/Streams$TemporaryPair;

    invoke-static {p0, p1}, Lcom/google/common/collect/Streams;->lambda$forEachPair$0(Ljava/util/function/BiConsumer;Lcom/google/common/collect/Streams$TemporaryPair;)V

    return-void
.end method
