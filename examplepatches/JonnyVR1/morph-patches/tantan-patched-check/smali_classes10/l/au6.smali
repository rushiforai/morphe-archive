.class public Ll/au6;
.super Ll/bzm;
.source "SourceFile"


# instance fields
.field public b:Ll/kbt;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bzm;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kbt;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/kbt;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/au6;->b:Ll/kbt;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Ll/ur4;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/yc60;->b()Ll/ftf0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/ftf0;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    const-string p0, "connect"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/yc60;->f(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {v1}, Ll/ftf0;->g()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/ftf0;->e()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    :cond_1
    iget-object p0, p0, Ll/au6;->b:Ll/kbt;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/yc60;->a()[B

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p0, v2}, Ll/kbt;->a([B)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->getMsgId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v2}, Ll/yc60;->f(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/smc0;->c()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;->a()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Ll/smc0;->m()Ll/vzv;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    new-instance v3, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v0, "ConvertInterceptor received message type:"

    .line 79
    .line 80
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->getMsgTypeName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v2, p0}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    :goto_0
    invoke-virtual {v1}, Ll/ftf0;->g()Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-eqz p0, :cond_3

    .line 102
    .line 103
    instance-of p0, v1, Ll/myt;

    .line 104
    .line 105
    if-eqz p0, :cond_3

    .line 106
    .line 107
    check-cast v1, Ll/myt;

    .line 108
    .line 109
    invoke-virtual {v1}, Ll/myt;->k()Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_3

    .line 114
    .line 115
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0}, Ll/smc0;->f()Ll/jx5;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Ll/jx5;->z()V

    .line 124
    .line 125
    .line 126
    :cond_3
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-interface {p1, p0}, Ll/ur4;->a(Ll/yc60;)Ll/ur4;

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public b(Ll/ur4;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/ur4;->call()Ll/qy3;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Ll/rct;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/yc60;->a()[B

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->parseFrom([B)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/smc0;->m()Ll/vzv;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "ConvertInterceptor send message:"

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->getMsgTypeName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-interface {p1, p0}, Ll/ur4;->a(Ll/yc60;)Ll/ur4;

    .line 55
    .line 56
    .line 57
    return-void
.end method
