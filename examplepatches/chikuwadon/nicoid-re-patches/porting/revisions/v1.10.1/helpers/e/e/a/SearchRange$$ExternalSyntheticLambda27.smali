.class public final synthetic Le/e/a/SearchRange$$ExternalSyntheticLambda27;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/LongConsumer;


# instance fields
.field public final synthetic f$0:[J

.field public final synthetic f$1:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>([JLjava/lang/Runnable;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda27;->f$0:[J

    iput-object p2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda27;->f$1:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final accept(J)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda27;->f$0:[J

    iget-object v1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda27;->f$1:Ljava/lang/Runnable;

    invoke-static {v0, v1, p1, p2}, Le/e/a/SearchRange;->lambda$6([JLjava/lang/Runnable;J)V

    return-void
.end method
