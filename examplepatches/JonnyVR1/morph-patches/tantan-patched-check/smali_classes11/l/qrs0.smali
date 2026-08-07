.class public final Ll/qrs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/internal/ads/zzboq;


# direct methods
.method public constructor <init>(Ll/ess0;Lcom/google/android/gms/internal/ads/zzboq;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/qrs0;->a:Lcom/google/android/gms/internal/ads/zzboq;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Ljava/lang/Object;)Ll/hpr;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/ors0;

    .line 2
    .line 3
    new-instance v0, Ll/tct0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/tct0;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/prs0;

    .line 9
    .line 10
    invoke-direct {v1, p0, v0}, Ll/prs0;-><init>(Ll/qrs0;Ll/tct0;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/qrs0;->a:Lcom/google/android/gms/internal/ads/zzboq;

    .line 14
    .line 15
    invoke-virtual {p1, p0, v1}, Ll/ors0;->m4(Lcom/google/android/gms/internal/ads/zzboq;Ll/nrs0;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
