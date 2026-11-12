.class public abstract Lls2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lu9d;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lu9d;

    invoke-direct {v0}, Lu9d;-><init>()V

    sget-object v1, Liw;->c:Lh58;

    sget-object v2, Lc16;->d:Lh58;

    invoke-static {v2, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    sget-object v2, Lf16;->c:Lh58;

    invoke-static {v2, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    sget-object v2, Lrp5;->d:Lh58;

    invoke-static {v2, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    sget-object v2, Ldtf;->d:Lh58;

    invoke-static {v2, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :cond_24
    if-ge v3, v2, :cond_4f

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lks2;

    invoke-interface {v4}, Lks2;->g()Ljava/util/Set;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_38
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_24

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lt0h;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6, v4}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lks2;

    goto :goto_38

    :cond_4f
    invoke-virtual {v0}, Lu9d;->g()Lu9d;

    move-result-object v0

    sput-object v0, Lls2;->a:Lu9d;

    return-void
.end method
