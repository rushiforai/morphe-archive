.class Lcn/shuzilm/core/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Lcn/shuzilm/core/Listener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcn/shuzilm/core/Listener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/j;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p2, p0, Lcn/shuzilm/core/j;->b:Lcn/shuzilm/core/Listener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    :try_start_0
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->a()Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcn/shuzilm/core/DUHelper;->a(Lcn/shuzilm/core/DUHelper;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "du"

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    :catchall_0
    :cond_0
    iget-object v0, p0, Lcn/shuzilm/core/j;->a:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v0}, Lcn/shuzilm/core/dl;->ia(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcn/shuzilm/core/j;->b:Lcn/shuzilm/core/Listener;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcn/shuzilm/core/j;->a:Landroid/content/Context;

    .line 26
    .line 27
    const/16 v1, 0x12d

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-static {v0, v1, v2}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, ""

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    const/16 v2, 0x2b

    .line 39
    .line 40
    const/16 v3, 0x2d

    .line 41
    .line 42
    :try_start_1
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const/16 v3, 0x2f

    .line 47
    .line 48
    const/16 v4, 0x5f

    .line 49
    .line 50
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v2, "="

    .line 55
    .line 56
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 60
    :catch_0
    iget-object p0, p0, Lcn/shuzilm/core/j;->b:Lcn/shuzilm/core/Listener;

    .line 61
    .line 62
    invoke-interface {p0, v0}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    iget-object p0, p0, Lcn/shuzilm/core/j;->b:Lcn/shuzilm/core/Listener;

    .line 67
    .line 68
    invoke-interface {p0, v1}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_0
    return-void
.end method
