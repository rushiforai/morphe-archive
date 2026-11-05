.class public final synthetic Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/FollowFeed$Rows;

.field public final synthetic f$1:Le/e/a/FollowFeedData$Item;


# direct methods
.method public synthetic constructor <init>(Le/e/a/FollowFeed$Rows;Le/e/a/FollowFeedData$Item;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda5;->f$0:Le/e/a/FollowFeed$Rows;

    iput-object p2, p0, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda5;->f$1:Le/e/a/FollowFeedData$Item;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda5;->f$0:Le/e/a/FollowFeed$Rows;

    iget-object v1, p0, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda5;->f$1:Le/e/a/FollowFeedData$Item;

    invoke-virtual {v0, v1, p1}, Le/e/a/FollowFeed$Rows;->lambda$2$e-e-a-FollowFeed$Rows(Le/e/a/FollowFeedData$Item;Landroid/view/View;)V

    return-void
.end method
