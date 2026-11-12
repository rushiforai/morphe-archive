.class public abstract Ldl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lq50;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/util/SortedSet;

.field public final e:Ljava/util/SortedSet;

.field public final f:Liq;


# direct methods
.method public constructor <init>(ILq50;Ljava/lang/String;Ljava/util/TreeSet;Ljava/util/TreeSet;Liq;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ldl;->a:I

    iput-object p2, p0, Ldl;->b:Lq50;

    iput-object p3, p0, Ldl;->c:Ljava/lang/String;

    const/4 p1, 0x0

    if-nez p4, :cond_e

    move-object p2, p1

    goto :goto_12

    :cond_e
    invoke-static {p4}, Ljava/util/Collections;->unmodifiableSortedSet(Ljava/util/SortedSet;)Ljava/util/SortedSet;

    move-result-object p2

    :goto_12
    iput-object p2, p0, Ldl;->d:Ljava/util/SortedSet;

    if-eqz p5, :cond_1a

    invoke-static {p5}, Ljava/util/Collections;->unmodifiableSortedSet(Ljava/util/SortedSet;)Ljava/util/SortedSet;

    move-result-object p1

    :cond_1a
    iput-object p1, p0, Ldl;->e:Ljava/util/SortedSet;

    iput-object p6, p0, Ldl;->f:Liq;

    return-void
.end method

.method public static a(Lorb;)Ljava/util/TreeSet;
    .registers 5

    const-string v0, "fallback-formats"

    invoke-virtual {p0, v0}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object p0

    if-nez p0, :cond_f

    sget-object p0, Lrm;->h:Lrm;

    invoke-static {p0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object p0

    goto :goto_3b

    :cond_f
    const-class v0, Lrm;

    invoke-static {v0}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    const/4 v1, 0x0

    :goto_16
    iget-object v2, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_3a

    invoke-virtual {p0, v1}, Lvpb;->d(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "*"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_30

    sget-object p0, Lrm;->i:Ljava/util/Set;

    invoke-virtual {v0, p0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    goto :goto_3a

    :cond_30
    :try_start_30
    invoke-static {v2}, Lrm;->d(Ljava/lang/String;)Lrm;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z
    :try_end_37
    .catch Ljava/lang/IllegalArgumentException; {:try_start_30 .. :try_end_37} :catch_37

    :catch_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    :cond_3a
    :goto_3a
    move-object p0, v0

    :goto_3b
    invoke-static {p0}, Ljava/util/EnumSet;->complementOf(Ljava/util/EnumSet;)Ljava/util/EnumSet;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_47

    const/4 p0, 0x0

    return-object p0

    :cond_47
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0, p0}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public static b(Lorb;)Ljava/util/TreeSet;
    .registers 6

    const-string v0, "fallback-provider-blacklist"

    invoke-virtual {p0, v0}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object p0

    if-eqz p0, :cond_39

    iget-object v0, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-eqz v1, :cond_39

    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    const/4 v2, 0x0

    :goto_16
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_38

    invoke-virtual {p0, v2}, Lvpb;->d(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "*"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2e

    sget-object p0, Lyo;->h:Ljava/util/Set;

    invoke-virtual {v1, p0}, Ljava/util/TreeSet;->addAll(Ljava/util/Collection;)Z

    goto :goto_38

    :cond_2e
    :try_start_2e
    invoke-static {v3}, Lyo;->d(Ljava/lang/String;)Lyo;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z
    :try_end_35
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2e .. :try_end_35} :catch_35

    :catch_35
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    :cond_38
    :goto_38
    return-object v1

    :cond_39
    const/4 p0, 0x0

    return-object p0
.end method
