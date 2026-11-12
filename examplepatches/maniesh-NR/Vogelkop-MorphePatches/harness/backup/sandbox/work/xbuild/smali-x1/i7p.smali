.class public final Li7p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Map;


# instance fields
.field public a:Lv6p;

.field public b:I

.field public c:I


# virtual methods
.method public final a(Ljava/lang/CharSequence;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    const/4 v0, 0x0

    if-eqz p1, :cond_2f

    if-eqz p2, :cond_29

    iget-object v1, p0, Li7p;->a:Lv6p;

    if-nez v1, :cond_10

    new-instance v1, Lv6p;

    invoke-direct {v1}, Lv6p;-><init>()V

    iput-object v1, p0, Li7p;->a:Lv6p;

    :cond_10
    const/4 v2, 0x0

    invoke-virtual {v1, p1, p2, v2}, Lv6p;->b(Ljava/lang/CharSequence;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_18

    return-object p2

    :cond_18
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    iget p2, p0, Li7p;->b:I

    if-le p1, p2, :cond_22

    iput p1, p0, Li7p;->b:I

    :cond_22
    iget p1, p0, Li7p;->c:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Li7p;->c:I

    return-object v0

    :cond_29
    const-string p0, "Null values are not handled"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v0

    :cond_2f
    const-string p0, "Null keys are not handled"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v0
.end method

.method public final b(Ljava/lang/CharSequence;)Ljava/util/Map$Entry;
    .registers 3

    iget-object p0, p0, Li7p;->a:Lv6p;

    if-eqz p0, :cond_c

    if-eqz p1, :cond_c

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lv6p;->f(ILjava/lang/CharSequence;)Lt6p;

    move-result-object p0

    return-object p0

    :cond_c
    const/4 p0, 0x0

    return-object p0
.end method

.method public final clear()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Li7p;->a:Lv6p;

    const/4 v0, -0x1

    iput v0, p0, Li7p;->b:I

    const/4 v0, 0x0

    iput v0, p0, Li7p;->c:I

    return-void
.end method

.method public final containsKey(Ljava/lang/Object;)Z
    .registers 2

    invoke-virtual {p0, p1}, Li7p;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final containsValue(Ljava/lang/Object;)Z
    .registers 2

    iget-object p0, p0, Li7p;->a:Lv6p;

    if-nez p0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-virtual {p0, p1}, Lv6p;->e(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final entrySet()Ljava/util/Set;
    .registers 3

    new-instance v0, Ljava/util/HashSet;

    iget v1, p0, Li7p;->c:I

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iget-object p0, p0, Li7p;->a:Lv6p;

    if-nez p0, :cond_c

    return-object v0

    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1, v0}, Lv6p;->c(Ljava/lang/StringBuilder;Ljava/util/HashSet;)V

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ljava/util/Map;

    if-nez v1, :cond_9

    return v0

    :cond_9
    invoke-virtual {p0}, Li7p;->entrySet()Ljava/util/Set;

    move-result-object p0

    check-cast p1, Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-object p0, p0, Li7p;->a:Lv6p;

    const/4 v0, 0x0

    if-eqz p0, :cond_14

    if-eqz p1, :cond_14

    instance-of v1, p1, Ljava/lang/CharSequence;

    if-nez v1, :cond_c

    return-object v0

    :cond_c
    check-cast p1, Ljava/lang/CharSequence;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lv6p;->a(ILjava/lang/CharSequence;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_14
    return-object v0
.end method

.method public final hashCode()I
    .registers 1

    invoke-virtual {p0}, Li7p;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->hashCode()I

    move-result p0

    return p0
.end method

.method public final isEmpty()Z
    .registers 1

    iget p0, p0, Li7p;->c:I

    if-nez p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final keySet()Ljava/util/Set;
    .registers 3

    new-instance v0, Ljava/util/HashSet;

    iget v1, p0, Li7p;->c:I

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iget-object p0, p0, Li7p;->a:Lv6p;

    if-nez p0, :cond_c

    return-object v0

    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1, v0}, Lv6p;->g(Ljava/lang/StringBuilder;Ljava/util/HashSet;)V

    return-object v0
.end method

.method public final bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1, p2}, Li7p;->a(Ljava/lang/CharSequence;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final putAll(Ljava/util/Map;)V
    .registers 4

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Li7p;->a(Ljava/lang/CharSequence;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    :cond_22
    return-void
.end method

.method public final remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final size()I
    .registers 1

    iget p0, p0, Li7p;->c:I

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 5

    invoke-virtual {p0}, Li7p;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    const-string p0, "{}"

    return-object p0

    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "{ "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Li7p;->entrySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/util/HashSet;

    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v1, 0x1

    :goto_1b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_38

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    if-eqz v1, :cond_2b

    const/4 v1, 0x0

    goto :goto_30

    :cond_2b
    const-string v3, ", "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_30
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1b

    :cond_38
    const-string p0, " }"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final values()Ljava/util/Collection;
    .registers 3

    new-instance v0, Ljava/util/ArrayList;

    iget v1, p0, Li7p;->c:I

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object p0, p0, Li7p;->a:Lv6p;

    if-nez p0, :cond_c

    return-object v0

    :cond_c
    invoke-virtual {p0, v0}, Lv6p;->d(Ljava/util/ArrayList;)V

    return-object v0
.end method
