.class public final synthetic Le/e/a/FollowFeed$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/FollowFeed$State;

.field public final synthetic f$1:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Le/e/a/FollowFeed$State;Landroid/app/Activity;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda9;->f$0:Le/e/a/FollowFeed$State;

    iput-object p2, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda9;->f$1:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda9;->f$0:Le/e/a/FollowFeed$State;

    iget-object v1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda9;->f$1:Landroid/app/Activity;

    invoke-static {v0, v1, p1}, Le/e/a/FollowFeed;->lambda$9(Le/e/a/FollowFeed$State;Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method
