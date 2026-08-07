.class public abstract Ll/qss0;
.super Ll/q6s0;
.source "SourceFile"

# interfaces
.implements Ll/rss0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "com.google.android.gms.ads.internal.instream.client.IInstreamAd"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/q6s0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final n8(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const/4 p4, 0x3

    .line 2
    if-eq p1, p4, :cond_6

    .line 3
    .line 4
    const/4 p4, 0x4

    .line 5
    if-eq p1, p4, :cond_5

    .line 6
    .line 7
    const/4 p4, 0x5

    .line 8
    if-eq p1, p4, :cond_2

    .line 9
    .line 10
    const/4 p4, 0x6

    .line 11
    if-eq p1, p4, :cond_1

    .line 12
    .line 13
    const/4 p2, 0x7

    .line 14
    if-eq p1, p2, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-interface {p0}, Ll/rss0;->zzc()Ll/xks0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 23
    .line 24
    .line 25
    invoke-static {p3, p0}, Ll/r6s0;->f(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Ll/p1m$a;->O(Landroid/os/IBinder;)Ll/p1m;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p2}, Ll/r6s0;->c(Landroid/os/Parcel;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p0, p1}, Ll/rss0;->zze(Ll/p1m;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Ll/p1m$a;->O(Landroid/os/IBinder;)Ll/p1m;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 56
    .line 57
    .line 58
    move-result-object p4

    .line 59
    if-nez p4, :cond_3

    .line 60
    .line 61
    const/4 p4, 0x0

    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const-string v0, "com.google.android.gms.ads.internal.instream.client.IInstreamAdCallback"

    .line 64
    .line 65
    invoke-interface {p4, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    instance-of v1, v0, Ll/uss0;

    .line 70
    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    move-object p4, v0

    .line 74
    check-cast p4, Ll/uss0;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    new-instance v0, Ll/sss0;

    .line 78
    .line 79
    invoke-direct {v0, p4}, Ll/sss0;-><init>(Landroid/os/IBinder;)V

    .line 80
    .line 81
    .line 82
    move-object p4, v0

    .line 83
    :goto_0
    invoke-static {p2}, Ll/r6s0;->c(Landroid/os/Parcel;)V

    .line 84
    .line 85
    .line 86
    invoke-interface {p0, p1, p4}, Ll/rss0;->U3(Ll/p1m;Ll/uss0;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_5
    invoke-interface {p0}, Ll/rss0;->zzd()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_6
    invoke-interface {p0}, Ll/rss0;->zzb()Ll/lpu0;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 105
    .line 106
    .line 107
    invoke-static {p3, p0}, Ll/r6s0;->f(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 108
    .line 109
    .line 110
    :goto_1
    const/4 p0, 0x1

    .line 111
    return p0
.end method
