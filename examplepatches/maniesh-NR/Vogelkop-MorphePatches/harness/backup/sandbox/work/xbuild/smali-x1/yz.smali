.class public abstract Lyz;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Lyo;

.field public final j:Lrm;

.field public final k:Li3j;

.field public final l:Ljava/lang/String;

.field public final m:J

.field public n:Luz;

.field public final o:Ldl;

.field public p:Ldl;

.field public q:Ltz;

.field public r:Lap;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lyo;Lrm;Li3j;Lap;)V
    .registers 17

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyz;->a:Ljava/lang/String;

    iput-object p2, p0, Lyz;->b:Ljava/lang/String;

    iput-object p3, p0, Lyz;->c:Ljava/lang/String;

    iput-object p4, p0, Lyz;->d:Ljava/lang/String;

    iput-object p5, p0, Lyz;->e:Ljava/lang/String;

    iput-object p6, p0, Lyz;->f:Ljava/lang/String;

    iput-object p7, p0, Lyz;->g:Ljava/lang/String;

    iput-object p8, p0, Lyz;->o:Ldl;

    iput-object p9, p0, Lyz;->h:Ljava/lang/String;

    iput-object p10, p0, Lyz;->i:Lyo;

    iput-object p11, p0, Lyz;->j:Lrm;

    iput-object v0, p0, Lyz;->l:Ljava/lang/String;

    iput-wide v1, p0, Lyz;->m:J

    iput-object p12, p0, Lyz;->k:Li3j;

    move-object/from16 p1, p13

    iput-object p1, p0, Lyz;->r:Lap;

    return-void
.end method


# virtual methods
.method public b()V
    .registers 10

    iget-object v0, p0, Lyz;->k:Li3j;

    iget-object v1, v0, Li3j;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    iget-object v0, v0, Li3j;->c:Ljava/lang/Object;

    check-cast v0, Lzy9;

    iget-object v0, v0, Lzy9;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lyz;->p()Z

    move-result v0

    if-nez v0, :cond_1b

    invoke-virtual {p0}, Lyz;->c()V

    return-void

    :cond_1b
    new-instance v0, Lpx;

    invoke-direct {v0, p0}, Lpx;-><init>(Lyz;)V

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_33

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4e

    :cond_33
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v3

    :goto_38
    if-ltz v0, :cond_4e

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyz;

    iget-wide v5, v1, Lyz;->m:J

    iget-wide v7, p0, Lyz;->m:J

    cmp-long v1, v5, v7

    if-gtz v1, :cond_4b

    add-int/lit8 v4, v0, 0x1

    goto :goto_4e

    :cond_4b
    add-int/lit8 v0, v0, -0x1

    goto :goto_38

    :cond_4e
    :goto_4e
    invoke-interface {v2, v4, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lyz;->q:Ltz;

    return-void
.end method

.method public c()V
    .registers 1

    return-void
.end method

.method public d(Liq;)Z
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 p1, 0x1

    if-eqz p0, :cond_b

    if-eq p0, p1, :cond_b

    const/4 p0, 0x0

    return p0

    :cond_b
    return p1
.end method

.method public e()Lv50;
    .registers 1

    sget-object p0, Lv50;->b:Lv50;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3a

    if-eqz p1, :cond_3c

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_3c

    check-cast p1, Lyz;

    iget-object v0, p0, Lyz;->f:Ljava/lang/String;

    iget-object v1, p1, Lyz;->f:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lyz;->g:Ljava/lang/String;

    iget-object v1, p1, Lyz;->g:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lyz;->i:Lyo;

    iget-object v1, p1, Lyz;->i:Lyo;

    if-ne v0, v1, :cond_3c

    iget-object v0, p0, Lyz;->j:Lrm;

    iget-object v1, p1, Lyz;->j:Lrm;

    if-ne v0, v1, :cond_3c

    iget-object p0, p0, Lyz;->l:Ljava/lang/String;

    iget-object p1, p1, Lyz;->l:Ljava/lang/String;

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3c

    :cond_3a
    const/4 p0, 0x1

    return p0

    :cond_3c
    const/4 p0, 0x0

    return p0
.end method

.method public f()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public g()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final h()Ldl;
    .registers 2

    iget-object v0, p0, Lyz;->p:Ldl;

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    iget-object p0, p0, Lyz;->o:Ldl;

    return-object p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lyz;->j:Lrm;

    iget-object v1, p0, Lyz;->l:Ljava/lang/String;

    iget-object v2, p0, Lyz;->f:Ljava/lang/String;

    iget-object v3, p0, Lyz;->g:Ljava/lang/String;

    iget-object p0, p0, Lyz;->i:Lyo;

    filled-new-array {v2, v3, p0, v0, v1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public i()Lvz;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public j()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public k()Ljava/util/List;
    .registers 1

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method

.method public l()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public m()J
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public n()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lyz;->a:Ljava/lang/String;

    return-object p0
.end method

.method public o()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public p()Z
    .registers 1

    invoke-virtual {p0}, Lyz;->q()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public abstract q()Z
.end method

.method public final r(Ljava/lang/String;)Z
    .registers 2

    iget-object p0, p0, Lyz;->n:Luz;

    if-eqz p0, :cond_e

    iget-object p0, p0, Luz;->a:Ljava/lang/String;

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public s()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public t()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
