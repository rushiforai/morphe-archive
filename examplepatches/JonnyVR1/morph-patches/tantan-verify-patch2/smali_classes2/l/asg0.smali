.class public final Ll/asg0;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/hsp0;

.field public final synthetic b:Ll/oug0;


# direct methods
.method public constructor <init>(Ll/oug0;Ll/hsp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/asg0;->b:Ll/oug0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/asg0;->a:Ll/hsp0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Exception;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/asg0;->b:Ll/oug0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/oug0;->b:Ll/nzg0;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/RuntimeException;

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "doubao error code:-1  msg:"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-direct {v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v0, v1}, Ll/nzg0;->c(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/asg0;->b:Ll/oug0;

    .line 28
    .line 29
    iget-object p0, p0, Ll/oug0;->k:Ll/uwg0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/uwg0;->l()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final run()V
    .locals 5

    .line 1
    const-string v0, "\u53d1\u9001\u8bed\u97f3\u6570\u636e\u7684\u7ebf\u7a0b\u5df2\u7ecf\u505c\u6b62"

    .line 2
    .line 3
    const-string v1, "DoubaoAsrAsyncClient"

    .line 4
    .line 5
    const-string v2, "\u53d1\u9001\u6570\u636e\u53d1\u751f\u5f02\u5e38\uff1a"

    .line 6
    .line 7
    :try_start_0
    iget-object v3, p0, Ll/asg0;->b:Ll/oug0;

    .line 8
    .line 9
    iget-object v4, p0, Ll/asg0;->a:Ll/hsp0;

    .line 10
    .line 11
    invoke-virtual {v3, v4}, Ll/oug0;->i(Ll/hsp0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :catch_0
    move-exception v3

    .line 21
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v3}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v1, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/dqg0;

    .line 41
    .line 42
    invoke-direct {v2, p0, v3}, Ll/dqg0;-><init>(Ll/asg0;Ljava/lang/Exception;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v2}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    .line 47
    .line 48
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :goto_0
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    throw p0
.end method
