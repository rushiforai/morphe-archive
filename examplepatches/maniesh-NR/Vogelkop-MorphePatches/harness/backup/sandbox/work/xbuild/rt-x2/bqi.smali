.class public abstract Lbqi;
.super Lgtg;
.source "SourceFile"

# interfaces
.implements Ldz;


# static fields
.field public static final o:Lir5;


# instance fields
.field public final d:Ljava/lang/ref/WeakReference;

.field public final e:Lyo;

.field public final f:Lrm;

.field public final g:Ljava/lang/String;

.field public final h:Li3j;

.field public final i:Lap;

.field public final j:Landroid/content/Context;

.field public final k:Lpyl;

.field public final l:Luwh;

.field public final m:Lr68;

.field public final n:Lqfb;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lir5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lbqi;->o:Lir5;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/app/Activity;Lyo;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;)V
    .registers 13

    invoke-direct {p0, p12}, Lgtg;-><init>(Lr9g;)V

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lbqi;->d:Ljava/lang/ref/WeakReference;

    iput-object p3, p0, Lbqi;->e:Lyo;

    iput-object p4, p0, Lbqi;->f:Lrm;

    iput-object p5, p0, Lbqi;->g:Ljava/lang/String;

    iput-object p10, p0, Lbqi;->h:Li3j;

    iput-object p11, p0, Lbqi;->i:Lap;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lbqi;->j:Landroid/content/Context;

    iput-object p6, p0, Lbqi;->k:Lpyl;

    iput-object p7, p0, Lbqi;->l:Luwh;

    iput-object p9, p0, Lbqi;->m:Lr68;

    iput-object p8, p0, Lbqi;->n:Lqfb;

    return-void
.end method

