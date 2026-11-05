.class Le/e/a/FollowFeed$1;
.super Ljava/lang/Object;
.source "FollowFeed.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/FollowFeed;->load(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$state:Le/e/a/FollowFeed$State;


# direct methods
.method constructor <init>(Le/e/a/FollowFeed$State;Landroid/app/Activity;)V
    .registers 3

    .line 114
    iput-object p1, p0, Le/e/a/FollowFeed$1;->val$state:Le/e/a/FollowFeed$State;

    iput-object p2, p0, Le/e/a/FollowFeed$1;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 6

    .line 117
    iget-object p1, p0, Le/e/a/FollowFeed$1;->val$state:Le/e/a/FollowFeed$State;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->autoLoad:Z

    if-eqz v0, :cond_21

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->failed:Z

    if-nez v0, :cond_21

    iget-object v0, p1, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_21

    if-lez p3, :cond_21

    add-int/2addr p2, p3

    add-int/lit8 p4, p4, -0x1

    if-lt p2, p4, :cond_21

    iget-object p2, p0, Le/e/a/FollowFeed$1;->val$a:Landroid/app/Activity;

    const/4 p3, 0x0

    # invokes: Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V
    invoke-static {p2, p1, p3}, Le/e/a/FollowFeed;->access$11(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V

    .line 118
    :cond_21
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 3

    .line 115
    const/4 p1, 0x1

    if-ne p2, p1, :cond_9

    iget-object p2, p0, Le/e/a/FollowFeed$1;->val$state:Le/e/a/FollowFeed$State;

    iget-object p2, p2, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    iput-boolean p1, p2, Le/e/a/FollowFeed$State;->autoLoad:Z

    :cond_9
    return-void
.end method
