.class Le/e/a/Quality195$1;
.super Ljava/lang/Object;
.source "Quality195.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Quality195;->change(Ljava/lang/Object;ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$current:Le/e/a/Quality195$State;

.field private final synthetic val$generation:I

.field private final synthetic val$model:Ljava/lang/Object;

.field private final synthetic val$owner:Ljava/lang/Object;

.field private final synthetic val$player:Ljava/lang/Object;

.field private final synthetic val$popup:Z

.field private final synthetic val$previous:I

.field private final synthetic val$video:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Le/e/a/Quality195$State;IIZLjava/lang/Object;)V
    .registers 9

    .line 80
    iput-object p1, p0, Le/e/a/Quality195$1;->val$model:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/Quality195$1;->val$video:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/Quality195$1;->val$owner:Ljava/lang/Object;

    iput-object p4, p0, Le/e/a/Quality195$1;->val$current:Le/e/a/Quality195$State;

    iput p5, p0, Le/e/a/Quality195$1;->val$generation:I

    iput p6, p0, Le/e/a/Quality195$1;->val$previous:I

    iput-boolean p7, p0, Le/e/a/Quality195$1;->val$popup:Z

    iput-object p8, p0, Le/e/a/Quality195$1;->val$player:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 14

    .line 82
    :try_start_0
    const-string v0, "e.e.a.ModernPlayback"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "stream"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    iget-object v4, p0, Le/e/a/Quality195$1;->val$model:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/Quality195$1;->val$model:Ljava/lang/Object;

    aput-object v2, v1, v5

    iget-object v2, p0, Le/e/a/Quality195$1;->val$video:Ljava/lang/String;

    aput-object v2, v1, v6

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Ljava/lang/String;

    .line 83
    # getter for: Le/e/a/Quality195;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/Quality195;->access$0()Landroid/os/Handler;

    move-result-object v0

    new-instance v12, Le/e/a/Quality195$1$1;

    iget-object v3, p0, Le/e/a/Quality195$1;->val$owner:Ljava/lang/Object;

    iget-object v4, p0, Le/e/a/Quality195$1;->val$current:Le/e/a/Quality195$State;

    iget v5, p0, Le/e/a/Quality195$1;->val$generation:I

    iget-boolean v6, p0, Le/e/a/Quality195$1;->val$popup:Z

    iget-object v7, p0, Le/e/a/Quality195$1;->val$player:Ljava/lang/Object;

    iget-object v8, p0, Le/e/a/Quality195$1;->val$video:Ljava/lang/String;

    iget-object v10, p0, Le/e/a/Quality195$1;->val$model:Ljava/lang/Object;

    iget v11, p0, Le/e/a/Quality195$1;->val$previous:I

    move-object v1, v12

    move-object v2, p0

    invoke-direct/range {v1 .. v11}, Le/e/a/Quality195$1$1;-><init>(Le/e/a/Quality195$1;Ljava/lang/Object;Le/e/a/Quality195$State;IZLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;I)V

    invoke-virtual {v0, v12}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4d} :catch_4e

    .line 95
    goto :goto_69

    :catch_4e
    move-exception v0

    # getter for: Le/e/a/Quality195;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/Quality195;->access$0()Landroid/os/Handler;

    move-result-object v0

    new-instance v9, Le/e/a/Quality195$1$2;

    iget-object v3, p0, Le/e/a/Quality195$1;->val$owner:Ljava/lang/Object;

    iget-object v4, p0, Le/e/a/Quality195$1;->val$current:Le/e/a/Quality195$State;

    iget v5, p0, Le/e/a/Quality195$1;->val$generation:I

    iget-object v6, p0, Le/e/a/Quality195$1;->val$model:Ljava/lang/Object;

    iget v7, p0, Le/e/a/Quality195$1;->val$previous:I

    iget-boolean v8, p0, Le/e/a/Quality195$1;->val$popup:Z

    move-object v1, v9

    move-object v2, p0

    invoke-direct/range {v1 .. v8}, Le/e/a/Quality195$1$2;-><init>(Le/e/a/Quality195$1;Ljava/lang/Object;Le/e/a/Quality195$State;ILjava/lang/Object;IZ)V

    invoke-virtual {v0, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 96
    :goto_69
    return-void
.end method
