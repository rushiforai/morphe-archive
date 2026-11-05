.class Le/e/a/Quality195$1$1;
.super Ljava/lang/Object;
.source "Quality195.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Quality195$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/Quality195$1;

.field private final synthetic val$current:Le/e/a/Quality195$State;

.field private final synthetic val$generation:I

.field private final synthetic val$model:Ljava/lang/Object;

.field private final synthetic val$owner:Ljava/lang/Object;

.field private final synthetic val$player:Ljava/lang/Object;

.field private final synthetic val$popup:Z

.field private final synthetic val$previous:I

.field private final synthetic val$url:Ljava/lang/String;

.field private final synthetic val$video:Ljava/lang/String;


# direct methods
.method constructor <init>(Le/e/a/Quality195$1;Ljava/lang/Object;Le/e/a/Quality195$State;IZLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 11

    .line 83
    iput-object p1, p0, Le/e/a/Quality195$1$1;->this$1:Le/e/a/Quality195$1;

    iput-object p2, p0, Le/e/a/Quality195$1$1;->val$owner:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/Quality195$1$1;->val$current:Le/e/a/Quality195$State;

    iput p4, p0, Le/e/a/Quality195$1$1;->val$generation:I

    iput-boolean p5, p0, Le/e/a/Quality195$1$1;->val$popup:Z

    iput-object p6, p0, Le/e/a/Quality195$1$1;->val$player:Ljava/lang/Object;

    iput-object p7, p0, Le/e/a/Quality195$1$1;->val$video:Ljava/lang/String;

    iput-object p8, p0, Le/e/a/Quality195$1$1;->val$url:Ljava/lang/String;

    iput-object p9, p0, Le/e/a/Quality195$1$1;->val$model:Ljava/lang/Object;

    iput p10, p0, Le/e/a/Quality195$1$1;->val$previous:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .line 85
    const/4 v0, 0x0

    :try_start_1
    # getter for: Le/e/a/Quality195;->STATES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/Quality195;->access$1()Ljava/util/WeakHashMap;

    move-result-object v1

    iget-object v2, p0, Le/e/a/Quality195$1$1;->val$owner:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Le/e/a/Quality195$1$1;->val$current:Le/e/a/Quality195$State;

    if-ne v1, v2, :cond_12d

    iget v1, v2, Le/e/a/Quality195$State;->generation:I

    iget v2, p0, Le/e/a/Quality195$1$1;->val$generation:I

    if-ne v1, v2, :cond_12d

    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$owner:Ljava/lang/Object;

    iget-boolean v2, p0, Le/e/a/Quality195$1$1;->val$popup:Z
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_19} :catch_12e

    const-string v3, "e"

    if-eqz v2, :cond_1f

    move-object v2, v3

    goto :goto_21

    :cond_1f
    :try_start_1f
    const-string v2, "a0"

    :goto_21
    # invokes: Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v1, v2}, Le/e/a/Quality195;->access$2(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Le/e/a/Quality195$1$1;->val$player:Ljava/lang/Object;

    if-ne v1, v2, :cond_12d

    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$video:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/Quality195$1$1;->val$owner:Ljava/lang/Object;

    iget-boolean v4, p0, Le/e/a/Quality195$1$1;->val$popup:Z

    if-eqz v4, :cond_34

    const-string v4, "f"

    goto :goto_36

    :cond_34
    const-string v4, "b0"

    :goto_36
    # invokes: Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v2, v4}, Le/e/a/Quality195;->access$2(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_42

    goto/16 :goto_12d

    .line 86
    :cond_42
    iget-boolean v1, p0, Le/e/a/Quality195$1$1;->val$popup:Z

    if-nez v1, :cond_51

    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$owner:Ljava/lang/Object;

    const-string v2, "x1"

    # invokes: Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v1, v2}, Le/e/a/Quality195;->access$2(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_51

    return-void

    .line 87
    :cond_51
    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$url:Ljava/lang/String;

    if-eqz v1, :cond_115

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5d

    goto/16 :goto_115

    .line 88
    :cond_5d
    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$current:Le/e/a/Quality195$State;

    iget-object v2, p0, Le/e/a/Quality195$1$1;->val$player:Ljava/lang/Object;

    const-string v3, "getCurrentPosition"

    new-array v4, v0, [Ljava/lang/Class;

    new-array v5, v0, [Ljava/lang/Object;

    # invokes: Le/e/a/Quality195;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v2, v3, v4, v5}, Le/e/a/Quality195;->access$6(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    iput-wide v2, v1, Le/e/a/Quality195$State;->position:J

    .line 89
    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$current:Le/e/a/Quality195$State;

    iget-object v2, p0, Le/e/a/Quality195$1$1;->val$player:Ljava/lang/Object;

    const-string v3, "isPlaying"

    new-array v4, v0, [Ljava/lang/Class;

    new-array v5, v0, [Ljava/lang/Object;

    # invokes: Le/e/a/Quality195;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v2, v3, v4, v5}, Le/e/a/Quality195;->access$6(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iput-boolean v2, v1, Le/e/a/Quality195$State;->resume:Z

    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$current:Le/e/a/Quality195$State;

    iget-object v2, p0, Le/e/a/Quality195$1$1;->val$video:Ljava/lang/String;

    iput-object v2, v1, Le/e/a/Quality195$State;->video:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$current:Le/e/a/Quality195$State;

    new-instance v2, Ljava/lang/ref/WeakReference;

    iget-object v3, p0, Le/e/a/Quality195$1$1;->val$player:Ljava/lang/Object;

    invoke-direct {v2, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, v1, Le/e/a/Quality195$State;->player:Ljava/lang/ref/WeakReference;

    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$current:Le/e/a/Quality195$State;

    const/4 v2, 0x1

    iput-boolean v2, v1, Le/e/a/Quality195$State;->pending:Z

    .line 90
    iget-boolean v1, p0, Le/e/a/Quality195$1$1;->val$popup:Z

    const-wide/16 v3, 0x0

    const-wide/32 v5, 0x7fffffff

    if-eqz v1, :cond_d9

    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$owner:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v7, "t0"

    invoke-virtual {v1, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    iget-object v7, p0, Le/e/a/Quality195$1$1;->val$current:Le/e/a/Quality195$State;

    iget-wide v7, v7, Le/e/a/Quality195$State;->position:J

    invoke-static {v3, v4, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v4, v3

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$owner:Ljava/lang/Object;

    const-string v3, "c"

    new-array v4, v2, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    aput-object v5, v4, v0

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v5, p0, Le/e/a/Quality195$1$1;->val$url:Ljava/lang/String;

    aput-object v5, v2, v0

    # invokes: Le/e/a/Quality195;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v1, v3, v4, v2}, Le/e/a/Quality195;->access$6(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_108

    .line 91
    :cond_d9
    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$owner:Ljava/lang/Object;

    const-string v7, "k0"

    iget-object v8, p0, Le/e/a/Quality195$1$1;->val$current:Le/e/a/Quality195$State;

    iget-wide v8, v8, Le/e/a/Quality195$State;->position:J

    invoke-static {v3, v4, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v4, v3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    # invokes: Le/e/a/Quality195;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    invoke-static {v1, v7, v3}, Le/e/a/Quality195;->access$3(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$player:Ljava/lang/Object;

    const-string v3, "setVideoURI"

    new-array v4, v2, [Ljava/lang/Class;

    const-class v5, Landroid/net/Uri;

    aput-object v5, v4, v0

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v5, p0, Le/e/a/Quality195$1$1;->val$url:Ljava/lang/String;

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    aput-object v5, v2, v0

    # invokes: Le/e/a/Quality195;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v1, v3, v4, v2}, Le/e/a/Quality195;->access$6(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    :goto_108
    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$owner:Ljava/lang/Object;

    iget-boolean v2, p0, Le/e/a/Quality195$1$1;->val$popup:Z

    # invokes: Le/e/a/Quality195;->update(Ljava/lang/Object;Z)V
    invoke-static {v1, v2}, Le/e/a/Quality195;->access$4(Ljava/lang/Object;Z)V

    const-string v1, "Quality: replacing legacy single-variant source"

    # invokes: Le/e/a/Quality195;->log(Ljava/lang/String;)V
    invoke-static {v1}, Le/e/a/Quality195;->access$5(Ljava/lang/String;)V

    .line 93
    goto :goto_153

    .line 87
    :cond_115
    :goto_115
    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$model:Ljava/lang/Object;

    iget v2, p0, Le/e/a/Quality195$1$1;->val$previous:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    # invokes: Le/e/a/Quality195;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    invoke-static {v1, v3, v2}, Le/e/a/Quality195;->access$3(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Le/e/a/Quality195$1$1;->val$owner:Ljava/lang/Object;

    iget-boolean v2, p0, Le/e/a/Quality195$1$1;->val$popup:Z

    # invokes: Le/e/a/Quality195;->update(Ljava/lang/Object;Z)V
    invoke-static {v1, v2}, Le/e/a/Quality195;->access$4(Ljava/lang/Object;Z)V

    const-string v1, "Quality: session acquisition failed"

    # invokes: Le/e/a/Quality195;->log(Ljava/lang/String;)V
    invoke-static {v1}, Le/e/a/Quality195;->access$5(Ljava/lang/String;)V
    :try_end_12c
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_12c} :catch_12e

    return-void

    .line 85
    :cond_12d
    :goto_12d
    return-void

    .line 93
    :catch_12e
    move-exception v1

    iget-object v2, p0, Le/e/a/Quality195$1$1;->val$current:Le/e/a/Quality195$State;

    iput-boolean v0, v2, Le/e/a/Quality195$State;->pending:Z

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Quality: replacement failed ("

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Le/e/a/Quality195;->log(Ljava/lang/String;)V
    invoke-static {v0}, Le/e/a/Quality195;->access$5(Ljava/lang/String;)V

    .line 94
    :goto_153
    return-void
.end method
