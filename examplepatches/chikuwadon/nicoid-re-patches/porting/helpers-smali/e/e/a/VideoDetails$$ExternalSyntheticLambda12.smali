.class public final synthetic Le/e/a/VideoDetails$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Landroid/widget/Button;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;->f$1:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;->f$1:Landroid/widget/Button;

    invoke-static {v0, v1}, Le/e/a/VideoDetails;->lambda$12(Le/e/a/NetworkTask;Landroid/widget/Button;)V

    return-void
.end method
