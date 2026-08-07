.class Ll/ftq0$c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ftq0$c;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/os/IBinder;

.field final synthetic b:Ll/ftq0$c;


# direct methods
.method public constructor <init>(Ll/ftq0$c;Landroid/os/IBinder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ftq0$c$a;->a:Landroid/os/IBinder;

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
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 3
    .line 4
    iget-object v1, v1, Ll/ftq0$c;->a:Ll/ftq0;

    .line 5
    .line 6
    invoke-static {v1}, Ll/ftq0;->b(Ll/ftq0;)Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 15
    .line 16
    iget-object v2, v2, Ll/ftq0$c;->a:Ll/ftq0;

    .line 17
    .line 18
    invoke-static {v2}, Ll/ftq0;->d(Ll/ftq0;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    new-instance v3, Ll/ftq0$b;

    .line 23
    .line 24
    iget-object v4, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 25
    .line 26
    iget-object v4, v4, Ll/ftq0$c;->a:Ll/ftq0;

    .line 27
    .line 28
    const/4 v5, 0x0

    .line 29
    invoke-direct {v3, v4, v5}, Ll/ftq0$b;-><init>(Ll/ftq0;Ll/ftq0$a;)V

    .line 30
    .line 31
    .line 32
    iget-object v4, p0, Ll/ftq0$c$a;->a:Landroid/os/IBinder;

    .line 33
    .line 34
    const-string v5, "OUID"

    .line 35
    .line 36
    invoke-static {v4, v1, v2, v5}, Ll/ftq0$d;->a(Landroid/os/IBinder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v3, Ll/ftq0$b;->b:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 43
    .line 44
    iget-object v1, v1, Ll/ftq0$c;->a:Ll/ftq0;

    .line 45
    .line 46
    invoke-static {v1, v3}, Ll/ftq0;->f(Ll/ftq0;Ll/ftq0$b;)Ll/ftq0$b;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 50
    .line 51
    iget-object v1, v1, Ll/ftq0$c;->a:Ll/ftq0;

    .line 52
    .line 53
    invoke-static {v1}, Ll/ftq0;->i(Ll/ftq0;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 57
    .line 58
    iget-object v1, v1, Ll/ftq0$c;->a:Ll/ftq0;

    .line 59
    .line 60
    invoke-static {v1, v0}, Ll/ftq0;->a(Ll/ftq0;I)I

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 64
    .line 65
    iget-object v0, v0, Ll/ftq0$c;->a:Ll/ftq0;

    .line 66
    .line 67
    invoke-static {v0}, Ll/ftq0;->c(Ll/ftq0;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    monitor-enter v1

    .line 72
    :try_start_1
    iget-object p0, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 73
    .line 74
    iget-object p0, p0, Ll/ftq0$c;->a:Ll/ftq0;

    .line 75
    .line 76
    invoke-static {p0}, Ll/ftq0;->c(Ll/ftq0;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :catchall_0
    move-exception p0

    .line 85
    goto :goto_1

    .line 86
    :catch_0
    :goto_0
    :try_start_2
    monitor-exit v1

    .line 87
    goto :goto_5

    .line 88
    :goto_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 89
    throw p0

    .line 90
    :catchall_1
    move-exception v1

    .line 91
    iget-object v2, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 92
    .line 93
    iget-object v2, v2, Ll/ftq0$c;->a:Ll/ftq0;

    .line 94
    .line 95
    invoke-static {v2}, Ll/ftq0;->i(Ll/ftq0;)V

    .line 96
    .line 97
    .line 98
    iget-object v2, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 99
    .line 100
    iget-object v2, v2, Ll/ftq0$c;->a:Ll/ftq0;

    .line 101
    .line 102
    invoke-static {v2, v0}, Ll/ftq0;->a(Ll/ftq0;I)I

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 106
    .line 107
    iget-object v0, v0, Ll/ftq0$c;->a:Ll/ftq0;

    .line 108
    .line 109
    invoke-static {v0}, Ll/ftq0;->c(Ll/ftq0;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    monitor-enter v2

    .line 114
    :try_start_3
    iget-object p0, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 115
    .line 116
    iget-object p0, p0, Ll/ftq0$c;->a:Ll/ftq0;

    .line 117
    .line 118
    invoke-static {p0}, Ll/ftq0;->c(Ll/ftq0;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 123
    .line 124
    .line 125
    goto :goto_2

    .line 126
    :catchall_2
    move-exception p0

    .line 127
    goto :goto_3

    .line 128
    :catch_1
    :goto_2
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 129
    throw v1

    .line 130
    :goto_3
    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 131
    throw p0

    .line 132
    :catch_2
    iget-object v1, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 133
    .line 134
    iget-object v1, v1, Ll/ftq0$c;->a:Ll/ftq0;

    .line 135
    .line 136
    invoke-static {v1}, Ll/ftq0;->i(Ll/ftq0;)V

    .line 137
    .line 138
    .line 139
    iget-object v1, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 140
    .line 141
    iget-object v1, v1, Ll/ftq0$c;->a:Ll/ftq0;

    .line 142
    .line 143
    invoke-static {v1, v0}, Ll/ftq0;->a(Ll/ftq0;I)I

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 147
    .line 148
    iget-object v0, v0, Ll/ftq0$c;->a:Ll/ftq0;

    .line 149
    .line 150
    invoke-static {v0}, Ll/ftq0;->c(Ll/ftq0;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    monitor-enter v0

    .line 155
    :try_start_6
    iget-object p0, p0, Ll/ftq0$c$a;->b:Ll/ftq0$c;

    .line 156
    .line 157
    iget-object p0, p0, Ll/ftq0$c;->a:Ll/ftq0;

    .line 158
    .line 159
    invoke-static {p0}, Ll/ftq0;->c(Ll/ftq0;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 164
    .line 165
    .line 166
    goto :goto_4

    .line 167
    :catchall_3
    move-exception p0

    .line 168
    goto :goto_6

    .line 169
    :catch_3
    :goto_4
    :try_start_7
    monitor-exit v0

    .line 170
    :goto_5
    return-void

    .line 171
    :goto_6
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 172
    throw p0
.end method
