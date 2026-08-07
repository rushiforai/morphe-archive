.class public Ll/shx0;
.super Ll/yfx0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MessageType:",
        "Lcom/google/android/gms/internal/ads/p5<",
        "TMessageType;TBuilderType;>;BuilderType:",
        "Ll/shx0<",
        "TMessageType;TBuilderType;>;>",
        "Ll/yfx0<",
        "TMessageType;TBuilderType;>;"
    }
.end annotation


# instance fields
.field public final a:Lcom/google/android/gms/internal/ads/p5;

.field public b:Lcom/google/android/gms/internal/ads/p5;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/p5;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/yfx0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/shx0;->a:Lcom/google/android/gms/internal/ads/p5;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/p5;->F()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/p5;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "Default instance must be immutable."

    .line 20
    .line 21
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    throw p0
.end method

.method public static f(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p0, p1}, Ll/ukx0;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public bridge synthetic I()Ll/fkx0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/shx0;->n()Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic b()Ll/yfx0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/shx0;->j()Ll/shx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/shx0;->j()Ll/shx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j()Ll/shx0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/shx0;->a:Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {v0, v1, v2, v2}, Lcom/google/android/gms/internal/ads/p5;->H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/shx0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/shx0;->n()Lcom/google/android/gms/internal/ads/p5;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iput-object p0, v0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 16
    .line 17
    return-object v0
.end method

.method public final k(Lcom/google/android/gms/internal/ads/p5;)Ll/shx0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/shx0;->a:Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/p5;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->F()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/shx0;->p()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 21
    .line 22
    invoke-static {v0, p1}, Ll/shx0;->f(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-object p0
.end method

.method public final l([BIILl/jhx0;)Ll/shx0;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    iget-object p2, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/google/android/gms/internal/ads/p5;->F()Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/shx0;->p()V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iget-object v0, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p2, v0}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 27
    .line 28
    new-instance v6, Ll/dgx0;

    .line 29
    .line 30
    invoke-direct {v6, p4}, Ll/dgx0;-><init>(Ll/jhx0;)V

    .line 31
    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    move-object v3, p1

    .line 35
    move v5, p3

    .line 36
    invoke-interface/range {v1 .. v6}, Ll/ukx0;->d(Ljava/lang/Object;[BIILl/dgx0;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    return-object p0

    .line 40
    :catch_0
    move-exception v0

    .line 41
    move-object p0, v0

    .line 42
    const-string p1, "Reading from byte array should not throw IOException."

    .line 43
    .line 44
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return-object p0

    .line 49
    :catch_1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzj()Lcom/google/android/gms/internal/ads/zzhag;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    throw p0

    .line 54
    :catch_2
    move-exception v0

    .line 55
    move-object p0, v0

    .line 56
    throw p0
.end method

.method public final m()Lcom/google/android/gms/internal/ads/p5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TMessageType;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/shx0;->n()Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->E()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/ads/zzhco;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/ads/zzhco;-><init>(Ll/fkx0;)V

    .line 15
    .line 16
    .line 17
    throw v0
.end method

.method public n()Lcom/google/android/gms/internal/ads/p5;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TMessageType;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->F()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/p5;->A()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 16
    .line 17
    return-object p0
.end method

.method public final o()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->F()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/shx0;->p()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/shx0;->a:Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/shx0;->f(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/shx0;->b:Lcom/google/android/gms/internal/ads/p5;

    .line 13
    .line 14
    return-void
.end method
