.class public final Ll/mnu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/ltu0;

.field public final b:Ll/qru0;

.field public final c:Ll/rvt0;

.field public final d:Ll/cmu0;


# direct methods
.method public constructor <init>(Ll/ltu0;Ll/qru0;Ll/rvt0;Ll/cmu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mnu0;->a:Ll/ltu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mnu0;->b:Ll/qru0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/mnu0;->c:Ll/rvt0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/mnu0;->d:Ll/cmu0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()Landroid/view/View;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcjw;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mnu0;->a:Ll/ltu0;

    .line 2
    .line 3
    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzq;->H()Lcom/google/android/gms/ads/internal/client/zzq;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2, v2}, Ll/ltu0;->a(Lcom/google/android/gms/ads/internal/client/zzq;Ll/q6w0;Ll/t6w0;)Ll/wit0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    move-object v1, v0

    .line 13
    check-cast v1, Landroid/view/View;

    .line 14
    .line 15
    const/16 v2, 0x8

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/hnu0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/hnu0;-><init>(Ll/mnu0;)V

    .line 23
    .line 24
    .line 25
    const-string v2, "/sendMessageToSdk"

    .line 26
    .line 27
    invoke-interface {v0, v2, v1}, Ll/wit0;->j0(Ljava/lang/String;Ll/bqs0;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/inu0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/inu0;-><init>(Ll/mnu0;)V

    .line 33
    .line 34
    .line 35
    const-string v2, "/adMuted"

    .line 36
    .line 37
    invoke-interface {v0, v2, v1}, Ll/wit0;->j0(Ljava/lang/String;Ll/bqs0;)V

    .line 38
    .line 39
    .line 40
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 41
    .line 42
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/jnu0;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/jnu0;-><init>(Ll/mnu0;)V

    .line 48
    .line 49
    .line 50
    iget-object v3, p0, Ll/mnu0;->b:Ll/qru0;

    .line 51
    .line 52
    const-string v4, "/loadHtml"

    .line 53
    .line 54
    invoke-virtual {v3, v1, v4, v2}, Ll/qru0;->j(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ll/bqs0;)V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 58
    .line 59
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    new-instance v2, Ll/knu0;

    .line 63
    .line 64
    invoke-direct {v2, p0}, Ll/knu0;-><init>(Ll/mnu0;)V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Ll/mnu0;->b:Ll/qru0;

    .line 68
    .line 69
    const-string v4, "/showOverlay"

    .line 70
    .line 71
    invoke-virtual {v3, v1, v4, v2}, Ll/qru0;->j(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ll/bqs0;)V

    .line 72
    .line 73
    .line 74
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 75
    .line 76
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Ll/lnu0;

    .line 80
    .line 81
    invoke-direct {v2, p0}, Ll/lnu0;-><init>(Ll/mnu0;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Ll/mnu0;->b:Ll/qru0;

    .line 85
    .line 86
    const-string v3, "/hideOverlay"

    .line 87
    .line 88
    invoke-virtual {p0, v1, v3, v2}, Ll/qru0;->j(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ll/bqs0;)V

    .line 89
    .line 90
    .line 91
    check-cast v0, Landroid/view/View;

    .line 92
    .line 93
    return-object v0
.end method

.method public final synthetic b(Ll/wit0;Ljava/util/Map;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mnu0;->b:Ll/qru0;

    .line 2
    .line 3
    const-string p1, "sendMessageToNativeJs"

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/qru0;->g(Ljava/lang/String;Ljava/util/Map;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c(Ll/wit0;Ljava/util/Map;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mnu0;->d:Ll/cmu0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/cmu0;->zzg()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic d(Ljava/util/Map;ZILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p2, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p3, "messageType"

    .line 7
    .line 8
    const-string p4, "htmlLoaded"

    .line 9
    .line 10
    invoke-interface {p2, p3, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string p3, "id"

    .line 14
    .line 15
    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p2, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/mnu0;->b:Ll/qru0;

    .line 25
    .line 26
    const-string p1, "sendMessageToNativeJs"

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Ll/qru0;->g(Ljava/lang/String;Ljava/util/Map;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic e(Ll/wit0;Ljava/util/Map;)V
    .locals 0

    .line 1
    const-string p2, "Showing native ads overlay."

    .line 2
    .line 3
    invoke-static {p2}, Ll/dct0;->f(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ll/wit0;->zzF()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 p2, 0x0

    .line 11
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/mnu0;->c:Ll/rvt0;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    invoke-virtual {p0, p1}, Ll/rvt0;->q(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic f(Ll/wit0;Ljava/util/Map;)V
    .locals 0

    .line 1
    const-string p2, "Hiding native ads overlay."

    .line 2
    .line 3
    invoke-static {p2}, Ll/dct0;->f(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ll/wit0;->zzF()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/16 p2, 0x8

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/mnu0;->c:Ll/rvt0;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Ll/rvt0;->q(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
