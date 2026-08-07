.class public final Ll/u2u0;
.super Lcom/google/android/gms/location/zzt;
.source "SourceFile"


# instance fields
.field public final a:Ll/utt0;


# direct methods
.method public constructor <init>(Ll/utt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/location/zzt;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u2u0;->a:Ll/utt0;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic O(Ll/u2u0;)Ll/utt0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u2u0;->a:Ll/utt0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final P2(Lcom/google/android/gms/common/api/internal/ListenerHolder;)Ll/u2u0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u2u0;->a:Ll/utt0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/utt0;->a(Lcom/google/android/gms/common/api/internal/ListenerHolder;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final zzd(Landroid/location/Location;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u2u0;->a:Ll/utt0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/utt0;->zza()Lcom/google/android/gms/common/api/internal/ListenerHolder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/e0u0;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/e0u0;-><init>(Ll/u2u0;Landroid/location/Location;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/internal/ListenerHolder;->notifyListener(Lcom/google/android/gms/common/api/internal/ListenerHolder$Notifier;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final zze()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u2u0;->a:Ll/utt0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/utt0;->zza()Lcom/google/android/gms/common/api/internal/ListenerHolder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/m1u0;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/m1u0;-><init>(Ll/u2u0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/internal/ListenerHolder;->notifyListener(Lcom/google/android/gms/common/api/internal/ListenerHolder$Notifier;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final zzg()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u2u0;->a:Ll/utt0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/utt0;->zza()Lcom/google/android/gms/common/api/internal/ListenerHolder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/ListenerHolder;->clear()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
