.class public final Lcom/opera/android/history/f;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lyk6;

.field public final d:Lj4c;

.field public final e:Lbw3;

.field public final f:Lcom/opera/android/history/d;

.field public final g:Lwnm;


# direct methods
.method public constructor <init>(Lorm;Lcom/opera/android/history/HistoryManager;Ltz1;La64;Lcom/opera/android/settings/SettingsManager;Lyk6;Lj4c;Lbw3;)V
    .registers 17

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p5, p0, Lcom/opera/android/history/f;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p6, p0, Lcom/opera/android/history/f;->c:Lyk6;

    iput-object p7, p0, Lcom/opera/android/history/f;->d:Lj4c;

    move-object/from16 p5, p8

    iput-object p5, p0, Lcom/opera/android/history/f;->e:Lbw3;

    new-instance p5, Lcom/opera/android/history/d;

    new-instance v1, Lcom/opera/android/history/e;

    invoke-direct {v1, p2, p3, p4}, Lcom/opera/android/history/e;-><init>(Lcom/opera/android/history/HistoryManager;Ltz1;La64;)V

    invoke-direct {p5, v1, p1}, Lcom/opera/android/history/d;-><init>(Lcom/opera/android/history/e;Lorm;)V

    iput-object p5, p0, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    invoke-virtual {p0}, Lcom/opera/android/history/f;->f()Lkea;

    move-result-object p1

    iget-object p2, p5, Loy;->f:Ljava/lang/Object;

    check-cast p2, Lh42;

    iget-object p3, p6, Lyk6;->j:Lkze;

    new-instance v0, Ls2;

    const/4 v6, 0x0

    const/16 v7, 0xc

    const/4 v1, 0x2

    const-class v3, Lcom/opera/android/history/f;

    const-string v4, "calculateState"

    const-string v5, "calculateState(Ljava/util/List;Z)Lcom/opera/android/history/HistoryViewState;"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-static {p1, p2, p3, v0}, Lxf8;->Y(Ljava/lang/Object;Lekc;Lekc;Lkotlin/jvm/functions/Function2;)Lwnm;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/history/f;->g:Lwnm;

    return-void
.end method


# virtual methods
.method public final f()Lkea;
    .registers 5

    new-instance v0, Lkea;

    iget-object v1, p0, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    iget-object v1, v1, Lcom/opera/android/history/d;->l:Lcom/opera/android/history/e;

    iget-object v1, v1, Lcom/opera/android/history/e;->e:Laea;

    iget-object p0, p0, Lcom/opera/android/history/f;->c:Lyk6;

    iget-object p0, p0, Lyk6;->j:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_25

    sget-object p0, Laea;->a:Laea;

    sget-object v2, Laea;->b:Laea;

    filled-new-array {p0, v2}, [Laea;

    move-result-object p0

    invoke-static {p0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    goto :goto_2b

    :cond_25
    sget-object p0, Laea;->a:Laea;

    invoke-static {p0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    :goto_2b
    sget-object v2, Ll08;->a:Ll08;

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, p0, v2}, Lkea;-><init>(ZLaea;Ljava/util/Set;Ljava/util/List;)V

    return-object v0
.end method

.method public final g(Lzda;)Ljava/lang/String;
    .registers 6

    const/4 v0, 0x0

    if-eqz p1, :cond_4a

    instance-of v1, p1, Lyda;

    if-eqz v1, :cond_3d

    check-cast p1, Lyda;

    iget-object p1, p1, Lyda;->a:Ljz1;

    iget-object v1, p1, Ljz1;->a:Ljava/lang/String;

    iget-object p1, p1, Ljz1;->b:Ljava/lang/String;

    iget-object p0, p0, Lcom/opera/android/history/f;->e:Lbw3;

    iget-object p0, p0, Lbw3;->a:Lq6e;

    const-wide v2, 0x7ffffffffffffffdL

    invoke-virtual {p0, v2, v3}, Lq6e;->c(J)Ll6e;

    move-result-object p0

    instance-of v2, p0, Ll42;

    if-eqz v2, :cond_23

    check-cast p0, Ll42;

    goto :goto_24

    :cond_23
    move-object p0, v0

    :goto_24
    if-eqz p0, :cond_3c

    invoke-virtual {p0, p1, v1}, Ll42;->r(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Ll6e;->d:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-static {v2, v1, p1}, Lzg;->o(ILjava/lang/String;Ljava/lang/String;)Lzg;

    move-result-object p1

    if-eqz p1, :cond_3c

    sget-object v0, Lp6l;->a:Lp6l;

    sget-object v1, Lcti;->a:Lhv5;

    invoke-static {p1, p0, v1, v0}, Lcti;->a(Lzg;Leri;Lbti;Lp6l;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3c
    return-object v0

    :cond_3d
    instance-of p0, p1, Lcom/opera/android/history/c;

    if-eqz p0, :cond_4a

    check-cast p1, Lcom/opera/android/history/c;

    iget-object p0, p1, Lcom/opera/android/history/c;->a:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {p0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getUrl()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4a
    invoke-static {}, Lh9o;->p()V

    return-object v0
.end method

.method public final h(Ljava/util/List;Z)V
    .registers 10

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_b
    :goto_b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Laca;

    if-eqz v2, :cond_b

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_1d
    new-instance p1, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {v0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_2e
    if-ge v3, v1, :cond_40

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Laca;

    invoke-interface {v4}, Laca;->a()Lzda;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    :cond_40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v3, v2

    :cond_4a
    :goto_4a
    if-ge v3, v1, :cond_68

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lzda;

    invoke-virtual {p0, v4}, Lcom/opera/android/history/f;->g(Lzda;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    if-eqz v4, :cond_61

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-gtz v6, :cond_62

    :cond_61
    move-object v4, v5

    :cond_62
    if-eqz v4, :cond_4a

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4a

    :cond_68
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_9c

    new-instance p1, Lvx3;

    sget-object v1, Llqm;->c:Llqm;

    invoke-direct {p1, v1}, Lvx3;-><init>(Llqm;)V

    new-instance v1, Lux3;

    const/4 v3, 0x1

    invoke-direct {v1, p1, v3}, Lux3;-><init>(Lvx3;Z)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    invoke-virtual {p1, v3}, Lvx3;->c(Z)V

    invoke-virtual {p1, p2}, Lvx3;->e(Z)V

    iget-object p0, p0, Lcom/opera/android/history/f;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->C()Lq7j;

    move-result-object p0

    sget-object p2, Lq7j;->c:Lq7j;

    if-ne p0, p2, :cond_90

    move p0, v3

    goto :goto_91

    :cond_90
    move p0, v2

    :goto_91
    invoke-virtual {p1, p0}, Lvx3;->a(Z)V

    invoke-virtual {p1, v3}, Lvx3;->d(Z)V

    iput-boolean v2, p1, Lvx3;->f:Z

    invoke-static {p1}, Lam2;->v(Lvx3;)V

    :cond_9c
    return-void
.end method

.method public final i(Laea;)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    iget-object v0, v0, Lcom/opera/android/history/d;->l:Lcom/opera/android/history/e;

    iget-object v1, v0, Lcom/opera/android/history/e;->e:Laea;

    if-ne v1, p1, :cond_9

    return-void

    :cond_9
    iput-object p1, v0, Lcom/opera/android/history/e;->e:Laea;

    invoke-virtual {v0}, Lcom/opera/android/history/e;->a()V

    iget-object p0, p0, Lcom/opera/android/history/f;->g:Lwnm;

    invoke-virtual {p0}, Lwnm;->u()V

    return-void
.end method
