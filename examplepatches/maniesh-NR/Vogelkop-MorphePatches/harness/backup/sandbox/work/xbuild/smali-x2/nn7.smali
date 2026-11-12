.class public final Lnn7;
.super Lldk;
.source "SourceFile"


# instance fields
.field public final j:Lb59;

.field public final k:Lx5f;

.field public final l:Lvzk;

.field public final m:Ln57;

.field public final n:Ljava/util/ArrayList;

.field public o:Lbn7;

.field public p:Ley;

.field public q:Lil;

.field public r:Landroid/util/SparseArray;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lx5f;Lvzk;)V
    .registers 7

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    const-string v1, "ads_dup"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    new-instance v0, Ln57;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Ln57;-><init>(B)V

    sget-object v1, Lngh;->a:Lr16;

    invoke-direct {p0, p2}, Lldk;-><init>(Ltcl;)V

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lnn7;->n:Ljava/util/ArrayList;

    iput-object p1, p0, Lnn7;->j:Lb59;

    iput-object p3, p0, Lnn7;->k:Lx5f;

    iput-object p4, p0, Lnn7;->l:Lvzk;

    iput-object v0, p0, Lnn7;->m:Ln57;

    invoke-virtual {p0}, Lldk;->h()V

    new-instance p1, Lrx;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lrx;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p4, p1}, Lvzk;->h(Ldy;)V

    return-void
.end method

