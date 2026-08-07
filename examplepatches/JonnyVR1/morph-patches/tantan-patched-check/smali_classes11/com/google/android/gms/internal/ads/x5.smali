.class public final Lcom/google/android/gms/internal/ads/x5;
.super Ll/olx0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ll/olx0;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/plx0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/plx0;->a()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic b(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/plx0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/plx0;->b()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final bridge synthetic c(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    iget-object p0, p1, Lcom/google/android/gms/internal/ads/p5;->zzc:Ll/plx0;

    .line 4
    .line 5
    invoke-static {}, Ll/plx0;->c()Ll/plx0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/plx0;->f()Ll/plx0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iput-object p0, p1, Lcom/google/android/gms/internal/ads/p5;->zzc:Ll/plx0;

    .line 16
    .line 17
    :cond_0
    return-object p0
.end method

.method public final synthetic d(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    iget-object p0, p1, Lcom/google/android/gms/internal/ads/p5;->zzc:Ll/plx0;

    .line 4
    .line 5
    return-object p0
.end method

.method public final bridge synthetic e(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {}, Ll/plx0;->c()Ll/plx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ll/plx0;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/plx0;->c()Ll/plx0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1}, Ll/plx0;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    check-cast p2, Ll/plx0;

    .line 22
    .line 23
    check-cast p1, Ll/plx0;

    .line 24
    .line 25
    invoke-static {p1, p2}, Ll/plx0;->e(Ll/plx0;Ll/plx0;)Ll/plx0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    check-cast p2, Ll/plx0;

    .line 31
    .line 32
    move-object p0, p1

    .line 33
    check-cast p0, Ll/plx0;

    .line 34
    .line 35
    invoke-virtual {p0, p2}, Ll/plx0;->d(Ll/plx0;)Ll/plx0;

    .line 36
    .line 37
    .line 38
    :cond_1
    return-object p1
.end method

.method public final synthetic f()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {}, Ll/plx0;->f()Ll/plx0;

    move-result-object p0

    return-object p0
.end method

.method public final synthetic g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    move-object p0, p1

    .line 2
    check-cast p0, Ll/plx0;

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/plx0;->h()V

    .line 5
    .line 6
    .line 7
    return-object p1
.end method

.method public final bridge synthetic h(Ljava/lang/Object;II)V
    .locals 0

    .line 1
    shl-int/lit8 p0, p2, 0x3

    .line 2
    .line 3
    or-int/lit8 p0, p0, 0x5

    .line 4
    .line 5
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p1, Ll/plx0;

    .line 10
    .line 11
    invoke-virtual {p1, p0, p2}, Ll/plx0;->j(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final bridge synthetic i(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    shl-int/lit8 p0, p2, 0x3

    .line 2
    .line 3
    or-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p1, Ll/plx0;

    .line 10
    .line 11
    invoke-virtual {p1, p0, p2}, Ll/plx0;->j(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final bridge synthetic j(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/plx0;

    .line 2
    .line 3
    shl-int/lit8 p0, p2, 0x3

    .line 4
    .line 5
    or-int/lit8 p0, p0, 0x3

    .line 6
    .line 7
    invoke-virtual {p1, p0, p3}, Ll/plx0;->j(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final bridge synthetic k(Ljava/lang/Object;ILcom/google/android/gms/internal/ads/zzgyl;)V
    .locals 0

    .line 1
    shl-int/lit8 p0, p2, 0x3

    .line 2
    .line 3
    check-cast p1, Ll/plx0;

    .line 4
    .line 5
    or-int/lit8 p0, p0, 0x2

    .line 6
    .line 7
    invoke-virtual {p1, p0, p3}, Ll/plx0;->j(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final bridge synthetic l(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    shl-int/lit8 p0, p2, 0x3

    .line 2
    .line 3
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p1, Ll/plx0;

    .line 8
    .line 9
    invoke-virtual {p1, p0, p2}, Ll/plx0;->j(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final m(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    iget-object p0, p1, Lcom/google/android/gms/internal/ads/p5;->zzc:Ll/plx0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/plx0;->h()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    check-cast p2, Ll/plx0;

    .line 4
    .line 5
    iput-object p2, p1, Lcom/google/android/gms/internal/ads/p5;->zzc:Ll/plx0;

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic o(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    check-cast p2, Ll/plx0;

    .line 4
    .line 5
    iput-object p2, p1, Lcom/google/android/gms/internal/ads/p5;->zzc:Ll/plx0;

    .line 6
    .line 7
    return-void
.end method

.method public final q(Ll/qkx0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final synthetic r(Ljava/lang/Object;Ll/fhx0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/plx0;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Ll/plx0;->k(Ll/fhx0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
