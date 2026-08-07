.class Lcn/shuzilm/core/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/l;->a:Landroid/content/Context;

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
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcn/shuzilm/core/l;->a:Landroid/content/Context;

    .line 3
    .line 4
    const-string v1, "du.lock"

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 11
    :try_start_1
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->tryLock()Ljava/nio/channels/FileLock;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    goto :goto_3

    .line 28
    :cond_0
    const/4 v1, 0x1

    .line 29
    invoke-static {v1}, Lcn/shuzilm/core/DUHelper;->a(I)V

    .line 30
    .line 31
    .line 32
    sget-object v2, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {v2}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 35
    .line 36
    .line 37
    :try_start_2
    const-string v2, "du"

    .line 38
    .line 39
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->a()Lcn/shuzilm/core/DUHelper;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v2}, Lcn/shuzilm/core/DUHelper;->a(Lcn/shuzilm/core/DUHelper;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_2

    .line 51
    .line 52
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    if-nez v2, :cond_1

    .line 57
    .line 58
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catchall_0
    move-exception v1

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    :goto_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 65
    .line 66
    .line 67
    :cond_2
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->a()Lcn/shuzilm/core/DUHelper;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v2, v1}, Lcn/shuzilm/core/DUHelper;->a(Lcn/shuzilm/core/DUHelper;Z)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    .line 73
    .line 74
    goto :goto_2

    .line 75
    :goto_1
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 76
    .line 77
    .line 78
    :goto_2
    :try_start_4
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    .line 82
    .line 83
    .line 84
    goto :goto_5

    .line 85
    :catchall_1
    move-exception v1

    .line 86
    goto :goto_4

    .line 87
    :cond_3
    :goto_3
    if-eqz v0, :cond_4

    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V

    .line 90
    .line 91
    .line 92
    :cond_4
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :catchall_2
    move-exception v1

    .line 97
    move-object p0, v0

    .line 98
    :goto_4
    :try_start_5
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 99
    .line 100
    .line 101
    if-eqz v0, :cond_5

    .line 102
    .line 103
    :try_start_6
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V

    .line 104
    .line 105
    .line 106
    :cond_5
    if-eqz p0, :cond_6

    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 109
    .line 110
    .line 111
    :catchall_3
    :cond_6
    :goto_5
    return-void

    .line 112
    :catchall_4
    move-exception v1

    .line 113
    if-eqz v0, :cond_7

    .line 114
    .line 115
    :try_start_7
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V

    .line 116
    .line 117
    .line 118
    :cond_7
    if-eqz p0, :cond_8

    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 121
    .line 122
    .line 123
    :catchall_5
    :cond_8
    throw v1
.end method
