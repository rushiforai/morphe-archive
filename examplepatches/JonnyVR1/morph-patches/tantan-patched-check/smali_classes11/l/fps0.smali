.class public final Ll/fps0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/wit0;


# direct methods
.method public constructor <init>(Ll/wit0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fps0;->a:Ll/wit0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string p0, "DefaultGmsgHandlers.attributionReportingManager"

    .line 2
    .line 3
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fps0;->a:Ll/wit0;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/String;

    .line 4
    .line 5
    new-instance v0, Ll/s6t0;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {p0}, Ll/wit0;->zzn()Lcom/google/android/gms/internal/ads/zzcei;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 16
    .line 17
    invoke-direct {v0, v1, p0, p1}, Ll/s6t0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/aas0;->b()Ll/hpr;

    .line 21
    .line 22
    .line 23
    return-void
.end method
