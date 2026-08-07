.class public Ll/b0l;
.super Ll/bzm;
.source "SourceFile"


# instance fields
.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bzm;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b0l;->b:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/ur4;)V
    .locals 0
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
    move-result-object p0

    .line 5
    invoke-interface {p1, p0}, Ll/ur4;->a(Ll/yc60;)Ll/ur4;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(Ll/ur4;)V
    .locals 2
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
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/w6s;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "connect"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-interface {p1}, Ll/ur4;->call()Ll/qy3;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    instance-of v0, v0, Ll/mwr;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string v0, "auth"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-interface {p1}, Ll/ur4;->call()Ll/qy3;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    instance-of v0, v0, Ll/gzq;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    const-string v0, "ping"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    invoke-interface {p1}, Ll/ur4;->call()Ll/qy3;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    instance-of v0, v0, Ll/b10;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const-string v0, "ack"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    const-string v0, "normal"

    .line 46
    .line 47
    :goto_0
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Ll/smc0;->p()Ll/etf0;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ll/etf0;->a()Ll/ftf0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ll/myt;

    .line 60
    .line 61
    invoke-virtual {v1, v0}, Ll/myt;->i(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ll/yc60;->a()[B

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-nez v0, :cond_4

    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    goto :goto_1

    .line 76
    :cond_4
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ll/yc60;->a()[B

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    array-length v0, v0

    .line 85
    :goto_1
    invoke-virtual {v1, v0}, Ll/myt;->l(I)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/b0l;->b:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1, p0}, Ll/myt;->n(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0, v1}, Ll/yc60;->e(Ll/ftf0;)V

    .line 98
    .line 99
    .line 100
    invoke-interface {p1, p0}, Ll/ur4;->a(Ll/yc60;)Ll/ur4;

    .line 101
    .line 102
    .line 103
    return-void
.end method
