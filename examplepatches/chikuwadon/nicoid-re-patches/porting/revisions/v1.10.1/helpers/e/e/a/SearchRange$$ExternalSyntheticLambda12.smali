.class public final synthetic Le/e/a/SearchRange$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic f$0:Le/e/a/DurationRangeModel;

.field public final synthetic f$1:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Le/e/a/DurationRangeModel;Ljava/lang/Runnable;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda12;->f$0:Le/e/a/DurationRangeModel;

    iput-object p2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda12;->f$1:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda12;->f$0:Le/e/a/DurationRangeModel;

    iget-object v1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda12;->f$1:Ljava/lang/Runnable;

    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Ljava/lang/Integer;

    invoke-static {v0, v1, p1, p2}, Le/e/a/SearchRange;->lambda$15(Le/e/a/DurationRangeModel;Ljava/lang/Runnable;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method
