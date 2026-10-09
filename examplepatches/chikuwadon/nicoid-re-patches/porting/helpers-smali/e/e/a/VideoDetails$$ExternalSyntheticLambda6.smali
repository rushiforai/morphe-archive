.class public final synthetic Le/e/a/VideoDetails$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Le/e/a/NetworkTask;

.field public final synthetic f$2:[Z

.field public final synthetic f$3:Ljava/lang/Runnable;

.field public final synthetic f$4:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Le/e/a/NetworkTask;[ZLjava/lang/Runnable;Landroid/widget/Button;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$0:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$1:Le/e/a/NetworkTask;

    iput-object p3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$2:[Z

    iput-object p4, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$3:Ljava/lang/Runnable;

    iput-object p5, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$4:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$0:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$1:Le/e/a/NetworkTask;

    iget-object v2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$2:[Z

    iget-object v3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$3:Ljava/lang/Runnable;

    iget-object v4, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$4:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/VideoDetails;->lambda$6(Ljava/lang/String;Le/e/a/NetworkTask;[ZLjava/lang/Runnable;Landroid/widget/Button;)V

    return-void
.end method
