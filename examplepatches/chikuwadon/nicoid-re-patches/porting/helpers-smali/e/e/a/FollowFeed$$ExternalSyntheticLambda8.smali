.class public final synthetic Le/e/a/FollowFeed$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/FollowFeed$State;

.field public final synthetic f$1:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Le/e/a/FollowFeed$State;Landroid/app/Activity;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda8;->f$0:Le/e/a/FollowFeed$State;

    iput-object p2, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda8;->f$1:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 13

    .line 0
    iget-object v0, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda8;->f$0:Le/e/a/FollowFeed$State;

    iget-object v1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda8;->f$1:Landroid/app/Activity;

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-wide v5, p4

    invoke-static/range {v0 .. v6}, Le/e/a/FollowFeed;->lambda$3(Le/e/a/FollowFeed$State;Landroid/app/Activity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method
