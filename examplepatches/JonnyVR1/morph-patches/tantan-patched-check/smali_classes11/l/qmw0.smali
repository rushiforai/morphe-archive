.class public final Ll/qmw0;
.super Ll/dnw0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Ll/wmw0;

.field public final synthetic c:Ll/zmw0;

.field public final synthetic d:Ll/sni0;

.field public final synthetic e:Ll/umw0;


# direct methods
.method public constructor <init>(Ll/umw0;Ll/sni0;Ll/wmw0;Ll/zmw0;Ll/sni0;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/qmw0;->b:Ll/wmw0;

    .line 2
    .line 3
    iput-object p4, p0, Ll/qmw0;->c:Ll/zmw0;

    .line 4
    .line 5
    iput-object p5, p0, Ll/qmw0;->d:Ll/sni0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/qmw0;->e:Ll/umw0;

    .line 8
    .line 9
    invoke-direct {p0, p2}, Ll/dnw0;-><init>(Ll/sni0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 8

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/qmw0;->e:Ll/umw0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/umw0;->a:Ll/snw0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/snw0;->e()Landroid/os/IInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v1, p0, Ll/qmw0;->e:Ll/umw0;

    .line 13
    .line 14
    invoke-static {v1}, Ll/umw0;->b(Ll/umw0;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v3, p0, Ll/qmw0;->b:Ll/wmw0;

    .line 19
    .line 20
    invoke-static {v1}, Ll/umw0;->b(Ll/umw0;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v4, Landroid/os/Bundle;

    .line 25
    .line 26
    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v5, "windowToken"

    .line 30
    .line 31
    invoke-virtual {v3}, Ll/wmw0;->e()Landroid/os/IBinder;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->putBinder(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 36
    .line 37
    .line 38
    const-string v5, "adFieldEnifd"

    .line 39
    .line 40
    invoke-virtual {v3}, Ll/wmw0;->f()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    invoke-virtual {v4, v5, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const-string v5, "layoutGravity"

    .line 48
    .line 49
    invoke-virtual {v3}, Ll/wmw0;->c()I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    invoke-virtual {v4, v5, v6}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    const-string v5, "layoutVerticalMargin"

    .line 57
    .line 58
    invoke-virtual {v3}, Ll/wmw0;->a()F

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 63
    .line 64
    .line 65
    const-string v5, "displayMode"

    .line 66
    .line 67
    const/4 v6, 0x0

    .line 68
    invoke-virtual {v4, v5, v6}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    const-string v5, "windowWidthPx"

    .line 72
    .line 73
    invoke-virtual {v3}, Ll/wmw0;->d()I

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    invoke-virtual {v4, v5, v7}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 78
    .line 79
    .line 80
    const-string v5, "deeplinkUrl"

    .line 81
    .line 82
    const/4 v7, 0x0

    .line 83
    invoke-virtual {v4, v5, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    const-string v5, "stableSessionToken"

    .line 87
    .line 88
    invoke-virtual {v4, v5, v6}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 89
    .line 90
    .line 91
    const-string v5, "callerPackage"

    .line 92
    .line 93
    invoke-virtual {v4, v5, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3}, Ll/wmw0;->g()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    if-eqz v1, :cond_1

    .line 101
    .line 102
    const-string v1, "appId"

    .line 103
    .line 104
    invoke-virtual {v3}, Ll/wmw0;->g()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {v4, v1, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :catch_0
    move-exception v0

    .line 113
    goto :goto_1

    .line 114
    :cond_1
    :goto_0
    new-instance v1, Ll/tmw0;

    .line 115
    .line 116
    iget-object v3, p0, Ll/qmw0;->e:Ll/umw0;

    .line 117
    .line 118
    iget-object v5, p0, Ll/qmw0;->c:Ll/zmw0;

    .line 119
    .line 120
    invoke-direct {v1, v3, v5}, Ll/tmw0;-><init>(Ll/umw0;Ll/zmw0;)V

    .line 121
    .line 122
    .line 123
    invoke-interface {v0, v2, v4, v1}, Ll/slw0;->d3(Ljava/lang/String;Landroid/os/Bundle;Ll/ulw0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :goto_1
    iget-object v1, p0, Ll/qmw0;->e:Ll/umw0;

    .line 128
    .line 129
    invoke-static {}, Ll/umw0;->a()Ll/cnw0;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-static {v1}, Ll/umw0;->b(Ll/umw0;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    const-string v3, "show overlay display from: %s"

    .line 142
    .line 143
    invoke-virtual {v2, v0, v3, v1}, Ll/cnw0;->b(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Ll/qmw0;->d:Ll/sni0;

    .line 147
    .line 148
    new-instance v1, Ljava/lang/RuntimeException;

    .line 149
    .line 150
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, v1}, Ll/sni0;->d(Ljava/lang/Exception;)Z

    .line 154
    .line 155
    .line 156
    return-void
.end method
