.class Lcn/shuzilm/core/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Z

.field final synthetic c:I

.field final synthetic d:Lcn/shuzilm/core/Listener;

.field final synthetic e:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;ZILcn/shuzilm/core/Listener;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/e;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcn/shuzilm/core/e;->b:Z

    .line 4
    .line 5
    iput p3, p0, Lcn/shuzilm/core/e;->c:I

    .line 6
    .line 7
    iput-object p4, p0, Lcn/shuzilm/core/e;->d:Lcn/shuzilm/core/Listener;

    .line 8
    .line 9
    iput-object p5, p0, Lcn/shuzilm/core/e;->e:Landroid/content/Context;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    const-string v0, "NA"

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->b()Ljava/util/concurrent/locks/Lock;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->c()Lcn/shuzilm/core/AIClient;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x2

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Lcn/shuzilm/core/AIClient;

    .line 18
    .line 19
    iget-object v3, p0, Lcn/shuzilm/core/e;->a:Landroid/content/Context;

    .line 20
    .line 21
    invoke-direct {v1, v3}, Lcn/shuzilm/core/AIClient;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Lcn/shuzilm/core/DUHelper;->a(Lcn/shuzilm/core/AIClient;)Lcn/shuzilm/core/AIClient;

    .line 25
    .line 26
    .line 27
    iget-boolean v1, p0, Lcn/shuzilm/core/e;->b:Z

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->c()Lcn/shuzilm/core/AIClient;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1, v2}, Lcn/shuzilm/core/AIClient;->asynAI(I)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception v1

    .line 40
    goto :goto_3

    .line 41
    :cond_0
    :goto_0
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->c()Lcn/shuzilm/core/AIClient;

    .line 42
    .line 43
    .line 44
    sget-boolean v1, Lcn/shuzilm/core/AIClient;->isf:Z

    .line 45
    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    iget-boolean v1, p0, Lcn/shuzilm/core/e;->b:Z

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->c()Lcn/shuzilm/core/AIClient;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1, v2}, Lcn/shuzilm/core/AIClient;->asynAI(I)V

    .line 57
    .line 58
    .line 59
    :cond_1
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->c()Lcn/shuzilm/core/AIClient;

    .line 60
    .line 61
    .line 62
    sget-boolean v1, Lcn/shuzilm/core/AIClient;->isf:Z

    .line 63
    .line 64
    if-nez v1, :cond_3

    .line 65
    .line 66
    iget-boolean v1, p0, Lcn/shuzilm/core/e;->b:Z

    .line 67
    .line 68
    if-nez v1, :cond_2

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    iget-object v1, p0, Lcn/shuzilm/core/e;->d:Lcn/shuzilm/core/Listener;

    .line 72
    .line 73
    invoke-interface {v1, v0}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_3
    :goto_1
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iget v2, p0, Lcn/shuzilm/core/e;->c:I

    .line 84
    .line 85
    const/4 v3, 0x1

    .line 86
    if-ne v2, v3, :cond_4

    .line 87
    .line 88
    const-string v1, "HUAWEI"

    .line 89
    .line 90
    :cond_4
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->c()Lcn/shuzilm/core/AIClient;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v2, v1}, Lcn/shuzilm/core/AIClient;->cm(Ljava/lang/String;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget-object v2, p0, Lcn/shuzilm/core/e;->a:Landroid/content/Context;

    .line 99
    .line 100
    invoke-static {v2, v1}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    if-nez v1, :cond_5

    .line 105
    .line 106
    move-object v1, v0

    .line 107
    :cond_5
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->c()Lcn/shuzilm/core/AIClient;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    const/4 v3, 0x3

    .line 112
    invoke-virtual {v2, v3}, Lcn/shuzilm/core/AIClient;->isOaidCollectAllowed(I)Z

    .line 113
    .line 114
    .line 115
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    iget-object v3, p0, Lcn/shuzilm/core/e;->d:Lcn/shuzilm/core/Listener;

    .line 117
    .line 118
    if-nez v2, :cond_6

    .line 119
    .line 120
    :try_start_1
    invoke-interface {v3, v0}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_6
    invoke-interface {v3, v1}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    .line 126
    .line 127
    :goto_2
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->b()Ljava/util/concurrent/locks/Lock;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Lcn/shuzilm/core/e;->e:Landroid/content/Context;

    .line 135
    .line 136
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->b(Landroid/content/Context;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :goto_3
    :try_start_2
    iget-object v2, p0, Lcn/shuzilm/core/e;->d:Lcn/shuzilm/core/Listener;

    .line 141
    .line 142
    if-eqz v2, :cond_7

    .line 143
    .line 144
    invoke-interface {v2, v0}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    goto :goto_4

    .line 148
    :catchall_1
    move-exception v0

    .line 149
    goto :goto_5

    .line 150
    :cond_7
    :goto_4
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 151
    .line 152
    .line 153
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->b()Ljava/util/concurrent/locks/Lock;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 158
    .line 159
    .line 160
    iget-object p0, p0, Lcn/shuzilm/core/e;->e:Landroid/content/Context;

    .line 161
    .line 162
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->b(Landroid/content/Context;)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :goto_5
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->b()Ljava/util/concurrent/locks/Lock;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 171
    .line 172
    .line 173
    iget-object p0, p0, Lcn/shuzilm/core/e;->e:Landroid/content/Context;

    .line 174
    .line 175
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->b(Landroid/content/Context;)V

    .line 176
    .line 177
    .line 178
    throw v0
.end method
