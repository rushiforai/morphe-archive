.class public final synthetic Lcom/google/android/gms/internal/ads/k1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ecs0;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(ZI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/google/android/gms/internal/ads/k1;->a:Z

    iput p2, p0, Lcom/google/android/gms/internal/ads/k1;->b:I

    return-void
.end method


# virtual methods
.method public final a(Ll/yds0;)V
    .locals 3

    .line 1
    sget v0, Lcom/google/android/gms/internal/ads/zzckf;->k0:I

    .line 2
    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/ads/f1;->L()Ll/tfs0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/tfs0;->s()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-boolean v2, p0, Lcom/google/android/gms/internal/ads/k1;->a:Z

    .line 12
    .line 13
    if-eq v1, v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ll/tfs0;->q(Z)Ll/tfs0;

    .line 16
    .line 17
    .line 18
    :cond_0
    iget p0, p0, Lcom/google/android/gms/internal/ads/k1;->b:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/tfs0;->r(I)Ll/tfs0;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/google/android/gms/internal/ads/f1;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ll/yds0;->z(Lcom/google/android/gms/internal/ads/f1;)Ll/yds0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
