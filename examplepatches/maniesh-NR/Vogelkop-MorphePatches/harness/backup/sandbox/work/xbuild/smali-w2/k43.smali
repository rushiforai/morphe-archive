.class public abstract Lk43;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpyl;

.field public final b:Lr68;

.field public final c:Ljava/lang/String;

.field public final d:Ldl;

.field public final e:Lyo;

.field public final f:Lsx;

.field public g:Lhvh;

.field public h:I

.field public i:I

.field public j:Z


# direct methods
.method public constructor <init>(Lbqi;Lzy;Ldl;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lbqi;->k:Lpyl;

    iput-object v0, p0, Lk43;->a:Lpyl;

    iget-object v0, p1, Lbqi;->m:Lr68;

    iput-object v0, p0, Lk43;->b:Lr68;

    iget-object v0, p1, Lbqi;->g:Ljava/lang/String;

    iput-object v0, p0, Lk43;->c:Ljava/lang/String;

    iput-object p3, p0, Lk43;->d:Ldl;

    iget-object p1, p1, Lbqi;->e:Lyo;

    iput-object p1, p0, Lk43;->e:Lyo;

    new-instance p1, Lsx;

    invoke-direct {p1}, Lsx;-><init>()V

    iput-object p2, p1, Lsx;->b:Ljava/lang/Object;

    iput-object p1, p0, Lk43;->f:Lsx;

    return-void
.end method


# virtual methods
.method public abstract a()V
.end method

.method public final b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V
    .registers 15

    const/4 v0, 0x1

    const-wide/16 v1, 0x0

    if-eqz p1, :cond_42

    iget-object v3, p0, Lk43;->b:Lr68;

    iget-object v4, v3, Lr68;->a:Lxnh;

    iget-object v3, v3, Lr68;->b:Landroid/util/SparseArray;

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lwnh;

    iget-wide v4, v4, Lwnh;->d:J

    const/16 v6, -0x3e8

    invoke-virtual {v3, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lq68;

    if-eqz v7, :cond_36

    invoke-virtual {v7}, Lq68;->a()Z

    move-result v8

    if-nez v8, :cond_26

    const-wide/16 v4, -0x1

    goto :goto_36

    :cond_26
    cmp-long v4, v4, v1

    if-nez v4, :cond_2c

    move-wide v4, v1

    goto :goto_36

    :cond_2c
    iget-wide v4, v7, Lq68;->b:J

    shl-long/2addr v4, v0

    const-wide/32 v7, 0x2bf20

    invoke-static {v7, v8, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    :cond_36
    :goto_36
    cmp-long v7, v4, v1

    if-lez v7, :cond_42

    new-instance v7, Lq68;

    invoke-direct {v7, v4, v5}, Lq68;-><init>(J)V

    invoke-virtual {v3, v6, v7}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_42
    if-eqz p3, :cond_56

    iget p3, p0, Lk43;->h:I

    if-ge p3, v0, :cond_56

    new-instance v3, Le23;

    move-object v4, p0

    move v5, p1

    move-object v6, p2

    move-object v7, p4

    move-object v8, p5

    invoke-direct/range {v3 .. v8}, Le23;-><init>(Lk43;ZLjava/lang/String;Lv50;Ljava/lang/Long;)V

    invoke-static {v3, v1, v2}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void

    :cond_56
    const/4 p3, 0x0

    invoke-virtual/range {p0 .. p5}, Lk43;->c(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    return-void
.end method

.method public final c(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V
    .registers 16

    iget-object v0, p0, Lk43;->g:Lhvh;

    if-eqz v0, :cond_2c

    iget-boolean v0, p0, Lk43;->j:Z

    if-eqz v0, :cond_1a

    iget v2, p0, Lk43;->i:I

    const/4 v3, 0x0

    const-wide/16 v7, 0x0

    iget-object v1, p0, Lk43;->a:Lpyl;

    move v4, p1

    move-object v5, p2

    move-object v6, p4

    move-object v9, p5

    invoke-virtual/range {v1 .. v9}, Lpyl;->s(IZZLjava/lang/String;Lv50;JLjava/lang/Long;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lk43;->j:Z

    goto :goto_1b

    :cond_1a
    move-object v5, p2

    :goto_1b
    if-nez p3, :cond_28

    iget-object p1, p0, Lk43;->c:Ljava/lang/String;

    invoke-static {v5, p1}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lk43;->f:Lsx;

    invoke-virtual {p2, p1}, Lsx;->onFailed(Ljava/lang/String;)V

    :cond_28
    iget-object p1, p0, Lk43;->g:Lhvh;

    if-nez p1, :cond_2d

    :cond_2c
    return-void

    :cond_2d
    const/4 p2, 0x0

    iput-object p2, p0, Lk43;->g:Lhvh;

    invoke-interface {p1, p0, p3}, Lhvh;->a(Lk43;Z)V

    return-void
.end method

.method public final d(Laqi;)V
    .registers 2

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lk43;->e(Ljava/util/List;)V

    return-void
.end method

.method public final e(Ljava/util/List;)V
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lk43;->b:Lr68;

    iget-object v1, v1, Lr68;->b:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    iget-object v1, v0, Lk43;->g:Lhvh;

    if-nez v1, :cond_21

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_96

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyz;

    invoke-virtual {v1}, Lyz;->b()V

    goto :goto_11

    :cond_21
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const-wide/16 v2, 0x0

    move-wide v4, v2

    :goto_28
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lyz;

    invoke-virtual {v6}, Lyz;->m()J

    move-result-wide v6

    add-long/2addr v4, v6

    goto :goto_28

    :cond_3a
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v6, 0x0

    const/4 v7, 0x0

    if-nez v1, :cond_50

    move-object/from16 v1, p1

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lyz;

    invoke-virtual {v8}, Lyz;->e()Lv50;

    move-result-object v8

    move-object v14, v8

    goto :goto_53

    :cond_50
    move-object/from16 v1, p1

    move-object v14, v7

    :goto_53
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    cmp-long v2, v4, v2

    if-lez v2, :cond_62

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v17, v2

    goto :goto_64

    :cond_62
    move-object/from16 v17, v7

    :goto_64
    iget-boolean v2, v0, Lk43;->j:Z

    if-eqz v2, :cond_76

    iget v10, v0, Lk43;->i:I

    int-to-long v2, v8

    const/4 v12, 0x0

    const/4 v13, 0x0

    iget-object v9, v0, Lk43;->a:Lpyl;

    const/4 v11, 0x1

    move-wide v15, v2

    invoke-virtual/range {v9 .. v17}, Lpyl;->s(IZZLjava/lang/String;Lv50;JLjava/lang/Long;)V

    iput-boolean v6, v0, Lk43;->j:Z

    :cond_76
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_7a
    :goto_7a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_92

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lyz;

    iget-object v3, v0, Lk43;->f:Lsx;

    invoke-virtual {v3, v2}, Lsx;->a(Lyz;)Z

    move-result v3

    if-nez v3, :cond_7a

    invoke-virtual {v2}, Lyz;->b()V

    goto :goto_7a

    :cond_92
    iget-object v1, v0, Lk43;->g:Lhvh;

    if-nez v1, :cond_97

    :cond_96
    return-void

    :cond_97
    iput-object v7, v0, Lk43;->g:Lhvh;

    invoke-interface {v1, v0}, Lhvh;->h(Lk43;)V

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lk43;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lk43;

    iget-object v1, p1, Lk43;->e:Lyo;

    iget-object p1, p1, Lk43;->c:Ljava/lang/String;

    iget-object v3, p0, Lk43;->e:Lyo;

    if-ne v3, v1, :cond_1d

    iget-object p0, p0, Lk43;->c:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1d

    return v0

    :cond_1d
    return v2
.end method

.method public final f(Lhvh;)V
    .registers 10

    iget-object v0, p0, Lk43;->g:Lhvh;

    if-eqz v0, :cond_7

    iput-object p1, p0, Lk43;->g:Lhvh;

    return-void

    :cond_7
    iput-object p1, p0, Lk43;->g:Lhvh;

    iget-object p1, p0, Lk43;->d:Ldl;

    iget-object v0, p1, Ldl;->b:Lq50;

    iget-object p1, p1, Ldl;->c:Ljava/lang/String;

    iget-object v1, p0, Lk43;->a:Lpyl;

    iget-object v2, v1, Lpyl;->c:Ljava/lang/Object;

    check-cast v2, Lwjh;

    iget-object v3, v2, Lwjh;->f:Ljava/lang/Object;

    check-cast v3, Lo59;

    if-eqz v3, :cond_33

    iget-wide v4, v3, Lo59;->f:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-gtz v4, :cond_33

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-object v6, v2, Lwjh;->f:Ljava/lang/Object;

    check-cast v6, Lo59;

    iget-wide v6, v6, Lo59;->b:J

    sub-long/2addr v4, v6

    iput-wide v4, v3, Lo59;->f:J

    invoke-virtual {v2}, Lwjh;->p()V

    :cond_33
    iget v2, v1, Lpyl;->b:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v1, Lpyl;->b:I

    iget-object v1, v1, Lpyl;->e:Ljava/lang/Object;

    check-cast v1, Landroid/util/SparseArray;

    new-instance v3, Ljp;

    iget-object v4, p0, Lk43;->c:Ljava/lang/String;

    iget-object v5, p0, Lk43;->e:Lyo;

    invoke-direct {v3, v4, v5, v0, p1}, Ljp;-><init>(Ljava/lang/String;Lyo;Lq50;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iput v2, p0, Lk43;->i:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lk43;->j:Z

    iget v0, p0, Lk43;->h:I

    add-int/2addr v0, p1

    iput v0, p0, Lk43;->h:I

    invoke-virtual {p0}, Lk43;->a()V

    return-void
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lk43;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lk43;->e:Lyo;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lk43;->c:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
