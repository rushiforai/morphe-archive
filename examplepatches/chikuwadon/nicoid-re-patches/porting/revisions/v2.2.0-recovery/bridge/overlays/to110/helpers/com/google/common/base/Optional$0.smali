.class public final synthetic Lcom/google/common/base/Optional$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Iterable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Iterable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Iterable;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/base/Optional$0;->f$0:Ljava/lang/Iterable;

    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .registers 1

    .line 0
    iget-object p0, p0, Lcom/google/common/base/Optional$0;->f$0:Ljava/lang/Iterable;

    invoke-static {p0}, Lcom/google/common/base/Optional;->lambda$presentInstances$0(Ljava/lang/Iterable;)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method
