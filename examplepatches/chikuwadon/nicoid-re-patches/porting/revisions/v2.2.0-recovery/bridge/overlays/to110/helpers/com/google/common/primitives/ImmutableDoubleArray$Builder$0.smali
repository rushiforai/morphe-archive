.class public final synthetic Lcom/google/common/primitives/ImmutableDoubleArray$Builder$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/DoubleConsumer;


# instance fields
.field public final synthetic f$0:Lcom/google/common/primitives/ImmutableDoubleArray$Builder;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/primitives/ImmutableDoubleArray$Builder;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/primitives/ImmutableDoubleArray$Builder$0;->f$0:Lcom/google/common/primitives/ImmutableDoubleArray$Builder;

    return-void
.end method


# virtual methods
.method public final accept(D)V
    .registers 3

    .line 0
    iget-object p0, p0, Lcom/google/common/primitives/ImmutableDoubleArray$Builder$0;->f$0:Lcom/google/common/primitives/ImmutableDoubleArray$Builder;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/primitives/ImmutableDoubleArray$Builder;->add(D)Lcom/google/common/primitives/ImmutableDoubleArray$Builder;

    return-void
.end method
