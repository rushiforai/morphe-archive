.class public final synthetic Le/e/a/ModernPosting$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Le/e/a/NetworkTask;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Ljava/lang/String;

.field public final synthetic f$5:J

.field public final synthetic f$6:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/String;Le/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/String;JLandroid/app/Activity;)V
    .registers 9

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$2:Le/e/a/NetworkTask;

    iput-object p4, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$3:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$4:Ljava/lang/String;

    iput-wide p6, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$5:J

    iput-object p8, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$6:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$2:Le/e/a/NetworkTask;

    iget-object v3, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$3:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$4:Ljava/lang/String;

    iget-wide v5, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$5:J

    iget-object v7, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;->f$6:Landroid/app/Activity;

    invoke-static/range {v0 .. v7}, Le/e/a/ModernPosting;->lambda$0(Ljava/lang/Object;Ljava/lang/String;Le/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/String;JLandroid/app/Activity;)V

    return-void
.end method
