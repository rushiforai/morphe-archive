.class public Lcom/p1/mobile/putong/api/WebSocketManager$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/WebSocketManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/WebSocketManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/api/WebSocketManager$a;Lcom/p1/mobile/putong/data/Connector;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$a;->c(Lcom/p1/mobile/putong/data/Connector;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/api/WebSocketManager$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$a;->d(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final synthetic c(Lcom/p1/mobile/putong/data/Connector;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->n(Lcom/p1/mobile/putong/api/WebSocketManager;Lcom/p1/mobile/putong/data/Connector;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->i(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/data/Connector;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->i(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/data/Connector;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->i(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/data/Connector;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 31
    .line 32
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/ConnectorConfig;->use_thirdparty_push:Z

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ll/cmb0;->d0(Z)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    sget-object v0, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CLOSE:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 46
    .line 47
    if-ne p1, v0, :cond_1

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 51
    .line 52
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->i(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/data/Connector;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 57
    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    invoke-static {v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->u(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 64
    .line 65
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->v(Lcom/p1/mobile/putong/api/WebSocketManager;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 74
    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->m0(Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->r(Lcom/p1/mobile/putong/api/WebSocketManager;Ljava/lang/String;)Ll/isp0;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->o(Lcom/p1/mobile/putong/api/WebSocketManager;Ll/isp0;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_3
    invoke-static {v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->y(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->DISCONNECTED:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->m0(Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->y(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->FORBIDDEN:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 8
    .line 9
    if-eq v0, v1, :cond_3

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CONNECTING:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 12
    .line 13
    if-eq v0, v1, :cond_3

    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CLOSE:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 16
    .line 17
    if-ne v0, v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->k(Lcom/p1/mobile/putong/api/WebSocketManager;)Ll/isp0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->k(Lcom/p1/mobile/putong/api/WebSocketManager;)Ll/isp0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Ll/isp0;->release()V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/api/WebSocketManager;->g:Ljava/util/Queue;

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->m(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->m0(Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->v(Lcom/p1/mobile/putong/api/WebSocketManager;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 72
    .line 73
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->r(Lcom/p1/mobile/putong/api/WebSocketManager;Ljava/lang/String;)Ll/isp0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->o(Lcom/p1/mobile/putong/api/WebSocketManager;Ll/isp0;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    sget-object v0, Ll/uqb0;->U:Ll/w1w;

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->U()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {v0, v1}, Ll/w1w;->C(I)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 94
    .line 95
    invoke-static {v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->m(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {v1}, Ll/qxk;->a(Landroid/os/Handler;)Ll/qxk;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/tsp0;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/tsp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager$a;)V

    .line 110
    .line 111
    .line 112
    new-instance v2, Ll/usp0;

    .line 113
    .line 114
    invoke-direct {v2, p0}, Ll/usp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager$a;)V

    .line 115
    .line 116
    .line 117
    const/4 p0, 0x0

    .line 118
    invoke-static {v1, v2, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    :cond_3
    :goto_0
    return-void
.end method
