.class public final synthetic Le/e/a/FollowFeed$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Le/e/a/FollowFeed$State;

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:Ljava/util/ArrayList;

.field public final synthetic f$4:Ljava/util/ArrayList;

.field public final synthetic f$5:Ljava/lang/String;

.field public final synthetic f$6:Z


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Z)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$1:Le/e/a/FollowFeed$State;

    iput-object p3, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$2:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$3:Ljava/util/ArrayList;

    iput-object p5, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$4:Ljava/util/ArrayList;

    iput-object p6, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$5:Ljava/lang/String;

    iput-boolean p7, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$6:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$1:Le/e/a/FollowFeed$State;

    iget-object v2, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$2:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$3:Ljava/util/ArrayList;

    iget-object v4, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$4:Ljava/util/ArrayList;

    iget-object v5, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$5:Ljava/lang/String;

    iget-boolean v6, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;->f$6:Z

    invoke-static/range {v0 .. v6}, Le/e/a/FollowFeed;->lambda$6(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Z)V

    return-void
.end method
