.class public final synthetic Lq3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 12
    iput-byte p3, p0, Lq3;->a:B

    iput-object p1, p0, Lq3;->b:Ljava/lang/Object;

    iput-object p2, p0, Lq3;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lyo7;Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    const/16 p3, 0x1b

    iput-byte p3, p0, Lq3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lq3;->b:Ljava/lang/Object;

    iput-object p2, p0, Lq3;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lq3;->a:B

    const/4 v2, 0x2

    const/4 v3, 0x3

    const-string v4, "application/vnd.opera.x-page-context"

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    iget-object v8, v0, Lq3;->c:Ljava/lang/Object;

    iget-object v0, v0, Lq3;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_480

    check-cast v0, Lmu2;

    check-cast v8, Lw3g;

    move-object/from16 v1, p1

    check-cast v1, Lpkj;

    sget-object v2, Lpkj;->a:Lpkj;

    if-ne v1, v2, :cond_3d

    iget-object v1, v0, Lmu2;->f:La4g;

    if-eqz v1, :cond_23

    move-object v7, v1

    :cond_23
    iget-object v1, v7, La4g;->a:Ljava/util/List;

    invoke-static {v1, v8}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result v2

    iget-wide v3, v7, La4g;->b:J

    invoke-static {v3, v4, v2}, LJ/N;->MvKxovNE(JI)V

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget-object v0, v0, Lmu2;->b:Lgjm;

    new-instance v1, Lj8n;

    iget v2, v8, Lw3g;->a:I

    invoke-direct {v1, v2}, Lj8n;-><init>(I)V

    invoke-virtual {v0, v1}, Lgjm;->b(Ln37;)Z

    :cond_3d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_40
    check-cast v0, Lts2;

    check-cast v8, Lru2;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lts2;->d:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :cond_51
    :goto_51
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6d

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpu2;

    iget v2, v8, Lru2;->a:I

    iget-object v1, v1, Lpu2;->a:Lcom/opera/android/browser/autofill/AutofillPopupView;

    iget-wide v3, v1, Lcom/opera/android/browser/autofill/AutofillPopupView;->a:J

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-eqz v1, :cond_51

    invoke-static {v3, v4, v2}, LJ/N;->ME6ZBAzG(JI)V

    goto :goto_51

    :cond_6d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_70
    check-cast v0, Lyo7;

    check-cast v8, Ljava/util/HashSet;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {v1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    if-nez v2, :cond_a6

    check-cast v1, Lkotlin/Pair;

    iget-object v2, v1, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v2, Ls0o;

    iget-object v1, v1, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    if-eqz v2, :cond_92

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ab

    :cond_92
    if-eqz v1, :cond_a0

    invoke-interface {v1, v8}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v1

    if-ne v1, v5, :cond_a0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ab

    :cond_a0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ab

    :cond_a6
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_ab
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ae
    check-cast v0, Lob2;

    check-cast v8, Ls0o;

    move-object/from16 v1, p1

    check-cast v1, Losk;

    iget-object v0, v0, Lob2;->c:Lnb2;

    invoke-virtual {v0, v1, v8}, Lkfo;->Q(Losk;Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_be
    check-cast v0, Lob2;

    check-cast v8, Ljava/util/ArrayList;

    move-object/from16 v1, p1

    check-cast v1, Losk;

    iget-object v0, v0, Lob2;->b:Lnb2;

    invoke-virtual {v0, v1, v8}, Lkfo;->P(Losk;Ljava/lang/Iterable;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ce
    check-cast v0, Ls22;

    check-cast v8, Ljava/util/List;

    move-object/from16 v15, p1

    check-cast v15, Ljava/lang/String;

    if-eqz v15, :cond_120

    check-cast v8, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v8, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_e9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_11c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc52;

    instance-of v5, v3, Le52;

    if-eqz v5, :cond_118

    move-object v5, v3

    check-cast v5, Le52;

    iget-object v6, v5, Le52;->e:Ljava/lang/String;

    invoke-static {v6, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_118

    iget-object v6, v5, Le52;->g:Ljava/lang/String;

    if-nez v6, :cond_118

    iget-object v10, v5, Le52;->b:Ljava/lang/String;

    iget-object v11, v5, Le52;->c:Ljava/lang/String;

    iget-object v12, v5, Le52;->d:Ljava/lang/String;

    iget-object v13, v5, Le52;->e:Ljava/lang/String;

    iget-object v14, v5, Le52;->f:Ljava/lang/String;

    new-instance v9, Le52;

    invoke-direct/range {v9 .. v15}, Le52;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v3, v9

    :cond_118
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e9

    :cond_11c
    invoke-virtual {v0, v1}, Ls22;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_123

    :cond_120
    invoke-virtual {v0, v8}, Ls22;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_123
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_126
    move-object v1, v0

    check-cast v1, Lm02;

    check-cast v8, Ls22;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_172

    :try_start_131
    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v0

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    :goto_140
    if-ge v6, v3, :cond_157

    new-instance v5, Lorb;

    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-direct {v5, v7}, Lorb;-><init>(Lorg/json/JSONObject;)V

    invoke-static {v5}, Lmkh;->E(Lorb;)Lc52;

    move-result-object v5

    if-eqz v5, :cond_154

    invoke-virtual {v0, v5}, Lehc;->add(Ljava/lang/Object;)Z

    :cond_154
    add-int/lit8 v6, v6, 0x1

    goto :goto_140

    :cond_157
    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v0
    :try_end_15b
    .catchall {:try_start_131 .. :try_end_15b} :catchall_15c

    goto :goto_165

    :catchall_15c
    move-exception v0

    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Lq0i;

    invoke-direct {v2, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v2

    :goto_165
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    if-nez v2, :cond_16e

    check-cast v0, Ljava/util/List;

    goto :goto_170

    :cond_16e
    sget-object v0, Ll08;->a:Ll08;

    :goto_170
    if-nez v0, :cond_174

    :cond_172
    sget-object v0, Ll08;->a:Ll08;

    :cond_174
    move-object v2, v0

    check-cast v2, Ljava/lang/Iterable;

    instance-of v3, v2, Ljava/util/Collection;

    if-eqz v3, :cond_184

    move-object v3, v2

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1af

    :cond_184
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_188
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1af

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc52;

    instance-of v5, v3, Le52;

    if-eqz v5, :cond_188

    check-cast v3, Le52;

    iget-object v3, v3, Le52;->e:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_188

    new-instance v2, Lq3;

    const/16 v3, 0x18

    invoke-direct {v2, v8, v0, v3}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-string v0, "OFA.CHAT_KEY"

    invoke-virtual {v1, v0, v2}, Lf12;->e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    goto :goto_1b2

    :cond_1af
    invoke-virtual {v8, v0}, Ls22;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1b2
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1b5
    check-cast v0, Lj32;

    check-cast v8, Lf9;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/Map;

    iget-object v2, v0, Lj32;->g:Li32;

    invoke-virtual {v2, v1}, Lldk;->g(Ljava/lang/Object;)V

    if-eqz v1, :cond_1d5

    iget-boolean v1, v0, Lj32;->f:Z

    if-eqz v1, :cond_1d0

    iput-boolean v6, v0, Lj32;->f:Z

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v8, v0}, Lf9;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1d5

    :cond_1d0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v8, v0}, Lf9;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1d5
    :goto_1d5
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1d8
    check-cast v0, Ll32;

    check-cast v8, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Lkotlin/Unit;

    new-instance v1, Ljava/io/File;

    iget-object v0, v0, Ll32;->d:Lk32;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    const-string v2, ".data"

    invoke-static {v8, v2}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_1fc
    check-cast v0, Lcom/opera/android/BrowserActivity;

    check-cast v8, Lwcj;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    instance-of v4, v1, Lq0i;

    if-nez v4, :cond_20b

    move-object v7, v1

    :cond_20b
    check-cast v7, Ll22;

    if-eqz v7, :cond_233

    new-instance v1, Lc5o;

    invoke-direct {v1, v0, v3}, Lc5o;-><init>(Landroid/content/Context;B)V

    iget-object v3, v7, Ll22;->a:Ljava/util/ArrayList;

    iget-object v4, v7, Ll22;->b:Lo52;

    iget-object v5, v7, Ll22;->c:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lc5o;->u(Lo52;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4, v3}, Lc5o;->y(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v4, v3}, Lc5o;->x(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Li4d;

    new-instance v4, Lqlb;

    invoke-direct {v4, v6, v1, v5, v2}, Lqlb;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V

    invoke-direct {v3, v4}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-interface {v8, v0, v3}, Lwcj;->c(Landroid/content/Context;Li4d;)V

    :cond_233
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_236
    check-cast v0, Landroid/content/Context;

    check-cast v8, Lf1j;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, v1, Lq0i;

    if-nez v2, :cond_245

    move-object v7, v1

    :cond_245
    check-cast v7, Ll22;

    if-eqz v7, :cond_25d

    new-instance v1, Lc5o;

    invoke-direct {v1, v0, v3}, Lc5o;-><init>(Landroid/content/Context;B)V

    iget-object v0, v7, Ll22;->a:Ljava/util/ArrayList;

    iget-object v2, v7, Ll22;->b:Lo52;

    invoke-virtual {v1, v2}, Lc5o;->u(Lo52;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lc5o;->y(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lf1j;->f(Ljava/lang/String;)V

    :cond_25d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_260
    check-cast v0, Lk22;

    check-cast v8, Ls62;

    move-object/from16 v1, p1

    check-cast v1, Latn;

    new-instance v2, Lt22;

    invoke-direct {v2, v8, v6}, Lt22;-><init>(Ls62;B)V

    invoke-virtual {v0, v1, v2}, Lk22;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_273
    check-cast v0, Lg22;

    check-cast v8, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Ld22;

    iget-object v0, v0, Lg22;->a:Ljava/util/LinkedHashMap;

    invoke-interface {v0, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_283
    check-cast v0, Ljava/lang/String;

    check-cast v8, Lfka;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v1, v0, :cond_29d

    new-instance v0, Lsw7;

    invoke-direct {v0, v7}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v8, v0}, Lfka;->n(Ltw7;)V

    :cond_29d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2a0
    check-cast v0, Lz3;

    check-cast v8, Lzz1;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {v1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    if-nez v2, :cond_2b8

    check-cast v1, Lehf;

    sget-object v1, Lwz1;->b:Lwz1;

    invoke-virtual {v0, v1}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2e1

    :cond_2b8
    iget-object v1, v8, Lzz1;->h:Lg7m;

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    iget-object v1, v1, Lg7m;->d:Ljava/lang/Object;

    check-cast v1, Lji;

    invoke-virtual {v1}, Lji;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    const/16 v4, 0xd

    check-cast v1, Lx5f;

    invoke-virtual {v1, v4, v3}, Lx5f;->R(ILjava/lang/String;)V

    instance-of v1, v2, Le42;

    if-eqz v1, :cond_2d6

    sget-object v1, Lwz1;->a:Lwz1;

    goto :goto_2de

    :cond_2d6
    new-instance v1, Lxz1;

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    :goto_2de
    invoke-virtual {v0, v1}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2e1
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2e4
    check-cast v0, Lt02;

    check-cast v8, Lzz1;

    move-object/from16 v1, p1

    check-cast v1, Lvke;

    invoke-virtual {v0, v1}, Lt02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v8, Lzz1;->f:Lkotlin/jvm/functions/Function2;

    new-instance v1, Lc4;

    const/16 v2, 0x1d

    invoke-direct {v1, v8, v2}, Lc4;-><init>(Ljava/lang/Object;B)V

    sget-wide v2, Lzz1;->l:J

    new-instance v4, Lpn7;

    invoke-direct {v4, v2, v3}, Lpn7;-><init>(J)V

    invoke-interface {v0, v1, v4}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_305
    check-cast v0, Liy1;

    check-cast v8, Lo0g;

    move-object/from16 v1, p1

    check-cast v1, Lkotlin/Unit;

    iget-object v0, v0, Liy1;->e:Lx12;

    invoke-virtual {v0, v8}, Lx12;->c(Lo0g;)Lt12;

    move-result-object v0

    return-object v0

    :pswitch_314
    check-cast v0, Liy1;

    check-cast v8, Lpy1;

    move-object/from16 v1, p1

    check-cast v1, Lkotlin/Unit;

    iget-object v0, v0, Liy1;->g:Lqy1;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_321
    iget-object v1, v8, Lpy1;->a:Landroid/net/Uri;

    iget-object v2, v8, Lpy1;->b:Ljava/io/File;

    invoke-virtual {v0, v1, v2}, Lqy1;->a(Landroid/net/Uri;Ljava/io/File;)Loy1;

    move-result-object v0
    :try_end_329
    .catch Ljava/lang/Exception; {:try_start_321 .. :try_end_329} :catch_32a

    goto :goto_32c

    :catch_32a
    sget-object v0, Loy1;->c:Loy1;

    :goto_32c
    return-object v0

    :pswitch_32d
    check-cast v0, Ljava/lang/String;

    check-cast v8, Ljava/lang/Long;

    move-object/from16 v1, p1

    check-cast v1, Lwa1;

    invoke-interface {v1, v6, v7}, Lwa1;->w(ILjava/lang/String;)V

    invoke-interface {v1, v5, v0}, Lwa1;->w(ILjava/lang/String;)V

    invoke-interface {v1, v2, v8}, Lwa1;->x(ILjava/lang/Long;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_341
    check-cast v0, Lm3c;

    check-cast v8, Lc8e;

    move-object/from16 v1, p1

    check-cast v1, Lc8e;

    invoke-interface {v1, v8}, Lc8e;->d(Lc8e;)Lc8e;

    move-result-object v1

    invoke-virtual {v0, v1}, Lm3c;->e0(Lc8e;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_353
    check-cast v0, Laog;

    check-cast v8, Lfog;

    move-object/from16 v1, p1

    check-cast v1, Lvb7;

    iput-object v8, v0, Laog;->o:Lfog;

    invoke-virtual {v0}, Laog;->r()V

    new-instance v0, Lt91;

    invoke-direct {v0, v6}, Lt91;-><init>(B)V

    return-object v0

    :pswitch_366
    check-cast v0, Lhbc;

    check-cast v8, Ln91;

    move-object/from16 v1, p1

    check-cast v1, Lnx5;

    new-instance v1, La9b;

    new-instance v2, Lpa;

    const/16 v3, 0x11

    invoke-direct {v2, v8, v3}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v0, v2}, La9b;-><init>(Lhbc;Lpa;)V

    return-object v1

    :pswitch_37b
    check-cast v0, Landroid/content/Context;

    check-cast v8, Ljava/util/List;

    move-object/from16 v1, p1

    check-cast v1, Lby0;

    iget-byte v2, v1, Lby0;->a:B

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v1, v3, v0}, Lby0;->d(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lkotlin/Pair;

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    :pswitch_397
    check-cast v0, Ljava/util/List;

    check-cast v8, Lyx0;

    move-object/from16 v1, p1

    check-cast v1, Lby0;

    iget-boolean v2, v1, Lby0;->c:Z

    if-eqz v2, :cond_3a9

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v5, :cond_3af

    :cond_3a9
    iget-object v0, v1, Lby0;->b:Ljava/util/EnumSet;

    invoke-interface {v0, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    :cond_3af
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_3b4
    check-cast v0, Lgx0;

    check-cast v8, Lwf5;

    move-object/from16 v1, p1

    check-cast v1, Lvke;

    iget-object v0, v0, Lgx0;->a:Lq3;

    invoke-virtual {v0, v1}, Lq3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v8, Lxf5;

    invoke-virtual {v8}, Lxf5;->a()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3c9
    check-cast v0, Landroid/view/View;

    check-cast v8, Lru;

    move-object/from16 v1, p1

    check-cast v1, Ltw7;

    instance-of v2, v1, Lrw7;

    if-eqz v2, :cond_3f2

    check-cast v1, Lrw7;

    iget-object v0, v1, Lrw7;->a:Ljava/lang/Object;

    check-cast v0, Luu;

    invoke-virtual {v8}, Lru;->I0()Lhm9;

    move-result-object v1

    iget-object v1, v1, Lhm9;->j:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Luu;->a:Ljava/lang/String;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f140f74

    invoke-virtual {v8, v2, v0}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    goto :goto_40d

    :cond_3f2
    instance-of v2, v1, Lsw7;

    if-eqz v2, :cond_410

    check-cast v1, Lsw7;

    iget-object v1, v1, Lsw7;->a:Ljava/lang/Object;

    check-cast v1, Lw3g;

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    iget-object v0, v8, Lru;->v:Lua7;

    iget v1, v1, Lw3g;->a:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    invoke-virtual {v8}, Lryl;->g0()V

    :goto_40d
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_413

    :cond_410
    invoke-static {}, Lh9o;->p()V

    :goto_413
    return-object v7

    :pswitch_414
    check-cast v0, Ltg;

    check-cast v8, Lekc;

    move-object/from16 v1, p1

    check-cast v1, Lpg;

    sget-object v2, Lng;->a:Lng;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_42c

    iput-boolean v5, v0, Ltg;->a:Z

    invoke-virtual {v8, v0}, Lekc;->k(Lf7f;)V

    iput-boolean v6, v0, Ltg;->a:Z

    goto :goto_437

    :cond_42c
    sget-object v2, Log;->a:Log;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_43a

    invoke-virtual {v8, v0}, Lekc;->p(Lf7f;)V

    :goto_437
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_43d

    :cond_43a
    invoke-static {}, Lh9o;->p()V

    :goto_43d
    return-object v7

    :pswitch_43e
    check-cast v0, Lrn9;

    check-cast v8, Lqb;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_453

    invoke-virtual {v8}, Lqb;->a()V

    invoke-virtual {v0}, Lrn9;->k()V

    goto :goto_45d

    :cond_453
    iget-object v1, v0, Lrn9;->d:Ljava/lang/Object;

    check-cast v1, Lqb;

    invoke-virtual {v1}, Lqb;->a()V

    invoke-virtual {v0}, Lrn9;->k()V

    :goto_45d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_460
    check-cast v0, Lejc;

    check-cast v8, Landroid/view/accessibility/AccessibilityManager;

    move-object/from16 v1, p1

    check-cast v1, Locc;

    sget-object v2, Locc;->ON_RESUME:Locc;

    if-ne v1, v2, :cond_46f

    invoke-virtual {v0, v8}, Lejc;->d(Landroid/view/accessibility/AccessibilityManager;)V

    :cond_46f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_472
    check-cast v0, Llde;

    check-cast v8, Lmwg;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Throwable;

    invoke-virtual {v0, v8}, Llde;->b(Lndb;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_480
    .packed-switch 0x0
        :pswitch_472
        :pswitch_460
        :pswitch_43e
        :pswitch_414
        :pswitch_3c9
        :pswitch_3b4
        :pswitch_397
        :pswitch_37b
        :pswitch_366
        :pswitch_353
        :pswitch_341
        :pswitch_32d
        :pswitch_314
        :pswitch_305
        :pswitch_2e4
        :pswitch_2a0
        :pswitch_283
        :pswitch_273
        :pswitch_260
        :pswitch_236
        :pswitch_1fc
        :pswitch_1d8
        :pswitch_1b5
        :pswitch_126
        :pswitch_ce
        :pswitch_be
        :pswitch_ae
        :pswitch_70
        :pswitch_40
    .end packed-switch
.end method
