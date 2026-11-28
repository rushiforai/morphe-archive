.class public final synthetic Lcom/google/common/collect/Streams$18;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic f$0:Lcom/google/common/collect/Streams$1OptionalState;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/collect/Streams$1OptionalState;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Streams$18;->f$0:Lcom/google/common/collect/Streams$1OptionalState;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/Streams$18;->f$0:Lcom/google/common/collect/Streams$1OptionalState;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/Streams$1OptionalState;->set(Ljava/lang/Object;)V

    return-void
.end method
