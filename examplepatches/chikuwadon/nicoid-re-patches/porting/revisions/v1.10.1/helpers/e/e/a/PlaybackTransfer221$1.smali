.class Le/e/a/PlaybackTransfer221$1;
.super Ljava/lang/Object;
.source "PlaybackTransfer221.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/PlaybackTransfer221;->capture(Ljava/lang/Object;Z)Le/e/a/PlaybackTransfer221$Transfer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$t:Le/e/a/PlaybackTransfer221$Transfer;


# direct methods
.method constructor <init>(Le/e/a/PlaybackTransfer221$Transfer;)V
    .registers 2

    .line 38
    iput-object p1, p0, Le/e/a/PlaybackTransfer221$1;->val$t:Le/e/a/PlaybackTransfer221$Transfer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 38
    # getter for: Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;
    invoke-static {}, Le/e/a/PlaybackTransfer221;->access$0()Le/e/a/PlaybackTransfer221$Transfer;

    move-result-object v0

    iget-object v1, p0, Le/e/a/PlaybackTransfer221$1;->val$t:Le/e/a/PlaybackTransfer221$Transfer;

    if-ne v0, v1, :cond_10

    invoke-static {v1}, Le/e/a/PlaybackTransfer221;->cancel(Le/e/a/PlaybackTransfer221$Transfer;)V

    const-string v0, "Playback transfer timed out; original session retained"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    :cond_10
    return-void
.end method
