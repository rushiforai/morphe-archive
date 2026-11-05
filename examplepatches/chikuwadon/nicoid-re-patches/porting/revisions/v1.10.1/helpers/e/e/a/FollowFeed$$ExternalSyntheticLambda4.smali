.class public final synthetic Le/e/a/FollowFeed$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/IntConsumer;


# instance fields
.field public final synthetic f$0:Le/e/a/FollowFeed$State;


# direct methods
.method public synthetic constructor <init>(Le/e/a/FollowFeed$State;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda4;->f$0:Le/e/a/FollowFeed$State;

    return-void
.end method


# virtual methods
.method public final accept(I)V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/FollowFeed$$ExternalSyntheticLambda4;->f$0:Le/e/a/FollowFeed$State;

    invoke-static {v0, p1}, Le/e/a/FollowFeed;->lambda$2(Le/e/a/FollowFeed$State;I)V

    return-void
.end method
