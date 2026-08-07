.class public final Ll/viw0;
.super Ll/shx0;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/v1;->M()Lcom/google/android/gms/internal/ads/v1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Ll/shx0;-><init>(Lcom/google/android/gms/internal/ads/p5;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/tiw0;)V
    .locals 0

    .line 9
    invoke-static {}, Lcom/google/android/gms/internal/ads/v1;->M()Lcom/google/android/gms/internal/ads/v1;

    move-result-object p1

    invoke-direct {p0, p1}, Ll/shx0;-><init>(Lcom/google/android/gms/internal/ads/p5;)V

    return-void
.end method


# virtual methods
.method public final q(Ljava/lang/String;)Ll/viw0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/shx0;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 5
    .line 6
    check-cast v0, Lcom/google/android/gms/internal/ads/v1;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/v1;->N(Lcom/google/android/gms/internal/ads/v1;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final r(I)Ll/viw0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/shx0;->o()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 5
    .line 6
    check-cast p1, Lcom/google/android/gms/internal/ads/v1;

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/ads/v1;->O(Lcom/google/android/gms/internal/ads/v1;I)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method
