.class public final synthetic Ll/y6u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jdu0;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/internal/ads/zzdkv;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/internal/ads/zzdkv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y6u0;->a:Lcom/google/android/gms/internal/ads/zzdkv;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/y6u0;->a:Lcom/google/android/gms/internal/ads/zzdkv;

    .line 2
    .line 3
    check-cast p1, Ll/f7u0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    const/16 v1, 0xc

    .line 11
    .line 12
    invoke-static {v1, p0, v0}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p1, p0}, Ll/f7u0;->k(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
