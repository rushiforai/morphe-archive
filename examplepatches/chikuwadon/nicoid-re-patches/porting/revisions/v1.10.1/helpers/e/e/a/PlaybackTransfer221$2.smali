.class Le/e/a/PlaybackTransfer221$2;
.super Ljava/lang/Object;
.source "PlaybackTransfer221.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/PlaybackTransfer221;->awaitStart(Le/e/a/PlaybackTransfer221$Transfer;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$attempt:I

.field private final synthetic val$t:Le/e/a/PlaybackTransfer221$Transfer;


# direct methods
.method constructor <init>(Le/e/a/PlaybackTransfer221$Transfer;I)V
    .registers 3

    .line 87
    iput-object p1, p0, Le/e/a/PlaybackTransfer221$2;->val$t:Le/e/a/PlaybackTransfer221$Transfer;

    iput p2, p0, Le/e/a/PlaybackTransfer221$2;->val$attempt:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 87
    # getter for: Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;
    invoke-static {}, Le/e/a/PlaybackTransfer221;->access$0()Le/e/a/PlaybackTransfer221$Transfer;

    move-result-object v0

    iget-object v1, p0, Le/e/a/PlaybackTransfer221$2;->val$t:Le/e/a/PlaybackTransfer221$Transfer;

    if-eq v0, v1, :cond_9

    return-void

    :cond_9
    :try_start_9
    invoke-static {v1}, Le/e/a/PlaybackTransfer221;->valid(Le/e/a/PlaybackTransfer221$Transfer;)Z

    move-result v0

    if-nez v0, :cond_15

    iget-object v0, p0, Le/e/a/PlaybackTransfer221$2;->val$t:Le/e/a/PlaybackTransfer221$Transfer;

    invoke-static {v0}, Le/e/a/PlaybackTransfer221;->cancel(Le/e/a/PlaybackTransfer221$Transfer;)V

    return-void

    :cond_15
    iget-object v0, p0, Le/e/a/PlaybackTransfer221$2;->val$t:Le/e/a/PlaybackTransfer221$Transfer;

    iget-object v0, v0, Le/e/a/PlaybackTransfer221$Transfer;->targetPlayer:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/PlaybackTransfer221;->isPlaying(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    iget-object v0, p0, Le/e/a/PlaybackTransfer221$2;->val$t:Le/e/a/PlaybackTransfer221$Transfer;

    invoke-static {v0}, Le/e/a/PlaybackTransfer221;->complete(Le/e/a/PlaybackTransfer221$Transfer;)V

    return-void

    :cond_25
    iget v0, p0, Le/e/a/PlaybackTransfer221$2;->val$attempt:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_31

    iget-object v0, p0, Le/e/a/PlaybackTransfer221$2;->val$t:Le/e/a/PlaybackTransfer221$Transfer;

    invoke-static {v0}, Le/e/a/PlaybackTransfer221;->cancel(Le/e/a/PlaybackTransfer221$Transfer;)V

    return-void

    :cond_31
    iget-object v1, p0, Le/e/a/PlaybackTransfer221$2;->val$t:Le/e/a/PlaybackTransfer221$Transfer;

    add-int/lit8 v0, v0, 0x1

    invoke-static {v1, v0}, Le/e/a/PlaybackTransfer221;->awaitStart(Le/e/a/PlaybackTransfer221$Transfer;I)V
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_38} :catch_39

    goto :goto_3e

    :catch_39
    iget-object v0, p0, Le/e/a/PlaybackTransfer221$2;->val$t:Le/e/a/PlaybackTransfer221$Transfer;

    invoke-static {v0}, Le/e/a/PlaybackTransfer221;->cancel(Le/e/a/PlaybackTransfer221$Transfer;)V

    :goto_3e
    return-void
.end method
