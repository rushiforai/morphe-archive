.class public final synthetic Lcom/google/android/libraries/places/internal/zzjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Ll/sni0;

.field public final synthetic zzb:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/sni0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzjg;->zza:Ll/sni0;

    .line 5
    .line 6
    const-string p1, "Location timeout."

    .line 7
    .line 8
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzjg;->zzb:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzjg;->zzb:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/gms/common/api/ApiException;

    .line 4
    .line 5
    new-instance v2, Lcom/google/android/gms/common/api/Status;

    .line 6
    .line 7
    const/16 v3, 0xf

    .line 8
    .line 9
    invoke-direct {v2, v3, v0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v1, v2}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzjg;->zza:Ll/sni0;

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Ll/sni0;->d(Ljava/lang/Exception;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method