.method public static j(Lyz;)I
    .registers 3

    instance-of v0, p0, Lw10;

    if-eqz v0, :cond_37

    check-cast p0, Lw10;

    iget-object v0, p0, Lw10;->u:Lcie;

    iget-object v1, v0, Lcie;->X:Lmgh;

    if-eqz v1, :cond_11

    iget-object v1, v1, Lmgh;->b:Ljava/lang/Object;

    check-cast v1, Leyi;

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    if-eqz v1, :cond_1d

    iget-object v0, v1, Leyi;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_29

    :cond_1d
    iget-object v0, v0, Lcie;->q:Ljava/lang/String;

    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-nez v0, :cond_25

    const-string v0, ""

    :cond_25
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_29
    iget-object p0, p0, Lyz;->i:Lyo;

    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    mul-int/lit8 p0, p0, 0x1f

    :goto_35
    add-int/2addr p0, v0

    return p0

    :cond_37
    iget-object v0, p0, Lyz;->i:Lyo;

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lyz;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    goto :goto_35
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 7

    iget-object p0, p0, Lnn7;->j:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "data"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lw1h;->o(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    if-nez p0, :cond_12

    return-object v1

    :cond_12
    new-instance v0, Landroid/util/SparseArray;

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :catch_1f
    :cond_1f
    :goto_1f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_53

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1f

    const/4 v2, 0x0

    :try_start_36
    aget-object v2, v1, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    aget-object v3, v1, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x2

    aget-object v1, v1, v4

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    new-instance v1, Lmn7;

    invoke-direct {v1, v3, v4, v5}, Lmn7;-><init>(IJ)V

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_52
    .catch Ljava/lang/NumberFormatException; {:try_start_36 .. :try_end_52} :catch_1f

    goto :goto_1f

    :cond_53
    return-object v0
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Ljava/util/Set;

    iget-object p0, p0, Lnn7;->j:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "data"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final c()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Landroid/util/SparseArray;

    if-nez p1, :cond_9

    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    :cond_9
    iput-object p1, p0, Lnn7;->r:Landroid/util/SparseArray;

    iget-object p1, p0, Lnn7;->p:Ley;

    if-eqz p1, :cond_12

    invoke-virtual {p0}, Lnn7;->o()V

    :cond_12
    return-void
.end method

.method public final k(Lyz;Lesk;)Z
    .registers 9

    iget-object v0, p0, Lnn7;->r:Landroid/util/SparseArray;

    const/4 v1, 0x1

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lnn7;->p:Ley;

    if-eqz v0, :cond_1d

    iget-wide v2, v0, Ley;->a:J

    const-wide/16 v4, 0x2

    and-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_16

    move v0, v1

    goto :goto_17

    :cond_16
    const/4 v0, 0x0

    :goto_17
    xor-int/2addr v0, v1

    invoke-virtual {p0, p1, p2, v0}, Lnn7;->l(Lyz;Lesk;Z)Z

    move-result p0

    return p0

    :cond_1d
    return v1
.end method

.method public final l(Lyz;Lesk;Z)Z
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lnn7;->p:Ley;

    iget-wide v2, v2, Ley;->a:J

    const-wide/16 v4, 0x1

    and-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    const/4 v3, 0x1

    if-eqz v2, :cond_bf

    iget-object v2, v1, Lyz;->r:Lap;

    iget v2, v2, Lap;->b:I

    if-eq v2, v3, :cond_bf

    invoke-static {v1}, Lnn7;->j(Lyz;)I

    move-result v13

    iget-object v2, v0, Lnn7;->r:Landroid/util/SparseArray;

    invoke-virtual {v2, v13}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmn7;

    if-eqz v2, :cond_bf

    iget-object v4, v0, Lnn7;->m:Ln57;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, v2, Lmn7;->b:J

    iget-object v8, v0, Lnn7;->p:Ley;

    iget-wide v9, v8, Ley;->c:J

    add-long/2addr v6, v9

    cmp-long v6, v4, v6

    if-ltz v6, :cond_3e

    invoke-virtual {v0, v4, v5}, Lnn7;->m(J)V

    return v3

    :cond_3e
    iget v2, v2, Lmn7;->a:I

    iget v4, v8, Ley;->b:I

    if-lt v2, v4, :cond_bf

    const/4 v2, 0x0

    if-eqz p3, :cond_84

    iget-object v4, v0, Lnn7;->q:Lil;

    if-eqz v4, :cond_84

    if-eqz p2, :cond_7a

    invoke-interface/range {p2 .. p2}, Lesk;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_57
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lyz;

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6, v2}, Lnn7;->l(Lyz;Lesk;Z)Z

    move-result v6

    if-eqz v6, :cond_57

    iget-object v4, v1, Lyz;->r:Lap;

    iget v4, v4, Lap;->a:I

    iget-object v5, v5, Lyz;->r:Lap;

    iget v5, v5, Lap;->a:I

    sub-int/2addr v4, v5

    iget-object v5, v0, Lnn7;->q:Lil;

    iget v5, v5, Lil;->b:I

    if-le v4, v5, :cond_84

    goto :goto_bf

    :cond_7a
    iget-object v4, v1, Lyz;->r:Lap;

    iget v4, v4, Lap;->a:I

    iget-object v5, v0, Lnn7;->q:Lil;

    iget v5, v5, Lil;->b:I

    if-gt v4, v5, :cond_bf

    :cond_84
    iget-object v6, v1, Lyz;->g:Ljava/lang/String;

    iget-object v3, v1, Lyz;->i:Lyo;

    invoke-static {v3}, Lyo;->h(Lyo;)Lu50;

    move-result-object v7

    iget-object v3, v1, Lyz;->o:Ldl;

    iget-object v9, v3, Ldl;->b:Lq50;

    iget-object v10, v3, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v3

    iget-object v11, v3, Ldl;->b:Lq50;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v3

    iget-object v12, v3, Ldl;->c:Ljava/lang/String;

    iget-object v3, v1, Lyz;->r:Lap;

    invoke-virtual {v3}, Lap;->c()F

    move-result v15

    invoke-virtual {v1}, Lyz;->e()Lv50;

    move-result-object v20

    invoke-virtual {v1}, Lyz;->j()Ljava/lang/String;

    move-result-object v21

    iget-object v4, v0, Lnn7;->k:Lx5f;

    iget-boolean v0, v4, Lx5f;->h:Z

    if-nez v0, :cond_b3

    return v2

    :cond_b3
    const-wide/16 v16, -0x1

    const-wide/16 v18, -0x1

    sget-object v5, Ld60;->e:Ld60;

    const/4 v8, 0x0

    const/4 v14, 0x1

    invoke-virtual/range {v4 .. v21}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    return v2

    :cond_bf
    :goto_bf
    return v3
.end method

.method public final m(J)V
    .registers 8

    iget-object v0, p0, Lnn7;->r:Landroid/util/SparseArray;

    if-eqz v0, :cond_2d

    iget-object v0, p0, Lnn7;->p:Ley;

    if-eqz v0, :cond_2d

    const/4 v0, 0x0

    :goto_9
    iget-object v1, p0, Lnn7;->r:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_2d

    iget-object v1, p0, Lnn7;->r:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmn7;

    iget-wide v1, v1, Lmn7;->b:J

    iget-object v3, p0, Lnn7;->p:Ley;

    iget-wide v3, v3, Ley;->c:J

    add-long/2addr v1, v3

    cmp-long v1, p1, v1

    if-ltz v1, :cond_2a

    iget-object v1, p0, Lnn7;->r:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->removeAt(I)V

    goto :goto_9

    :cond_2a
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_2d
    return-void
