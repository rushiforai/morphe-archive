.class Ll/koh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/koh0;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/koh0;


# direct methods
.method public constructor <init>(Ll/koh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/koh0$a;->a:Ll/koh0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    :goto_0
    iget-object v0, p0, Ll/koh0$a;->a:Ll/koh0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/koh0;->a(Ll/koh0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ll/koh0$a;->a:Ll/koh0;

    .line 9
    .line 10
    invoke-static {v1}, Ll/koh0;->b(Ll/koh0;)Ll/aje;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_3

    .line 20
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    const-string v0, "SDKResource"

    .line 22
    .line 23
    const-string v2, "\u5f00\u59cb\u4e0b\u8f7d\u8d44\u6e90: %s"

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/aje;->b()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-static {v0, v2, v3}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/koh0$a;->a:Ll/koh0;

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    invoke-static {v0, v1, v2}, Ll/koh0;->c(Ll/koh0;Ll/aje;Z)Ll/xr4;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/xr4;->c()Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const-string v3, "SDKResource"

    .line 48
    .line 49
    const-string v4, "\u5b8c\u6210\u8d44\u6e90\u4e0b\u8f7d(%s): %s"

    .line 50
    .line 51
    if-nez v2, :cond_1

    .line 52
    .line 53
    const-string v2, "\u6210\u529f"

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    const-string v2, "\u5931\u8d25"

    .line 57
    .line 58
    :goto_1
    invoke-virtual {v1}, Ll/aje;->b()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    filled-new-array {v2, v5}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v3, v4, v2}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Ll/koh0$a;->a:Ll/koh0;

    .line 70
    .line 71
    invoke-static {v2}, Ll/koh0;->a(Ll/koh0;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    monitor-enter v2

    .line 76
    :try_start_1
    iget-object v3, p0, Ll/koh0$a;->a:Ll/koh0;

    .line 77
    .line 78
    invoke-static {v3, v0, v1}, Ll/koh0;->d(Ll/koh0;Ll/xr4;Ll/aje;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/koh0$a;->a:Ll/koh0;

    .line 82
    .line 83
    invoke-static {v0}, Ll/koh0;->e(Ll/koh0;)Ljava/util/Map;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_2

    .line 92
    .line 93
    monitor-exit v2

    .line 94
    return-void

    .line 95
    :catchall_1
    move-exception p0

    .line 96
    goto :goto_2

    .line 97
    :cond_2
    monitor-exit v2

    .line 98
    goto :goto_0

    .line 99
    :goto_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 100
    throw p0

    .line 101
    :goto_3
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 102
    throw p0
.end method
