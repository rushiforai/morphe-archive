.class public final Lp7p;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ljava/util/LinkedHashSet;

.field public static final d:Ljava/util/LinkedHashSet;


# instance fields
.field public final a:Lvoo;

.field public final b:Ljava/util/LinkedHashSet;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    sput-object v0, Lp7p;->c:Ljava/util/LinkedHashSet;

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    sput-object v0, Lp7p;->d:Ljava/util/LinkedHashSet;

    return-void
.end method

.method public constructor <init>(Lvoo;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp7p;->a:Lvoo;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lp7p;->b:Ljava/util/LinkedHashSet;

    return-void
.end method

.method public static c(Ljava/lang/String;Ljava/util/List;Ljava/util/LinkedHashSet;)V
    .registers 7

    if-eqz p1, :cond_41

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_41

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ":ping_trackers"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p2, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_41

    sget-object p0, Lvbp;->b:Lvbp;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_25
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_41

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    sget-object v0, Ldap;->a:Ldap;

    sget-object v0, Lp9p;->j:Lp9p;

    new-instance v1, Lp9p;

    const/4 v2, 0x1

    const/16 v3, 0xb

    invoke-direct {v1, v3, v2}, Lp9p;-><init>(BI)V

    invoke-static {p2, v0, v1, p0}, Ldap;->c(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Licp;)Lq8p;

    goto :goto_25

    :cond_41
    return-void
.end method

.method public static e(Lp8p;Ljava/util/List;Ljava/util/LinkedHashSet;)V
    .registers 6

    instance-of v0, p0, Lr5p;

    const/16 v1, 0x3a

    if-eqz v0, :cond_20

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lp8p;->a:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-object v1, p0

    check-cast v1, Lr5p;

    iget v1, v1, Lr5p;->l:I

    :goto_18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_38

    :cond_20
    instance-of v0, p0, Lebp;

    iget-object v2, p0, Lp8p;->a:Ljava/lang/String;

    if-eqz v0, :cond_37

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-object v1, p0

    check-cast v1, Lebp;

    iget v1, v1, Lebp;->l:I

    goto :goto_18

    :cond_37
    move-object v0, v2

    :goto_38
    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-static {p0}, Lp8p;->a(Lp8p;)V

    :cond_41
    invoke-static {v0, p1, p2}, Lp7p;->c(Ljava/lang/String;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 11

    new-instance v0, Lebp;

    iget-object v1, p0, Lp7p;->a:Lvoo;

    iget-object v4, v1, Lvoo;->c:Ljava/lang/String;

    iget-object v2, v1, Lvoo;->b:Lpro;

    iget-object v5, v2, Lpro;->a:Ljava/lang/String;

    iget-object v6, v1, Lvoo;->j:Ljava/lang/String;

    iget-object v2, v1, Lvoo;->l:Lfuo;

    iget-wide v7, v1, Lvoo;->k:D

    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    move v1, p1

    invoke-direct/range {v0 .. v6}, Lebp;-><init>(ILfuo;Ljava/lang/Double;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    iget-object p0, p0, Lp7p;->b:Ljava/util/LinkedHashSet;

    invoke-static {v0, p1, p0}, Lp7p;->e(Lp8p;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    return-void
.end method

.method public final b(Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;)V
    .registers 16

    new-instance v0, Lwfp;

    iget-object v11, p0, Lp7p;->a:Lvoo;

    iget-object v1, v11, Lvoo;->c:Ljava/lang/String;

    iget-object v2, v11, Lvoo;->b:Lpro;

    iget-object v2, v2, Lpro;->a:Ljava/lang/String;

    iget-object v3, v11, Lvoo;->j:Ljava/lang/String;

    iget-object v4, v11, Lvoo;->l:Lfuo;

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object v5

    invoke-virtual {v5}, Lt5p;->a()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object v6

    iget-boolean v6, v6, Lt5p;->c:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iget-wide v7, v11, Lvoo;->k:D

    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    move-object v8, p1

    move-object v9, p2

    move-object v10, p3

    invoke-direct/range {v0 .. v10}, Lwfp;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Double;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;)V

    invoke-virtual {v11}, Lvoo;->d()Ljava/util/List;

    move-result-object p1

    iget-object p0, p0, Lp7p;->b:Ljava/util/LinkedHashSet;

    invoke-static {v0, p1, p0}, Lp7p;->e(Lp8p;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    return-void
.end method

.method public final d(Ljava/lang/String;Ljava/util/Map;)V
    .registers 5

    new-instance v0, Lu9d;

    invoke-direct {v0}, Lu9d;-><init>()V

    invoke-virtual {v0, p2}, Lu9d;->putAll(Ljava/util/Map;)V

    iget-object p0, p0, Lp7p;->a:Lvoo;

    iget-object p2, p0, Lvoo;->c:Ljava/lang/String;

    const-string v1, "reqId"

    invoke-virtual {v0, v1, p2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lvoo;->b:Lpro;

    iget-object p2, p2, Lpro;->a:Ljava/lang/String;

    const-string v1, "placementId"

    invoke-virtual {v0, v1, p2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lvoo;->j:Ljava/lang/String;

    const-string v1, "crId"

    invoke-virtual {v0, v1, p2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lvoo;->l:Lfuo;

    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "adType"

    invoke-virtual {v0, p2, p0}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object p0

    invoke-virtual {p0}, Lt5p;->a()Ljava/lang/String;

    move-result-object p0

    const-string p2, "connectionType"

    invoke-virtual {v0, p2, p0}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object p0

    iget-boolean p0, p0, Lt5p;->c:Z

    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p0

    const-string p2, "b.vpn"

    invoke-virtual {v0, p2, p0}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lu9d;->g()Lu9d;

    move-result-object p0

    sget-object p2, Lp8p;->Companion:Lk8p;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    const/4 v0, 0x0

    if-gtz p2, :cond_6a

    move-object p1, v0

    :cond_6a
    if-eqz p1, :cond_71

    new-instance v0, Ln8p;

    invoke-direct {v0, p1, p0}, Ln8p;-><init>(Ljava/lang/String;Lu9d;)V

    :cond_71
    if-eqz v0, :cond_76

    invoke-static {v0}, Lp8p;->a(Lp8p;)V

    :cond_76
    return-void
.end method

.method public final f()V
    .registers 6

    new-instance v0, Lxjo;

    iget-object v1, p0, Lp7p;->a:Lvoo;

    iget-object v2, v1, Lvoo;->c:Ljava/lang/String;

    iget-object v3, v1, Lvoo;->b:Lpro;

    iget-object v3, v3, Lpro;->a:Ljava/lang/String;

    iget-object v4, v1, Lvoo;->j:Ljava/lang/String;

    iget-object v1, v1, Lvoo;->l:Lfuo;

    invoke-direct {v0, v2, v3, v4, v1}, Lxjo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;)V

    const/4 v1, 0x0

    iget-object p0, p0, Lp7p;->b:Ljava/util/LinkedHashSet;

    invoke-static {v0, v1, p0}, Lp7p;->e(Lp8p;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    return-void
.end method

.method public final g(ILjava/lang/String;)V
    .registers 4

    new-instance v0, Lxz3;

    invoke-direct {v0, p0, p1, p2}, Lxz3;-><init>(Lp7p;ILjava/lang/String;)V

    invoke-static {v0}, Lpfp;->c(Ljava/lang/Runnable;)V

    return-void
.end method
