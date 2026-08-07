.class public final Lcom/google/android/gms/measurement/internal/zzp;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field private final zza:Ll/atx0;


# direct methods
.method public constructor <init>(Ll/atx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ll/atx0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ll/atx0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/d6x0;->F()Ll/l8x0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "App receiver called with null intent"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ll/atx0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/d6x0;->F()Ll/l8x0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "App receiver called with null action"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ll/atx0;

    .line 42
    .line 43
    const-string p2, "com.google.android.gms.measurement.TRIGGERS_AVAILABLE"

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/d6x0;->F()Ll/l8x0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string p1, "App receiver called with unknown action"

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    invoke-static {}, Ll/spy0;->a()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_4

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/atx0;->u()Ll/ajr0;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    sget-object p2, Ll/whs0;->J0:Ll/zpw0;

    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    invoke-virtual {p1, v0, p2}, Ll/ajr0;->B(Ljava/lang/String;Ll/zpw0;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-nez p1, :cond_3

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Ll/d6x0;->E()Ll/l8x0;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const-string p2, "App receiver notified triggers are available"

    .line 94
    .line 95
    invoke-virtual {p1, p2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/atx0;->zzl()Ll/qsx0;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    new-instance p2, Ll/usy0;

    .line 103
    .line 104
    invoke-direct {p2, p0}, Ll/usy0;-><init>(Ll/atx0;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, p2}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 108
    .line 109
    .line 110
    :cond_4
    :goto_0
    return-void
.end method
