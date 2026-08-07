.class public final Ll/xxu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/List;

.field public final c:Ljava/util/Set;

.field public final d:Landroid/os/Bundle;

.field public final e:Ljava/util/Map;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:I

.field public final i:Ljava/util/Set;

.field public final j:Landroid/os/Bundle;

.field public final k:Ljava/util/Set;

.field public final l:Z

.field public final m:Ljava/lang/String;

.field public final n:I


# direct methods
.method public constructor <init>(Ll/rwu0;Ll/ree0;)V
    .locals 0
    .param p2    # Ll/ree0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/rwu0;->h(Ll/rwu0;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    iput-object p2, p0, Ll/xxu0;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Ll/rwu0;->o(Ll/rwu0;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Ll/xxu0;->b:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {p1}, Ll/rwu0;->m(Ll/rwu0;)Ljava/util/HashSet;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iput-object p2, p0, Ll/xxu0;->c:Ljava/util/Set;

    .line 25
    .line 26
    invoke-static {p1}, Ll/rwu0;->f(Ll/rwu0;)Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iput-object p2, p0, Ll/xxu0;->d:Landroid/os/Bundle;

    .line 31
    .line 32
    invoke-static {p1}, Ll/rwu0;->k(Ll/rwu0;)Ljava/util/HashMap;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iput-object p2, p0, Ll/xxu0;->e:Ljava/util/Map;

    .line 41
    .line 42
    invoke-static {p1}, Ll/rwu0;->i(Ll/rwu0;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    iput-object p2, p0, Ll/xxu0;->f:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p1}, Ll/rwu0;->j(Ll/rwu0;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    iput-object p2, p0, Ll/xxu0;->g:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p1}, Ll/rwu0;->d(Ll/rwu0;)I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iput p2, p0, Ll/xxu0;->h:I

    .line 59
    .line 60
    invoke-static {p1}, Ll/rwu0;->n(Ll/rwu0;)Ljava/util/HashSet;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    iput-object p2, p0, Ll/xxu0;->i:Ljava/util/Set;

    .line 69
    .line 70
    invoke-static {p1}, Ll/rwu0;->e(Ll/rwu0;)Landroid/os/Bundle;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    iput-object p2, p0, Ll/xxu0;->j:Landroid/os/Bundle;

    .line 75
    .line 76
    invoke-static {p1}, Ll/rwu0;->l(Ll/rwu0;)Ljava/util/HashSet;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    iput-object p2, p0, Ll/xxu0;->k:Ljava/util/Set;

    .line 85
    .line 86
    invoke-static {p1}, Ll/rwu0;->b(Ll/rwu0;)Z

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    iput-boolean p2, p0, Ll/xxu0;->l:Z

    .line 91
    .line 92
    invoke-static {p1}, Ll/rwu0;->g(Ll/rwu0;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    iput-object p2, p0, Ll/xxu0;->m:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {p1}, Ll/rwu0;->c(Ll/rwu0;)I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    iput p1, p0, Ll/xxu0;->n:I

    .line 103
    .line 104
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xxu0;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xxu0;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public final c()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxu0;->j:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Ljava/lang/Class;)Landroid/os/Bundle;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xxu0;->d:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final e()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxu0;->d:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()Ll/ree0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final g()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xxu0;->m:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxu0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxu0;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxu0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k()Ljava/util/List;
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xxu0;->b:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final l()Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxu0;->k:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public final m()Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxu0;->c:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n()Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean p0, p0, Ll/xxu0;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public final o(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/gdv0;->f()Ll/gdv0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gdv0;->c()Lcom/google/android/gms/ads/RequestConfiguration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/xxu0;->i:Ljava/util/Set;

    .line 13
    .line 14
    invoke-static {p1}, Ll/obt0;->A(Landroid/content/Context;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/google/android/gms/ads/RequestConfiguration;->e()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0

    .line 37
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 38
    return p0
.end method
