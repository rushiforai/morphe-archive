.class Le/e/a/NicoliveSession$3;
.super Ljava/lang/Object;
.source "NicoliveSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/NicoliveSession;->message(Lnicoid/network238/okhttp3/WebSocket;Lorg/json/JSONObject;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/NicoliveSession;

.field private final synthetic val$token:I

.field private final synthetic val$view:Ljava/lang/String;


# direct methods
.method constructor <init>(Le/e/a/NicoliveSession;ILjava/lang/String;)V
    .registers 4

    .line 47
    iput-object p1, p0, Le/e/a/NicoliveSession$3;->this$0:Le/e/a/NicoliveSession;

    iput p2, p0, Le/e/a/NicoliveSession$3;->val$token:I

    iput-object p3, p0, Le/e/a/NicoliveSession$3;->val$view:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    const/4 v0, -0x1

    .line 47
    :try_start_0
    iget-object v1, p0, Le/e/a/NicoliveSession$3;->this$0:Le/e/a/NicoliveSession;

    iget-object v2, p0, Le/e/a/NicoliveSession$3;->val$view:Ljava/lang/String;

    iget v3, p0, Le/e/a/NicoliveSession$3;->val$token:I

    invoke-virtual {v1, v2, v3}, Le/e/a/NicoliveSession;->comments(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    iget-object v1, p0, Le/e/a/NicoliveSession$3;->this$0:Le/e/a/NicoliveSession;

    monitor-enter v1

    :try_start_1
    iget-object v2, p0, Le/e/a/NicoliveSession$3;->this$0:Le/e/a/NicoliveSession;

    iget v2, v2, Le/e/a/NicoliveSession;->commentGeneration:I

    iget v3, p0, Le/e/a/NicoliveSession$3;->val$token:I

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Le/e/a/NicoliveSession$3;->this$0:Le/e/a/NicoliveSession;

    iget-object v2, v2, Le/e/a/NicoliveSession;->commentView:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/NicoliveSession$3;->val$view:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object p0, p0, Le/e/a/NicoliveSession$3;->this$0:Le/e/a/NicoliveSession;

    iput v0, p0, Le/e/a/NicoliveSession;->commentGeneration:I

    :cond_0
    monitor-exit v1

    return-void

    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0

    :catchall_1
    move-exception v1

    iget-object v2, p0, Le/e/a/NicoliveSession$3;->this$0:Le/e/a/NicoliveSession;

    monitor-enter v2

    :try_start_2
    iget-object v3, p0, Le/e/a/NicoliveSession$3;->this$0:Le/e/a/NicoliveSession;

    iget v3, v3, Le/e/a/NicoliveSession;->commentGeneration:I

    iget v4, p0, Le/e/a/NicoliveSession$3;->val$token:I

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Le/e/a/NicoliveSession$3;->this$0:Le/e/a/NicoliveSession;

    iget-object v3, v3, Le/e/a/NicoliveSession;->commentView:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/NicoliveSession$3;->val$view:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object p0, p0, Le/e/a/NicoliveSession$3;->this$0:Le/e/a/NicoliveSession;

    iput v0, p0, Le/e/a/NicoliveSession;->commentGeneration:I

    :cond_1
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v1

    :goto_1
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw p0

    :catchall_2
    move-exception p0

    goto :goto_1
.end method
