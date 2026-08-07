.class public final Ll/azr0;
.super Ll/z4s0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Landroid/widget/FrameLayout;

.field public final synthetic c:Landroid/widget/FrameLayout;

.field public final synthetic d:Landroid/content/Context;

.field public final synthetic e:Ll/s3s0;


# direct methods
.method public constructor <init>(Ll/s3s0;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/azr0;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    iput-object p3, p0, Ll/azr0;->c:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    iput-object p4, p0, Ll/azr0;->d:Landroid/content/Context;

    .line 6
    .line 7
    iput-object p1, p0, Ll/azr0;->e:Ll/s3s0;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/z4s0;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/azr0;->d:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "native_ad_view_delegate"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/s3s0;->q(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/qwv0;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/qwv0;-><init>()V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final bridge synthetic b(Ll/tbt0;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/azr0;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    iget-object p0, p0, Ll/azr0;->b:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-static {p0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p1, p0, v0}, Ll/tbt0;->b1(Ll/p1m;Ll/p1m;)Ll/els0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final bridge synthetic c()Ljava/lang/Object;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/azr0;->d:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/sgs0;->a(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/sgs0;->ia:Ll/dgs0;

    .line 7
    .line 8
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    :try_start_0
    iget-object v0, p0, Ll/azr0;->d:Landroid/content/Context;

    .line 25
    .line 26
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Ll/azr0;->b:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    invoke-static {v1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v2, p0, Ll/azr0;->c:Landroid/widget/FrameLayout;

    .line 37
    .line 38
    invoke-static {v2}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v3, p0, Ll/azr0;->d:Landroid/content/Context;

    .line 43
    .line 44
    const-string v4, "com.google.android.gms.ads.ChimeraNativeAdViewDelegateCreatorImpl"

    .line 45
    .line 46
    sget-object v5, Ll/sxr0;->a:Ll/sxr0;

    .line 47
    .line 48
    invoke-static {v3, v4, v5}, Ll/gct0;->b(Landroid/content/Context;Ljava/lang/String;Ll/fct0;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Ll/hls0;

    .line 53
    .line 54
    const v4, 0xe52bf80

    .line 55
    .line 56
    .line 57
    invoke-interface {v3, v0, v1, v2, v4}, Ll/hls0;->i1(Ll/p1m;Ll/p1m;Ll/p1m;I)Landroid/os/IBinder;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Ll/dls0;->o8(Landroid/os/IBinder;)Ll/els0;

    .line 62
    .line 63
    .line 64
    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzcef; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    return-object p0

    .line 66
    :catch_0
    move-exception v0

    .line 67
    goto :goto_0

    .line 68
    :catch_1
    move-exception v0

    .line 69
    goto :goto_0

    .line 70
    :catch_2
    move-exception v0

    .line 71
    :goto_0
    iget-object v1, p0, Ll/azr0;->e:Ll/s3s0;

    .line 72
    .line 73
    iget-object v2, p0, Ll/azr0;->d:Landroid/content/Context;

    .line 74
    .line 75
    invoke-static {v2}, Ll/w2t0;->c(Landroid/content/Context;)Ll/y2t0;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {v1, v2}, Ll/s3s0;->p(Ll/s3s0;Ll/y2t0;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/azr0;->e:Ll/s3s0;

    .line 83
    .line 84
    invoke-static {p0}, Ll/s3s0;->m(Ll/s3s0;)Ll/y2t0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-string v1, "ClientApiBroker.createNativeAdViewDelegate"

    .line 89
    .line 90
    invoke-interface {p0, v0, v1}, Ll/y2t0;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    const/4 p0, 0x0

    .line 94
    return-object p0

    .line 95
    :cond_0
    iget-object v0, p0, Ll/azr0;->e:Ll/s3s0;

    .line 96
    .line 97
    iget-object v1, p0, Ll/azr0;->d:Landroid/content/Context;

    .line 98
    .line 99
    iget-object v2, p0, Ll/azr0;->b:Landroid/widget/FrameLayout;

    .line 100
    .line 101
    iget-object p0, p0, Ll/azr0;->c:Landroid/widget/FrameLayout;

    .line 102
    .line 103
    invoke-static {v0}, Ll/s3s0;->i(Ll/s3s0;)Ll/pns0;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0, v1, v2, p0}, Ll/pns0;->a(Landroid/content/Context;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)Ll/els0;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0
.end method
