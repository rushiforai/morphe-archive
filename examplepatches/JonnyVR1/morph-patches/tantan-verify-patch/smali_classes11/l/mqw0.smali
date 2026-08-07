.class public final Ll/mqw0;
.super Ll/kqw0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-direct {p0, v0}, Ll/kqw0;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Object;)Ll/lqw0;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/kqw0;->c(Ljava/lang/Object;)Ll/kqw0;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final g(Ljava/lang/Object;)Ll/mqw0;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/kqw0;->c(Ljava/lang/Object;)Ll/kqw0;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final varargs h([Ljava/lang/Object;)Ll/mqw0;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/kqw0;->e([Ljava/lang/Object;I)V

    .line 3
    .line 4
    .line 5
    return-object p0
.end method

.method public final i(Ljava/lang/Iterable;)Ll/mqw0;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/kqw0;->d(Ljava/lang/Iterable;)Ll/lqw0;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final j()Lcom/google/android/gms/internal/ads/zzgaa;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/kqw0;->c:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/kqw0;->a:[Ljava/lang/Object;

    .line 5
    .line 6
    iget p0, p0, Ll/kqw0;->b:I

    .line 7
    .line 8
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/ads/zzgaa;->zzi([Ljava/lang/Object;I)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
