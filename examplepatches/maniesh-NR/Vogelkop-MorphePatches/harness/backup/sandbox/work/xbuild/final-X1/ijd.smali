.class public final Lijd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    sget-object v0, Lhsh;->d:Lhsh;

    .line 30
    iput-object v0, p0, Lijd;->f:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Lijd;->b:Z

    .line 32
    sget-object v0, Lh1b;->b:La1b;

    .line 33
    sget-object v0, Lcsh;->e:Lcsh;

    .line 34
    iput-object v0, p0, Lijd;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lrki;Lj3i;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lijd;->d:Ljava/lang/Object;

    iput-object p2, p0, Lijd;->e:Ljava/lang/Object;

    new-instance p1, Lftj;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Lftj;-><init>(B)V

    iput-object p1, p0, Lijd;->f:Ljava/lang/Object;

    sget-object p1, Limi;->a:[J

    new-instance p1, Lsee;

    invoke-direct {p1}, Lsee;-><init>()V

    iput-object p1, p0, Lijd;->g:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lijd;->c:Z

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/ArrayList;
    .registers 17

    move-object/from16 v0, p0

    iget-object v1, v0, Lijd;->e:Ljava/lang/Object;

    check-cast v1, Lh0a;

    iget-object v2, v0, Lijd;->d:Ljava/lang/Object;

    check-cast v2, Lyk6;

    sget-object v3, Lqdf;->c:Lh58;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lw4;

    const/4 v6, 0x0

    invoke-direct {v5, v3, v6}, Lw4;-><init>(Ljava/lang/Object;B)V

    :cond_1a
    :goto_1a
    invoke-virtual {v5}, Lw4;->hasNext()Z

    move-result v3

    const/4 v7, 0x0

    const/4 v8, 0x4

    const/4 v9, 0x3

    const/4 v10, 0x2

    const/4 v11, 0x1

    if-eqz v3, :cond_87

    invoke-virtual {v5}, Lw4;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Lqdf;

    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    move-result v12

    if-eqz v12, :cond_81

    if-eq v12, v11, :cond_4f

    if-eq v12, v10, :cond_3e

    if-eq v12, v9, :cond_81

    if-eq v12, v8, :cond_81

    invoke-static {}, Lh9o;->p()V

    return-object v7

    :cond_3e
    iget-object v7, v0, Lijd;->f:Ljava/lang/Object;

    check-cast v7, Lxnc;

    iget-object v7, v7, Lxnc;->a:Lkze;

    invoke-virtual {v7}, Lekc;->g()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    goto :goto_81

    :cond_4f
    iget-object v8, v2, Lyk6;->i:Lkze;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_6b

    iget-object v8, v2, Lyk6;->k:Lkze;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_81

    :cond_6b
    iget-object v8, v1, Lh0a;->d:Lode;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Li0a;

    if-eqz v8, :cond_7b

    iget-boolean v7, v8, Li0a;->a:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    :cond_7b
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    :cond_81
    :goto_81
    if-eqz v11, :cond_1a

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    :cond_87
    new-instance v3, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {v4, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v12, v6

    :goto_97
    if-ge v12, v5, :cond_ef

    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    add-int/lit8 v12, v12, 0x1

    check-cast v13, Lqdf;

    new-instance v14, Lrdf;

    invoke-virtual {v13}, Ljava/lang/Enum;->ordinal()I

    move-result v15

    if-eqz v15, :cond_e6

    if-eq v15, v11, :cond_c6

    if-eq v15, v10, :cond_bb

    if-eq v15, v9, :cond_b8

    if-ne v15, v8, :cond_b4

    iget-boolean v15, v0, Lijd;->c:Z

    goto :goto_e8

    :cond_b4
    invoke-static {}, Lh9o;->p()V

    return-object v7

    :cond_b8
    iget-boolean v15, v0, Lijd;->b:Z

    goto :goto_e8

    :cond_bb
    iget-object v15, v0, Lijd;->g:Ljava/lang/Object;

    check-cast v15, Lcom/opera/android/settings/SettingsManager;

    const-string v6, "live_scores_enabled"

    invoke-virtual {v15, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v15

    goto :goto_e8

    :cond_c6
    iget-object v6, v2, Lyk6;->j:Lkze;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_e4

    iget-object v6, v1, Lh0a;->d:Lode;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Li0a;

    if-eqz v6, :cond_e2

    iget-boolean v6, v6, Li0a;->b:Z

    if-eq v6, v11, :cond_e4

    :cond_e2
    const/4 v15, 0x0

    goto :goto_e8

    :cond_e4
    move v15, v11

    goto :goto_e8

    :cond_e6
    iget-boolean v15, v0, Lijd;->a:Z

    :goto_e8
    invoke-direct {v14, v13, v15}, Lrdf;-><init>(Lqdf;Z)V

    invoke-virtual {v3, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_97

    :cond_ef
    return-object v3
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Lijd;->d:Ljava/lang/Object;

    check-cast v0, Lrki;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->b:Lqcc;

    if-ne v1, v2, :cond_31

    iget-boolean v1, p0, Lijd;->a:Z

    if-nez v1, :cond_2b

    iget-object v1, p0, Lijd;->e:Ljava/lang/Object;

    check-cast v1, Lj3i;

    invoke-virtual {v1}, Lj3i;->invoke()Ljava/lang/Object;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v1, Lh9;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lh9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    iput-boolean v2, p0, Lijd;->a:Z

    return-void

    :cond_2b
    const-string p0, "SavedStateRegistry was already attached."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void

    :cond_31
    const-string p0, "Restarter must be created only during owner\'s initialization stage"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method
