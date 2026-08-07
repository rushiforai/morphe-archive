.class public Ll/l6t;
.super Ll/cyr;
.source "SourceFile"

# interfaces
.implements Ll/uwl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam;",
        ">",
        "Ll/cyr<",
        "TV;>;",
        "Ll/uwl;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/uwl;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/l6t;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cyr;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/l6t;->d:Ljava/lang/String;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Ll/l6t;->a:I

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic q2(Ljava/util/HashMap;Ljava/util/Map$Entry;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/c6m;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ll/uwl;

    .line 20
    .line 21
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public A2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l6t;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final B2(Ll/l6t;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l6t;->c:Ll/l6t;

    .line 2
    .line 3
    return-void
.end method

.method public C(Ll/iam;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/cyr;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C2(Ll/l6t;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/l6t;->r2()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 8
    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/l6t;->v2()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {p1}, Ll/l6t;->n()V

    .line 23
    .line 24
    .line 25
    instance-of v0, p1, Ll/c6m;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    move-object v0, p1

    .line 30
    check-cast v0, Ll/c6m;

    .line 31
    .line 32
    invoke-interface {v0}, Ll/c6m;->m1()V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/l6t;->v2()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    :cond_3
    :goto_0
    return-void
.end method

.method public T()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Ll/l6t;->a:I

    .line 3
    .line 4
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-static {p0}, Ll/xre0;->h(Ljava/util/HashMap;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/cyr;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 3
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/cyr;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/iam;->destroy()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v0, -0x1

    .line 14
    iput v0, p0, Ll/l6t;->a:I

    .line 15
    .line 16
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-static {v0}, Ll/xre0;->f(Ljava/util/HashMap;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 27
    .line 28
    .line 29
    new-instance v0, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    new-instance v2, Ll/k6t;

    .line 41
    .line 42
    invoke-direct {v2, v0}, Ll/k6t;-><init>(Ljava/util/HashMap;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/l6t;->r2()V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 57
    .line 58
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final r2()V
    .locals 0

    .line 1
    return-void
.end method

.method public s2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/l6t;->r2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-static {v0}, Ll/xre0;->g(Ljava/util/HashMap;)V

    .line 7
    .line 8
    .line 9
    instance-of v0, p0, Ll/c6m;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Ll/c6m;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/c6m;->m1()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public t()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Ll/l6t;->a:I

    .line 3
    .line 4
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-static {p0}, Ll/xre0;->i(Ljava/util/HashMap;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final u2(Ll/l6t;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/l6t;->v2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    mul-int/lit16 p0, p0, 0x3e8

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/16 v2, 0x3e8

    .line 18
    .line 19
    rem-long/2addr v0, v2

    .line 20
    long-to-int v0, v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Ll/l6t;->A2(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-object p0
.end method

.method public v2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l6t;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public w2()Ll/l6t;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l6t;->c:Ll/l6t;

    .line 2
    .line 3
    return-object p0
.end method

.method public y2()I
    .locals 0

    .line 1
    iget p0, p0, Ll/l6t;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public z2(Ll/l6t;)Ll/l6t;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ll/l6t;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/l6t;->r2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-static {p0, p1, v0}, Ll/rf00;->a(Ll/l6t;Ll/l6t;Ljava/util/HashMap;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-object p1

    .line 13
    :cond_0
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    new-instance v0, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 23
    .line 24
    :cond_1
    invoke-virtual {p1, p0}, Ll/l6t;->B2(Ll/l6t;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/l6t;->u2(Ll/l6t;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 32
    .line 33
    invoke-virtual {v1, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    iget v0, p0, Ll/l6t;->a:I

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    if-lt v0, v1, :cond_2

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/l6t;->T()V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget p0, p0, Ll/l6t;->a:I

    .line 45
    .line 46
    const/4 v0, 0x2

    .line 47
    if-ne p0, v0, :cond_3

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/l6t;->t()V

    .line 50
    .line 51
    .line 52
    :cond_3
    return-object p1
.end method
