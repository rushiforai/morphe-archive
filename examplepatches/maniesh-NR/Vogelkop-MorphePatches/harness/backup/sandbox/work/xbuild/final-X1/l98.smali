.class public final Ll98;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Lot6;

.field public final d:Lgq6;

.field public final e:Lf1p;

.field public final f:Lpw3;

.field public final g:Lqv7;

.field public final h:Ljg8;

.field public final i:Lcom/opera/android/settings/SettingsManager;

.field public final j:Lx5f;

.field public final k:Llq6;

.field public final l:Ltw2;

.field public final m:Lsm6;

.field public final n:Lga6;

.field public final o:Llq6;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ldp6;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v9, p2

    invoke-virtual {v9}, Ldp6;->c()Lot6;

    move-result-object v10

    iget-object v1, v9, Ldp6;->u:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lgq6;

    iget-object v12, v9, Ldp6;->n:Lf1p;

    new-instance v1, Lpw3;

    const/4 v6, 0x0

    const/4 v7, 0x3

    const-class v3, Lcom/opera/android/BrowserActivity;

    const-string v4, "sheetQueue"

    const-string v5, "getSheetQueue()Lcom/opera/android/ui/SheetQueue;"

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v7}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v13, v1

    new-instance v1, Lqv7;

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v2, 0x0

    const-string v5, "canShowInternalOnboardings"

    const-string v6, "canShowInternalOnboardings()Z"

    move-object v4, v3

    move-object/from16 v3, p1

    invoke-direct/range {v1 .. v8}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v2, v3

    sget-object v3, Lvml;->e:Lwjh;

    iget-object v3, v3, Lwjh;->d:Ljava/lang/Object;

    check-cast v3, Ljg8;

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    sget-object v5, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v5

    check-cast v5, Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->c:Lx5f;

    new-instance v6, Llq6;

    invoke-virtual {v9}, Ldp6;->d()Lip6;

    move-result-object v7

    invoke-direct {v6, v7}, Llq6;-><init>(Lip6;)V

    new-instance v7, Ltw2;

    iget-object v8, v9, Ldp6;->c:Lg77;

    const/16 v14, 0x1c

    invoke-direct {v7, v8, v14}, Ltw2;-><init>(Ljava/lang/Object;B)V

    new-instance v15, Lsm6;

    new-instance v9, Ltw2;

    invoke-direct {v9, v8, v14}, Ltw2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v15, v9}, Lsm6;-><init>(Ltw2;)V

    new-instance v9, Lga6;

    move-object/from16 v16, v15

    new-instance v15, Lvm6;

    move-object/from16 v17, v7

    new-instance v7, Ltw2;

    invoke-direct {v7, v8, v14}, Ltw2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v15, v7}, Lvm6;-><init>(Ltw2;)V

    const/4 v7, 0x2

    invoke-direct {v9, v15, v7}, Lga6;-><init>(Ljava/lang/Object;B)V

    new-instance v7, Llq6;

    invoke-virtual/range {p2 .. p2}, Ldp6;->d()Lip6;

    move-result-object v8

    invoke-direct {v7, v8}, Llq6;-><init>(Lip6;)V

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v2, v0, Ll98;->a:Lcom/opera/android/BrowserActivity;

    iput-object v2, v0, Ll98;->b:Lcom/opera/android/BrowserActivity;

    iput-object v10, v0, Ll98;->c:Lot6;

    iput-object v11, v0, Ll98;->d:Lgq6;

    iput-object v12, v0, Ll98;->e:Lf1p;

    iput-object v13, v0, Ll98;->f:Lpw3;

    iput-object v1, v0, Ll98;->g:Lqv7;

    iput-object v3, v0, Ll98;->h:Ljg8;

    iput-object v4, v0, Ll98;->i:Lcom/opera/android/settings/SettingsManager;

    iput-object v5, v0, Ll98;->j:Lx5f;

    iput-object v6, v0, Ll98;->k:Llq6;

    move-object/from16 v1, v17

    iput-object v1, v0, Ll98;->l:Ltw2;

    move-object/from16 v1, v16

    iput-object v1, v0, Ll98;->m:Lsm6;

    iput-object v9, v0, Ll98;->n:Lga6;

    iput-object v7, v0, Ll98;->o:Llq6;

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p1, Lg98;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lg98;

    iget v1, v0, Lg98;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lg98;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lg98;

    invoke-direct {v0, p0, p1}, Lg98;-><init>(Ll98;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lg98;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lg98;->x:I

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v2, :cond_55

    if-eq v2, v6, :cond_51

    if-eq v2, v5, :cond_4d

    if-eq v2, v4, :cond_44

    if-ne v2, v3, :cond_3e

    iget-object p0, v0, Lg98;->u:Ljava/lang/String;

    check-cast p0, Ld98;

    iget-object p0, v0, Lg98;->t:Ljava/util/Iterator;

    check-cast p0, Ljava/lang/String;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto/16 :goto_119

    :cond_3e
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7

    :cond_44
    iget-object v2, v0, Lg98;->u:Ljava/lang/String;

    iget-object v5, v0, Lg98;->t:Ljava/util/Iterator;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_dd

    :cond_4d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_96

    :cond_51
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7d

    :cond_55
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Ll98;->i:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "esim_notifications"

    invoke-virtual {p1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_65

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_65
    iget-object p1, p0, Ll98;->l:Ltw2;

    iget-object p1, p1, Ltw2;->b:Ljava/lang/Object;

    check-cast p1, Lg77;

    iget-object p1, p1, Lg77;->c:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lf99;

    iput v6, v0, Lg98;->x:I

    invoke-static {p1, v0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_118

    :goto_7d
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_88

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_88
    iget-object p1, p0, Ll98;->k:Llq6;

    iget-object p1, p1, Llq6;->a:Lip6;

    iget-object p1, p1, Lip6;->e:Lf99;

    iput v5, v0, Lg98;->x:I

    invoke-static {p1, v0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_118

    :goto_96
    check-cast p1, Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move-object v5, p1

    :cond_a1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_119

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ld98;

    iput-object v5, v0, Lg98;->t:Ljava/util/Iterator;

    iput-object v2, v0, Lg98;->u:Ljava/lang/String;

    iput v4, v0, Lg98;->x:I

    iget-object v8, p1, Ld98;->f:Le98;

    if-eqz v8, :cond_d1

    iget-boolean v9, v8, Le98;->c:Z

    if-ne v9, v6, :cond_ca

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_db

    :cond_ca
    iget-boolean v8, v8, Le98;->b:Z

    if-ne v8, v6, :cond_d1

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_db

    :cond_d1
    iget-object v8, p0, Ll98;->n:Lga6;

    iget-object v8, v8, Lga6;->b:Ljava/lang/Object;

    check-cast v8, Lvm6;

    invoke-virtual {v8, p1, v0}, Lvm6;->a(Ld98;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    :goto_db
    if-eq p1, v1, :cond_118

    :goto_dd
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_a1

    iget-object p1, p0, Ll98;->g:Lqv7;

    invoke-virtual {p1}, Lqv7;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_a1

    iget-object p1, p0, Ll98;->f:Lpw3;

    invoke-virtual {p1}, Lpw3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnej;

    new-instance v4, Lxq3;

    iget-object v5, p0, Ll98;->j:Lx5f;

    invoke-direct {v4, v5}, Lxq3;-><init>(Lx5f;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Lijm;->b:Lijm;

    invoke-virtual {p1, v4, v5}, Lr22;->b(Ljjm;Lijm;)V

    iput-object v7, v0, Lg98;->t:Ljava/util/Iterator;

    iput-object v7, v0, Lg98;->u:Ljava/lang/String;

    iput v3, v0, Lg98;->x:I

    iget-object p0, p0, Ll98;->o:Llq6;

    invoke-virtual {p0, v2, v0}, Llq6;->b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_119

    :cond_118
    return-object v1

    :cond_119
    :goto_119
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final b(Landroid/content/Intent;)V
    .registers 5

    if-eqz p1, :cond_15

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_15

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.intent.action.MAIN"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_15

    return-void

    :cond_15
    iget-object p1, p0, Ll98;->b:Lcom/opera/android/BrowserActivity;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-static {p1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object p1

    new-instance v0, Lj98;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2, v1}, Lj98;-><init>(Ll98;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {p1, v2, v2, v0, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method
