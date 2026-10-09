.class public final synthetic Le/e/a/FollowFeed$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Le/e/a/FollowFeed$State;

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:Ljava/lang/Exception;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/lang/Exception;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda2;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda2;->f$1:Le/e/a/FollowFeed$State;

    iput-object p3, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda2;->f$2:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda2;->f$3:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda2;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda2;->f$1:Le/e/a/FollowFeed$State;

    iget-object v2, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda2;->f$2:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda2;->f$3:Ljava/lang/Exception;

    invoke-static {v0, v1, v2, v3}, Le/e/a/FollowFeed;->lambda$8(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/lang/Exception;)V

    return-void
.end method
