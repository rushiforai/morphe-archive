.class Lcom/immomo/moment/mediautils/o$e;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/o;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/o;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    packed-switch v0, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :pswitch_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 9
    .line 10
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-static {p0, p1}, Lcom/immomo/moment/mediautils/o;->k(Lcom/immomo/moment/mediautils/o;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :pswitch_1
    iget-object p1, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/immomo/moment/mediautils/o;->h(Lcom/immomo/moment/mediautils/o;)V

    .line 25
    .line 26
    .line 27
    const-string p1, "EditProcess"

    .line 28
    .line 29
    const-string v0, "MediaSourceManager resetWorking"

    .line 30
    .line 31
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/immomo/moment/mediautils/o;->i(Lcom/immomo/moment/mediautils/o;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    monitor-enter p1

    .line 41
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/immomo/moment/mediautils/o;->j(Lcom/immomo/moment/mediautils/o;Z)Z

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 47
    .line 48
    invoke-static {p0}, Lcom/immomo/moment/mediautils/o;->i(Lcom/immomo/moment/mediautils/o;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 53
    .line 54
    .line 55
    monitor-exit p1

    .line 56
    return-void

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0

    .line 60
    :pswitch_2
    const-string p1, "EditProcess"

    .line 61
    .line 62
    const-string v0, "MediaSourceManager seekWorking"

    .line 63
    .line 64
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/immomo/moment/mediautils/o;->e(Lcom/immomo/moment/mediautils/o;)J

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    invoke-static {p1, v0, v1}, Lcom/immomo/moment/mediautils/o;->g(Lcom/immomo/moment/mediautils/o;J)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 77
    .line 78
    const-wide/16 v0, 0x0

    .line 79
    .line 80
    invoke-static {p0, v0, v1}, Lcom/immomo/moment/mediautils/o;->f(Lcom/immomo/moment/mediautils/o;J)J

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :pswitch_3
    const-string p1, "EditProcess"

    .line 85
    .line 86
    const-string v0, "MediaSourceManager resumeWorking"

    .line 87
    .line 88
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 92
    .line 93
    invoke-static {p0}, Lcom/immomo/moment/mediautils/o;->c(Lcom/immomo/moment/mediautils/o;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :pswitch_4
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 98
    .line 99
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast p1, Ljava/lang/Boolean;

    .line 102
    .line 103
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    invoke-static {v0, p1}, Lcom/immomo/moment/mediautils/o;->u(Lcom/immomo/moment/mediautils/o;Z)V

    .line 108
    .line 109
    .line 110
    const-string p1, "EditProcess"

    .line 111
    .line 112
    const-string v0, "MediaSourceManager pauseWorking"

    .line 113
    .line 114
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 118
    .line 119
    invoke-static {p0, v1}, Lcom/immomo/moment/mediautils/o;->v(Lcom/immomo/moment/mediautils/o;Z)Z

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :pswitch_5
    const-string p1, "EditProcess"

    .line 124
    .line 125
    const-string v0, "MediaSourceManager changeSource"

    .line 126
    .line 127
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$e;->a:Lcom/immomo/moment/mediautils/o;

    .line 131
    .line 132
    invoke-static {p0}, Lcom/immomo/moment/mediautils/o;->t(Lcom/immomo/moment/mediautils/o;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    nop

    .line 137
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
