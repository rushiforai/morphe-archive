.class public final synthetic Le/e/a/FollowFeed$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/FollowFeed$State;

.field public final synthetic f$1:Le/e/a/FollowFeedData$Actor;

.field public final synthetic f$2:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Le/e/a/FollowFeed$State;Le/e/a/FollowFeedData$Actor;Landroid/app/Activity;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda10;->f$0:Le/e/a/FollowFeed$State;

    iput-object p2, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda10;->f$1:Le/e/a/FollowFeedData$Actor;

    iput-object p3, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda10;->f$2:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda10;->f$0:Le/e/a/FollowFeed$State;

    iget-object v1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda10;->f$1:Le/e/a/FollowFeedData$Actor;

    iget-object v2, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda10;->f$2:Landroid/app/Activity;

    invoke-static {v0, v1, v2, p1}, Le/e/a/FollowFeed;->lambda$10(Le/e/a/FollowFeed$State;Le/e/a/FollowFeedData$Actor;Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method
