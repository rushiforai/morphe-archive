.class public final synthetic Le/e/a/FollowFeed$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Le/e/a/NetworkTask;

.field public final synthetic f$4:Z

.field public final synthetic f$5:Le/e/a/FollowFeed$State;

.field public final synthetic f$6:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;ZLe/e/a/FollowFeed$State;Landroid/app/Activity;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$0:I

    iput-object p2, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$3:Le/e/a/NetworkTask;

    iput-boolean p5, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$4:Z

    iput-object p6, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$5:Le/e/a/FollowFeed$State;

    iput-object p7, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$6:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    .line 0
    iget v0, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$0:I

    iget-object v1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$3:Le/e/a/NetworkTask;

    iget-boolean v4, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$4:Z

    iget-object v5, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$5:Le/e/a/FollowFeed$State;

    iget-object v6, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;->f$6:Landroid/app/Activity;

    invoke-static/range {v0 .. v6}, Le/e/a/FollowFeed;->lambda$5(ILjava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;ZLe/e/a/FollowFeed$State;Landroid/app/Activity;)V

    return-void
.end method
