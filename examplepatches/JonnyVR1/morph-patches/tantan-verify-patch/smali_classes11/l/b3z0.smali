.class public final Ll/b3z0;
.super Ll/qar0;
.source "SourceFile"


# instance fields
.field public g:Lcom/google/android/gms/internal/measurement/c;

.field public final synthetic h:Ll/pwy0;


# direct methods
.method public constructor <init>(Ll/pwy0;Ljava/lang/String;ILcom/google/android/gms/internal/measurement/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/qar0;-><init>(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    iput-object p4, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/c;->E()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/c;->V()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final j()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final k(Ljava/lang/Long;Ljava/lang/Long;Lcom/google/android/gms/internal/measurement/y;JLl/pbs0;Z)Z
    .locals 14

    .line 1
    invoke-static {}, Ll/rly0;->a()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 2
    invoke-virtual {v0}, Ll/yyx0;->a()Ll/ajr0;

    move-result-object v0

    iget-object v3, p0, Ll/qar0;->a:Ljava/lang/String;

    sget-object v4, Ll/whs0;->q0:Ll/zpw0;

    .line 3
    invoke-virtual {v0, v3, v4}, Ll/ajr0;->B(Ljava/lang/String;Ll/zpw0;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 4
    :goto_0
    iget-object v3, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/c;->U()Z

    move-result v3

    if-eqz v3, :cond_1

    move-object/from16 v3, p6

    .line 5
    iget-wide v3, v3, Ll/pbs0;->e:J

    goto :goto_1

    :cond_1
    move-wide/from16 v3, p4

    .line 6
    :goto_1
    iget-object v5, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v5}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v5

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Ll/d6x0;->w(I)Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_3

    .line 7
    iget-object v5, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v5}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v5

    .line 8
    invoke-virtual {v5}, Ll/d6x0;->E()Ll/l8x0;

    move-result-object v5

    iget v7, p0, Ll/qar0;->b:I

    .line 9
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 10
    iget-object v8, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/c;->W()Z

    move-result v8

    if-eqz v8, :cond_2

    iget-object v8, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/c;->E()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_2

    :cond_2
    move-object v8, v6

    :goto_2
    iget-object v9, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 11
    invoke-virtual {v9}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v9

    iget-object v10, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/c;->L()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ll/wxw0;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 12
    const-string v10, "Evaluating filter. audience, filter, event"

    invoke-virtual {v5, v10, v7, v8, v9}, Ll/l8x0;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    iget-object v5, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v5}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v5

    .line 14
    invoke-virtual {v5}, Ll/d6x0;->E()Ll/l8x0;

    move-result-object v5

    iget-object v7, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 15
    invoke-virtual {v7}, Ll/qjy0;->i()Ll/vmy0;

    move-result-object v7

    iget-object v8, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v7, v8}, Ll/vmy0;->D(Lcom/google/android/gms/internal/measurement/c;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "Filter definition"

    invoke-virtual {v5, v8, v7}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 16
    :cond_3
    iget-object v5, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/c;->W()Z

    move-result v5

    if-eqz v5, :cond_2b

    iget-object v5, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/c;->E()I

    move-result v5

    const/16 v7, 0x100

    if-le v5, v7, :cond_4

    goto/16 :goto_e

    .line 17
    :cond_4
    iget-object v5, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/c;->N()Z

    move-result v5

    .line 18
    iget-object v7, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/c;->T()Z

    move-result v7

    .line 19
    iget-object v8, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/c;->U()Z

    move-result v8

    if-nez v5, :cond_6

    if-nez v7, :cond_6

    if-eqz v8, :cond_5

    goto :goto_3

    :cond_5
    move v5, v1

    goto :goto_4

    :cond_6
    :goto_3
    move v5, v2

    :goto_4
    if-eqz p7, :cond_8

    if-nez v5, :cond_8

    .line 20
    iget-object v0, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    move-result-object v0

    iget v1, p0, Ll/qar0;->b:I

    .line 22
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 23
    iget-object v3, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/c;->W()Z

    move-result v3

    if-eqz v3, :cond_7

    iget-object p0, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/c;->E()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 24
    :cond_7
    const-string p0, "Event filter already evaluated true and it is not associated with an enhanced audience. audience ID, filter ID"

    invoke-virtual {v0, p0, v1, v6}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v2

    .line 25
    :cond_8
    iget-object v7, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    .line 26
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/measurement/y;->X()Ljava/lang/String;

    move-result-object v8

    .line 27
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/c;->V()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 28
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/c;->K()Lcom/google/android/gms/internal/measurement/zzfo$zzd;

    move-result-object v9

    invoke-static {v3, v4, v9}, Ll/qar0;->c(JLcom/google/android/gms/internal/measurement/zzfo$zzd;)Ljava/lang/Boolean;

    move-result-object v3

    if-nez v3, :cond_9

    goto/16 :goto_b

    .line 29
    :cond_9
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_a

    .line 30
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_b

    .line 31
    :cond_a
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 32
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/c;->M()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/measurement/d;

    .line 33
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/d;->I()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_b

    .line 34
    iget-object v3, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v3

    .line 35
    invoke-virtual {v3}, Ll/d6x0;->F()Ll/l8x0;

    move-result-object v3

    iget-object v4, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 36
    invoke-virtual {v4}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v4

    invoke-virtual {v4, v8}, Ll/wxw0;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 37
    const-string v7, "null or empty param name in filter. event"

    invoke-virtual {v3, v7, v4}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_b

    .line 38
    :cond_b
    invoke-virtual {v9}, Lcom/google/android/gms/internal/measurement/d;->I()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 39
    :cond_c
    new-instance v4, Ll/l01;

    invoke-direct {v4}, Ll/l01;-><init>()V

    .line 40
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/measurement/y;->Y()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_d
    :goto_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_13

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/internal/measurement/a0;

    .line 41
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->Z()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_d

    .line 42
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->e0()Z

    move-result v11

    if-eqz v11, :cond_f

    .line 43
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->Z()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->e0()Z

    move-result v12

    if-eqz v12, :cond_e

    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->V()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    goto :goto_7

    :cond_e
    move-object v10, v6

    :goto_7
    invoke-interface {v4, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    .line 44
    :cond_f
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->c0()Z

    move-result v11

    if-eqz v11, :cond_11

    .line 45
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->Z()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->c0()Z

    move-result v12

    if-eqz v12, :cond_10

    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->B()D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    goto :goto_8

    :cond_10
    move-object v10, v6

    .line 46
    :goto_8
    invoke-interface {v4, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    .line 47
    :cond_11
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->g0()Z

    move-result v11

    if-eqz v11, :cond_12

    .line 48
    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->Z()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->a0()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v4, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    .line 49
    :cond_12
    iget-object v3, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v3

    .line 50
    invoke-virtual {v3}, Ll/d6x0;->F()Ll/l8x0;

    move-result-object v3

    iget-object v4, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 51
    invoke-virtual {v4}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v4

    invoke-virtual {v4, v8}, Ll/wxw0;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v7, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 52
    invoke-virtual {v7}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v7

    invoke-virtual {v10}, Lcom/google/android/gms/internal/measurement/a0;->Z()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ll/wxw0;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 53
    const-string v8, "Unknown value for param. event, param"

    invoke-virtual {v3, v8, v4, v7}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_b

    .line 54
    :cond_13
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/c;->M()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_14
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_23

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/measurement/d;

    .line 55
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/d;->L()Z

    move-result v9

    if-eqz v9, :cond_15

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/d;->K()Z

    move-result v9

    if-eqz v9, :cond_15

    move v9, v2

    goto :goto_9

    :cond_15
    move v9, v1

    .line 56
    :goto_9
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/d;->I()Ljava/lang/String;

    move-result-object v10

    .line 57
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_16

    .line 58
    iget-object v3, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v3

    .line 59
    invoke-virtual {v3}, Ll/d6x0;->F()Ll/l8x0;

    move-result-object v3

    iget-object v4, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 60
    invoke-virtual {v4}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v4

    invoke-virtual {v4, v8}, Ll/wxw0;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 61
    const-string v7, "Event has empty param name. event"

    invoke-virtual {v3, v7, v4}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_b

    .line 62
    :cond_16
    invoke-interface {v4, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 63
    instance-of v12, v11, Ljava/lang/Long;

    if-eqz v12, :cond_19

    .line 64
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/d;->M()Z

    move-result v12

    if-nez v12, :cond_17

    .line 65
    iget-object v3, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v3

    .line 66
    invoke-virtual {v3}, Ll/d6x0;->F()Ll/l8x0;

    move-result-object v3

    iget-object v4, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 67
    invoke-virtual {v4}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v4

    invoke-virtual {v4, v8}, Ll/wxw0;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v7, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 68
    invoke-virtual {v7}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v7

    invoke-virtual {v7, v10}, Ll/wxw0;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 69
    const-string v8, "No number filter for long param. event, param"

    invoke-virtual {v3, v8, v4, v7}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_b

    .line 70
    :cond_17
    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/d;->E()Lcom/google/android/gms/internal/measurement/zzfo$zzd;

    move-result-object v7

    invoke-static {v10, v11, v7}, Ll/qar0;->c(JLcom/google/android/gms/internal/measurement/zzfo$zzd;)Ljava/lang/Boolean;

    move-result-object v7

    if-nez v7, :cond_18

    goto/16 :goto_b

    .line 71
    :cond_18
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-ne v7, v9, :cond_14

    .line 72
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_b

    .line 73
    :cond_19
    instance-of v12, v11, Ljava/lang/Double;

    if-eqz v12, :cond_1c

    .line 74
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/d;->M()Z

    move-result v12

    if-nez v12, :cond_1a

    .line 75
    iget-object v3, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v3

    .line 76
    invoke-virtual {v3}, Ll/d6x0;->F()Ll/l8x0;

    move-result-object v3

    iget-object v4, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 77
    invoke-virtual {v4}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v4

    invoke-virtual {v4, v8}, Ll/wxw0;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v7, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 78
    invoke-virtual {v7}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v7

    invoke-virtual {v7, v10}, Ll/wxw0;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 79
    const-string v8, "No number filter for double param. event, param"

    invoke-virtual {v3, v8, v4, v7}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_b

    .line 80
    :cond_1a
    check-cast v11, Ljava/lang/Double;

    invoke-virtual {v11}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/d;->E()Lcom/google/android/gms/internal/measurement/zzfo$zzd;

    move-result-object v7

    invoke-static {v10, v11, v7}, Ll/qar0;->b(DLcom/google/android/gms/internal/measurement/zzfo$zzd;)Ljava/lang/Boolean;

    move-result-object v7

    if-nez v7, :cond_1b

    goto/16 :goto_b

    .line 81
    :cond_1b
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-ne v7, v9, :cond_14

    .line 82
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_b

    .line 83
    :cond_1c
    instance-of v12, v11, Ljava/lang/String;

    if-eqz v12, :cond_21

    .line 84
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/d;->T()Z

    move-result v12

    if-eqz v12, :cond_1d

    .line 85
    check-cast v11, Ljava/lang/String;

    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/d;->G()Lcom/google/android/gms/internal/measurement/zzfo$zzf;

    move-result-object v7

    iget-object v10, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v10}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v10

    invoke-static {v11, v7, v10}, Ll/qar0;->g(Ljava/lang/String;Lcom/google/android/gms/internal/measurement/zzfo$zzf;Ll/d6x0;)Ljava/lang/Boolean;

    move-result-object v7

    goto :goto_a

    .line 86
    :cond_1d
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/d;->M()Z

    move-result v12

    if-eqz v12, :cond_20

    .line 87
    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ll/vmy0;->a0(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1f

    .line 88
    invoke-virtual {v7}, Lcom/google/android/gms/internal/measurement/d;->E()Lcom/google/android/gms/internal/measurement/zzfo$zzd;

    move-result-object v7

    invoke-static {v11, v7}, Ll/qar0;->e(Ljava/lang/String;Lcom/google/android/gms/internal/measurement/zzfo$zzd;)Ljava/lang/Boolean;

    move-result-object v7

    :goto_a
    if-nez v7, :cond_1e

    goto/16 :goto_b

    .line 89
    :cond_1e
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-ne v7, v9, :cond_14

    .line 90
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_b

    .line 91
    :cond_1f
    iget-object v3, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v3

    .line 92
    invoke-virtual {v3}, Ll/d6x0;->F()Ll/l8x0;

    move-result-object v3

    iget-object v4, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 93
    invoke-virtual {v4}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v4

    invoke-virtual {v4, v8}, Ll/wxw0;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v7, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 94
    invoke-virtual {v7}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v7

    invoke-virtual {v7, v10}, Ll/wxw0;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 95
    const-string v8, "Invalid param value for number filter. event, param"

    invoke-virtual {v3, v8, v4, v7}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_b

    .line 96
    :cond_20
    iget-object v3, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v3

    .line 97
    invoke-virtual {v3}, Ll/d6x0;->F()Ll/l8x0;

    move-result-object v3

    iget-object v4, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 98
    invoke-virtual {v4}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v4

    invoke-virtual {v4, v8}, Ll/wxw0;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v7, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 99
    invoke-virtual {v7}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v7

    invoke-virtual {v7, v10}, Ll/wxw0;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 100
    const-string v8, "No filter for String param. event, param"

    invoke-virtual {v3, v8, v4, v7}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_b

    .line 101
    :cond_21
    iget-object v3, p0, Ll/b3z0;->h:Ll/pwy0;

    if-nez v11, :cond_22

    .line 102
    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v3

    .line 103
    invoke-virtual {v3}, Ll/d6x0;->E()Ll/l8x0;

    move-result-object v3

    iget-object v4, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 104
    invoke-virtual {v4}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v4

    invoke-virtual {v4, v8}, Ll/wxw0;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v6, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 105
    invoke-virtual {v6}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v6

    invoke-virtual {v6, v10}, Ll/wxw0;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 106
    const-string v7, "Missing param for filter. event, param"

    invoke-virtual {v3, v7, v4, v6}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 107
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_b

    .line 108
    :cond_22
    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v3

    .line 109
    invoke-virtual {v3}, Ll/d6x0;->F()Ll/l8x0;

    move-result-object v3

    iget-object v4, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 110
    invoke-virtual {v4}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v4

    invoke-virtual {v4, v8}, Ll/wxw0;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v7, p0, Ll/b3z0;->h:Ll/pwy0;

    .line 111
    invoke-virtual {v7}, Ll/yyx0;->c()Ll/wxw0;

    move-result-object v7

    invoke-virtual {v7, v10}, Ll/wxw0;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 112
    const-string v8, "Unknown param type. event, param"

    invoke-virtual {v3, v8, v4, v7}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_b

    .line 113
    :cond_23
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 114
    :goto_b
    iget-object v3, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v3

    invoke-virtual {v3}, Ll/d6x0;->E()Ll/l8x0;

    move-result-object v3

    if-nez v6, :cond_24

    const-string v4, "null"

    goto :goto_c

    :cond_24
    move-object v4, v6

    :goto_c
    const-string v7, "Event filter result"

    invoke-virtual {v3, v7, v4}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    if-nez v6, :cond_25

    return v1

    .line 115
    :cond_25
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v1, p0, Ll/qar0;->c:Ljava/lang/Boolean;

    .line 116
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_26

    return v2

    .line 117
    :cond_26
    iput-object v1, p0, Ll/qar0;->d:Ljava/lang/Boolean;

    if-eqz v5, :cond_2a

    .line 118
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/measurement/y;->b0()Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 119
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/measurement/y;->U()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 120
    iget-object v3, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/c;->T()Z

    move-result v3

    if-eqz v3, :cond_28

    if-eqz v0, :cond_27

    .line 121
    iget-object v0, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/c;->V()Z

    move-result v0

    if-eqz v0, :cond_27

    move-object v1, p1

    .line 122
    :cond_27
    iput-object v1, p0, Ll/qar0;->f:Ljava/lang/Long;

    goto :goto_d

    :cond_28
    if-eqz v0, :cond_29

    .line 123
    iget-object v0, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/c;->V()Z

    move-result v0

    if-eqz v0, :cond_29

    move-object/from16 v1, p2

    .line 124
    :cond_29
    iput-object v1, p0, Ll/qar0;->e:Ljava/lang/Long;

    :cond_2a
    :goto_d
    return v2

    .line 125
    :cond_2b
    :goto_e
    iget-object v0, p0, Ll/b3z0;->h:Ll/pwy0;

    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    move-result-object v0

    .line 126
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    move-result-object v0

    iget-object v2, p0, Ll/qar0;->a:Ljava/lang/String;

    .line 127
    invoke-static {v2}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 128
    iget-object v3, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/c;->W()Z

    move-result v3

    if-eqz v3, :cond_2c

    iget-object p0, p0, Ll/b3z0;->g:Lcom/google/android/gms/internal/measurement/c;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/c;->E()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    :cond_2c
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 129
    const-string v3, "Invalid event filter ID. appId, id"

    invoke-virtual {v0, v3, v2, p0}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v1
.end method
