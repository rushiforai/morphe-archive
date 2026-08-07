.class public final Lcom/immomo/motracing/CTracer;
.super Lcom/immomo/motracing/Tracer;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001J<\u0010\n\u001a\u00020\t2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00062\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0006H\u0082 \u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ3\u0010\u0010\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u00042\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u000f2\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u000fH\u0010\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R%\u0010\u0014\u001a\u0010\u0012\u0004\u0012\u00020\u0013\u0012\u0006\u0012\u0004\u0018\u00010\t0\u00128\u0002X\u0082\u0004\u00f8\u0001\u0000\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0015R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010\u0016R\u001d\u0010\u0017\u001a\u00020\u00138\u0016X\u0096\u0004\u00f8\u0001\u0000\u00a2\u0006\u000c\n\u0004\u0008\u0017\u0010\u0016\u001a\u0004\u0008\u0018\u0010\u0019\u0082\u0002\u0004\n\u0002\u0008\u0019\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/immomo/motracing/CTracer;",
        "Lcom/immomo/motracing/Tracer;",
        "",
        "np",
        "",
        "name",
        "",
        "keys",
        "values",
        "Lcom/immomo/motracing/Span;",
        "_startSpan",
        "(JLjava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Lcom/immomo/motracing/Span;",
        "Ll/quf0;",
        "a",
        "(Ljava/lang/String;)Ll/quf0;",
        "",
        "b",
        "(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/immomo/motracing/Span;",
        "Landroid/util/LruCache;",
        "Lkotlin/ULong;",
        "spanCache",
        "Landroid/util/LruCache;",
        "J",
        "id",
        "getId",
        "()J",
        "MoTracing_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private final id:J

.field private final np:J

.field private final spanCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Lkotlin/ULong;",
            "Lcom/immomo/motracing/Span;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private final native _startSpan(JLjava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Lcom/immomo/motracing/Span;
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ll/quf0;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/quf0;

    .line 5
    .line 6
    invoke-direct {v0, p1, p0}, Ll/quf0;-><init>(Ljava/lang/String;Lcom/immomo/motracing/Tracer;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public b(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/immomo/motracing/Span;
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/immomo/motracing/Span;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-wide v1, p0, Lcom/immomo/motracing/CTracer;->np:J

    .line 11
    .line 12
    check-cast p2, Ljava/util/Collection;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    new-array v3, v0, [Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {p2, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    const/4 v3, 0x0

    .line 22
    const-string v4, "null cannot be cast to non-null type kotlin.Array<T>"

    .line 23
    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    check-cast p2, [Ljava/lang/String;

    .line 27
    .line 28
    check-cast p3, Ljava/util/Collection;

    .line 29
    .line 30
    new-array v0, v0, [Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p3, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    if-eqz p3, :cond_0

    .line 37
    .line 38
    move-object v5, p3

    .line 39
    check-cast v5, [Ljava/lang/String;

    .line 40
    .line 41
    move-object v0, p0

    .line 42
    move-object v3, p1

    .line 43
    move-object v4, p2

    .line 44
    invoke-direct/range {v0 .. v5}, Lcom/immomo/motracing/CTracer;->_startSpan(JLjava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Lcom/immomo/motracing/Span;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p1, v0, Lcom/immomo/motracing/CTracer;->spanCache:Landroid/util/LruCache;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/immomo/motracing/Span;->a()J

    .line 51
    .line 52
    .line 53
    move-result-wide p2

    .line 54
    invoke-static {p2, p3}, Lkotlin/ULong;->a(J)Lkotlin/ULong;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p1, p2, p0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_0
    invoke-static {v4}, Lb;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-object v3

    .line 66
    :cond_1
    invoke-static {v4}, Lb;->a(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-object v3
.end method
