.class public final synthetic Lcom/google/common/util/concurrent/Callables$3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/google/common/base/Supplier;

.field public final synthetic f$1:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/base/Supplier;Ljava/lang/Runnable;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/Callables$3;->f$0:Lcom/google/common/base/Supplier;

    iput-object p2, p0, Lcom/google/common/util/concurrent/Callables$3;->f$1:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lcom/google/common/util/concurrent/Callables$3;->f$0:Lcom/google/common/base/Supplier;

    iget-object p0, p0, Lcom/google/common/util/concurrent/Callables$3;->f$1:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Lcom/google/common/util/concurrent/Callables;->lambda$threadRenaming$1(Lcom/google/common/base/Supplier;Ljava/lang/Runnable;)V

    return-void
.end method
