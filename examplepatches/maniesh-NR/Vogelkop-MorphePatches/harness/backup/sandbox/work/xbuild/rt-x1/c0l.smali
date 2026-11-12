.class public final Lc0l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq9g;


# static fields
.field public static final e:Ldpj;

.field public static f:Lc0l;


# instance fields
.field public final a:Lumi;

.field public final b:Lydj;

.field public final c:Lqie;

.field public d:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ldpj;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ldpj;-><init>(B)V

    sput-object v0, Lc0l;->e:Ldpj;

    return-void
.end method

.method public constructor <init>(Lumi;Lydj;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc0l;->a:Lumi;

    iput-object p2, p0, Lc0l;->b:Lydj;

    new-instance p1, Lqie;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lqie;-><init>(B)V

    iput-object p1, p0, Lc0l;->c:Lqie;

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 4

    new-instance v0, Lrl;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lrl;-><init>(B)V

    new-instance v1, Lkoj;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lkoj;-><init>(Ljava/lang/Object;B)V

    iget-object v2, p0, Lc0l;->a:Lumi;

    invoke-interface {v2, v1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v1

    invoke-interface {v2, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    invoke-virtual {v1, v0}, Lnml;->b(Lnml;)V

    new-instance v0, Loml;

    invoke-direct {v0, v1}, Loml;-><init>(Lnml;)V

    const/4 v1, 0x0

    iget-object p0, p0, Lc0l;->c:Lqie;

    invoke-virtual {p0, v0, v1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final a()V
    .registers 5

    new-instance v0, Lgpk;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lgpk;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lc0l;->a:Lumi;

    invoke-virtual {v1, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v2, Lgpk;

    const/16 v3, 0x8

    invoke-direct {v2, p0, v3}, Lgpk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnml;->b(Lnml;)V

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    const/4 v0, 0x0

    iget-object p0, p0, Lc0l;->c:Lqie;

    invoke-virtual {p0, v1, v0}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final b(Ljava/util/HashMap;Ljava/util/LinkedHashMap;)V
    .registers 7

    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_8
    :goto_8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljag;

    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    sget-object v1, Llag;->b:Llag;

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object p1

    sget-object v1, Lkag;->b:Lkag;

    if-ne p1, v1, :cond_8

    sget-object p1, Lrmj;->a:Ln9h;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-virtual {p1, v1, v2, v3, v0}, Ln9h;->j(JZLjava/lang/String;)Lsmj;

    goto :goto_8

    :cond_3c
    return-void
.end method

.method public final d(Ljava/util/List;)V
    .registers 5

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6
    :goto_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lloj;

    iget-object v1, v0, Lloj;->b:Llag;

    if-eqz v1, :cond_1d

    sget-object v2, Llag;->b:Llag;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_1e

    :cond_1d
    const/4 v1, 0x1

    :goto_1e
    if-eqz v1, :cond_6

    iget-object v0, v0, Lloj;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_6

    new-instance v1, Let2;

    invoke-direct {v1, p0, v0}, Let2;-><init>(Lc0l;Ljava/lang/String;)V

    iget-object v0, p0, Lc0l;->a:Lumi;

    invoke-interface {v0, v1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    const/4 v0, 0x0

    iget-object v2, p0, Lc0l;->c:Lqie;

    invoke-virtual {v2, v1, v0}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    goto :goto_6

    :cond_3f
    return-void
.end method
