.class public Lcom/tantanapp/common/data/orm/LruCache2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private evictionCount:I

.field private hitCount:I

.field private final map:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private maxSize:I

.field private missCount:I

.field private putCount:I

.field private size:I


# direct methods
.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-lez p1, :cond_0

    .line 5
    .line 6
    iput p1, p0, Lcom/tantanapp/common/data/orm/LruCache2;->maxSize:I

    .line 7
    .line 8
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 9
    .line 10
    const/high16 v0, 0x3f400000    # 0.75f

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {p1, v2, v0, v1}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/LruCache2;->map:Ljava/util/LinkedHashMap;

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p0, "maxSize <= 0"

    .line 21
    .line 22
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    throw p0
.end method

.method private safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/data/orm/LruCache2;->sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ltz p0, :cond_0

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const-string p0, "Negative size: "

    .line 9
    .line 10
    const-string v0, "="

    .line 11
    .line 12
    invoke-static {p0, p1, v0, p2}, Ll/krd0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0
.end method


# virtual methods
.method public final cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->putCount:I

    .line 6
    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iput v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->putCount:I

    .line 10
    .line 11
    iget v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 12
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/common/data/orm/LruCache2;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/2addr v0, v1

    .line 18
    iput v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 19
    .line 20
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->map:Ljava/util/LinkedHashMap;

    .line 21
    .line 22
    invoke-virtual {v0, p1, p2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    iget v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 29
    .line 30
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/common/data/orm/LruCache2;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    sub-int/2addr v0, p1

    .line 35
    iput v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 36
    .line 37
    :cond_0
    iget p1, p0, Lcom/tantanapp/common/data/orm/LruCache2;->maxSize:I

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/LruCache2;->trimToSize(I)V

    .line 40
    .line 41
    .line 42
    return-object p2

    .line 43
    :cond_1
    new-instance p0, Ljava/lang/NullPointerException;

    .line 44
    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v1, "key = "

    .line 48
    .line 49
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p1, " , value = "

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw p0
.end method

.method public final cached(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/LruCache2;->map:Ljava/util/LinkedHashMap;

    .line 5
    .line 6
    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->hitCount:I

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    iput v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->hitCount:I

    .line 17
    .line 18
    return-object p1

    .line 19
    :cond_0
    iget p1, p0, Lcom/tantanapp/common/data/orm/LruCache2;->missCount:I

    .line 20
    .line 21
    add-int/lit8 p1, p1, 0x1

    .line 22
    .line 23
    iput p1, p0, Lcom/tantanapp/common/data/orm/LruCache2;->missCount:I

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    const-string p0, "key == null"

    .line 27
    .line 28
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public final evictAll()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/LruCache2;->trimToSize(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final evictionCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->evictionCount:I

    .line 2
    .line 3
    return p0
.end method

.method public final hitCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->hitCount:I

    .line 2
    .line 3
    return p0
.end method

.method public final maxSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->maxSize:I

    .line 2
    .line 3
    return p0
.end method

.method public final missCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->missCount:I

    .line 2
    .line 3
    return p0
.end method

.method public final putCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->putCount:I

    .line 2
    .line 3
    return p0
.end method

.method public final remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->map:Ljava/util/LinkedHashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget v1, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 12
    .line 13
    invoke-direct {p0, p1, v0}, Lcom/tantanapp/common/data/orm/LruCache2;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    sub-int/2addr v1, p1

    .line 18
    iput v1, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 19
    .line 20
    :cond_0
    return-object v0

    .line 21
    :cond_1
    const-string p0, "key == null"

    .line 22
    .line 23
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public resize(I)V
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/tantanapp/common/data/orm/LruCache2;->maxSize:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/LruCache2;->trimToSize(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "maxSize <= 0"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final size()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 2
    .line 3
    return p0
.end method

.method public sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)I"
        }
    .end annotation

    const/4 p0, 0x1

    return p0
.end method

.method public final snapshot()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->map:Ljava/util/LinkedHashMap;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->hitCount:I

    .line 2
    .line 3
    iget v1, p0, Lcom/tantanapp/common/data/orm/LruCache2;->missCount:I

    .line 4
    .line 5
    add-int/2addr v1, v0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    mul-int/lit8 v0, v0, 0x64

    .line 9
    .line 10
    div-int/2addr v0, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    iget v1, p0, Lcom/tantanapp/common/data/orm/LruCache2;->maxSize:I

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget v2, p0, Lcom/tantanapp/common/data/orm/LruCache2;->hitCount:I

    .line 20
    .line 21
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget p0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->missCount:I

    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    filled-new-array {v1, v2, p0, v0}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]"

    .line 40
    .line 41
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public trimToSize(I)V
    .locals 3

    .line 1
    :goto_0
    iget v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 2
    .line 3
    if-ltz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->map:Ljava/util/LinkedHashMap;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 14
    .line 15
    if-nez v0, :cond_3

    .line 16
    .line 17
    :cond_0
    iget v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 18
    .line 19
    if-le v0, p1, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->map:Ljava/util/LinkedHashMap;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->map:Ljava/util/LinkedHashMap;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ljava/util/Map$Entry;

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/LruCache2;->map:Ljava/util/LinkedHashMap;

    .line 55
    .line 56
    invoke-virtual {v2, v1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    iget v2, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 60
    .line 61
    invoke-direct {p0, v1, v0}, Lcom/tantanapp/common/data/orm/LruCache2;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    sub-int/2addr v2, v0

    .line 66
    iput v2, p0, Lcom/tantanapp/common/data/orm/LruCache2;->size:I

    .line 67
    .line 68
    iget v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->evictionCount:I

    .line 69
    .line 70
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    iput v0, p0, Lcom/tantanapp/common/data/orm/LruCache2;->evictionCount:I

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    :goto_1
    return-void

    .line 76
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, ".sizeOf() is reporting inconsistent results!"

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method