.end method

.method public final n(I)Z
    .registers 10

    iget-object v0, p0, Lnn7;->r:Landroid/util/SparseArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_2b

    iget-object v2, p0, Lnn7;->p:Ley;

    if-eqz v2, :cond_2b

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmn7;

    if-eqz p1, :cond_2b

    iget-object v0, p0, Lnn7;->m:Ln57;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p1, Lmn7;->b:J

    iget-object p1, p0, Lnn7;->p:Ley;

    iget-wide v6, p1, Ley;->c:J

    add-long/2addr v4, v6

    cmp-long p1, v2, v4

    if-ltz p1, :cond_29

    invoke-virtual {p0, v2, v3}, Lnn7;->m(J)V

    return v1

    :cond_29
    const/4 p0, 0x1

    return p0

    :cond_2b
    return v1
.end method

.method public final o()V
    .registers 8

    iget-object v0, p0, Lnn7;->l:Lvzk;

    iget-object v0, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Lcy;

    invoke-virtual {v0}, Lcy;->c()Lml;

    move-result-object v0

    iget-object v0, v0, Lml;->h:Lil;

    iput-object v0, p0, Lnn7;->q:Lil;

    iget-object v0, p0, Lnn7;->m:Ln57;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lnn7;->m(J)V

    iget-object v0, p0, Lnn7;->n:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_21
    if-ge v2, v1, :cond_33

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lln7;

    iget v4, v3, Lln7;->a:I

    iget-wide v5, v3, Lln7;->b:J

    invoke-virtual {p0, v4, v5, v6}, Lnn7;->p(IJ)V

    goto :goto_21

    :cond_33
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public final p(IJ)V
    .registers 10

    iget-object v0, p0, Lnn7;->r:Landroid/util/SparseArray;

    if-eqz v0, :cond_44

    iget-object v1, p0, Lnn7;->p:Ley;

    if-eqz v1, :cond_44

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmn7;

    const/4 v1, 0x1

    if-eqz v0, :cond_28

    iget-wide v2, v0, Lmn7;->b:J

    iget-object v4, p0, Lnn7;->p:Ley;

    iget-wide v4, v4, Ley;->c:J

    add-long/2addr v2, v4

    cmp-long v2, p2, v2

    if-ltz v2, :cond_20

    invoke-virtual {p0, p2, p3}, Lnn7;->m(J)V

    goto :goto_28

    :cond_20
    iget p0, v0, Lmn7;->a:I

    add-int/2addr p0, v1

    iput p0, v0, Lmn7;->a:I

    iput-wide p2, v0, Lmn7;->b:J

    return-void

    :cond_28
    :goto_28
    iget-object v0, p0, Lnn7;->r:Landroid/util/SparseArray;

    new-instance v2, Lmn7;

    invoke-direct {v2, v1, p2, p3}, Lmn7;-><init>(IJ)V

    invoke-virtual {v0, p1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object p1, p0, Lnn7;->o:Lbn7;

    if-nez p1, :cond_44

    new-instance p1, Lbn7;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lbn7;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lnn7;->o:Lbn7;

    const-wide/32 p2, 0x493e0

    invoke-static {p1, p2, p3}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_44
    return-void
.end method

.method public final q()V
    .registers 7

    iget-object v0, p0, Lnn7;->r:Landroid/util/SparseArray;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lnn7;->o:Lbn7;

    if-eqz v0, :cond_f

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lnn7;->o:Lbn7;

    :cond_f
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lnn7;->r:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    const/4 v1, 0x0

    :goto_1b
    iget-object v2, p0, Lnn7;->r:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_55

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lnn7;->r:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lnn7;->r:Landroid/util/SparseArray;

    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lmn7;

    iget v5, v4, Lmn7;->a:I

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-wide v3, v4, Lmn7;->b:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    :cond_55
    invoke-virtual {p0, v0}, Lldk;->g(Ljava/lang/Object;)V

    return-void
.end method
