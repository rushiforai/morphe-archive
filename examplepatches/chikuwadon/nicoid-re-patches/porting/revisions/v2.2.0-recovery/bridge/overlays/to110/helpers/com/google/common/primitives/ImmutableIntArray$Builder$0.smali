.class public final synthetic Lcom/google/common/primitives/ImmutableIntArray$Builder$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/IntConsumer;


# instance fields
.field public final synthetic f$0:Lcom/google/common/primitives/ImmutableIntArray$Builder;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/primitives/ImmutableIntArray$Builder;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/primitives/ImmutableIntArray$Builder$0;->f$0:Lcom/google/common/primitives/ImmutableIntArray$Builder;

    return-void
.end method


# virtual methods
.method public final accept(I)V
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/primitives/ImmutableIntArray$Builder$0;->f$0:Lcom/google/common/primitives/ImmutableIntArray$Builder;

    invoke-virtual {p0, p1}, Lcom/google/common/primitives/ImmutableIntArray$Builder;->add(I)Lcom/google/common/primitives/ImmutableIntArray$Builder;

    return-void
.end method
