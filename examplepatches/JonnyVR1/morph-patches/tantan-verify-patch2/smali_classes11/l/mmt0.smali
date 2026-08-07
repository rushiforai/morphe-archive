.class public final Ll/mmt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mmt0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mmt0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ll/a5t0;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mmt0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/jlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/mmt0;->b:Ll/kqx0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/hew0;

    .line 16
    .line 17
    invoke-static {}, Ll/bxy0;->h()Ll/fvs0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzcei;->F()Lcom/google/android/gms/internal/ads/zzcei;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v0, v2, p0}, Ll/fvs0;->b(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/hew0;)Ll/ovs0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    sget-object v2, Ll/lvs0;->b:Ll/ivs0;

    .line 30
    .line 31
    const-string v3, "google.afma.request.getAdDictionary"

    .line 32
    .line 33
    invoke-virtual {v1, v3, v2, v2}, Ll/ovs0;->a(Ljava/lang/String;Ll/hvs0;Ll/gvs0;)Ll/evs0;

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/bxy0;->h()Ll/fvs0;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzcei;->F()Lcom/google/android/gms/internal/ads/zzcei;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v1, v0, v3, p0}, Ll/fvs0;->b(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/hew0;)Ll/ovs0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string v1, "google.afma.sdkConstants.getSdkConstants"

    .line 49
    .line 50
    invoke-virtual {p0, v1, v2, v2}, Ll/ovs0;->a(Ljava/lang/String;Ll/hvs0;Ll/gvs0;)Ll/evs0;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance v1, Ll/z4t0;

    .line 55
    .line 56
    invoke-direct {v1, v0, p0}, Ll/z4t0;-><init>(Landroid/content/Context;Ll/evs0;)V

    .line 57
    .line 58
    .line 59
    return-object v1
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mmt0;->a()Ll/a5t0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
