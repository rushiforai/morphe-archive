.class Le/e/a/Quality195$1$2;
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

.field private final synthetic val$popup:Z

.field private final synthetic val$previous:I


# direct methods
.method constructor <init>(Le/e/a/Quality195$1;Ljava/lang/Object;Le/e/a/Quality195$State;ILjava/lang/Object;IZ)V
    .registers 8

    .line 95
    iput-object p1, p0, Le/e/a/Quality195$1$2;->this$1:Le/e/a/Quality195$1;

    iput-object p2, p0, Le/e/a/Quality195$1$2;->val$owner:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/Quality195$1$2;->val$current:Le/e/a/Quality195$State;

    iput p4, p0, Le/e/a/Quality195$1$2;->val$generation:I

    iput-object p5, p0, Le/e/a/Quality195$1$2;->val$model:Ljava/lang/Object;

    iput p6, p0, Le/e/a/Quality195$1$2;->val$previous:I

    iput-boolean p7, p0, Le/e/a/Quality195$1$2;->val$popup:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 95
    :try_start_0
    # getter for: Le/e/a/Quality195;->STATES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/Quality195;->access$1()Ljava/util/WeakHashMap;

    move-result-object v0

    iget-object v1, p0, Le/e/a/Quality195$1$2;->val$owner:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Le/e/a/Quality195$1$2;->val$current:Le/e/a/Quality195$State;

    if-ne v0, v1, :cond_2a

    iget v0, v1, Le/e/a/Quality195$State;->generation:I

    iget v1, p0, Le/e/a/Quality195$1$2;->val$generation:I

    if-ne v0, v1, :cond_2a

    iget-object v0, p0, Le/e/a/Quality195$1$2;->val$model:Ljava/lang/Object;

    const-string v1, "e"

    iget v2, p0, Le/e/a/Quality195$1$2;->val$previous:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    # invokes: Le/e/a/Quality195;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    invoke-static {v0, v1, v2}, Le/e/a/Quality195;->access$3(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Le/e/a/Quality195$1$2;->val$owner:Ljava/lang/Object;

    iget-boolean v1, p0, Le/e/a/Quality195$1$2;->val$popup:Z

    # invokes: Le/e/a/Quality195;->update(Ljava/lang/Object;Z)V
    invoke-static {v0, v1}, Le/e/a/Quality195;->access$4(Ljava/lang/Object;Z)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_28} :catch_29

    goto :goto_2a

    :catch_29
    move-exception v0

    :cond_2a
    :goto_2a
    const-string v0, "Quality: acquisition failed"

    # invokes: Le/e/a/Quality195;->log(Ljava/lang/String;)V
    invoke-static {v0}, Le/e/a/Quality195;->access$5(Ljava/lang/String;)V

    return-void
.end method
