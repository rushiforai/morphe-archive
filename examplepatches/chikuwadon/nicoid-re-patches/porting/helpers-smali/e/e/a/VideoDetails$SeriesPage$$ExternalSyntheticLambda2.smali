.class public final synthetic Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/VideoDetails$SeriesPage;

.field public final synthetic f$1:Le/e/a/NetworkTask;


# direct methods
.method public synthetic constructor <init>(Le/e/a/VideoDetails$SeriesPage;Le/e/a/NetworkTask;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda2;->f$0:Le/e/a/VideoDetails$SeriesPage;

    iput-object p2, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda2;->f$1:Le/e/a/NetworkTask;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda2;->f$0:Le/e/a/VideoDetails$SeriesPage;

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda2;->f$1:Le/e/a/NetworkTask;

    invoke-virtual {v0, v1}, Le/e/a/VideoDetails$SeriesPage;->lambda$2$e-e-a-VideoDetails$SeriesPage(Le/e/a/NetworkTask;)V

    return-void
.end method
