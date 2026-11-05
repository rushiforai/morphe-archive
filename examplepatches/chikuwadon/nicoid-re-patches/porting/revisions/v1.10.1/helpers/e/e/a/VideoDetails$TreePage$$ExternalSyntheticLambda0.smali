.class public final synthetic Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/VideoDetails$TreePage;

.field public final synthetic f$1:I

.field public final synthetic f$2:Le/e/a/NetworkTask;


# direct methods
.method public synthetic constructor <init>(Le/e/a/VideoDetails$TreePage;ILe/e/a/NetworkTask;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda0;->f$0:Le/e/a/VideoDetails$TreePage;

    iput p2, p0, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda0;->f$1:I

    iput-object p3, p0, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda0;->f$2:Le/e/a/NetworkTask;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda0;->f$0:Le/e/a/VideoDetails$TreePage;

    iget v1, p0, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda0;->f$1:I

    iget-object v2, p0, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda0;->f$2:Le/e/a/NetworkTask;

    invoke-virtual {v0, v1, v2}, Le/e/a/VideoDetails$TreePage;->lambda$2$e-e-a-VideoDetails$TreePage(ILe/e/a/NetworkTask;)V

    return-void
.end method
