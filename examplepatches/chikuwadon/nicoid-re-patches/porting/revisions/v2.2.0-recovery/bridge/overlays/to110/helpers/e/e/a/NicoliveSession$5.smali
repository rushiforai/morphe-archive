.class Le/e/a/NicoliveSession$5;
.super Ljava/lang/Object;
.source "NicoliveSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/NicoliveSession;->post(Ljava/lang/String;JZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/NicoliveSession;


# direct methods
.method constructor <init>(Le/e/a/NicoliveSession;)V
    .registers 2

    .line 63
    iput-object p1, p0, Le/e/a/NicoliveSession$5;->this$0:Le/e/a/NicoliveSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 63
    iget-object v0, p0, Le/e/a/NicoliveSession$5;->this$0:Le/e/a/NicoliveSession;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Le/e/a/NicoliveSession$5;->this$0:Le/e/a/NicoliveSession;

    iget-boolean v1, v1, Le/e/a/NicoliveSession;->posting:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Le/e/a/NicoliveSession$5;->this$0:Le/e/a/NicoliveSession;

    const/4 v2, 0x0

    iput-boolean v2, v1, Le/e/a/NicoliveSession;->posting:Z

    iget-object p0, p0, Le/e/a/NicoliveSession$5;->this$0:Le/e/a/NicoliveSession;

    iget-object p0, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    const-string/jumbo v1, "\u9001\u4fe1\u7d50\u679c\u3092\u78ba\u8a8d\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u6295\u7a3f\u6e08\u307f\u304b\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {p0, v2, v1}, Le/e/a/NicoliveSession$Listener;->posted(ZLjava/lang/String;)V

    :cond_0
    monitor-exit v0

    return-void

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method
