.class public final synthetic Lvvf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lifg;Lwkj;)V
    .registers 4

    const/16 v0, 0x14

    iput-byte v0, p0, Lvvf;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvvf;->c:Ljava/lang/Object;

    iput-object p2, p0, Lvvf;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 12
    iput-byte p3, p0, Lvvf;->a:B

    iput-object p1, p0, Lvvf;->b:Ljava/lang/Object;

    iput-object p2, p0, Lvvf;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lvvf;->a:B

    const/16 v3, 0x17

    const/16 v4, 0x14

    const/16 v5, 0xa

    const/4 v6, 0x0

    const/4 v7, 0x4

    const/4 v8, 0x5

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x0

    packed-switch v2, :pswitch_data_5f6

    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Luyj;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Llqh;

    check-cast v1, Ltyj;

    iget-object v3, v2, Luyj;->c:Lqie;

    iget-object v4, v2, Luyj;->a:Lumi;

    new-instance v5, Ltxi;

    const/16 v6, 0xb

    invoke-direct {v5, v2, v6}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v2

    new-instance v4, Loml;

    invoke-direct {v4, v2}, Loml;-><init>(Lnml;)V

    iget-boolean v2, v0, Llqh;->a:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    new-instance v5, Lkotlin/Pair;

    invoke-direct {v5, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v4, v5}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    iput-boolean v9, v0, Llqh;->a:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_46
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lqyj;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Luyj;

    check-cast v1, Lbzj;

    iget-object v3, v2, Lqyj;->m:Luyj;

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5b

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_6a

    :cond_5b
    iget-object v0, v2, Lqyj;->j:Lode;

    invoke-static {v0, v1}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lbzj;->a()Z

    move-result v0

    if-nez v0, :cond_68

    iput-object v11, v2, Lqyj;->m:Luyj;

    :cond_68
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_6a
    return-object v0

    :pswitch_6b
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Ltmi;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    instance-of v4, v1, Lq0i;

    if-eqz v4, :cond_7e

    move-object v1, v3

    :cond_7e
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_8a

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v11

    :cond_8a
    invoke-virtual {v2, v11}, Ltmi;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_90
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Leoj;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, [Ljava/io/File;

    check-cast v1, Ljava/util/List;

    iget-object v3, v2, Leoj;->a:Lumi;

    new-instance v4, Lrml;

    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v4, v5, v3}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v3, Ltmi;

    invoke-direct {v3, v1, v0, v2, v8}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v3}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    return-object v5

    :pswitch_b0
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/Set;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Leoj;

    check-cast v1, [Ljava/io/File;

    if-eqz v1, :cond_132

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v2

    iget-object v3, v0, Leoj;->e:Ljava/util/ArrayList;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v9

    :cond_ce
    :goto_ce
    if-ge v8, v7, :cond_e5

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v8, v8, 0x1

    move-object v11, v10

    check-cast v11, Lynj;

    iget-object v11, v11, Lynj;->a:Ldoj;

    iget-object v11, v11, Ldoj;->b:Lp6l;

    sget-object v12, Lp6l;->a:Lp6l;

    if-ne v11, v12, :cond_ce

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_ce

    :cond_e5
    new-instance v3, Ljava/util/ArrayList;

    invoke-static {v6, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v5

    :goto_f2
    if-ge v9, v5, :cond_104

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v9, v9, 0x1

    check-cast v7, Lynj;

    iget-object v7, v7, Lynj;->a:Ldoj;

    iget-object v7, v7, Ldoj;->a:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f2

    :cond_104
    invoke-interface {v2, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object v3, v0, Leoj;->b:La5l;

    new-instance v5, Lvvf;

    const/16 v6, 0x1a

    invoke-direct {v5, v0, v1, v6}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v3, La5l;->a:Lumi;

    new-instance v1, Lrml;

    sget-object v6, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v6, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Ld7k;

    const/16 v6, 0xc

    invoke-direct {v0, v3, v2, v6}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    new-instance v1, Ln6k;

    invoke-direct {v1, v5, v4}, Ln6k;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    iget-object v1, v3, La5l;->g:Lqie;

    invoke-virtual {v0, v1}, Lplk;->m(Lqie;)Lp1j;

    :cond_132
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_135
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Leoj;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lv4b;

    check-cast v1, Lndc;

    new-instance v1, Liuh;

    invoke-direct {v1, v0}, Liuh;-><init>(Lv4b;)V

    iput-object v1, v2, Leoj;->d:Lhoj;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_149
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashMap;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lvnj;

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_202

    iget-object v0, v0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_16e

    move-object v11, v0

    :cond_16e
    const-string v0, "icons"

    const-string v1, "id=?"

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_201

    :pswitch_17f
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lvnj;

    iget-object v4, v2, Lvnj;->a:Lumi;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lpnj;

    check-cast v1, Ljnj;

    if-eqz v1, :cond_1dc

    instance-of v5, v1, Linj;

    if-eqz v5, :cond_1ab

    iget-object v3, v2, Lvnj;->d:Lqie;

    new-instance v5, Lvdi;

    invoke-direct {v5, v1, v2, v0, v7}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v1

    new-instance v4, Lmgf;

    const/16 v5, 0x1d

    invoke-direct {v4, v2, v0, v5}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v4}, Lnml;->c(Ln5o;)Loml;

    move-result-object v0

    invoke-virtual {v3, v0, v11}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    goto :goto_1d9

    :cond_1ab
    instance-of v5, v1, Lgnj;

    if-eqz v5, :cond_1cb

    check-cast v1, Lgnj;

    iget v1, v1, Lgnj;->a:I

    const/16 v5, 0x194

    if-ne v1, v5, :cond_1c0

    new-instance v1, Ls4f;

    invoke-direct {v1, v2, v0, v3}, Ls4f;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v4, v1}, Lfac;->C(Lumi;Lkotlin/jvm/functions/Function0;)Loml;

    goto :goto_1d9

    :cond_1c0
    sget-wide v0, Lvnj;->i:J

    new-instance v3, Ldnj;

    invoke-direct {v3, v2, v9}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-static {v4, v0, v1, v3}, Lfac;->B(Lumi;JLkotlin/jvm/functions/Function0;)Loml;

    goto :goto_1d9

    :cond_1cb
    instance-of v0, v1, Lhnj;

    if-eqz v0, :cond_1dc

    sget-wide v0, Lvnj;->i:J

    new-instance v3, Ldnj;

    invoke-direct {v3, v2, v9}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-static {v4, v0, v1, v3}, Lfac;->B(Lumi;JLkotlin/jvm/functions/Function0;)Loml;

    :goto_1d9
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1df

    :cond_1dc
    invoke-static {}, Lh9o;->p()V

    :goto_1df
    return-object v11

    :pswitch_1e0
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lknj;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    check-cast v1, Lonj;

    instance-of v3, v1, Lpnj;

    if-eqz v3, :cond_202

    check-cast v1, Lpnj;

    iget-object v3, v1, Lpnj;->b:Llnj;

    iget-object v2, v2, Lknj;->b:Llnj;

    invoke-virtual {v3, v2}, Llnj;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_202

    iget-object v1, v1, Lpnj;->c:Lkotlin/jvm/functions/Function1;

    if-eqz v1, :cond_201

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_201
    :goto_201
    move v9, v10

    :cond_202
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_207
    iget-object v2, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v2, Lifg;

    iget-object v0, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v0, Lwkj;

    check-cast v1, Lp1d;

    iget-object v0, v0, Lwkj;->H:Ltji;

    invoke-static {v1, v2, v0, v7}, Lp1d;->p(Lp1d;Lifg;Lkotlin/jvm/functions/Function1;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_219
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Landroid/net/Uri;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    check-cast v1, Landroid/content/Intent;

    const-string v3, "android.intent.extra.STREAM"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v10}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_231
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Bitmap;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    check-cast v1, Lfcj;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_244
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Bitmap;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lgcj;

    check-cast v1, Lkotlin/Unit;

    :try_start_24e
    iget-object v0, v0, Lgcj;->r:Ldx3;

    const-string v1, "share_qr_code"

    const-string v3, ".png"

    invoke-static {v0, v1, v3}, Ln1h;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    if-eqz v6, :cond_27f

    sget-object v1, Lgcj;->y:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x64

    invoke-static {v2, v6, v1, v3}, Lz5i;->l0(Landroid/graphics/Bitmap;Ljava/io/File;Landroid/graphics/Bitmap$CompressFormat;I)Z

    move-result v1

    if-eqz v1, :cond_27f

    invoke-static {v6}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v7

    invoke-static {v7}, Lqyn;->G(Landroid/net/Uri;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_27f

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    new-instance v4, Lfcj;

    const v1, 0x7f140d6b

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v4 .. v9}, Lfcj;-><init>(Ljava/lang/String;Ljava/io/File;Landroid/net/Uri;J)V
    :try_end_27e
    .catch Ljava/io/IOException; {:try_start_24e .. :try_end_27e} :catch_27f

    move-object v11, v4

    :catch_27f
    :cond_27f
    return-object v11

    :pswitch_280
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lqpi;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lspi;

    check-cast v1, Lyi7;

    iget-boolean v3, v1, Lyi7;->b:Z

    if-eqz v3, :cond_291

    const/high16 v3, -0x40800000    # -1.0f

    goto :goto_293

    :cond_291
    const/high16 v3, 0x3f800000    # 1.0f

    :goto_293
    iget-wide v4, v1, Lyi7;->a:J

    iget-object v0, v0, Lspi;->d:Lfsf;

    sget-object v1, Lfsf;->b:Lfsf;

    if-ne v0, v1, :cond_2a0

    invoke-static {v4, v5, v10, v6}, Ly8f;->a(JIF)J

    move-result-wide v0

    goto :goto_2a5

    :cond_2a0
    const/4 v0, 0x2

    invoke-static {v4, v5, v0, v6}, Ly8f;->a(JIF)J

    move-result-wide v0

    :goto_2a5
    invoke-static {v0, v1, v3}, Ly8f;->f(JF)J

    move-result-wide v0

    invoke-virtual {v2, v10, v0, v1}, Lqpi;->a(IJ)J

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2af
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lffe;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Ltlm;

    check-cast v1, Lg2o;

    new-instance v3, Lyf8;

    invoke-direct {v3, v0, v1}, Lyf8;-><init>(Ltlm;Lg2o;)V

    iget-object v0, v2, Lffe;->a:Lt0g;

    invoke-virtual {v0, v3}, Lt0g;->setValue(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2c6
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Ll5b;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lqln;

    check-cast v1, Ljava/util/Map;

    iget-boolean v4, v2, Ll5b;->b:Z

    if-eqz v4, :cond_2d7

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_32c

    :cond_2d7
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2e0

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_32c

    :cond_2e0
    iget-object v0, v0, Lqln;->f:Lami;

    iget-object v4, v0, Lami;->e:Ljava/lang/Object;

    check-cast v4, Lvq8;

    invoke-virtual {v4}, Lvq8;->i()Z

    move-result v4

    if-nez v4, :cond_2ef

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_32c

    :cond_2ef
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    iget-object v4, v0, Lami;->e:Ljava/lang/Object;

    check-cast v4, Lvq8;

    iget-object v4, v4, Lvq8;->j:Ljava/lang/Object;

    check-cast v4, Lkze;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v4

    new-instance v5, Lmn;

    const/16 v6, 0x18

    invoke-direct {v5, v6}, Lmn;-><init>(B)V

    invoke-interface {v4, v5}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object v4

    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    invoke-interface {v4, v1}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_32a

    iput-boolean v10, v2, Ll5b;->b:Z

    new-instance v1, Lpjg;

    invoke-direct {v1, v2, v3}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lami;->r(Ljava/lang/Runnable;)V

    :cond_32a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_32c
    return-object v0

    :pswitch_32d
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Ljqh;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lgqh;

    check-cast v1, Losk;

    iget-object v2, v2, Ljqh;->b:Lnb2;

    invoke-virtual {v2, v1, v0}, Lkfo;->Q(Losk;Ljava/lang/Object;)V

    return-object v11

    :pswitch_33d
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lyc3;

    check-cast v1, Lpg;

    sget-object v3, Lng;->a:Lng;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_353

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    goto :goto_35e

    :cond_353
    sget-object v3, Log;->a:Log;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_361

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    :goto_35e
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_364

    :cond_361
    invoke-static {}, Lh9o;->p()V

    :goto_364
    return-object v11

    :pswitch_365
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lhoh;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    check-cast v1, Ljava/lang/Throwable;

    iget-object v3, v2, Lhoh;->c:Ljava/lang/Object;

    monitor-enter v3

    if-eqz v0, :cond_381

    if-eqz v1, :cond_382

    :try_start_376
    instance-of v4, v1, Ljava/util/concurrent/CancellationException;

    if-eqz v4, :cond_37b

    move-object v1, v11

    :cond_37b
    if-eqz v1, :cond_382

    invoke-static {v0, v1}, Lwf8;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_382

    :cond_381
    move-object v0, v11

    :cond_382
    :goto_382
    iput-object v0, v2, Lhoh;->e:Ljava/lang/Throwable;

    iget-object v0, v2, Lhoh;->u:Lnak;

    sget-object v1, Leoh;->a:Leoh;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v11, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_38e
    .catchall {:try_start_376 .. :try_end_38e} :catchall_392

    monitor-exit v3

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_392
    move-exception v0

    monitor-exit v3

    throw v0

    :pswitch_395
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lfi5;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Ltee;

    invoke-virtual {v2, v1}, Lfi5;->z(Ljava/lang/Object;)V

    if-eqz v0, :cond_3a5

    invoke-virtual {v0, v1}, Ltee;->a(Ljava/lang/Object;)Z

    :cond_3a5
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3a8
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lpmh;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lomh;

    check-cast v1, Losk;

    iget-object v2, v2, Lpmh;->b:Lnb2;

    invoke-virtual {v2, v1, v0}, Lkfo;->Q(Losk;Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3ba
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Liak;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Liak;

    move-object v7, v1

    check-cast v7, Lmk7;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-interface {v7, v1}, Ln27;->o0(F)F

    move-result v11

    invoke-interface {v2}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lu95;

    iget-wide v3, v3, Lu95;->a:J

    sget v5, Lsih;->c:F

    div-float/2addr v5, v1

    invoke-interface {v7, v5}, Ln27;->o0(F)F

    move-result v5

    div-float v1, v11, v1

    sub-float/2addr v5, v1

    new-instance v8, Lqik;

    const/4 v10, 0x0

    const/16 v13, 0x1e

    const/4 v9, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v8 .. v13}, Lqik;-><init>(IIFFI)V

    const/16 v14, 0x6c

    const-wide/16 v11, 0x0

    move v10, v5

    move-object v13, v8

    move-wide v8, v3

    invoke-static/range {v7 .. v14}, Lmk7;->I(Lmk7;JFJLnk7;I)V

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgh7;

    iget v3, v3, Lgh7;->a:F

    invoke-static {v3, v6}, Lgh7;->a(FF)I

    move-result v3

    if-lez v3, :cond_41e

    invoke-interface {v2}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lu95;

    iget-wide v8, v2, Lu95;->a:J

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgh7;

    iget v0, v0, Lgh7;->a:F

    invoke-interface {v7, v0}, Ln27;->o0(F)F

    move-result v0

    sub-float v10, v0, v1

    sget-object v13, La39;->a:La39;

    const/16 v14, 0x6c

    const-wide/16 v11, 0x0

    invoke-static/range {v7 .. v14}, Lmk7;->I(Lmk7;JFJLnk7;I)V

    :cond_41e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_421
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lnhj;

    check-cast v1, Lkotlin/Unit;

    const-string v1, "qrWidgetShortcut"

    invoke-static {v2, v1}, Lm5h;->A(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_436

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_43f

    :cond_436
    :try_start_436
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v2, v0}, Lphj;->C0(Landroid/content/ContextWrapper;Ljava/util/List;)Z
    :try_end_43d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_436 .. :try_end_43d} :catch_43d
    .catch Ljava/lang/IllegalStateException; {:try_start_436 .. :try_end_43d} :catch_43d

    :catch_43d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_43f
    return-object v0

    :pswitch_440
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Llqh;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lmdh;

    check-cast v1, Ljava/util/List;

    iget-boolean v3, v2, Llqh;->a:Z

    if-eqz v3, :cond_4ab

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4ab

    iget-object v3, v0, Lmdh;->i:Lw6j;

    if-eqz v3, :cond_45b

    invoke-virtual {v3}, Lw6j;->b()V

    :cond_45b
    iget-object v3, v0, Lmdh;->g:Lnv1;

    invoke-virtual {v3}, Lnv1;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v12

    check-cast v1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-static {v1, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_476
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_48d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    new-instance v6, Lw2g;

    iget-object v5, v5, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    invoke-direct {v6, v5, v10}, Lw2g;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_476

    :cond_48d
    invoke-static {v3}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v13

    sget-object v1, Lpn7;->b:Lon7;

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v8, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v5

    invoke-static {v5, v6}, Lpn7;->f(J)J

    move-result-wide v14

    new-instance v1, Lvk2;

    invoke-direct {v1, v4}, Lvk2;-><init>(B)V

    new-instance v11, Lw6j;

    move-object/from16 v16, v1

    invoke-direct/range {v11 .. v16}, Lw6j;-><init>(ILh1b;JLcom/opera/api/Callback;)V

    iput-object v11, v0, Lmdh;->i:Lw6j;

    :cond_4ab
    iput-boolean v9, v2, Llqh;->a:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4b0
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/PushedContentHandler;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lgh2;

    check-cast v1, Ljava/lang/Boolean;

    iget-object v3, v2, Lcom/opera/android/PushedContentHandler;->j:Lx5f;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {v3, v7, v4}, Lx5f;->K0(IZ)V

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_4e8

    iget-object v1, v2, Lcom/opera/android/PushedContentHandler;->k:Lx5f;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    new-instance v6, Lck0;

    invoke-direct {v6, v4, v5}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v6}, Lck0;->c()Ltb0;

    move-result-object v4

    iget-object v4, v4, Ltb0;->b:Lq56;

    const/16 v6, 0x20

    invoke-virtual {v4, v6, v10, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {v1, v5}, Lx5f;->U0(Lx56;)V

    :cond_4e8
    invoke-virtual {v0}, Lgh2;->run()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4ee
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Ls9i;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lsmg;

    check-cast v1, Landroid/view/MotionEvent;

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    iget-object v0, v0, Lsmg;->b:Ldc1;

    if-nez v3, :cond_517

    if-eqz v0, :cond_503

    move-object v11, v0

    :cond_503
    invoke-virtual {v11, v1}, Ldc1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_512

    sget-object v0, Lqmg;->b:Lqmg;

    goto :goto_514

    :cond_512
    sget-object v0, Lqmg;->c:Lqmg;

    :goto_514
    iput-object v0, v2, Ls9i;->c:Ljava/lang/Object;

    goto :goto_51d

    :cond_517
    if-eqz v0, :cond_51a

    move-object v11, v0

    :cond_51a
    invoke-virtual {v11, v1}, Ldc1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_51d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_520
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Ln5g;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    move-object v13, v0

    check-cast v13, Landroidx/recyclerview/widget/i;

    move-object v0, v1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_586

    iget-object v12, v2, Ln5g;->c:Lflb;

    iget-object v0, v12, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_586

    invoke-virtual {v12, v13, v10}, Lflb;->k(Landroidx/recyclerview/widget/i;Z)I

    move-result v0

    if-eqz v0, :cond_586

    iget-object v0, v12, Lflb;->a:Ljava/util/ArrayList;

    iget-object v1, v13, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, v13, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v14

    iget-object v0, v13, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v15

    new-instance v11, Lykb;

    move/from16 v16, v14

    move/from16 v17, v15

    invoke-direct/range {v11 .. v17}, Lykb;-><init>(Lflb;Landroidx/recyclerview/widget/i;FFFF)V

    iget-object v0, v11, Lelb;->g:Landroid/animation/ValueAnimator;

    iget-object v1, v12, Lflb;->q:Lblb;

    iget-object v2, v12, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v2, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    if-nez v1, :cond_56a

    const-wide/16 v1, 0xfa

    goto :goto_56c

    :cond_56a
    iget-wide v1, v1, Landroidx/recyclerview/widget/e;->d:J

    :goto_56c
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    invoke-virtual {v11, v6}, Lykb;->a(F)V

    iget-object v1, v12, Lflb;->t:Ljava/util/ArrayList;

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v10, v11, Lelb;->s:Z

    iget-object v1, v13, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1, v10}, Landroid/view/View;->setHasTransientState(Z)V

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    iget-object v0, v12, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_586
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_589
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lafe;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    check-cast v1, Lp1d;

    new-instance v3, Ll51;

    invoke-direct {v3, v0, v8}, Ll51;-><init>(Ljava/util/ArrayList;B)V

    iput-boolean v10, v1, Lp1d;->a:Z

    invoke-virtual {v3, v1}, Ll51;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iput-boolean v9, v1, Lp1d;->a:Z

    invoke-interface {v2}, Liak;->getValue()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5a5
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lkotlin/jvm/functions/Function2;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lp8f;

    check-cast v1, Lusg;

    iget v1, v1, Lusg;->a:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v0, v0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ljxf;

    if-eqz v0, :cond_5bc

    move-object v11, v0

    :cond_5bc
    iget v0, v11, Ljxf;->b:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v2, v1, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5c8
    iget-object v2, v0, Lvvf;->b:Ljava/lang/Object;

    check-cast v2, Lwvf;

    iget-object v0, v0, Lvvf;->c:Ljava/lang/Object;

    check-cast v0, Lifg;

    check-cast v1, Lp1d;

    iget-boolean v3, v2, Lwvf;->s:Z

    iget v4, v2, Lwvf;->o:F

    if-eqz v3, :cond_5e6

    invoke-interface {v1, v4}, Ln27;->M(F)I

    move-result v3

    iget v2, v2, Lwvf;->p:F

    invoke-interface {v1, v2}, Ln27;->M(F)I

    move-result v2

    invoke-static {v1, v0, v3, v2}, Lp1d;->h(Lp1d;Lifg;II)V

    goto :goto_5f3

    :cond_5e6
    invoke-interface {v1, v4}, Ln27;->M(F)I

    move-result v3

    iget v2, v2, Lwvf;->p:F

    invoke-interface {v1, v2}, Ln27;->M(F)I

    move-result v2

    invoke-static {v1, v0, v3, v2}, Lp1d;->f(Lp1d;Lifg;II)V

    :goto_5f3
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_5f6
    .packed-switch 0x0
        :pswitch_5c8
        :pswitch_5a5
        :pswitch_589
        :pswitch_520
        :pswitch_4ee
        :pswitch_4b0
        :pswitch_440
        :pswitch_421
        :pswitch_3ba
        :pswitch_3a8
        :pswitch_395
        :pswitch_365
        :pswitch_33d
        :pswitch_32d
        :pswitch_2c6
        :pswitch_2af
        :pswitch_280
        :pswitch_244
        :pswitch_231
        :pswitch_219
        :pswitch_207
        :pswitch_1e0
        :pswitch_17f
        :pswitch_149
        :pswitch_135
        :pswitch_b0
        :pswitch_90
        :pswitch_6b
        :pswitch_46
    .end packed-switch
.end method
