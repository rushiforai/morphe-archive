.class public final Lzzb;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public b:I

.field public final c:I

.field public d:I

.field public final synthetic e:La0c;


# direct methods
.method public constructor <init>(La0c;Landroid/content/Context;)V
    .registers 16

    iput-object p1, p0, Lzzb;->e:La0c;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lzzb;->a:Ljava/util/ArrayList;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    sget-object v0, Lwwc;->a:Ljava/util/Locale;

    new-instance v0, Ljava/util/ArrayList;

    invoke-static {}, Lywc;->d()V

    sget-object v1, Lywc;->a:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_2d
    if-ge v4, v2, :cond_40

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ljava/lang/String;

    new-instance v6, Ltzb;

    invoke-direct {v6, p2, v5}, Ltzb;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2d

    :cond_40
    new-instance v0, Lrp2;

    invoke-direct {v0, p1}, Lrp2;-><init>(B)V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-static {}, Lywc;->c()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v6, v3

    :goto_5a
    if-ge v6, v5, :cond_6a

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Ltzb;

    iget-object v7, v7, Ltzb;->a:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5a

    :cond_6a
    sget-object v5, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    check-cast v5, Lcom/opera/android/OperaApplication;

    iget-object v5, v5, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llpe;

    iget-object v5, v5, Llpe;->b:Lcq5;

    invoke-virtual {v5}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnok;

    invoke-virtual {v5}, Lnok;->d()Lffb;

    move-result-object v5

    const-string v6, "localize"

    invoke-virtual {v2, v6, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v7, "language_code"

    const/4 v8, 0x0

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lwwc;->a:Ljava/util/Locale;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    check-cast v8, Lcom/opera/android/OperaApplication;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->K()Lr0k;

    move-result-object v8

    invoke-interface {v8}, Lr0k;->j()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->size()I

    move-result v8

    const/16 v9, 0x2e

    if-lt v8, v9, :cond_b3

    new-instance v2, Luac;

    const/16 v8, 0xa

    invoke-direct {v2, v8}, Luac;-><init>(B)V

    goto :goto_b9

    :cond_b3
    new-instance v8, Lkw0;

    invoke-direct {v8, v2}, Lkw0;-><init>(Landroid/content/Context;)V

    move-object v2, v8

    :goto_b9
    new-instance v8, Ljava/util/ArrayList;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    if-eqz v6, :cond_d1

    invoke-static {v6, p1}, Lywc;->b(Ljava/lang/String;Z)Lxwc;

    move-result-object v9

    if-eqz v9, :cond_d1

    invoke-static {v6}, Lwwc;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d1
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v9

    move v10, v3

    :cond_d6
    :goto_d6
    if-ge v10, v9, :cond_100

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v10, v10, 0x1

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Lwwc;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_d6

    invoke-static {v11, p1}, Lywc;->b(Ljava/lang/String;Z)Lxwc;

    move-result-object v12

    if-eqz v12, :cond_d6

    invoke-interface {v2, v11}, Lurg;->test(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_d6

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_d6

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d6

    :cond_100
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_104
    :goto_104
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_12a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lwwc;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_104

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_104

    invoke-static {v5, p1}, Lywc;->b(Ljava/lang/String;Z)Lxwc;

    move-result-object v9

    if-eqz v9, :cond_104

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_104

    :cond_12a
    invoke-static {v7}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v7, v3

    :cond_133
    if-ge v7, v5, :cond_146

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v7, v7, 0x1

    check-cast v9, Ljava/lang/String;

    invoke-static {v9, v2}, Lwwc;->b(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_133

    const-string v2, ""

    goto :goto_148

    :cond_146
    const-string v2, "en"

    :goto_148
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_14c
    :goto_14c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_162

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5, v2}, Lwwc;->b(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_14c

    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_14c

    :cond_162
    if-eqz v6, :cond_16c

    invoke-static {v2, v6}, Lwwc;->b(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_16c

    move v4, p1

    goto :goto_16d

    :cond_16c
    move v4, v3

    :goto_16d
    invoke-virtual {v8, v4, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v4, v3

    :cond_175
    :goto_175
    if-ge v4, v2, :cond_1b0

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ltzb;

    iget-object v6, v5, Ltzb;->a:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_175

    iget-object v6, v5, Ltzb;->a:Ljava/lang/String;

    invoke-static {v6}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v6

    sget-object v7, Lwwc;->a:Ljava/util/Locale;

    invoke-static {v6}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v7}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lwwc;->b(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    iget-object v9, p0, Lzzb;->a:Ljava/util/ArrayList;

    if-eqz v6, :cond_1ac

    new-instance v5, Ltzb;

    invoke-static {v7}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, p2, v6}, Ltzb;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_175

    :cond_1ac
    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_175

    :cond_1b0
    iget-object v0, p0, Lzzb;->a:Ljava/util/ArrayList;

    new-instance v1, Ltzb;

    invoke-direct {v1}, Ltzb;-><init>()V

    invoke-virtual {v0, v3, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    sget-object v0, Lvl6;->f:Lvl6;

    if-eqz v0, :cond_1d0

    iget-object v0, v0, Lvl6;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {v8, v1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_1d0
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v1, p1

    :goto_1d5
    if-ge v3, v0, :cond_1ed

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v3, v3, 0x1

    check-cast v2, Ljava/lang/String;

    iget-object v4, p0, Lzzb;->a:Ljava/util/ArrayList;

    add-int/lit8 v5, v1, 0x1

    new-instance v6, Ltzb;

    invoke-direct {v6, p2, v2}, Ltzb;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v4, v1, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    move v1, v5

    goto :goto_1d5

    :cond_1ed
    iput v1, p0, Lzzb;->c:I

    iget-object v0, p0, Lzzb;->a:Ljava/util/ArrayList;

    new-instance v2, Ltzb;

    invoke-direct {v2}, Ltzb;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iput p1, p0, Lzzb;->b:I

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lwwc;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_23d

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lwwc;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p2

    :goto_215
    iget-object v0, p0, Lzzb;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_23d

    iget-object v0, p0, Lzzb;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltzb;

    iget-object v0, v0, Ltzb;->b:Ljava/util/Locale;

    if-eqz v0, :cond_23a

    invoke-static {p2}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lwwc;->b(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23a

    iput p1, p0, Lzzb;->b:I

    goto :goto_23d

    :cond_23a
    add-int/lit8 p1, p1, 0x1

    goto :goto_215

    :cond_23d
    :goto_23d
    const/4 p1, -0x1

    iput p1, p0, Lzzb;->d:I

    return-void
.end method


# virtual methods
.method public final G()V
    .registers 7

    sget-object v0, Lvl6;->f:Lvl6;

    const/4 v1, 0x0

    if-eqz v0, :cond_20

    iget-object v2, v0, Lvl6;->e:Ljava/lang/Object;

    check-cast v2, Lu85;

    if-eqz v2, :cond_1d

    iget-boolean v3, v2, Lu85;->a:Z

    if-nez v3, :cond_18

    iget-object v3, v2, Lu85;->e:Ljava/lang/Object;

    check-cast v3, Lr0k;

    iget v4, v2, Lu85;->b:I

    invoke-interface {v3, v4}, Lr0k;->b(I)Lcom/google/android/gms/tasks/Task;

    :cond_18
    invoke-virtual {v2}, Lu85;->c()V

    iput-object v1, v0, Lvl6;->e:Ljava/lang/Object;

    :cond_1d
    invoke-virtual {v0}, Lvl6;->R()V

    :cond_20
    iget v0, p0, Lzzb;->d:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_26

    return-void

    :cond_26
    iput v2, p0, Lzzb;->d:I

    iget-object v2, p0, Lzzb;->e:La0c;

    iget-object v3, v2, La0c;->t:Lu85;

    if-eqz v3, :cond_40

    iget-boolean v4, v3, Lu85;->a:Z

    if-nez v4, :cond_3b

    iget-object v4, v3, Lu85;->e:Ljava/lang/Object;

    check-cast v4, Lr0k;

    iget v5, v3, Lu85;->b:I

    invoke-interface {v4, v5}, Lr0k;->b(I)Lcom/google/android/gms/tasks/Task;

    :cond_3b
    invoke-virtual {v3}, Lu85;->c()V

    iput-object v1, v2, La0c;->t:Lu85;

    :cond_40
    iput-object v1, v2, La0c;->u:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    return-void
.end method

.method public final H()V
    .registers 4

    iget v0, p0, Lzzb;->d:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    return-void

    :cond_6
    iput v1, p0, Lzzb;->d:I

    iget-object v1, p0, Lzzb;->e:La0c;

    const/4 v2, 0x0

    iput-object v2, v1, La0c;->t:Lu85;

    iput-object v2, v1, La0c;->u:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    return-void
.end method

.method public final I()V
    .registers 6

    iget-object p0, p0, Lzzb;->e:La0c;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v0

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->e:Lqcc;

    invoke-virtual {v0, v1}, Lqcc;->d(Lqcc;)Z

    move-result v0

    if-eqz v0, :cond_5b

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v0

    new-instance v1, Lrxh;

    const v2, 0x7f141178

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    new-instance v2, Lyzb;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lyzb;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lgkj;

    invoke-direct {p0, v3, v3}, Lnz0;-><init>(ZZ)V

    const/4 v4, 0x0

    iput-object v4, p0, Lgkj;->a:Ljava/lang/String;

    iput-object v4, p0, Lgkj;->b:Ljava/lang/String;

    iput-object v4, p0, Lgkj;->c:Ljava/lang/String;

    iput-object v4, p0, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v4, p0, Lgkj;->e:Lekj;

    iput-object v4, p0, Lgkj;->f:Lfkj;

    iput-object v4, p0, Lgkj;->g:Lqp2;

    iput-object v2, p0, Lgkj;->h:Ldkj;

    iput-object v4, p0, Lgkj;->i:Ldkj;

    iput-object v4, p0, Lgkj;->j:Lql;

    const v2, 0x7f140bbb

    iput v2, p0, Lgkj;->k:I

    iput v3, p0, Lgkj;->l:I

    const v2, 0x7f141179

    iput v2, p0, Lgkj;->m:I

    const/4 v2, 0x1

    iput-boolean v2, p0, Lgkj;->n:Z

    iput-object v1, p0, Lgkj;->o:Lpxh;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {v0, p0, v1}, Lr22;->b(Ljjm;Lijm;)V

    :cond_5b
    return-void
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lzzb;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final getItemId(I)J
    .registers 2

    int-to-long p0, p1

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    iget-object p0, p0, Lzzb;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltzb;

    iget-object p0, p0, Ltzb;->b:Ljava/util/Locale;

    if-nez p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 10

    check-cast p1, Luzb;

    iget-object v0, p0, Lzzb;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltzb;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object v1, v0, Ltzb;->b:Ljava/util/Locale;

    if-nez v1, :cond_23

    invoke-static {p1}, Lmn5;->a(Landroid/view/View;)Lmn5;

    move-result-object p0

    iget-object p0, p0, Lmn5;->b:Lcom/opera/android/custom_views/StylingTextView;

    if-nez p2, :cond_1c

    const p1, 0x7f1408b0

    goto :goto_1f

    :cond_1c
    const p1, 0x7f1408af

    :goto_1f
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void

    :cond_23
    invoke-static {p1}, Ly83;->d(Landroid/view/View;)Ly83;

    move-result-object v1

    iget-object v2, v1, Ly83;->f:Ljava/lang/Object;

    check-cast v2, Landroid/widget/TextView;

    iget-object v3, v0, Ltzb;->c:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, v1, Ly83;->c:Ljava/lang/Object;

    check-cast v2, Landroid/widget/TextView;

    iget-object v3, v0, Ltzb;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    iget p1, p0, Lzzb;->d:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne p2, p1, :cond_44

    move p1, v2

    goto :goto_45

    :cond_44
    move p1, v3

    :goto_45
    iget-object v4, v1, Ly83;->d:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    iget-object v5, v1, Ly83;->b:Landroid/view/ViewGroup;

    check-cast v5, Landroid/widget/LinearLayout;

    iget-object v1, v1, Ly83;->h:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    const/4 v6, 0x2

    if-eqz p1, :cond_79

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v4, p1}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    const p1, 0x7f080523

    invoke-virtual {v4, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    new-instance p1, Lg63;

    invoke-direct {p1, p0, p2, v6}, Lg63;-><init>(Ljava/lang/Object;IB)V

    new-instance p0, Lks8;

    invoke-direct {p0, p1, v6}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_79
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->q(Landroid/content/Context;)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v4, p1}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    const p1, 0x7f080512

    invoke-virtual {v4, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget p1, p0, Lzzb;->b:I

    if-eq p2, p1, :cond_93

    move v2, v3

    :cond_93
    const/4 p1, 0x4

    if-nez v2, :cond_97

    move v3, p1

    :cond_97
    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    new-instance p1, Lxzb;

    invoke-direct {p1, p0, v2, p2, v0}, Lxzb;-><init>(Lzzb;ZILtzb;)V

    new-instance p0, Lks8;

    invoke-direct {p0, p1, v6}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 6

    new-instance v0, Luzb;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p2, v2, :cond_7

    move v2, v1

    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    if-eqz v2, :cond_1f

    const p0, 0x7f0d0385

    invoke-virtual {p2, p0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lmn5;->a(Landroid/view/View;)Lmn5;

    move-result-object p0

    iget-object p0, p0, Lmn5;->b:Lcom/opera/android/custom_views/StylingTextView;

    goto :goto_3f

    :cond_1f
    invoke-static {p2, p1}, Ly83;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ly83;

    move-result-object p1

    iget-object p2, p1, Ly83;->d:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageView;

    const/16 v1, 0x8

    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Lvs5;

    const/4 v2, 0x2

    invoke-direct {v1, p0, p2, p1, v2}, Lvs5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-eqz p0, :cond_3b

    invoke-static {p0, p2, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_3b
    iget-object p0, p1, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p0, Landroid/widget/LinearLayout;

    :goto_3f
    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    return-object v0
.end method
