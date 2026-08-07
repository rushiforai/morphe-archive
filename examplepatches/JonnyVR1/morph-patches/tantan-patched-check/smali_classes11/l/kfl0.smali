.class public final Ll/kfl0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kfl0$a;
    }
.end annotation


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/internal/client/zzfk;)V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-boolean v0, p1, Lcom/google/android/gms/ads/internal/client/zzfk;->zza:Z

    iput-boolean v0, p0, Ll/kfl0;->a:Z

    iget-boolean v0, p1, Lcom/google/android/gms/ads/internal/client/zzfk;->zzb:Z

    iput-boolean v0, p0, Ll/kfl0;->b:Z

    iget-boolean p1, p1, Lcom/google/android/gms/ads/internal/client/zzfk;->zzc:Z

    iput-boolean p1, p0, Ll/kfl0;->c:Z

    return-void
.end method

.method public synthetic constructor <init>(Ll/kfl0$a;Ll/wtx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/kfl0$a;->e(Ll/kfl0$a;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iput-boolean p2, p0, Ll/kfl0;->a:Z

    .line 9
    .line 10
    invoke-static {p1}, Ll/kfl0$a;->d(Ll/kfl0$a;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    iput-boolean p2, p0, Ll/kfl0;->b:Z

    .line 15
    .line 16
    invoke-static {p1}, Ll/kfl0$a;->c(Ll/kfl0$a;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput-boolean p1, p0, Ll/kfl0;->c:Z

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kfl0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kfl0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kfl0;->a:Z

    .line 2
    .line 3
    return p0
.end method
