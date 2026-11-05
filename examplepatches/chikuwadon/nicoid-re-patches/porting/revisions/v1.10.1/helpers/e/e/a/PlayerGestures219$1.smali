.class Le/e/a/PlayerGestures219$1;
.super Ljava/lang/Object;
.source "PlayerGestures219.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/PlayerGestures219;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$pending:Le/e/a/PlayerGestures219$State;


# direct methods
.method constructor <init>(Le/e/a/PlayerGestures219$State;)V
    .registers 2

    .line 54
    iput-object p1, p0, Le/e/a/PlayerGestures219$1;->val$pending:Le/e/a/PlayerGestures219$State;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 54
    iget-object v0, p0, Le/e/a/PlayerGestures219$1;->val$pending:Le/e/a/PlayerGestures219$State;

    iget-object v0, v0, Le/e/a/PlayerGestures219$State;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_18

    iget-object v0, p0, Le/e/a/PlayerGestures219$1;->val$pending:Le/e/a/PlayerGestures219$State;

    invoke-static {v0}, Le/e/a/PlayerGestures219;->flush(Le/e/a/PlayerGestures219$State;)V

    goto :goto_22

    :cond_18
    iget-object v0, p0, Le/e/a/PlayerGestures219$1;->val$pending:Le/e/a/PlayerGestures219$State;

    invoke-static {v0}, Le/e/a/PlayerGestures219;->recycle(Le/e/a/PlayerGestures219$State;)V

    iget-object v0, p0, Le/e/a/PlayerGestures219$1;->val$pending:Le/e/a/PlayerGestures219$State;

    const/4 v1, 0x0

    iput-object v1, v0, Le/e/a/PlayerGestures219$State;->single:Ljava/lang/Runnable;

    :goto_22
    return-void
.end method
