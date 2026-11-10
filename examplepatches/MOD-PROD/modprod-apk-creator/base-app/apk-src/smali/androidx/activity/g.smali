.class public final synthetic Landroidx/activity/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La/b;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Le/i;


# direct methods
.method public synthetic constructor <init>(Le/i;I)V
    .locals 0

    iput p2, p0, Landroidx/activity/g;->a:I

    iput-object p1, p0, Landroidx/activity/g;->b:Le/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 17

    move-object/from16 v0, p0

    iget v1, v0, Landroidx/activity/g;->a:I

    packed-switch v1, :pswitch_data_0

    iget-object v1, v0, Landroidx/activity/g;->b:Le/i;

    iget-object v1, v1, Le/i;->r:LC/j;

    iget-object v1, v1, LC/j;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/fragment/app/f;

    iget-object v2, v1, Landroidx/fragment/app/f;->c:Landroidx/fragment/app/p;

    iget-object v3, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    if-nez v3, :cond_1f

    iput-object v1, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    iput-object v1, v2, Landroidx/fragment/app/p;->s:Landroidx/fragment/app/f;

    iget-object v3, v2, Landroidx/fragment/app/p;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    iget-object v3, v1, Landroidx/fragment/app/f;->d:Le/i;

    invoke-virtual {v3}, Landroidx/activity/l;->g()Landroidx/activity/v;

    move-result-object v4

    iput-object v4, v2, Landroidx/fragment/app/p;->f:Landroidx/activity/v;

    iget-object v5, v2, Landroidx/fragment/app/p;->g:Landroidx/fragment/app/k;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v6, "onBackPressedCallback"

    invoke-static {v5, v6}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1}, Landroidx/lifecycle/q;->c()Landroidx/lifecycle/s;

    move-result-object v1

    iget-object v6, v1, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    sget-object v7, Landroidx/lifecycle/l;->a:Landroidx/lifecycle/l;

    if-ne v6, v7, :cond_0

    goto :goto_0

    :cond_0
    new-instance v6, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;

    invoke-direct {v6, v4, v1, v5}, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;-><init>(Landroidx/activity/v;Landroidx/lifecycle/s;Landroidx/fragment/app/k;)V

    iget-object v1, v5, Landroidx/fragment/app/k;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v6}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v4}, Landroidx/activity/v;->c()V

    new-instance v1, Landroidx/activity/u;

    const/4 v6, 0x0

    invoke-direct {v1, v6, v4}, Landroidx/activity/u;-><init>(ILjava/lang/Object;)V

    iput-object v1, v5, Landroidx/fragment/app/k;->c:Landroidx/activity/u;

    :goto_0
    invoke-virtual {v3}, Landroidx/activity/l;->b()Landroidx/lifecycle/G;

    move-result-object v1

    new-instance v3, LC/h;

    sget-object v4, Landroidx/fragment/app/r;->g:LF/d;

    invoke-direct {v3, v1, v4}, LC/h;-><init>(Landroidx/lifecycle/G;LF/d;)V

    const-class v1, Landroidx/fragment/app/r;

    invoke-virtual {v3, v1}, LC/h;->g(Ljava/lang/Class;)Landroidx/lifecycle/E;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/r;

    iput-object v1, v2, Landroidx/fragment/app/p;->E:Landroidx/fragment/app/r;

    iget-object v3, v2, Landroidx/fragment/app/p;->c:LQ/t;

    iput-object v1, v3, LQ/t;->d:Ljava/lang/Object;

    iget-object v1, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    if-eqz v1, :cond_18

    invoke-virtual {v1}, Landroidx/fragment/app/f;->a()LL/e;

    move-result-object v1

    new-instance v4, Landroidx/activity/f;

    const/4 v5, 0x2

    invoke-direct {v4, v5, v2}, Landroidx/activity/f;-><init>(ILjava/lang/Object;)V

    const-string v5, "android:support:fragments"

    invoke-virtual {v1, v5, v4}, LL/e;->e(Ljava/lang/String;LL/d;)V

    invoke-virtual {v1, v5}, LL/e;->c(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_18

    invoke-virtual {v1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "result_"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v6

    if-eqz v6, :cond_1

    iget-object v7, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    iget-object v7, v7, Landroidx/fragment/app/f;->a:Le/i;

    invoke-virtual {v7}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    const/4 v7, 0x7

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    iget-object v7, v2, Landroidx/fragment/app/p;->j:Ljava/util/Map;

    invoke-interface {v7, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const-string v7, "state"

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v8, "fragment_"

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v6

    if-eqz v6, :cond_3

    iget-object v8, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    iget-object v8, v8, Landroidx/fragment/app/f;->a:Le/i;

    invoke-virtual {v8}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroidx/fragment/app/s;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    iget-object v5, v3, LQ/t;->c:Ljava/lang/Object;

    check-cast v5, Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->clear()V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v9, 0x0

    :goto_3
    if-ge v9, v6, :cond_5

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Landroidx/fragment/app/s;

    iget-object v11, v10, Landroidx/fragment/app/s;->b:Ljava/lang/String;

    invoke-virtual {v5, v11, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_5
    invoke-virtual {v1, v7}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/q;

    if-nez v1, :cond_6

    goto/16 :goto_d

    :cond_6
    iget-object v4, v3, LQ/t;->a:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    iget-object v6, v1, Landroidx/fragment/app/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v9, 0x0

    :goto_4
    const/4 v10, 0x0

    if-ge v9, v7, :cond_a

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v9, v9, 0x1

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v5, v11}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroidx/fragment/app/s;

    if-nez v11, :cond_7

    goto :goto_4

    :cond_7
    iget-object v1, v2, Landroidx/fragment/app/p;->E:Landroidx/fragment/app/r;

    iget-object v1, v1, Landroidx/fragment/app/r;->c:Ljava/util/HashMap;

    iget-object v3, v11, Landroidx/fragment/app/s;->b:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_9

    iget-object v1, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    iget-object v1, v1, Landroidx/fragment/app/f;->a:Le/i;

    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    iget-object v3, v11, Landroidx/fragment/app/s;->a:Ljava/lang/String;

    iget-object v2, v2, Landroidx/fragment/app/p;->t:Landroidx/fragment/app/m;

    invoke-virtual {v2, v3}, Landroidx/fragment/app/m;->a(Ljava/lang/String;)V

    iget-object v2, v11, Landroidx/fragment/app/s;->j:Landroid/os/Bundle;

    if-eqz v2, :cond_8

    invoke-virtual {v2, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    :cond_8
    throw v10

    :cond_9
    new-instance v1, Ljava/lang/ClassCastException;

    invoke-direct {v1}, Ljava/lang/ClassCastException;-><init>()V

    throw v1

    :cond_a
    iget-object v5, v2, Landroidx/fragment/app/p;->E:Landroidx/fragment/app/r;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Ljava/util/ArrayList;

    iget-object v5, v5, Landroidx/fragment/app/r;->c:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-direct {v6, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_17

    iget-object v5, v1, Landroidx/fragment/app/q;->b:Ljava/util/ArrayList;

    iget-object v6, v3, LQ/t;->b:Ljava/lang/Object;

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    if-eqz v5, :cond_c

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_b

    goto :goto_5

    :cond_b
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, LK/d;->a(Ljava/lang/Object;)V

    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "No instantiated fragment for ("

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_c
    :goto_5
    iget-object v4, v1, Landroidx/fragment/app/q;->c:[Landroidx/fragment/app/b;

    if-eqz v4, :cond_14

    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, v1, Landroidx/fragment/app/q;->c:[Landroidx/fragment/app/b;

    array-length v5, v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v4, v2, Landroidx/fragment/app/p;->d:Ljava/util/ArrayList;

    const/4 v4, 0x0

    :goto_6
    iget-object v5, v1, Landroidx/fragment/app/q;->c:[Landroidx/fragment/app/b;

    array-length v6, v5

    if-ge v4, v6, :cond_13

    aget-object v5, v5, v4

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Landroidx/fragment/app/a;

    invoke-direct {v6, v2}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/p;)V

    const/4 v7, 0x0

    const/4 v9, 0x0

    :goto_7
    iget-object v10, v5, Landroidx/fragment/app/b;->a:[I

    array-length v11, v10

    const/4 v13, 0x1

    const-string v14, "FragmentManager"

    if-ge v7, v11, :cond_f

    new-instance v11, Landroidx/fragment/app/t;

    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    add-int/lit8 v15, v7, 0x1

    const/16 v16, 0x2

    aget v12, v10, v7

    iput v12, v11, Landroidx/fragment/app/t;->a:I

    invoke-static/range {v16 .. v16}, Landroidx/fragment/app/p;->h(I)Z

    move-result v12

    if-eqz v12, :cond_d

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v8, "Instantiate "

    invoke-direct {v12, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v8, " op #"

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, " base fragment #"

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v8, v10, v15

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v14, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_d
    invoke-static {}, Landroidx/lifecycle/l;->values()[Landroidx/lifecycle/l;

    move-result-object v8

    iget-object v12, v5, Landroidx/fragment/app/b;->c:[I

    aget v12, v12, v9

    aget-object v8, v8, v12

    iput-object v8, v11, Landroidx/fragment/app/t;->g:Landroidx/lifecycle/l;

    invoke-static {}, Landroidx/lifecycle/l;->values()[Landroidx/lifecycle/l;

    move-result-object v8

    iget-object v12, v5, Landroidx/fragment/app/b;->d:[I

    aget v12, v12, v9

    aget-object v8, v8, v12

    iput-object v8, v11, Landroidx/fragment/app/t;->h:Landroidx/lifecycle/l;

    add-int/lit8 v8, v7, 0x2

    aget v12, v10, v15

    if-eqz v12, :cond_e

    goto :goto_8

    :cond_e
    const/4 v13, 0x0

    :goto_8
    iput-boolean v13, v11, Landroidx/fragment/app/t;->b:Z

    add-int/lit8 v12, v7, 0x3

    aget v8, v10, v8

    iput v8, v11, Landroidx/fragment/app/t;->c:I

    add-int/lit8 v13, v7, 0x4

    aget v12, v10, v12

    iput v12, v11, Landroidx/fragment/app/t;->d:I

    add-int/lit8 v14, v7, 0x5

    aget v13, v10, v13

    iput v13, v11, Landroidx/fragment/app/t;->e:I

    add-int/lit8 v7, v7, 0x6

    aget v10, v10, v14

    iput v10, v11, Landroidx/fragment/app/t;->f:I

    iput v8, v6, Landroidx/fragment/app/a;->b:I

    iput v12, v6, Landroidx/fragment/app/a;->c:I

    iput v13, v6, Landroidx/fragment/app/a;->d:I

    iput v10, v6, Landroidx/fragment/app/a;->e:I

    iget-object v8, v6, Landroidx/fragment/app/a;->a:Ljava/util/ArrayList;

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget v8, v6, Landroidx/fragment/app/a;->b:I

    iput v8, v11, Landroidx/fragment/app/t;->c:I

    iget v8, v6, Landroidx/fragment/app/a;->c:I

    iput v8, v11, Landroidx/fragment/app/t;->d:I

    iget v8, v6, Landroidx/fragment/app/a;->d:I

    iput v8, v11, Landroidx/fragment/app/t;->e:I

    iget v8, v6, Landroidx/fragment/app/a;->e:I

    iput v8, v11, Landroidx/fragment/app/t;->f:I

    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_7

    :cond_f
    const/16 v16, 0x2

    iget v7, v5, Landroidx/fragment/app/b;->e:I

    iput v7, v6, Landroidx/fragment/app/a;->f:I

    iget-object v7, v5, Landroidx/fragment/app/b;->f:Ljava/lang/String;

    iput-object v7, v6, Landroidx/fragment/app/a;->h:Ljava/lang/String;

    iput-boolean v13, v6, Landroidx/fragment/app/a;->g:Z

    iget v7, v5, Landroidx/fragment/app/b;->h:I

    iput v7, v6, Landroidx/fragment/app/a;->i:I

    iget-object v7, v5, Landroidx/fragment/app/b;->i:Ljava/lang/CharSequence;

    iput-object v7, v6, Landroidx/fragment/app/a;->j:Ljava/lang/CharSequence;

    iget v7, v5, Landroidx/fragment/app/b;->j:I

    iput v7, v6, Landroidx/fragment/app/a;->k:I

    iget-object v7, v5, Landroidx/fragment/app/b;->k:Ljava/lang/CharSequence;

    iput-object v7, v6, Landroidx/fragment/app/a;->l:Ljava/lang/CharSequence;

    iget-object v7, v5, Landroidx/fragment/app/b;->l:Ljava/util/ArrayList;

    iput-object v7, v6, Landroidx/fragment/app/a;->m:Ljava/util/ArrayList;

    iget-object v7, v5, Landroidx/fragment/app/b;->m:Ljava/util/ArrayList;

    iput-object v7, v6, Landroidx/fragment/app/a;->n:Ljava/util/ArrayList;

    iget-boolean v7, v5, Landroidx/fragment/app/b;->n:Z

    iput-boolean v7, v6, Landroidx/fragment/app/a;->o:Z

    iget v7, v5, Landroidx/fragment/app/b;->g:I

    iput v7, v6, Landroidx/fragment/app/a;->q:I

    const/4 v7, 0x0

    :goto_9
    iget-object v8, v5, Landroidx/fragment/app/b;->b:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v7, v9, :cond_11

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    if-eqz v8, :cond_10

    iget-object v9, v6, Landroidx/fragment/app/a;->a:Ljava/util/ArrayList;

    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/fragment/app/t;

    iget-object v10, v3, LQ/t;->a:Ljava/lang/Object;

    check-cast v10, Ljava/util/HashMap;

    invoke-virtual {v10, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, LK/d;->a(Ljava/lang/Object;)V

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_10
    add-int/lit8 v7, v7, 0x1

    goto :goto_9

    :cond_11
    invoke-virtual {v6, v13}, Landroidx/fragment/app/a;->a(I)V

    invoke-static/range {v16 .. v16}, Landroidx/fragment/app/p;->h(I)Z

    move-result v5

    if-eqz v5, :cond_12

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "restoreAllState: back stack #"

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " (index "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, v6, Landroidx/fragment/app/a;->q:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "): "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v14, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Landroidx/fragment/app/u;

    invoke-direct {v5}, Landroidx/fragment/app/u;-><init>()V

    new-instance v7, Ljava/io/PrintWriter;

    invoke-direct {v7, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    const-string v5, "  "

    const/4 v8, 0x0

    invoke-virtual {v6, v5, v7, v8}, Landroidx/fragment/app/a;->b(Ljava/lang/String;Ljava/io/PrintWriter;Z)V

    invoke-virtual {v7}, Ljava/io/PrintWriter;->close()V

    goto :goto_a

    :cond_12
    const/4 v8, 0x0

    :goto_a
    iget-object v5, v2, Landroidx/fragment/app/p;->d:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_6

    :cond_13
    const/4 v8, 0x0

    goto :goto_b

    :cond_14
    const/4 v8, 0x0

    iput-object v10, v2, Landroidx/fragment/app/p;->d:Ljava/util/ArrayList;

    :goto_b
    iget-object v4, v2, Landroidx/fragment/app/p;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    iget v5, v1, Landroidx/fragment/app/q;->d:I

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object v4, v1, Landroidx/fragment/app/q;->e:Ljava/lang/String;

    if-eqz v4, :cond_15

    iget-object v3, v3, LQ/t;->a:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashMap;

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, LK/d;->a(Ljava/lang/Object;)V

    :cond_15
    iget-object v3, v1, Landroidx/fragment/app/q;->f:Ljava/util/ArrayList;

    if-eqz v3, :cond_16

    :goto_c
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v8, v4, :cond_16

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, v1, Landroidx/fragment/app/q;->g:Ljava/util/ArrayList;

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/fragment/app/c;

    iget-object v6, v2, Landroidx/fragment/app/p;->i:Ljava/util/Map;

    invoke-interface {v6, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v8, v8, 0x1

    goto :goto_c

    :cond_16
    new-instance v3, Ljava/util/ArrayDeque;

    iget-object v1, v1, Landroidx/fragment/app/q;->h:Ljava/util/ArrayList;

    invoke-direct {v3, v1}, Ljava/util/ArrayDeque;-><init>(Ljava/util/Collection;)V

    iput-object v3, v2, Landroidx/fragment/app/p;->x:Ljava/util/ArrayDeque;

    goto :goto_d

    :cond_17
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/lang/ClassCastException;

    invoke-direct {v1}, Ljava/lang/ClassCastException;-><init>()V

    throw v1

    :cond_18
    :goto_d
    iget-object v1, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    if-eqz v1, :cond_19

    iget-object v1, v1, Landroidx/fragment/app/f;->d:Le/i;

    new-instance v3, Landroidx/fragment/app/n;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Landroidx/fragment/app/n;-><init>(I)V

    new-instance v4, Landroidx/fragment/app/j;

    const/4 v5, 0x1

    invoke-direct {v4, v2, v5}, Landroidx/fragment/app/j;-><init>(Landroidx/fragment/app/p;I)V

    const-string v5, "FragmentManager:StartActivityForResult"

    iget-object v1, v1, Landroidx/activity/l;->j:Landroidx/activity/h;

    invoke-virtual {v1, v5, v3, v4}, Landroidx/activity/h;->b(Ljava/lang/String;LD/g;Landroidx/fragment/app/j;)LG/a;

    move-result-object v3

    iput-object v3, v2, Landroidx/fragment/app/p;->u:LG/a;

    new-instance v3, Landroidx/fragment/app/n;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Landroidx/fragment/app/n;-><init>(I)V

    new-instance v4, Landroidx/fragment/app/j;

    const/4 v5, 0x2

    invoke-direct {v4, v2, v5}, Landroidx/fragment/app/j;-><init>(Landroidx/fragment/app/p;I)V

    const-string v5, "FragmentManager:StartIntentSenderForResult"

    invoke-virtual {v1, v5, v3, v4}, Landroidx/activity/h;->b(Ljava/lang/String;LD/g;Landroidx/fragment/app/j;)LG/a;

    move-result-object v3

    iput-object v3, v2, Landroidx/fragment/app/p;->v:LG/a;

    new-instance v3, Landroidx/fragment/app/n;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Landroidx/fragment/app/n;-><init>(I)V

    new-instance v4, Landroidx/fragment/app/j;

    const/4 v5, 0x0

    invoke-direct {v4, v2, v5}, Landroidx/fragment/app/j;-><init>(Landroidx/fragment/app/p;I)V

    const-string v5, "FragmentManager:RequestPermissions"

    invoke-virtual {v1, v5, v3, v4}, Landroidx/activity/h;->b(Ljava/lang/String;LD/g;Landroidx/fragment/app/j;)LG/a;

    move-result-object v1

    iput-object v1, v2, Landroidx/fragment/app/p;->w:LG/a;

    :cond_19
    iget-object v1, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    if-eqz v1, :cond_1a

    iget-object v1, v1, Landroidx/fragment/app/f;->d:Le/i;

    iget-object v1, v1, Landroidx/activity/l;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-object v3, v2, Landroidx/fragment/app/p;->l:Landroidx/fragment/app/i;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    :cond_1a
    iget-object v1, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    if-eqz v1, :cond_1b

    iget-object v1, v1, Landroidx/fragment/app/f;->d:Le/i;

    iget-object v1, v1, Landroidx/activity/l;->l:Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-object v3, v2, Landroidx/fragment/app/p;->m:Landroidx/fragment/app/i;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    :cond_1b
    iget-object v1, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    if-eqz v1, :cond_1c

    iget-object v1, v1, Landroidx/fragment/app/f;->d:Le/i;

    iget-object v1, v1, Landroidx/activity/l;->n:Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-object v3, v2, Landroidx/fragment/app/p;->n:Landroidx/fragment/app/i;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    :cond_1c
    iget-object v1, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    if-eqz v1, :cond_1d

    iget-object v1, v1, Landroidx/fragment/app/f;->d:Le/i;

    iget-object v1, v1, Landroidx/activity/l;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-object v3, v2, Landroidx/fragment/app/p;->o:Landroidx/fragment/app/i;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    :cond_1d
    iget-object v1, v2, Landroidx/fragment/app/p;->r:Landroidx/fragment/app/f;

    if-eqz v1, :cond_1e

    iget-object v1, v1, Landroidx/fragment/app/f;->d:Le/i;

    iget-object v1, v1, Landroidx/activity/l;->c:LC/h;

    iget-object v3, v1, LC/h;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-object v2, v2, Landroidx/fragment/app/p;->p:Landroidx/fragment/app/l;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, v1, LC/h;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    :cond_1e
    return-void

    :cond_1f
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Already attached"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_0
    iget-object v1, v0, Landroidx/activity/g;->b:Le/i;

    iget-object v2, v1, Landroidx/activity/l;->e:LL/f;

    iget-object v2, v2, LL/f;->c:Ljava/lang/Object;

    check-cast v2, LL/e;

    const-string v3, "android:support:activity-result"

    invoke-virtual {v2, v3}, LL/e;->c(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_22

    iget-object v1, v1, Landroidx/activity/l;->j:Landroidx/activity/h;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "KEY_COMPONENT_ACTIVITY_REGISTERED_RCS"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    const-string v4, "KEY_COMPONENT_ACTIVITY_REGISTERED_KEYS"

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    if-eqz v4, :cond_22

    if-nez v3, :cond_20

    goto :goto_f

    :cond_20
    const-string v5, "KEY_COMPONENT_ACTIVITY_LAUNCHED_KEYS"

    invoke-virtual {v2, v5}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    iput-object v5, v1, Landroidx/activity/h;->d:Ljava/util/ArrayList;

    const-string v5, "KEY_COMPONENT_ACTIVITY_PENDING_RESULT"

    invoke-virtual {v2, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    iget-object v5, v1, Landroidx/activity/h;->g:Landroid/os/Bundle;

    invoke-virtual {v5, v2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    const/4 v2, 0x0

    :goto_e
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_22

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iget-object v7, v1, Landroidx/activity/h;->b:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    iget-object v9, v1, Landroidx/activity/h;->a:Ljava/util/HashMap;

    if-eqz v8, :cond_21

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v5, v6}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_21

    invoke-virtual {v9, v8}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_21
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v7, v8, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    :cond_22
    :goto_f
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
