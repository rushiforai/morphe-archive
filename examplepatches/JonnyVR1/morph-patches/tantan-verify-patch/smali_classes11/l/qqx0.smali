.class public final Ll/qqx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field public final a:Ljava/lang/String;

.field public final synthetic b:Ll/tnx0;


# direct methods
.method public constructor <init>(Ll/tnx0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qqx0;->b:Ll/tnx0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/qqx0;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Ll/qqx0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qqx0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/qqx0;->b:Ll/tnx0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/tnx0;->a:Ll/atx0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/d6x0;->F()Ll/l8x0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "Install Referrer connection returned with null binder"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    :try_start_0
    invoke-static {p2}, Ll/d3t0;->P2(Landroid/os/IBinder;)Ll/h4t0;

    .line 22
    .line 23
    .line 24
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    iget-object p2, p0, Ll/qqx0;->b:Ll/tnx0;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    :try_start_1
    iget-object p1, p2, Ll/tnx0;->a:Ll/atx0;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/atx0;->zzj()Ll/d6x0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ll/d6x0;->F()Ll/l8x0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string p2, "Install Referrer Service implementation was not found"

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catch_0
    move-exception p1

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object p2, p2, Ll/tnx0;->a:Ll/atx0;

    .line 48
    .line 49
    invoke-virtual {p2}, Ll/atx0;->zzj()Ll/d6x0;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p2}, Ll/d6x0;->E()Ll/l8x0;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const-string v0, "Install Referrer Service connected"

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Ll/qqx0;->b:Ll/tnx0;

    .line 63
    .line 64
    iget-object p2, p2, Ll/tnx0;->a:Ll/atx0;

    .line 65
    .line 66
    invoke-virtual {p2}, Ll/atx0;->zzl()Ll/qsx0;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    new-instance v0, Ll/ppx0;

    .line 71
    .line 72
    invoke-direct {v0, p0, p1, p0}, Ll/ppx0;-><init>(Ll/qqx0;Ll/h4t0;Landroid/content/ServiceConnection;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2, v0}, Ll/qsx0;->w(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :goto_0
    iget-object p0, p0, Ll/qqx0;->b:Ll/tnx0;

    .line 80
    .line 81
    iget-object p0, p0, Ll/tnx0;->a:Ll/atx0;

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Ll/d6x0;->F()Ll/l8x0;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const-string p2, "Exception occurred while calling Install Referrer API"

    .line 92
    .line 93
    invoke-virtual {p0, p2, p1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qqx0;->b:Ll/tnx0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tnx0;->a:Ll/atx0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/d6x0;->E()Ll/l8x0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "Install Referrer Service disconnected"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
