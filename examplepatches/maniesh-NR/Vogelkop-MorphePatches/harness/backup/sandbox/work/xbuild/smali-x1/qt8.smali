.class public final Lqt8;
.super Lcom/opera/android/suggestion/SuggestionProviderBridge;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Llrk;Llrk;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lqt8;->d:B

    .line 32
    new-instance v1, Ld06;

    const/16 v2, 0x12

    invoke-direct {v1, v2}, Ld06;-><init>(B)V

    .line 33
    invoke-direct {p0, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    .line 34
    iput-object p1, p0, Lqt8;->e:Ljava/lang/Object;

    .line 35
    iput-object p2, p0, Lqt8;->f:Ljava/lang/Object;

    .line 36
    iput-object p3, p0, Lqt8;->g:Ljava/lang/Object;

    .line 37
    iput-object v1, p0, Lqt8;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lwcd;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lqt8;->d:B

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    new-instance v0, Lvdf;

    const/16 v1, 0xd

    invoke-direct {v0, p0, v1}, Lvdf;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lqt8;->h:Ljava/lang/Object;

    iput-object p2, p0, Lqt8;->e:Ljava/lang/Object;

    new-instance p2, Lro9;

    invoke-static {p1}, Lnr8;->e(Landroid/content/Context;)I

    move-result p1

    const/16 v0, 0x19

    invoke-direct {p2, v0, p1}, Lro9;-><init>(BI)V

    iput-object p2, p0, Lqt8;->g:Ljava/lang/Object;

    return-void
.end method

.method private final h()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 2

    iget-byte v0, p0, Lqt8;->d:B

    packed-switch v0, :pswitch_data_e

    iget-object p0, p0, Lqt8;->g:Ljava/lang/Object;

    check-cast p0, Lro9;

    const/4 v0, 0x0

    iput-object v0, p0, Lro9;->d:Ljava/lang/Object;

    :pswitch_c
    return-void

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final g(Ljava/lang/String;ZZLyv4;)V
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    iget-byte v3, v0, Lqt8;->d:B

    const/4 v4, 0x0

    iget-object v5, v0, Lqt8;->g:Ljava/lang/Object;

    iget-object v6, v0, Lqt8;->e:Ljava/lang/Object;

    iget-object v7, v0, Lqt8;->h:Ljava/lang/Object;

    const/4 v8, 0x0

    packed-switch v3, :pswitch_data_26e

    check-cast v7, Lvdf;

    check-cast v6, Lwcd;

    iget-object v3, v6, Lwcd;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v9, "enable_suggested_speed_dials"

    invoke-virtual {v3, v9}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c7

    iget-object v3, v6, Lwcd;->c:Lew3;

    invoke-virtual {v3}, Lew3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_c7

    if-nez p3, :cond_c7

    sget-object v3, Lvcd;->b:Lvcd;

    invoke-virtual {v6, v1, v3}, Lwcd;->a(Ljava/lang/String;Lvcd;)Ll2g;

    move-result-object v1

    if-nez v1, :cond_40

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {v2, v0}, Lyv4;->d(Ljava/util/List;)V

    goto/16 :goto_cc

    :cond_40
    iput-object v2, v0, Lqt8;->f:Ljava/lang/Object;

    invoke-static {v7}, Lvml;->a(Ljava/lang/Runnable;)V

    const-wide/16 v2, 0x1f4

    invoke-static {v7, v2, v3}, Lvml;->d(Ljava/lang/Runnable;J)V

    check-cast v5, Lro9;

    new-instance v2, Leof;

    const/4 v3, 0x2

    invoke-direct {v2, v0, v1, v3}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v5, Lro9;->c:Ljava/lang/Object;

    check-cast v0, Lw6j;

    const/16 v3, 0x13

    if-eqz v0, :cond_9f

    iget v6, v1, Ll2g;->a:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->size()I

    move-result v7

    iget-object v0, v0, Lw6j;->a:Ljava/lang/Object;

    check-cast v0, Lh1b;

    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    move-result v9

    if-eq v7, v9, :cond_74

    move v0, v8

    goto :goto_8f

    :cond_74
    invoke-interface {v0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v7, Lmn;

    invoke-direct {v7, v3}, Lmn;-><init>(B)V

    invoke-interface {v0, v7}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object v0

    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v6, v0}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    :goto_8f
    if-eqz v0, :cond_94

    iput-object v2, v5, Lro9;->d:Ljava/lang/Object;

    goto :goto_cc

    :cond_94
    iput-object v4, v5, Lro9;->d:Ljava/lang/Object;

    iget-object v0, v5, Lro9;->c:Ljava/lang/Object;

    check-cast v0, Lw6j;

    if-eqz v0, :cond_9f

    invoke-virtual {v0}, Lw6j;->b()V

    :cond_9f
    iput-object v2, v5, Lro9;->d:Ljava/lang/Object;

    new-instance v9, Lw6j;

    iget v10, v5, Lro9;->b:I

    new-instance v0, Lw2g;

    invoke-direct {v0, v1, v8}, Lw2g;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lo8f;

    const/4 v2, 0x6

    invoke-direct {v1, v5, v2}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object v11

    new-instance v14, Leof;

    invoke-direct {v14, v1, v0, v3}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-wide/16 v12, 0x1388

    invoke-direct/range {v9 .. v14}, Lw6j;-><init>(ILh1b;JLcom/opera/api/Callback;)V

    iget-object v0, v5, Lro9;->d:Ljava/lang/Object;

    check-cast v0, Leof;

    if-eqz v0, :cond_cc

    iput-object v9, v5, Lro9;->c:Ljava/lang/Object;

    goto :goto_cc

    :cond_c7
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {v2, v0}, Lyv4;->d(Ljava/util/List;)V

    :cond_cc
    :goto_cc
    return-void

    :pswitch_cd
    check-cast v6, Landroid/content/Context;

    check-cast v7, Ld06;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Ln6h;->h(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v3

    if-nez v3, :cond_e7

    invoke-static {v1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    goto :goto_eb

    :cond_e7
    invoke-static {v1, v3}, Ln6h;->q(Ljava/lang/String;Ljava/util/Locale;)Lehc;

    move-result-object v3

    :goto_eb
    iget-object v7, v7, Ld06;->a:Ljava/lang/Object;

    check-cast v7, Lh58;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_f3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_203

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v10, v9

    check-cast v10, Lnt8;

    iget-object v10, v10, Lnt8;->f:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_1f8

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v11

    move v12, v8

    :goto_10d
    if-ge v12, v11, :cond_1f8

    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    add-int/lit8 v12, v12, 0x1

    check-cast v13, Ljava/util/List;

    move-object v14, v3

    check-cast v14, Ljava/lang/Iterable;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v15

    const/4 v8, 0x1

    invoke-static {v15, v8}, Ldgh;->f(II)V

    instance-of v8, v14, Ljava/util/RandomAccess;

    if-eqz v8, :cond_16e

    instance-of v8, v14, Ljava/util/List;

    if-eqz v8, :cond_16e

    check-cast v14, Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v8

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v8}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    :goto_136
    if-ltz v1, :cond_169

    if-ge v1, v8, :cond_169

    move/from16 v18, v1

    sub-int v1, v8, v18

    if-gt v15, v1, :cond_141

    move v1, v15

    :cond_141
    if-lt v1, v15, :cond_169

    move-object/from16 v19, v3

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v20, v5

    const/4 v5, 0x0

    :goto_14d
    if-ge v5, v1, :cond_15f

    move/from16 v21, v1

    add-int v1, v5, v18

    invoke-interface {v14, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    move/from16 v1, v21

    goto :goto_14d

    :cond_15f
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v18, 0x1

    move-object/from16 v3, v19

    move-object/from16 v5, v20

    goto :goto_136

    :cond_169
    move-object/from16 v19, v3

    move-object/from16 v20, v5

    goto :goto_19e

    :cond_16e
    move-object/from16 v19, v3

    move-object/from16 v20, v5

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_184

    sget-object v1, Lk08;->a:Lk08;

    goto :goto_18e

    :cond_184
    new-instance v3, Leqj;

    const/4 v5, 0x0

    invoke-direct {v3, v15, v1, v5}, Leqj;-><init>(ILjava/util/Iterator;Lmt5;)V

    invoke-static {v3}, Lt1j;->a(Lkotlin/jvm/functions/Function2;)Lk1j;

    move-result-object v1

    :goto_18e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_19e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18e

    :cond_19e
    :goto_19e
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1f2

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x0

    :goto_1a9
    if-ge v3, v1, :cond_1f2

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v3, v3, 0x1

    check-cast v8, Ljava/util/List;

    check-cast v8, Ljava/lang/Iterable;

    move-object v14, v13

    check-cast v14, Ljava/lang/Iterable;

    invoke-static {v8, v14}, Lkotlin/collections/CollectionsKt;->o0(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_1f0

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v14

    const/4 v15, 0x0

    :goto_1c7
    if-ge v15, v14, :cond_1f0

    invoke-virtual {v8, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v5, v17

    check-cast v5, Lkotlin/Pair;

    move/from16 v17, v1

    iget-object v1, v5, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v5, v5, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    move/from16 v21, v3

    const/4 v3, 0x1

    invoke-static {v1, v5, v3}, Lkotlin/text/c;->m(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_1eb

    move/from16 v1, v17

    move/from16 v3, v21

    goto :goto_1a9

    :cond_1eb
    move/from16 v1, v17

    move/from16 v3, v21

    goto :goto_1c7

    :cond_1f0
    move-object v4, v9

    goto :goto_206

    :cond_1f2
    move-object/from16 v3, v19

    move-object/from16 v5, v20

    goto/16 :goto_10d

    :cond_1f8
    move-object/from16 v19, v3

    move-object/from16 v20, v5

    move-object/from16 v3, v19

    move-object/from16 v5, v20

    const/4 v8, 0x0

    goto/16 :goto_f3

    :cond_203
    move-object/from16 v20, v5

    const/4 v4, 0x0

    :goto_206
    check-cast v4, Lnt8;

    if-nez p3, :cond_268

    if-eqz v4, :cond_268

    invoke-static/range {p1 .. p1}, Lwqm;->x(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_268

    iget-object v0, v0, Lqt8;->f:Ljava/lang/Object;

    check-cast v0, Llrk;

    invoke-virtual {v0, v4}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_268

    move-object/from16 v5, v20

    check-cast v5, Llrk;

    invoke-virtual {v5, v4}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpt8;

    iget v1, v4, Lnt8;->d:I

    invoke-virtual {v6, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    if-eqz v0, :cond_23a

    iget-object v1, v0, Lpt8;->a:Ljava/lang/String;

    if-eqz v1, :cond_23a

    :goto_238
    move-object v10, v1

    goto :goto_241

    :cond_23a
    iget v1, v4, Lnt8;->e:I

    invoke-virtual {v6, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_238

    :goto_241
    if-eqz v0, :cond_249

    iget-object v0, v0, Lpt8;->b:Ljava/lang/String;

    if-eqz v0, :cond_249

    :goto_247
    move-object v11, v0

    goto :goto_24c

    :cond_249
    iget-object v0, v4, Lnt8;->c:Ljava/lang/String;

    goto :goto_247

    :goto_24c
    new-instance v7, Lcom/opera/android/suggestion/Suggestion;

    const/16 v8, 0x22

    const/4 v12, 0x0

    const/4 v13, 0x0

    const v14, 0x7fffffff

    const-string v15, ""

    const/16 v16, 0x0

    const/16 v17, -0x1

    move-object/from16 v18, v4

    invoke-direct/range {v7 .. v18}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    invoke-static {v7}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v2, v0}, Lyv4;->d(Ljava/util/List;)V

    goto :goto_26d

    :cond_268
    sget-object v0, Ll08;->a:Ll08;

    invoke-virtual {v2, v0}, Lyv4;->d(Ljava/util/List;)V

    :goto_26d
    return-void

    :pswitch_data_26e
    .packed-switch 0x0
        :pswitch_cd
    .end packed-switch
.end method
