.class public abstract Lzxf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public a:Ljava/util/ArrayList;

.field public b:Ll0c;

.field public final c:Ljava/util/HashSet;

.field public final synthetic d:Ldyf;


# direct methods
.method public constructor <init>(Ldyf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzxf;->d:Ldyf;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lzxf;->c:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Lxxf;

    iget-object v0, p0, Lzxf;->c:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {p0}, Lzxf;->g()V

    iget-object v1, p0, Lzxf;->d:Ldyf;

    iget-object v2, v1, Ldyf;->g:Lh7f;

    invoke-virtual {v2, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Ldyf;->d()V

    :cond_17
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lxxf;

    iget-object v0, p0, Lzxf;->c:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_17

    iget-object p1, p0, Lzxf;->d:Ldyf;

    iget-object v0, p1, Ldyf;->g:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Ldyf;->d()V

    :cond_17
    return-void
.end method

.method public final a()Ljava/util/ArrayList;
    .registers 10

    iget-object v0, p0, Lzxf;->d:Ldyf;

    iget-object v1, v0, Ldyf;->a:Landroid/content/Context;

    invoke-virtual {p0}, Lzxf;->f()Z

    move-result v2

    if-eqz v2, :cond_86

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v2

    invoke-virtual {v2}, Lfue;->d()V

    iget-object v2, v2, Lfue;->a:Lcue;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_86

    invoke-virtual {v0}, Ldyf;->a()Lc6j;

    move-result-object v2

    iget-object v2, v2, Lc6j;->b:Ljava/lang/Object;

    check-cast v2, Lnre;

    if-eqz v2, :cond_86

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, v2}, Lzxf;->b(Lnre;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v4, 0x0

    :goto_3a
    if-ge v4, v2, :cond_85

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lyqe;

    sget-object v6, Lyqe;->d:Lyqe;

    invoke-virtual {v5, v6}, Lyqe;->equals(Ljava/lang/Object;)Z

    move-result v6

    iget-object v7, v0, Ldyf;->e:Ljava/util/WeakHashMap;

    if-eqz v6, :cond_69

    const-string v5, "topnews"

    invoke-virtual {v7, v5}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lbwf;

    if-nez v6, :cond_81

    new-instance v6, Ljvl;

    iget-object v8, v0, Ldyf;->b:Lay;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lp0c;

    invoke-direct {v6, v1, v8}, Ljvl;-><init>(Landroid/content/Context;Lp0c;)V

    invoke-virtual {v7, v5, v6}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_81

    :cond_69
    invoke-virtual {v7, v5}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lbwf;

    if-nez v6, :cond_7c

    new-instance v6, Lzqe;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    iput-object v5, v6, Lzqe;->a:Lyqe;

    invoke-virtual {v7, v5, v6}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_81

    :cond_7c
    move-object v7, v6

    check-cast v7, Lzqe;

    iput-object v5, v7, Lzqe;->a:Lyqe;

    :cond_81
    :goto_81
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    :cond_85
    return-object v3

    :cond_86
    const/4 p0, 0x0

    return-object p0
.end method

.method public b(Lnre;)Ljava/util/ArrayList;
    .registers 2

    iget-object p0, p1, Lnre;->d:Ljava/util/List;

    iget-object p1, p1, Lnre;->g:Lbre;

    if-eqz p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    invoke-static {p0, p1}, Li41;->y(Ljava/util/Collection;Z)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public final c()Ll0c;
    .registers 3

    invoke-virtual {p0}, Lzxf;->f()Z

    move-result v0

    if-eqz v0, :cond_2f

    iget-object p0, p0, Lzxf;->d:Ldyf;

    iget-object v0, p0, Ldyf;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v0

    invoke-virtual {v0}, Lfue;->d()V

    iget-object v0, v0, Lfue;->a:Lcue;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2f

    invoke-virtual {p0}, Ldyf;->a()Lc6j;

    move-result-object p0

    iget-object p0, p0, Lc6j;->b:Ljava/lang/Object;

    check-cast p0, Lnre;

    if-eqz p0, :cond_2f

    iget-object p0, p0, Lnre;->c:Ll0c;

    return-object p0

    :cond_2f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final e()Ljava/util/List;
    .registers 2

    iget-object v0, p0, Lzxf;->c:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Lzxf;->a:Ljava/util/ArrayList;

    if-eqz v0, :cond_d

    return-object v0

    :cond_d
    invoke-virtual {p0}, Lzxf;->a()Ljava/util/ArrayList;

    move-result-object p0

    if-eqz p0, :cond_14

    return-object p0

    :cond_14
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method

.method public f()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final g()V
    .registers 4

    invoke-virtual {p0}, Lzxf;->a()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0}, Lzxf;->c()Ll0c;

    move-result-object v1

    iget-object v2, p0, Lzxf;->b:Ll0c;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    iget-object v2, p0, Lzxf;->a:Ljava/util/ArrayList;

    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_37

    :cond_18
    iput-object v0, p0, Lzxf;->a:Ljava/util/ArrayList;

    iput-object v1, p0, Lzxf;->b:Ll0c;

    new-instance v0, Ljava/util/HashSet;

    iget-object p0, p0, Lzxf;->c:Ljava/util/HashSet;

    invoke-direct {v0, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_27
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_37

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxxf;

    invoke-interface {v0}, Lxxf;->f()V

    goto :goto_27

    :cond_37
    return-void
.end method
