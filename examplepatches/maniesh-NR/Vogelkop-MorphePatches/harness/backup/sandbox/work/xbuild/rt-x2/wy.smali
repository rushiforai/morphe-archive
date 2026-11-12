.class public final Lwy;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public A:Lkze;

.field public final a:Landroid/content/Context;

.field public final b:Lx5f;

.field public final c:Luwh;

.field public final d:Lwjh;

.field public final e:Lvzk;

.field public final f:Lzy9;

.field public final g:Lux;

.field public final h:Li3j;

.field public final i:Ls9i;

.field public final j:Lbi;

.field public k:Z

.field public final l:Lyl;

.field public final m:Lks3;

.field public final n:Lb59;

.field public final o:Ljtg;

.field public final p:Lgmk;

.field public final q:Lw7h;

.field public final r:Lty;

.field public final s:Luy;

.field public final t:Lvy;

.field public final u:Lvy;

.field public final v:Llhb;

.field public final w:Lgy;

.field public final x:Lay;

.field public final y:Lej;

.field public z:Z


# direct methods
.method public constructor <init>(Lxd5;Lumi;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Lx5f;Ljtg;Lgmk;Lrr3;Lzv9;Lgy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lesk;)V
    .registers 41

    move-object/from16 v10, p0

    move-object/from16 v2, p2

    move-object/from16 v13, p5

    move-object/from16 v14, p10

    invoke-direct {v10}, Ljava/lang/Object;-><init>()V

    new-instance v8, Lzy9;

    const/4 v0, 0x6

    invoke-direct {v8, v0}, Lzy9;-><init>(B)V

    iput-object v8, v10, Lwy;->f:Lzy9;

    new-instance v1, Lay;

    const/4 v9, 0x1

    invoke-direct {v1, v10, v9}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v10, Lwy;->x:Lay;

    new-instance v1, Lej;

    invoke-direct {v1}, Lej;-><init>()V

    iput-object v1, v10, Lwy;->y:Lej;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, v10, Lwy;->a:Landroid/content/Context;

    const/4 v11, 0x0

    new-array v3, v11, [Lbg1;

    const-string v4, "ads"

    invoke-static {v1, v2, v4, v3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v3

    iput-object v3, v10, Lwy;->n:Lb59;

    iput-object v13, v10, Lwy;->b:Lx5f;

    move-object/from16 v4, p6

    iput-object v4, v10, Lwy;->o:Ljtg;

    move-object/from16 v4, p7

    iput-object v4, v10, Lwy;->p:Lgmk;

    new-instance v4, Lwjh;

    new-instance v5, Lsy;

    invoke-direct {v5, v10, v11}, Lsy;-><init>(Lwy;B)V

    move-object/from16 v12, p3

    move-object/from16 v6, p8

    invoke-direct {v4, v12, v13, v6, v5}, Lwjh;-><init>(Lcom/opera/android/settings/SettingsManager;Lx5f;Lrr3;Lsy;)V

    iput-object v4, v10, Lwy;->d:Lwjh;

    new-instance v5, Lvzk;

    new-instance v6, Ltw2;

    invoke-direct {v6, v10, v0}, Ltw2;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lsy;

    invoke-direct {v0, v10, v9}, Lsy;-><init>(Lwy;B)V

    new-instance v7, Lsy;

    const/4 v15, 0x2

    invoke-direct {v7, v10, v15}, Lsy;-><init>(Lwy;B)V

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    new-instance v15, Ljava/util/WeakHashMap;

    invoke-direct {v15}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v15}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v15

    iput-object v15, v5, Lvzk;->c:Ljava/lang/Object;

    new-instance v15, Lami;

    move-object/from16 v19, v0

    move-object/from16 v16, v1

    move-object/from16 v18, v3

    move-object/from16 v20, v4

    move-object/from16 v17, v5

    invoke-direct/range {v15 .. v20}, Lami;-><init>(Landroid/content/Context;Lvzk;Lb59;Lsy;Lwjh;)V

    move-object v0, v15

    move-object/from16 v15, v17

    iput-object v0, v15, Lvzk;->b:Ljava/lang/Object;

    new-instance v0, Li5o;

    new-instance v4, Lvx;

    invoke-direct {v4, v15, v11}, Lvx;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v5, p13

    move-object/from16 v16, v6

    move-object/from16 v6, v19

    invoke-direct/range {v0 .. v7}, Li5o;-><init>(Landroid/content/Context;Lumi;Lb59;Lvx;Lesk;Lsy;Lsy;)V

    move-object/from16 v18, v1

    move-object v1, v0

    move-object/from16 v0, v18

    move-object/from16 v18, v3

    iput-object v1, v15, Lvzk;->d:Ljava/lang/Object;

    new-instance v3, Lcy;

    new-instance v4, Lrx;

    invoke-direct {v4, v15, v9}, Lrx;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v17, v18

    move-object/from16 v21, v20

    move-object/from16 v18, v1

    move-object/from16 v20, v4

    move-object v1, v15

    move-object v15, v3

    invoke-direct/range {v15 .. v21}, Lcy;-><init>(Ltw2;Lb59;Li5o;Lsy;Lrx;Lwjh;)V

    move-object/from16 v3, v21

    iput-object v15, v1, Lvzk;->a:Ljava/lang/Object;

    iput-object v1, v10, Lwy;->e:Lvzk;

    new-instance v4, Lux;

    invoke-direct {v4, v1}, Lux;-><init>(Lvzk;)V

    iput-object v4, v10, Lwy;->g:Lux;

    iput-boolean v9, v4, Lux;->j:Z

    new-instance v5, Li3j;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    new-instance v6, Lc4;

    const/16 v7, 0xb

    invoke-direct {v6, v5, v7}, Lc4;-><init>(Ljava/lang/Object;B)V

    iput-object v6, v5, Li3j;->a:Ljava/lang/Object;

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iput-object v6, v5, Li3j;->b:Ljava/lang/Object;

    iput-object v8, v5, Li3j;->c:Ljava/lang/Object;

    iput-object v4, v5, Li3j;->d:Ljava/lang/Object;

    iput-object v5, v10, Lwy;->h:Li3j;

    new-instance v6, Ls9i;

    new-instance v7, Lpza;

    const/16 v15, 0xf

    invoke-direct {v7, v15}, Lpza;-><init>(B)V

    new-instance v9, Lni6;

    const-string v15, "ads_premium"

    invoke-direct {v9, v2, v0, v15}, Lni6;-><init>(Lumi;Landroid/content/Context;Ljava/lang/String;)V

    invoke-direct {v6, v7, v9, v1}, Ls9i;-><init>(Lpza;Lni6;Lvzk;)V

    iput-object v6, v10, Lwy;->i:Ls9i;

    new-instance v7, Lnn7;

    invoke-direct {v7, v0, v2, v13, v1}, Lnn7;-><init>(Landroid/content/Context;Lumi;Lx5f;Lvzk;)V

    iput-object v14, v10, Lwy;->w:Lgy;

    new-instance v9, Lty;

    invoke-direct {v9, v10, v7, v11}, Lty;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v9, v10, Lwy;->r:Lty;

    new-instance v9, Lks3;

    new-instance v15, Ls9i;

    invoke-direct {v15, v0, v2}, Ls9i;-><init>(Landroid/content/Context;Lumi;)V

    iget-object v11, v1, Lvzk;->d:Ljava/lang/Object;

    check-cast v11, Li5o;

    sget-object v18, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v18

    check-cast v18, Lcom/opera/android/OperaApplication;

    move-object/from16 p7, v5

    invoke-virtual/range {v18 .. v18}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->d:Lx5f;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    move-object/from16 v18, v8

    new-instance v8, Ljava/util/HashMap;

    const/16 v12, 0xfa

    invoke-direct {v8, v12}, Ljava/util/HashMap;-><init>(I)V

    iput-object v8, v9, Lks3;->a:Ljava/lang/Object;

    iput-object v7, v9, Lks3;->b:Ljava/lang/Object;

    iput-object v15, v9, Lks3;->c:Ljava/lang/Object;

    iput-object v11, v9, Lks3;->d:Ljava/lang/Object;

    iput-object v6, v9, Lks3;->e:Ljava/lang/Object;

    iput-object v3, v9, Lks3;->f:Ljava/lang/Object;

    iput-object v13, v9, Lks3;->g:Ljava/lang/Object;

    iput-object v5, v9, Lks3;->h:Ljava/lang/Object;

    new-instance v6, Lua7;

    invoke-direct {v6, v5}, Lua7;-><init>(Lx5f;)V

    iput-object v6, v9, Lks3;->i:Ljava/lang/Object;

    iput-object v9, v10, Lwy;->m:Lks3;

    new-instance v5, Lyl;

    new-instance v6, Lyl;

    iget-object v8, v1, Lvzk;->d:Ljava/lang/Object;

    check-cast v8, Li5o;

    invoke-direct {v6, v0, v9, v8}, Lyl;-><init>(Landroid/content/Context;Lks3;Li5o;)V

    new-instance v8, Ltx;

    invoke-direct {v8, v4, v6}, Ltx;-><init>(Lux;Lyl;)V

    invoke-direct {v5, v0, v2, v8}, Lyl;-><init>(Landroid/content/Context;Lumi;Ltx;)V

    iput-object v5, v10, Lwy;->l:Lyl;

    move-object v6, v5

    invoke-static {v0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v5

    move-object v8, v6

    new-instance v6, Luwh;

    invoke-virtual/range {p1 .. p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v9

    invoke-direct {v6, v9, v5}, Luwh;-><init>(Ltcc;Lxnh;)V

    iput-object v6, v10, Lwy;->c:Luwh;

    move-object v9, v0

    new-instance v0, Lw7h;

    iget-object v11, v1, Lvzk;->d:Ljava/lang/Object;

    check-cast v11, Li5o;

    move-object/from16 v25, p7

    move-object/from16 v12, p9

    move-object/from16 v15, p11

    move-object/from16 v16, p12

    move-object/from16 v17, p13

    move-object/from16 v23, v1

    move-object/from16 v24, v4

    move-object/from16 v26, v8

    move-object/from16 v22, v9

    move-object v9, v11

    move-object/from16 v8, v18

    move-object/from16 v1, p1

    move-object/from16 v4, p4

    move-object v11, v3

    move-object/from16 v3, p3

    invoke-direct/range {v0 .. v17}, Lw7h;-><init>(Landroid/app/Activity;Lumi;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Lxnh;Luwh;Lnn7;Lzy9;Li5o;Lwy;Lwjh;Lzv9;Lx5f;Lgy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lesk;)V

    move-object v11, v10

    iput-object v0, v11, Lwy;->q:Lw7h;

    new-instance v1, Luy;

    invoke-direct {v1, v11}, Luy;-><init>(Lwy;)V

    iput-object v1, v11, Lwy;->s:Luy;

    new-instance v1, Lvy;

    const/4 v3, 0x0

    invoke-direct {v1, v11, v3}, Lvy;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v11, Lwy;->t:Lvy;

    iput-object v1, v11, Lwy;->u:Lvy;

    new-instance v1, Lbi;

    const/16 v4, 0xf

    invoke-direct {v1, v11, v4}, Lbi;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v11, Lwy;->j:Lbi;

    move-object/from16 v1, v24

    move-object/from16 v5, v25

    iput-object v5, v1, Lux;->f:Li3j;

    iput-object v0, v1, Lux;->g:Lw7h;

    iput-object v6, v1, Lux;->h:Luwh;

    new-instance v10, Lpo7;

    invoke-direct {v10, v14}, Lpo7;-><init>(Lno7;)V

    new-instance v9, Lnhb;

    move-object/from16 v15, v23

    invoke-direct {v9, v15}, Lnhb;-><init>(Lvzk;)V

    new-instance v1, Lz0b;

    const/4 v5, 0x4

    invoke-direct {v1, v5}, Lv0b;-><init>(I)V

    new-instance v5, Lho;

    invoke-direct {v5, v3}, Lho;-><init>(B)V

    invoke-virtual {v1, v5}, Lv0b;->c(Ljava/lang/Object;)V

    new-instance v5, Lj10;

    move-object/from16 v6, v26

    invoke-direct {v5, v6}, Lj10;-><init>(Lyl;)V

    invoke-virtual {v1, v5}, Lv0b;->c(Ljava/lang/Object;)V

    new-instance v5, Lho;

    const/4 v7, 0x1

    invoke-direct {v5, v7}, Lho;-><init>(B)V

    invoke-virtual {v1, v5}, Lv0b;->c(Ljava/lang/Object;)V

    sget-object v5, Lep7;->a:Lii;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqyf;

    invoke-virtual {v5}, Lk8;->a0()Z

    move-result v7

    if-eqz v7, :cond_1ff

    iget-object v5, v5, Lk8;->a:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    new-array v7, v3, [Ljava/lang/Class;

    new-array v3, v3, [Ljava/lang/Object;

    const-string v8, "createInterstitialPresenter"

    invoke-static {v5, v8, v7, v3}, Lmzg;->k(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljhb;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v3}, Lv0b;->c(Ljava/lang/Object;)V

    :cond_1ff
    new-instance v3, Llhb;

    new-instance v5, Lpza;

    const/16 v7, 0xe

    invoke-direct {v5, v7}, Lpza;-><init>(B)V

    move-object v7, v5

    new-instance v5, Lpza;

    invoke-direct {v5, v4}, Lpza;-><init>(B)V

    move-object v8, v6

    new-instance v6, Lni6;

    const-string v4, "ads_interstitial"

    move-object/from16 v12, v22

    invoke-direct {v6, v2, v12, v4}, Lni6;-><init>(Lumi;Landroid/content/Context;Ljava/lang/String;)V

    move-object v4, v7

    new-instance v7, Li16;

    const/16 v2, 0x15

    invoke-direct {v7, v0, v2}, Li16;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Lz0b;->g()Lcsh;

    move-result-object v0

    move-object v1, v8

    move-object v8, v0

    move-object v0, v3

    move-object v3, v1

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    invoke-direct/range {v0 .. v10}, Llhb;-><init>(Lndc;Lx5f;Lyl;Lpza;Lpza;Lni6;Li16;Lcsh;Lnhb;Lpo7;)V

    iput-object v0, v11, Lwy;->v:Llhb;

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 3

    iget-object v0, p0, Lwy;->e:Lvzk;

    iget-object v0, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Li5o;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lwy;->q:Lw7h;

    iget-object v0, v0, Lw7h;->f:Lpyl;

    iget-object v0, v0, Lpyl;->f:Ljava/lang/Object;

    check-cast v0, Ljec;

    invoke-virtual {v0}, Ljec;->clear()V

    iget-object v0, p0, Lwy;->l:Lyl;

    iget-object v1, v0, Lyl;->e:Ljava/lang/Object;

    check-cast v1, Lxl;

    invoke-virtual {v1}, Lldk;->i()V

    iget-object v0, v0, Lyl;->d:Ljava/lang/Object;

    check-cast v0, Ljec;

    invoke-virtual {v0}, Ljec;->clear()V

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lldk;->g(Ljava/lang/Object;)V

    iget-object p0, p0, Lwy;->g:Lux;

    iput-object v0, p0, Lux;->l:Ljava/lang/String;

    return-void
.end method

.method public final S(Landroid/content/Context;Lcom/opera/api/Callback;)V
    .registers 6

    new-instance v0, Lsu;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, p2, v1}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lwy;->e:Lvzk;

    iget-object p2, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p2, Li5o;

    new-instance v1, Lwx;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p2, Li5o;->a:Ljava/lang/Object;

    check-cast p0, Liy;

    new-instance v0, Lk3;

    const/4 v2, 0x6

    invoke-direct {v0, p2, p1, v1, v2}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Liy;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public final T()Z
    .registers 4

    iget-object v0, p0, Lwy;->a:Landroid/content/Context;

    invoke-static {v0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v1

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwnh;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lwnh;->a(I)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_15

    return v2

    :cond_15
    iget-boolean p0, p0, Lwy;->z:Z

    if-eqz p0, :cond_2b

    invoke-static {v0}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsvg;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lsvg;->a(I)Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    :cond_2b
    const/4 p0, 0x0

    return p0
.end method

.method public final U()V
    .registers 5

    iget-object v0, p0, Lwy;->A:Lkze;

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lwy;->T()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_f
    iget-object p0, p0, Lwy;->e:Lvzk;

    iget-object p0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast p0, Lcy;

    iget-object v0, p0, Lcy;->b:Ljava/lang/Object;

    check-cast v0, Lay;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->c()Z

    move-result v1

    if-eqz v1, :cond_4f

    iget-object v1, p0, Lcy;->c:Ljava/lang/Object;

    check-cast v1, Ltw2;

    iget-object v1, v1, Ltw2;->b:Ljava/lang/Object;

    check-cast v1, Lwy;

    invoke-virtual {v1}, Lwy;->T()Z

    move-result v1

    if-eqz v1, :cond_4f

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lml;

    new-instance v2, Lix5;

    const/16 v3, 0x15

    invoke-direct {v2, v3}, Lix5;-><init>(B)V

    const-string v3, ""

    invoke-virtual {v1, v3, v2}, Lml;->d(Ljava/lang/String;Lgm;)Z

    move-result v1

    if-eqz v1, :cond_4f

    iget-object p0, p0, Lcy;->g:Ljava/lang/Object;

    check-cast p0, Lrx;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lml;

    invoke-virtual {p0, v0}, Lrx;->s(Lml;)V

    :cond_4f
    return-void
.end method

.method public final W(Lndc;)V
    .registers 5

    sget-object v0, Lzsd;->b:Lzsd;

    iget-object v1, p0, Lwy;->s:Luy;

    iget-object v0, v0, Lzsd;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lwy;->a:Landroid/content/Context;

    invoke-static {v0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v1

    iget-object v2, p0, Lwy;->t:Lvy;

    invoke-virtual {v1, v2}, Lno7;->g(Lmo7;)V

    invoke-static {v0}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object v0

    iget-object v1, p0, Lwy;->u:Lvy;

    invoke-virtual {v0, v1}, Lno7;->g(Lmo7;)V

    iget-object v0, p0, Lwy;->w:Lgy;

    iget-object v1, p0, Lwy;->r:Lty;

    invoke-virtual {v0, v1}, Lno7;->g(Lmo7;)V

    iget-object v0, p0, Lwy;->o:Ljtg;

    invoke-virtual {v0}, Ljtg;->b()Z

    move-result v0

    if-eqz v0, :cond_33

    iget-object v0, p0, Lwy;->p:Lgmk;

    iget-object v0, v0, Lgmk;->a:Lkze;

    invoke-virtual {v0, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    :cond_33
    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Luvg;

    sget-object v0, Luvg;->g:Luvg;

    if-eq p1, v0, :cond_11

    sget-object v0, Luvg;->d:Luvg;

    if-ne p1, v0, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    iget-boolean v0, p0, Lwy;->z:Z

    if-ne v0, p1, :cond_12

    :cond_11
    return-void

    :cond_12
    iput-boolean p1, p0, Lwy;->z:Z

    invoke-virtual {p0}, Lwy;->U()V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 4

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    sget-object p1, Lzsd;->b:Lzsd;

    iget-object v0, p0, Lwy;->s:Luy;

    iget-object p1, p1, Lzsd;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Lwy;->a:Landroid/content/Context;

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v0

    iget-object v1, p0, Lwy;->t:Lvy;

    invoke-virtual {v0, v1}, Lno7;->p(Lmo7;)V

    invoke-static {p1}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object p1

    iget-object v0, p0, Lwy;->u:Lvy;

    invoke-virtual {p1, v0}, Lno7;->p(Lmo7;)V

    iget-object p1, p0, Lwy;->w:Lgy;

    iget-object v0, p0, Lwy;->r:Lty;

    invoke-virtual {p1, v0}, Lno7;->p(Lmo7;)V

    iget-object p1, p0, Lwy;->h:Li3j;

    invoke-virtual {p1}, Li3j;->m()V

    iget-object p0, p0, Lwy;->d:Lwjh;

    iget-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p1, Lo59;

    if-nez p1, :cond_39

    return-void

    :cond_39
    iget-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    iget-object v0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast v0, Ls9;

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 5

    const/4 p1, 0x0

    iput-boolean p1, p0, Lwy;->k:Z

    iget-object v0, p0, Lwy;->m:Lks3;

    iget-object v1, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v1, Lnn7;

    iget-object v2, v1, Lnn7;->o:Lbn7;

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lnn7;->q()V

    :cond_10
    iget-object v0, v0, Lks3;->c:Ljava/lang/Object;

    check-cast v0, Ls9i;

    iget-object v1, v0, Ls9i;->e:Ljava/lang/Object;

    check-cast v1, Loml;

    if-eqz v1, :cond_2f

    invoke-virtual {v1, p1}, Loml;->cancel(Z)Z

    const/4 p1, 0x0

    iput-object p1, v0, Ls9i;->e:Ljava/lang/Object;

    iget-object p1, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast p1, Li32;

    iget-object v0, v0, Ls9i;->d:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clone()Landroid/util/SparseArray;

    move-result-object v0

    invoke-virtual {p1, v0}, Lldk;->g(Ljava/lang/Object;)V

    :cond_2f
    iget-object p0, p0, Lwy;->g:Lux;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lux;->j:Z

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 4

    const/4 p1, 0x1

    iput-boolean p1, p0, Lwy;->k:Z

    iget-object v0, p0, Lwy;->e:Lvzk;

    iget-object v0, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Lcy;

    invoke-virtual {v0}, Lcy;->i()V

    iget-object v0, p0, Lwy;->g:Lux;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lux;->j:Z

    iget-object p0, p0, Lwy;->h:Li3j;

    invoke-virtual {p0, p1}, Li3j;->q(Z)V

    return-void
.end method

.method public final onStop(Lndc;)V
    .registers 3

    iget-object p1, p0, Lwy;->f:Lzy9;

    invoke-virtual {p1}, Lzy9;->I()V

    iget-object p1, p0, Lwy;->h:Li3j;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Li3j;->q(Z)V

    iget-object p0, p0, Lwy;->q:Lw7h;

    iget-object p1, p0, Lw7h;->g:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_17
    :goto_17
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_17

    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    goto :goto_17

    :cond_2d
    iget-object p0, p0, Lw7h;->h:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_37
    :goto_37
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_37

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    goto :goto_37

    :cond_4d
    return-void
.end method
