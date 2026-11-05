.class public final synthetic Le/e/a/VideoDetails$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Z

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:[Z

.field public final synthetic f$3:Le/e/a/NetworkTask;

.field public final synthetic f$4:Ljava/lang/String;

.field public final synthetic f$5:Ljava/lang/Runnable;

.field public final synthetic f$6:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;[ZLe/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/Runnable;Landroid/widget/Button;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$0:Z

    iput-object p2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$2:[Z

    iput-object p4, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$3:Le/e/a/NetworkTask;

    iput-object p5, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$4:Ljava/lang/String;

    iput-object p6, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$5:Ljava/lang/Runnable;

    iput-object p7, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$6:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    .line 0
    iget-boolean v0, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$0:Z

    iget-object v1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$2:[Z

    iget-object v3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$3:Le/e/a/NetworkTask;

    iget-object v4, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$4:Ljava/lang/String;

    iget-object v5, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$5:Ljava/lang/Runnable;

    iget-object v6, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;->f$6:Landroid/widget/Button;

    invoke-static/range {v0 .. v6}, Le/e/a/VideoDetails;->lambda$24(ZLjava/lang/String;[ZLe/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/Runnable;Landroid/widget/Button;)V

    return-void
.end method
