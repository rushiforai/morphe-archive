.class Le/e/a/MiniSession225$Session$3;
.super Ljava/lang/Object;
.source "MiniSession225.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/MiniSession225$Session;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/MiniSession225$Session;


# direct methods
.method constructor <init>(Le/e/a/MiniSession225$Session;)V
    .registers 2

    .line 129
    iput-object p1, p0, Le/e/a/MiniSession225$Session$3;->this$1:Le/e/a/MiniSession225$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 129
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session$3;->this$1:Le/e/a/MiniSession225$Session;

    if-ne v0, v1, :cond_26

    iget-object v0, p0, Le/e/a/MiniSession225$Session$3;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    if-nez v0, :cond_26

    # getter for: Le/e/a/MiniSession225;->foreground:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/MiniSession225;->access$4()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session$3;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v1, v1, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    if-ne v0, v1, :cond_26

    const-string v0, "Mini-player navigation did not resume a host; original player retained"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    iget-object v0, p0, Le/e/a/MiniSession225$Session$3;->this$1:Le/e/a/MiniSession225$Session;

    invoke-virtual {v0}, Le/e/a/MiniSession225$Session;->finishRestore()V

    :cond_26
    return-void
.end method
