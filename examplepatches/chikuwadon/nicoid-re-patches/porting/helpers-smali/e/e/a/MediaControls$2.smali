.class Le/e/a/MediaControls$2;
.super Landroid/content/BroadcastReceiver;
.source "MediaControls.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/MediaControls;->attach(Ljava/lang/Object;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$s:Le/e/a/MediaControls$State;


# direct methods
.method constructor <init>(Le/e/a/MediaControls$State;)V
    .registers 2

    .line 34
    iput-object p1, p0, Le/e/a/MediaControls$2;->val$s:Le/e/a/MediaControls$State;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    .line 34
    # getter for: Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;
    invoke-static {}, Le/e/a/MediaControls;->access$100()Le/e/a/MediaControls$State;

    move-result-object p1

    iget-object v0, p0, Le/e/a/MediaControls$2;->val$s:Le/e/a/MediaControls$State;

    if-ne p1, v0, :cond_13

    iget-object p1, p0, Le/e/a/MediaControls$2;->val$s:Le/e/a/MediaControls$State;

    const-string v0, "command"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Le/e/a/MediaControls;->command(Le/e/a/MediaControls$State;Ljava/lang/String;)V

    :cond_13
    return-void
.end method
