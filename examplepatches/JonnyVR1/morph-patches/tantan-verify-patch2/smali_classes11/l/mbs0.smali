.class public final Ll/mbs0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/g6s0;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/fts0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mbs0;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ll/fts0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/fts0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/mbs0;->b:Ll/fts0;

    .line 17
    .line 18
    new-instance v0, Ll/o3s0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/o3s0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/mbs0;->b(Ll/g6s0;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/fas0;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/fas0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/mbs0;->b(Ll/g6s0;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/tcs0;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/tcs0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/mbs0;->b(Ll/g6s0;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/mgs0;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/mgs0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/mbs0;->b(Ll/g6s0;)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ll/cjs0;

    .line 51
    .line 52
    invoke-direct {v0}, Ll/cjs0;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/mbs0;->b(Ll/g6s0;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Ll/zqs0;

    .line 59
    .line 60
    invoke-direct {v0}, Ll/zqs0;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Ll/mbs0;->b(Ll/g6s0;)V

    .line 64
    .line 65
    .line 66
    new-instance v0, Ll/dxs0;

    .line 67
    .line 68
    invoke-direct {v0}, Ll/dxs0;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ll/mbs0;->b(Ll/g6s0;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method


# virtual methods
.method public final a(Ll/gix0;Ll/ewr0;)Ll/ewr0;
    .locals 2

    .line 1
    invoke-static {p1}, Ll/tqw0;->b(Ll/gix0;)I

    .line 2
    .line 3
    .line 4
    instance-of v0, p2, Ll/xzr0;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    check-cast p2, Ll/xzr0;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/xzr0;->b()Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p2}, Ll/xzr0;->a()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    iget-object v1, p0, Ll/mbs0;->a:Ljava/util/Map;

    .line 19
    .line 20
    invoke-interface {v1, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Ll/mbs0;->a:Ljava/util/Map;

    .line 27
    .line 28
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ll/g6s0;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p0, p0, Ll/mbs0;->b:Ll/fts0;

    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0, p2, p1, v0}, Ll/g6s0;->b(Ljava/lang/String;Ll/gix0;Ljava/util/List;)Ll/ewr0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_1
    return-object p2
.end method

.method public final b(Ll/g6s0;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/g6s0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/google/android/gms/internal/measurement/zzbv;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/google/android/gms/internal/measurement/zzbv;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p0, Ll/mbs0;->a:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {v2, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method
