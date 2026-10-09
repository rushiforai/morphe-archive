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

    .line 116
    iput-object p1, p0, Le/e/a/FollowFeed$1;->val$state:Le/e/a/FollowFeed$State;

    iput-object p2, p0, Le/e/a/FollowFeed$1;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 5

    .line 119
    iget-object p1, p0, Le/e/a/FollowFeed$1;->val$state:Le/e/a/FollowFeed$State;

    iget-boolean p1, p1, Le/e/a/FollowFeed$State;->failed:Z

    if-nez p1, :cond_1f

    iget-object p1, p0, Le/e/a/FollowFeed$1;->val$state:Le/e/a/FollowFeed$State;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1f

    if-lez p3, :cond_1f

    add-int/2addr p2, p3

    add-int/lit8 p4, p4, -0x1

    if-lt p2, p4, :cond_1f

    iget-object p1, p0, Le/e/a/FollowFeed$1;->val$a:Landroid/app/Activity;

    iget-object p2, p0, Le/e/a/FollowFeed$1;->val$state:Le/e/a/FollowFeed$State;

    const/4 p3, 0x0

    # invokes: Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V
    invoke-static {p1, p2, p3}, Le/e/a/FollowFeed;->access$12(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V

    .line 120
    :cond_1f
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 3

    .line 117
    return-void
.end method
