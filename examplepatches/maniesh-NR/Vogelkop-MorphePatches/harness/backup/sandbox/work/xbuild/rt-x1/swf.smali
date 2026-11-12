.class public final Lswf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lni6;

.field public final b:Lx5f;

.field public final c:Lbf9;

.field public final d:Lcom/opera/android/settings/SettingsManager;

.field public e:Ljava/util/ArrayList;

.field public final f:Ljava/util/HashSet;

.field public final g:Li7f;


# direct methods
.method public constructor <init>(Lni6;Lx5f;Lbf9;Lcom/opera/android/settings/SettingsManager;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Lswf;->a:Lni6;

    iput-object v2, v0, Lswf;->b:Lx5f;

    move-object/from16 v4, p3

    iput-object v4, v0, Lswf;->c:Lbf9;

    iput-object v3, v0, Lswf;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4}, Lbf9;->t()Z

    move-result v5

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-eqz v5, :cond_2e

    invoke-virtual {v4}, Lbf9;->r()I

    move-result v4

    if-lt v4, v6, :cond_2e

    const-string v4, "my_flow_visible"

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2e

    move v3, v8

    goto :goto_2f

    :cond_2e
    move v3, v7

    :goto_2f
    invoke-static {v3}, Lwxe;->C(Z)Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, v0, Lswf;->e:Ljava/util/ArrayList;

    sget-object v3, Lqwf;->o:Lqwf;

    filled-new-array {v3}, [Lqwf;

    move-result-object v3

    new-instance v4, Ljava/util/HashSet;

    invoke-static {v8}, Lqbd;->a(I)I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/HashSet;-><init>(I)V

    invoke-static {v3, v4}, Le82;->A([Ljava/lang/Object;Ljava/util/AbstractSet;)V

    iput-object v4, v0, Lswf;->f:Ljava/util/HashSet;

    new-instance v3, Li7f;

    invoke-direct {v3}, Li7f;-><init>()V

    iput-object v3, v0, Lswf;->g:Li7f;

    iget-object v3, v1, Lni6;->a:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    const-string v5, ""

    const-string v9, "order"

    invoke-interface {v4, v9, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_68

    :goto_66
    const/4 v3, 0x0

    goto :goto_d1

    :cond_68
    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/util/ArrayList;

    array-length v11, v4

    invoke-direct {v5, v11}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    :try_start_79
    array-length v12, v4

    :goto_7a
    if-ge v7, v12, :cond_c1

    aget-object v13, v4, v7

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Math;->abs(I)I

    move-result v14

    invoke-static {}, Lqwf;->values()[Lqwf;

    move-result-object v15

    invoke-static {v15}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_95
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_a8

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v10, v16

    check-cast v10, Lqwf;

    iget-byte v10, v10, Lqwf;->b:B

    if-ne v10, v14, :cond_95

    goto :goto_aa

    :cond_a8
    const/16 v16, 0x0

    :goto_aa
    move-object/from16 v10, v16

    check-cast v10, Lqwf;

    if-eqz v10, :cond_be

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-gez v13, :cond_be

    invoke-static {v10}, Lqwf;->k(Lqwf;)Z

    move-result v13

    if-eqz v13, :cond_be

    invoke-virtual {v11, v10}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_be
    .catch Ljava/lang/NumberFormatException; {:try_start_79 .. :try_end_be} :catch_c7

    :cond_be
    add-int/lit8 v7, v7, 0x1

    goto :goto_7a

    :cond_c1
    new-instance v3, Lyqa;

    invoke-direct {v3, v5, v11}, Lyqa;-><init>(Ljava/util/ArrayList;Ljava/util/HashSet;)V

    goto :goto_d1

    :catch_c7
    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    invoke-static {v3, v9}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    goto :goto_66

    :goto_d1
    sget-object v4, Luk0;->b:Luk0;

    if-eqz v3, :cond_123

    iget-object v5, v0, Lswf;->f:Ljava/util/HashSet;

    iget-object v3, v3, Lyqa;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/Set;

    check-cast v3, Ljava/lang/Iterable;

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_e6
    :goto_e6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_ff

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v10, v9

    check-cast v10, Lqwf;

    iget-object v11, v0, Lswf;->e:Ljava/util/ArrayList;

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_e6

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e6

    :cond_ff
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_107

    move-object v10, v7

    goto :goto_108

    :cond_107
    const/4 v10, 0x0

    :goto_108
    if-nez v10, :cond_10e

    invoke-virtual {v0}, Lswf;->a()Ljava/util/ArrayList;

    move-result-object v10

    :cond_10e
    invoke-virtual {v5}, Ljava/util/HashSet;->clear()V

    invoke-interface {v5, v10}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object v3, v0, Lswf;->e:Ljava/util/ArrayList;

    invoke-virtual {v1, v3, v10}, Lni6;->c(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {v0}, Lswf;->b()Z

    move-result v1

    if-nez v1, :cond_126

    invoke-virtual {v2, v4}, Lx5f;->E0(Luk0;)V

    goto :goto_126

    :cond_123
    invoke-virtual {v2, v4}, Lx5f;->E0(Luk0;)V

    :cond_126
    :goto_126
    new-instance v1, Lhw9;

    invoke-direct {v1, v0, v8}, Lhw9;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v0, Lswf;->g:Li7f;

    invoke-virtual {v2, v1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object v1, v0, Lswf;->c:Lbf9;

    new-instance v2, Lj99;

    invoke-direct {v2, v0, v6}, Lj99;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lbf9;->b(Lhxl;)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/ArrayList;
    .registers 8

    iget-object v0, p0, Lswf;->e:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :cond_c
    :goto_c
    if-ge v3, v2, :cond_23

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    move-object v5, v4

    check-cast v5, Lqwf;

    iget-object v6, p0, Lswf;->f:Ljava/util/HashSet;

    invoke-virtual {v6, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_c

    :cond_23
    return-object v1
.end method

.method public final b()Z
    .registers 9

    invoke-virtual {p0}, Lswf;->a()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_5d

    sget-object v0, Lqhj;->e:Lr16;

    invoke-virtual {p0}, Lswf;->a()Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqwf;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lqhj;->values()[Lqhj;

    move-result-object v0

    array-length v3, v0

    invoke-static {v3}, Lqbd;->a(I)I

    move-result v3

    const/16 v4, 0x10

    if-ge v3, v4, :cond_28

    move v3, v4

    :cond_28
    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    array-length v3, v0

    move v5, v1

    :goto_2f
    if-ge v5, v3, :cond_3b

    aget-object v6, v0, v5

    iget-object v7, v6, Lqhj;->a:Lqwf;

    invoke-interface {v4, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    :cond_3b
    invoke-interface {v4, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5d

    sget-object v0, Lqhj;->e:Lr16;

    invoke-virtual {p0}, Lswf;->a()Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqwf;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lr16;->p(Lqwf;)Lqhj;

    move-result-object v0

    iget-object v0, v0, Lqhj;->d:Luk0;

    iget-object p0, p0, Lswf;->b:Lx5f;

    invoke-virtual {p0, v0}, Lx5f;->E0(Luk0;)V

    const/4 p0, 0x1

    return p0

    :cond_5d
    return v1
.end method