.method public static n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v0, ": "

    invoke-static {p1, v0, p0}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public a()Z
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object v2, p0, Lbqi;->n:Lqfb;

    if-eqz v2, :cond_71

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v4, "M2006C3LG"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6e

    const-string v4, "vivo 1906"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6e

    const-string v4, "vivo 1904"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6e

    const-string v4, "M2006C3LI"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6e

    const-string v4, "Infinix X6516"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6e

    const-string v4, "V2037"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6e

    iget-object v3, p0, Lbqi;->e:Lyo;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_50

    if-eq v3, v0, :cond_50

    const/4 v4, 0x3

    if-eq v3, v4, :cond_50

    const/4 v4, 0x4

    if-eq v3, v4, :cond_50

    const/4 v4, 0x5

    if-eq v3, v4, :cond_50

    const/4 v4, 0x6

    if-eq v3, v4, :cond_50

    move v2, v0

    goto :goto_6f

    :cond_50
    iget-object v2, v2, Lqfb;->b:Ljava/lang/Object;

    check-cast v2, Lw7h;

    iget-object v2, v2, Lw7h;->a:Landroid/app/Activity;

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    iget-object v2, v2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->n1:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lvwn;

    invoke-virtual {v2}, Lvwn;->a()Z

    move-result v2

    xor-int/2addr v2, v0

    goto :goto_6f

    :cond_6e
    move v2, v1

    :goto_6f
    if-eqz v2, :cond_8f

    :cond_71
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lbqi;->o(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_93

    iget-object p0, p0, Lbqi;->m:Lr68;

    iget-object p0, p0, Lr68;->b:Landroid/util/SparseArray;

    move v2, v1

    :goto_7d
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_93

    invoke-virtual {p0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lq68;

    invoke-virtual {v3}, Lq68;->a()Z

    move-result v3

    if-nez v3, :cond_90

    :cond_8f
    return v1

    :cond_90
    add-int/lit8 v2, v2, 0x1

    goto :goto_7d

    :cond_93
    return v0
.end method

.method public final b()Ls50;
    .registers 9

    iget-object v0, p0, Lbqi;->l:Luwh;

    iget-object v1, v0, Luwh;->g:Ljava/util/IdentityHashMap;

    iget-object v2, v0, Luwh;->b:Ld14;

    iget-object v3, v0, Luwh;->a:Lxnh;

    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lwnh;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Lwnh;->a(I)Z

    move-result v3

    if-eqz v3, :cond_1d

    iget v3, v0, Luwh;->e:I

    if-lez v3, :cond_1d

    sget-object p0, Ls50;->b:Ls50;

    return-object p0

    :cond_1d
    invoke-virtual {v1}, Ljava/util/IdentityHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2e

    iget-object v3, v2, Ld14;->a:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2e

    sget-object p0, Ls50;->c:Ls50;

    return-object p0

    :cond_2e
    iget-boolean v0, v0, Luwh;->d:Z

    if-nez v0, :cond_35

    sget-object p0, Ls50;->d:Ls50;

    return-object p0

    :cond_35
    const/4 v0, 0x0

    :goto_36
    iget-object v3, v2, Ld14;->a:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    iget-object v4, p0, Lbqi;->e:Lyo;

    iget-object v5, p0, Lbqi;->g:Ljava/lang/String;

    sget-object v6, Ls50;->e:Ls50;

    if-ge v0, v3, :cond_5e

    iget-object v3, v2, Ld14;->a:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltwh;

    iget-object v3, v3, Ltwh;->a:Lk43;

    iget-object v7, v3, Lk43;->e:Lyo;

    if-ne v7, v4, :cond_5b

    iget-object v3, v3, Lk43;->c:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5b

    return-object v6

    :cond_5b
    add-int/lit8 v0, v0, 0x1

    goto :goto_36

    :cond_5e
    invoke-virtual {v1}, Ljava/util/IdentityHashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_66
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_81

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk43;

    if-eqz v0, :cond_66

    iget-object v1, v0, Lk43;->e:Lyo;

    if-ne v1, v4, :cond_66

    iget-object v0, v0, Lk43;->c:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_66

    return-object v6

    :cond_81
    sget-object p0, Ls50;->f:Ls50;

    return-object p0
.end method

.method public c()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final d(Laz;)Lyz;
    .registers 15

    invoke-interface {p1}, Laz;->e()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return-object v1

    :cond_8
    invoke-interface {p1}, Laz;->d()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lbqi;->h:Li3j;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lpx;

    iget-object v4, p0, Lbqi;->e:Lyo;

    iget-object v5, p0, Lbqi;->f:Lrm;

    iget-object p0, p0, Lbqi;->g:Ljava/lang/String;

    invoke-direct {v3, v4, v5, p0}, Lpx;-><init>(Lyo;Lrm;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Li3j;->r(Lpx;)Z

    move-result p0

    iget-object v4, v2, Li3j;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    if-nez v5, :cond_32

    if-eqz p0, :cond_8b

    invoke-virtual {v2}, Li3j;->u()V

    goto :goto_8b

    :cond_32
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_36
    :goto_36
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_76

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lyz;

    iget-object v8, v7, Lyz;->r:Lap;

    iget v8, v8, Lap;->b:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_52

    if-nez v0, :cond_4d

    const/4 v8, 0x0

    goto :goto_53

    :cond_4d
    invoke-virtual {v7, v0}, Lyz;->r(Ljava/lang/String;)Z

    move-result v8

    goto :goto_53

    :cond_52
    move v8, v9

    :goto_53
    if-eqz v8, :cond_36

    if-eqz v1, :cond_74

    iget-object v8, v7, Lyz;->r:Lap;

    iget-object v10, v1, Lyz;->r:Lap;

    iget v11, v8, Lap;->b:I

    if-ne v11, v9, :cond_64

    iget v12, v10, Lap;->b:I

    if-eq v12, v11, :cond_6a

    goto :goto_72

    :cond_64
    iget v11, v10, Lap;->b:I

    if-ne v11, v9, :cond_6a

    const/4 v9, -0x1

    goto :goto_72

    :cond_6a
    iget v8, v8, Lap;->a:I

    iget v9, v10, Lap;->a:I

    invoke-static {v8, v9}, Ljava/lang/Integer;->compare(II)I

    move-result v9

    :goto_72
    if-lez v9, :cond_36

    :cond_74
    move-object v1, v7

    goto :goto_36

    :cond_76
    if-eqz v1, :cond_7b

    invoke-interface {v5, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_7b
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_84

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_84
    if-nez v1, :cond_88

    if-eqz p0, :cond_8b

    :cond_88
    invoke-virtual {v2}, Li3j;->u()V

    :cond_8b
    :goto_8b
    if-eqz v1, :cond_93

    invoke-interface {p1}, Laz;->a()Ldl;

    move-result-object p0

    iput-object p0, v1, Lyz;->p:Ldl;

    :cond_93
    return-object v1
.end method

.method public final e(Lzy;Laz;)V
    .registers 4

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lbqi;->h(Lzy;Laz;I)V

    return-void
.end method

.method public final h(Lzy;Laz;I)V
    .registers 6

    invoke-virtual {p0}, Lbqi;->a()Z

    move-result p3

    iget-object v0, p0, Lbqi;->g:Ljava/lang/String;

    if-nez p3, :cond_12

    const-string p0, "ads provider not available"

    invoke-static {p0, v0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    return-void

    :cond_12
    invoke-virtual {p0, p2}, Lbqi;->d(Laz;)Lyz;

    move-result-object p3

    if-eqz p3, :cond_22

    invoke-interface {p1, p3}, Lzy;->a(Lyz;)Z

    move-result p0

    if-nez p0, :cond_46

    invoke-virtual {p3}, Lyz;->b()V

    return-void

    :cond_22
    iget-object p3, p0, Lbqi;->m:Lr68;

    iget-object p3, p3, Lr68;->b:Landroid/util/SparseArray;

    const/16 v1, -0x3e8

    invoke-virtual {p3, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lq68;

    if-eqz p3, :cond_40

    invoke-virtual {p3}, Lq68;->a()Z

    move-result p3

    if-nez p3, :cond_40

    const-string p0, "placement no fill delay"

    invoke-static {p0, v0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    return-void

    :cond_40
    invoke-virtual {p0, p1, p2}, Lbqi;->l(Lzy;Laz;)Lk43;

    move-result-object p1

    if-nez p1, :cond_47

    :cond_46
    return-void

    :cond_47
    invoke-interface {p2}, Laz;->b()Z

    move-result p2

    if-eqz p2, :cond_53

    sget-object p0, Lbqi;->o:Lir5;

    invoke-virtual {p1, p0}, Lk43;->f(Lhvh;)V

    return-void

    :cond_53
    iget-object p2, p0, Lbqi;->i:Lap;

    iget p2, p2, Lap;->a:I

    iget-object p0, p0, Lbqi;->l:Luwh;

    invoke-virtual {p0, p1, p2}, Luwh;->a(Lk43;I)V

    return-void
.end method

.method public final k(Ljava/lang/String;)Z
    .registers 2

    invoke-virtual {p0, p1}, Lbqi;->o(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public l(Lzy;Laz;)Lk43;
    .registers 3

    invoke-virtual {p0}, Lbqi;->m()Landroid/app/Activity;

    const-string p2, "ads provider not available"

    iget-object p0, p0, Lbqi;->g:Ljava/lang/String;

    invoke-static {p2, p0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final m()Landroid/app/Activity;
    .registers 3

    iget-object p0, p0, Lbqi;->d:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    const/4 v0, 0x0

    if-nez p0, :cond_c

    return-object v0

    :cond_c
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_13

    return-object v0

    :cond_13
    return-object p0
.end method

.method public final o(Ljava/lang/String;)Z
    .registers 6

    iget-object v0, p0, Lbqi;->h:Li3j;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lpx;

    iget-object v2, p0, Lbqi;->e:Lyo;

    iget-object v3, p0, Lbqi;->f:Lrm;

    iget-object p0, p0, Lbqi;->g:Ljava/lang/String;

    invoke-direct {v1, v2, v3, p0}, Lpx;-><init>(Lyo;Lrm;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Li3j;->r(Lpx;)Z

    move-result p0

    if-eqz p0, :cond_19

    invoke-virtual {v0}, Li3j;->u()V

    :cond_19
    iget-object p0, v0, Li3j;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    const/4 v0, 0x0

    if-eqz p0, :cond_4a

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyz;

    iget-object v2, v1, Lyz;->r:Lap;

    iget v2, v2, Lap;->b:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_46

    if-nez p1, :cond_41

    move v1, v0

    goto :goto_47

    :cond_41
    invoke-virtual {v1, p1}, Lyz;->r(Ljava/lang/String;)Z

    move-result v1

    goto :goto_47

    :cond_46
    move v1, v3

    :goto_47
    if-eqz v1, :cond_2a

    return v3

    :cond_4a
    return v0
.end method
