.class public final Lv6p;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lv6p;->a:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(ILjava/lang/CharSequence;)Ljava/lang/Object;
    .registers 5

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-gt v0, p1, :cond_9

    iget-object p0, p0, Lv6p;->a:Ljava/lang/Object;

    return-object p0

    :cond_9
    invoke-interface {p2, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    iget-object p0, p0, Lv6p;->b:Ljava/util/HashMap;

    const/4 v1, 0x0

    if-nez p0, :cond_18

    move-object p0, v1

    goto :goto_1e

    :cond_18
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lv6p;

    :goto_1e
    if-nez p0, :cond_21

    return-object v1

    :cond_21
    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1, p2}, Lv6p;->a(ILjava/lang/CharSequence;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final b(Ljava/lang/CharSequence;Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 6

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ne v0, p3, :cond_b

    iget-object p1, p0, Lv6p;->a:Ljava/lang/Object;

    iput-object p2, p0, Lv6p;->a:Ljava/lang/Object;

    return-object p1

    :cond_b
    invoke-interface {p1, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    iget-object v1, p0, Lv6p;->b:Ljava/util/HashMap;

    if-nez v1, :cond_27

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lv6p;->b:Ljava/util/HashMap;

    new-instance p0, Lv6p;

    invoke-direct {p0}, Lv6p;-><init>()V

    invoke-virtual {v1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3a

    :cond_27
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lv6p;

    if-nez v1, :cond_39

    new-instance v1, Lv6p;

    invoke-direct {v1}, Lv6p;-><init>()V

    iget-object p0, p0, Lv6p;->b:Ljava/util/HashMap;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_39
    move-object p0, v1

    :goto_3a
    add-int/lit8 p3, p3, 0x1

    invoke-virtual {p0, p1, p2, p3}, Lv6p;->b(Ljava/lang/CharSequence;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final c(Ljava/lang/StringBuilder;Ljava/util/HashSet;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    iget-object v1, p0, Lv6p;->a:Ljava/lang/Object;

    if-eqz v1, :cond_16

    new-instance v1, Lt6p;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lv6p;->a:Ljava/lang/Object;

    invoke-direct {v1, v2, v3}, Lt6p;-><init>(Ljava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {p2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_16
    iget-object v1, p0, Lv6p;->b:Ljava/util/HashMap;

    if-eqz v1, :cond_55

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    if-lez v1, :cond_55

    const/16 v1, 0x58

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lv6p;->b:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_2f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_52

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Character;

    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v2

    invoke-virtual {p1, v0, v2}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lv6p;

    invoke-virtual {v1, p1, p2}, Lv6p;->c(Ljava/lang/StringBuilder;Ljava/util/HashSet;)V

    goto :goto_2f

    :cond_52
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    :cond_55
    return-void
.end method

.method public final d(Ljava/util/ArrayList;)V
    .registers 3

    iget-object v0, p0, Lv6p;->a:Ljava/lang/Object;

    if-eqz v0, :cond_7

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    iget-object p0, p0, Lv6p;->b:Ljava/util/HashMap;

    if-eqz p0, :cond_23

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv6p;

    invoke-virtual {v0, p1}, Lv6p;->d(Ljava/util/ArrayList;)V

    goto :goto_13

    :cond_23
    return-void
.end method

.method public final e(Ljava/lang/Object;)Z
    .registers 3

    iget-object v0, p0, Lv6p;->a:Ljava/lang/Object;

    if-eqz v0, :cond_a

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    :cond_a
    iget-object p0, p0, Lv6p;->b:Ljava/util/HashMap;

    if-eqz p0, :cond_2a

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_16
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv6p;

    invoke-virtual {v0, p1}, Lv6p;->e(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_28
    const/4 p0, 0x1

    return p0

    :cond_2a
    const/4 p0, 0x0

    return p0
.end method

.method public final f(ILjava/lang/CharSequence;)Lt6p;
    .registers 7

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    if-gt v0, p1, :cond_12

    iget-object p0, p0, Lv6p;->a:Ljava/lang/Object;

    if-eqz p0, :cond_11

    new-instance p1, Lt6p;

    invoke-direct {p1, p2, p0}, Lt6p;-><init>(Ljava/lang/CharSequence;Ljava/lang/Object;)V

    return-object p1

    :cond_11
    return-object v1

    :cond_12
    invoke-interface {p2, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    iget-object v2, p0, Lv6p;->b:Ljava/util/HashMap;

    if-nez v2, :cond_20

    move-object v0, v1

    goto :goto_26

    :cond_20
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv6p;

    :goto_26
    const/4 v2, 0x0

    if-nez v0, :cond_3e

    iget-object p0, p0, Lv6p;->a:Ljava/lang/Object;

    if-eqz p0, :cond_3d

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-le v0, p1, :cond_37

    invoke-interface {p2, v2, p1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    :cond_37
    new-instance p1, Lt6p;

    invoke-direct {p1, p2, p0}, Lt6p;-><init>(Ljava/lang/CharSequence;Ljava/lang/Object;)V

    return-object p1

    :cond_3d
    return-object v1

    :cond_3e
    add-int/lit8 v3, p1, 0x1

    invoke-virtual {v0, v3, p2}, Lv6p;->f(ILjava/lang/CharSequence;)Lt6p;

    move-result-object v0

    if-eqz v0, :cond_47

    return-object v0

    :cond_47
    iget-object p0, p0, Lv6p;->a:Ljava/lang/Object;

    if-eqz p0, :cond_5b

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-le v0, p1, :cond_55

    invoke-interface {p2, v2, p1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    :cond_55
    new-instance p1, Lt6p;

    invoke-direct {p1, p2, p0}, Lt6p;-><init>(Ljava/lang/CharSequence;Ljava/lang/Object;)V

    return-object p1

    :cond_5b
    return-object v1
.end method

.method public final g(Ljava/lang/StringBuilder;Ljava/util/HashSet;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    iget-object v1, p0, Lv6p;->a:Ljava/lang/Object;

    if-eqz v1, :cond_f

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_f
    iget-object v1, p0, Lv6p;->b:Ljava/util/HashMap;

    if-eqz v1, :cond_4e

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    if-lez v1, :cond_4e

    const/16 v1, 0x58

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lv6p;->b:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_28
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Character;

    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v2

    invoke-virtual {p1, v0, v2}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lv6p;

    invoke-virtual {v1, p1, p2}, Lv6p;->g(Ljava/lang/StringBuilder;Ljava/util/HashSet;)V

    goto :goto_28

    :cond_4b
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    :cond_4e
    return-void
.end method
