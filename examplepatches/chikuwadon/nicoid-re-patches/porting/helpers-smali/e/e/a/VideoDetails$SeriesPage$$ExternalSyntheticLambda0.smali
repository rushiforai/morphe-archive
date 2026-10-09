.class public final synthetic Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/VideoDetails$SeriesPage;

.field public final synthetic f$1:Le/e/a/NetworkTask;

.field public final synthetic f$2:I

.field public final synthetic f$3:Lorg/json/JSONArray;


# direct methods
.method public synthetic constructor <init>(Le/e/a/VideoDetails$SeriesPage;Le/e/a/NetworkTask;ILorg/json/JSONArray;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;->f$0:Le/e/a/VideoDetails$SeriesPage;

    iput-object p2, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;->f$1:Le/e/a/NetworkTask;

    iput p3, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;->f$2:I

    iput-object p4, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;->f$3:Lorg/json/JSONArray;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;->f$0:Le/e/a/VideoDetails$SeriesPage;

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;->f$1:Le/e/a/NetworkTask;

    iget v2, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;->f$2:I

    iget-object v3, p0, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;->f$3:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2, v3}, Le/e/a/VideoDetails$SeriesPage;->lambda$3$e-e-a-VideoDetails$SeriesPage(Le/e/a/NetworkTask;ILorg/json/JSONArray;)V

    return-void
.end method
