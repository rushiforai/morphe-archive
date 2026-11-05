.class Le/e/a/CastControls218$1;
.super Ljava/lang/Object;
.source "CastControls218.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CastControls218;->publish(Ljava/lang/Object;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$copy:Ljava/util/ArrayList;

.field private final synthetic val$model:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 3

    .line 34
    iput-object p1, p0, Le/e/a/CastControls218$1;->val$model:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/CastControls218$1;->val$copy:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 35
    # getter for: Le/e/a/CastControls218;->COMMENTS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/CastControls218;->access$2()Ljava/util/WeakHashMap;

    move-result-object v0

    iget-object v1, p0, Le/e/a/CastControls218$1;->val$model:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/CastControls218$1;->val$copy:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    :try_start_b
    sget-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->K:Le/e/a/l3/a;

    if-eqz v0, :cond_21

    .line 38
    const-string v1, "a"

    # invokes: Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v0, v1}, Le/e/a/CastControls218;->access$1(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    # invokes: Le/e/a/CastControls218;->showComments(Ljava/lang/Object;)V
    invoke-static {v0}, Le/e/a/CastControls218;->access$3(Ljava/lang/Object;)V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_18} :catch_19

    goto :goto_21

    :catch_19
    move-exception v0

    .line 39
    const-string v1, "nicoid-cast"

    const-string v2, "Cannot update Cast comment list"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_21
    :goto_21
    return-void
.end method
