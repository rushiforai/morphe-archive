.class public Lkotlin/jvm/internal/SpreadBuilder;
.super Ljava/lang/Object;
.source "SpreadBuilder.java"


# instance fields
.field private final list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .registers 3

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lkotlin/jvm/internal/SpreadBuilder;->list:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 2

    .line 55
    iget-object p0, p0, Lkotlin/jvm/internal/SpreadBuilder;->list:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addSpread(Ljava/lang/Object;)V
    .registers 5

    if-nez p1, :cond_3

    goto :goto_5b

    .line 25
    :cond_3
    instance-of v0, p1, [Ljava/lang/Object;

    if-eqz v0, :cond_1f

    .line 26
    check-cast p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    .line 27
    array-length v0, p1

    if-lez v0, :cond_5b

    .line 28
    iget-object v0, p0, Lkotlin/jvm/internal/SpreadBuilder;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    array-length v2, p1

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 29
    iget-object p0, p0, Lkotlin/jvm/internal/SpreadBuilder;->list:Ljava/util/ArrayList;

    invoke-static {p0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    return-void

    .line 32
    :cond_1f
    instance-of v0, p1, Ljava/util/Collection;

    if-eqz v0, :cond_2b

    .line 33
    iget-object p0, p0, Lkotlin/jvm/internal/SpreadBuilder;->list:Ljava/util/ArrayList;

    check-cast p1, Ljava/util/Collection;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void

    .line 35
    :cond_2b
    instance-of v0, p1, Ljava/lang/Iterable;

    if-eqz v0, :cond_45

    .line 36
    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_35
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 37
    iget-object v1, p0, Lkotlin/jvm/internal/SpreadBuilder;->list:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_35

    .line 40
    :cond_45
    instance-of v0, p1, Ljava/util/Iterator;

    if-eqz v0, :cond_5c

    .line 41
    check-cast p1, Ljava/util/Iterator;

    :goto_4b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5b

    .line 42
    iget-object v0, p0, Lkotlin/jvm/internal/SpreadBuilder;->list:Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4b

    :cond_5b
    :goto_5b
    return-void

    .line 46
    :cond_5c
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Don\'t know how to spread "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public size()I
    .registers 1

    .line 51
    iget-object p0, p0, Lkotlin/jvm/internal/SpreadBuilder;->list:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 2

    .line 59
    iget-object p0, p0, Lkotlin/jvm/internal/SpreadBuilder;->list:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
