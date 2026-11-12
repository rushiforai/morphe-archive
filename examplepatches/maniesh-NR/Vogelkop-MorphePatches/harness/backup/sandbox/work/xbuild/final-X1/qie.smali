.class public final Lqie;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq03;
.implements Lqye;
.implements Lahf;
.implements Lu13;
.implements Lcn;
.implements Lsic;
.implements Lb5n;
.implements Lxx5;
.implements Lboi;
.implements Lvlf;
.implements Lu18;
.implements Lonk;


# static fields
.field public static c:Lqie;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 7

    iput-byte p1, p0, Lqie;->a:B

    const/4 v0, 0x0

    sparse-switch p1, :sswitch_data_128

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object p1

    const/16 v0, 0xe0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Lnf2;->g:Lnf2;

    new-instance v2, Lkotlin/Pair;

    invoke-direct {v2, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v2}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0xd0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v2, Lnf2;->e:Lnf2;

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v0, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v3}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0xc0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v3, Lnf2;->n:Lnf2;

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0xb0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0xa0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x90

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x80

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x70

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Lnf2;->b:Lnf2;

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x60

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Lnf2;->c:Lnf2;

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x50

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x40

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x30

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x20

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x10

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v2, Lkotlin/Pair;

    invoke-direct {v2, v0, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v2}, Lehc;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x4000

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v2, Lkotlin/Pair;

    invoke-direct {v2, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v2}, Lehc;->add(Ljava/lang/Object;)Z

    invoke-static {p1}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p1

    iput-object p1, p0, Lqie;->b:Ljava/lang/Object;

    return-void

    :sswitch_f0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lr16;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqie;->b:Ljava/lang/Object;

    return-void

    :sswitch_fb
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lauj;

    invoke-direct {p1, v0}, Lauj;-><init>(B)V

    iput-object p1, p0, Lqie;->b:Ljava/lang/Object;

    return-void

    :sswitch_106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lqie;->b:Ljava/lang/Object;

    return-void

    :sswitch_111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lisd;

    const/16 v1, 0x11

    invoke-direct {p1, v1, v0}, Lisd;-><init>(BZ)V

    new-instance v0, Lyp9;

    const/16 v1, 0x86

    const/4 v2, 0x2

    invoke-direct {v0, p1, v1, v2}, Lyp9;-><init>(Ljava/lang/Object;IB)V

    iput-object v0, p1, Lisd;->b:Ljava/lang/Object;

    iput-object p1, p0, Lqie;->b:Ljava/lang/Object;

    return-void

    :sswitch_data_128
    .sparse-switch
        0xc -> :sswitch_111
        0x13 -> :sswitch_106
        0x16 -> :sswitch_fb
        0x1c -> :sswitch_f0
    .end sparse-switch
.end method

.method public synthetic constructor <init>(BZ)V
    .registers 3

    .line 321
    iput-byte p1, p0, Lqie;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;B)V
    .registers 6

    iput-byte p2, p0, Lqie;->a:B

    packed-switch p2, :pswitch_data_3c

    .line 310
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 311
    invoke-static {p1}, Li0l;->h(Landroid/content/Context;)Lcom/opera/android/Lazy;

    move-result-object p1

    iput-object p1, p0, Lqie;->b:Ljava/lang/Object;

    return-void

    .line 312
    :pswitch_f
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 313
    new-instance p2, Lwh5;

    .line 314
    new-instance v0, Lmjk;

    .line 315
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 316
    const-string v1, "b"

    invoke-static {v1}, Lddh;->v(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 317
    new-instance v1, Lwh5;

    invoke-direct {v1, p1}, Lwh5;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x2

    new-array p1, p1, [Luil;

    const/4 v2, 0x0

    aput-object v0, p1, v2

    const/4 v0, 0x1

    aput-object v1, p1, v0

    .line 318
    invoke-direct {p2, p1}, Lwh5;-><init>([Luil;)V

    iput-object p2, p0, Lqie;->b:Ljava/lang/Object;

    return-void

    .line 319
    :cond_35
    const-string p0, "Invalid tag: b"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :pswitch_data_3c
    .packed-switch 0xf
        :pswitch_f
    .end packed-switch
.end method

.method public constructor <init>(Landroid/content/Context;Lh42;)V
    .registers 9

    const/16 v0, 0x1a

    iput-byte v0, p0, Lqie;->a:B

    .line 299
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 300
    new-instance v0, Lh42;

    invoke-direct {v0}, Lh42;-><init>()V

    .line 301
    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    .line 302
    new-instance v1, Lkpk;

    new-instance v2, Lmpk;

    .line 303
    iget-object v3, p1, Lru9;->a:Landroid/content/SharedPreferences;

    .line 304
    const-string v4, "startpage.last_suggestion_count"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 305
    invoke-direct {v2, v3}, Lmpk;-><init>(I)V

    .line 306
    sget-object v3, Lnpk;->a:Lnpk;

    invoke-direct {v1, v2, v3}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 307
    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    .line 308
    new-instance v1, Lwj;

    const/4 v2, 0x6

    invoke-direct {v1, p1, v0, v2}, Lwj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p2, v1}, Lh42;->s(Lekc;Lf7f;)V

    .line 309
    iput-object v0, p0, Lqie;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/oauth2/OAuth2Account;Lab;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lqie;->a:B

    .line 322
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lqie;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lisd;)V
    .registers 3

    const/16 v0, 0xa

    iput-byte v0, p0, Lqie;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 296
    iget-object p1, p1, Lisd;->b:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/internal/play_billing/zzca;

    .line 297
    iput-object p1, p0, Lqie;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 298
    iput-byte p2, p0, Lqie;->a:B

    iput-object p1, p0, Lqie;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lp03;Lbx7;)V
    .registers 3

    const/4 p1, 0x0

    iput-byte p1, p0, Lqie;->a:B

    .line 320
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lqie;->b:Ljava/lang/Object;

    return-void
.end method

.method public static s(Lsn5;Ljava/util/List;Lcom/usercentrics/sdk/v2/translation/data/LegalBasisLocalization;)Liac;
    .registers 56

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_30

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;

    invoke-interface {v0}, Lsn5;->d()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->a:Ljava/lang/String;

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v0}, Lsn5;->c()Ljava/lang/String;

    move-result-object v4

    iget-object v3, v3, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->b:Ljava/lang/String;

    invoke-static {v4, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    goto :goto_31

    :cond_30
    const/4 v2, 0x0

    :goto_31
    check-cast v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;

    if-nez v2, :cond_b1

    invoke-interface {v0}, Lsn5;->getDescription()Ljava/lang/String;

    move-result-object v39

    invoke-interface {v0}, Lsn5;->d()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0}, Lsn5;->c()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0}, Lsn5;->a()Z

    move-result v45

    invoke-interface {v0}, Lsn5;->b()Ljava/lang/String;

    move-result-object v30

    invoke-interface {v0}, Lsn5;->f()Ljava/lang/Boolean;

    move-result-object v47

    invoke-interface {v0}, Lsn5;->e()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_5a

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    :goto_57
    move/from16 v52, v1

    goto :goto_5c

    :cond_5a
    const/4 v1, 0x0

    goto :goto_57

    :goto_5c
    new-instance v3, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;

    sget-object v9, Ll08;->a:Ll08;

    new-instance v43, Lcom/usercentrics/sdk/v2/settings/data/ConsentDisclosureObject;

    invoke-direct/range {v43 .. v43}, Lcom/usercentrics/sdk/v2/settings/data/ConsentDisclosureObject;-><init>()V

    const/16 v50, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v8, ""

    const/4 v10, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v31, 0x0

    const/16 v37, 0x0

    const/16 v40, 0x0

    const/16 v41, 0x0

    const/16 v42, 0x0

    const/16 v44, 0x0

    const/16 v46, 0x0

    const/16 v48, 0x0

    const/16 v49, 0x0

    const/16 v51, 0x0

    move-object v11, v8

    move-object v12, v8

    move-object v13, v8

    move-object v14, v9

    move-object v15, v9

    move-object/from16 v16, v9

    move-object/from16 v17, v9

    move-object/from16 v18, v9

    move-object/from16 v19, v9

    move-object/from16 v20, v9

    move-object/from16 v22, v8

    move-object/from16 v26, v8

    move-object/from16 v27, v8

    move-object/from16 v28, v8

    move-object/from16 v29, v8

    move-object/from16 v32, v8

    move-object/from16 v33, v8

    move-object/from16 v34, v8

    move-object/from16 v35, v8

    move-object/from16 v36, v8

    move-object/from16 v38, v8

    invoke-direct/range {v3 .. v52}, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/String;Lcom/usercentrics/sdk/v2/settings/data/ConsentDisclosureObject;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;ZLjava/lang/String;Z)V

    move-object v2, v3

    :cond_b1
    iget-object v1, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->e:Ljava/lang/String;

    iget-object v3, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->p:Ljava/util/List;

    iget-object v5, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->m:Ljava/util/List;

    new-instance v6, Lzpg;

    iget-object v4, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->G:Ljava/lang/String;

    iget-object v7, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->I:Ljava/lang/String;

    invoke-direct {v6, v4, v7}, Lzpg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->n:Ljava/util/List;

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_cc

    iget-object v4, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->f:Ljava/util/List;

    :cond_cc
    move-object v7, v4

    check-cast v7, Ljava/util/List;

    iget-object v8, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->o:Ljava/util/List;

    iget-object v9, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->j:Ljava/lang/String;

    invoke-interface {v0}, Lsn5;->d()Ljava/lang/String;

    move-result-object v10

    instance-of v4, v0, Lcom/usercentrics/sdk/v2/settings/data/ServiceConsentTemplate;

    if-eqz v4, :cond_11d

    move-object v11, v0

    check-cast v11, Lcom/usercentrics/sdk/v2/settings/data/ServiceConsentTemplate;

    iget-object v11, v11, Lcom/usercentrics/sdk/v2/settings/data/ServiceConsentTemplate;->k:Ljava/util/List;

    if-eqz v11, :cond_11d

    move-object v12, v11

    check-cast v12, Ljava/util/Collection;

    invoke-interface {v12}, Ljava/util/Collection;->isEmpty()Z

    move-result v12

    const/4 v13, 0x1

    xor-int/2addr v12, v13

    if-ne v12, v13, :cond_11d

    check-cast v11, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    const/16 v12, 0xa

    invoke-static {v11, v12}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v12

    invoke-direct {v3, v12}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_fe
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_126

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    move-object/from16 v13, p2

    iget-object v14, v13, Lcom/usercentrics/sdk/v2/translation/data/LegalBasisLocalization;->c:Ljava/util/Map;

    if-eqz v14, :cond_119

    invoke-interface {v14, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    if-eqz v14, :cond_119

    move-object v12, v14

    :cond_119
    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_fe

    :cond_11d
    move-object v11, v3

    check-cast v11, Ljava/util/Collection;

    invoke-interface {v11}, Ljava/util/Collection;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_128

    :cond_126
    :goto_126
    move-object v11, v3

    goto :goto_12f

    :cond_128
    iget-object v3, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->x:Ljava/lang/String;

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    goto :goto_126

    :goto_12f
    if-eqz v1, :cond_139

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_139

    :goto_137
    move-object v12, v1

    goto :goto_13c

    :cond_139
    const-string v1, ""

    goto :goto_137

    :goto_13c
    new-instance v14, Luqg;

    iget-object v1, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->i:Ljava/lang/String;

    iget-object v3, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->D:Ljava/lang/String;

    iget-object v13, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->h:Ljava/lang/String;

    invoke-direct {v14, v1, v3, v13}, Luqg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v15, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->C:Ljava/lang/String;

    iget-object v1, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->k:Ljava/util/List;

    new-instance v3, Lorg;

    iget-object v13, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->F:Ljava/lang/String;

    iget-object v0, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->w:Ljava/lang/String;

    move-object/from16 v16, v1

    iget-object v1, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->y:Ljava/lang/String;

    move/from16 v17, v4

    iget-object v4, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->E:Ljava/lang/String;

    invoke-direct {v3, v13, v0, v1, v4}, Lorg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface/range {p0 .. p0}, Lsn5;->c()Ljava/lang/String;

    move-result-object v18

    if-eqz v17, :cond_16a

    move-object/from16 v0, p0

    check-cast v0, Lcom/usercentrics/sdk/v2/settings/data/ServiceConsentTemplate;

    iget-object v0, v0, Lcom/usercentrics/sdk/v2/settings/data/ServiceConsentTemplate;->l:Ljava/lang/Boolean;

    :goto_168
    move-object v13, v0

    goto :goto_16d

    :cond_16a
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_168

    :goto_16d
    iget-object v0, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->K:Ljava/lang/Long;

    iget-object v1, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->L:Ljava/lang/Boolean;

    iget-object v4, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->M:Ljava/lang/String;

    move-object/from16 v19, v0

    iget-object v0, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->N:Lcom/usercentrics/sdk/v2/settings/data/ConsentDisclosureObject;

    move-object/from16 v22, v0

    iget-object v0, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->O:Ljava/lang/String;

    iget-boolean v2, v2, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsService;->P:Z

    move-object/from16 v21, v4

    new-instance v4, Liac;

    move-object/from16 v23, v0

    move-object/from16 v20, v1

    move/from16 v24, v2

    move-object/from16 v17, v3

    invoke-direct/range {v4 .. v24}, Liac;-><init>(Ljava/util/List;Lzpg;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/Boolean;Luqg;Ljava/lang/String;Ljava/util/List;Lorg;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/String;Lcom/usercentrics/sdk/v2/settings/data/ConsentDisclosureObject;Ljava/lang/String;Z)V

    return-object v4
.end method

.method public static v(Ljava/lang/String;)[I
    .registers 6

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_24

    new-instance v0, Ljava/util/StringTokenizer;

    const-string v1, "."

    invoke-direct {v0, p0, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v1

    new-array v2, v1, [I

    const/4 v3, 0x0

    :goto_14
    if-ge v3, v1, :cond_23

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    :cond_23
    return-object v2

    :cond_24
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Version string is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2c
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_2c} :catch_2c

    :catch_2c
    move-exception v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unable to parse HTTP flags version string: `"

    const-string v3, "`"

    invoke-static {v2, p0, v3}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static x(Le79;Ljava/lang/String;Ljava/lang/String;Z)Lqie;
    .registers 8

    const-string v0, "Cronet ResolvedFlags#resolve"

    invoke-static {v0}, Llni;->h(Ljava/lang/String;)V

    :try_start_5
    invoke-static {p2}, Lqie;->v(Ljava/lang/String;)[I

    move-result-object p2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0}, Le79;->b()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1a
    :goto_1a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;
    :try_end_26
    .catchall {:try_start_5 .. :try_end_26} :catchall_6a

    :try_start_26
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lz69;

    invoke-static {v2, p1, p2, p3}, Lgyh;->b(Lz69;Ljava/lang/String;[IZ)Lgyh;

    move-result-object v2

    if-eqz v2, :cond_1a

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3b
    .catch Ljava/lang/RuntimeException; {:try_start_26 .. :try_end_3b} :catch_3c
    .catchall {:try_start_26 .. :try_end_3b} :catchall_6a

    goto :goto_1a

    :catch_3c
    move-exception p0

    :try_start_3d
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unable to resolve HTTP flag `"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "`"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :cond_5f
    new-instance p0, Lqie;

    const/16 p1, 0xe

    invoke-direct {p0, v0, p1}, Lqie;-><init>(Ljava/lang/Object;B)V
    :try_end_66
    .catchall {:try_start_3d .. :try_end_66} :catchall_6a

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-object p0

    :catchall_6a
    move-exception p0

    :try_start_6b
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_6e
    .catchall {:try_start_6b .. :try_end_6e} :catchall_6f

    goto :goto_73

    :catchall_6f
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_73
    throw p0
.end method


# virtual methods
.method public final A(Landroid/view/View;)I
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Llph;

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/f;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/f;->getDecoratedRight(Landroid/view/View;)I

    move-result p0

    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr p0, p1

    return p0
.end method

.method public final I(IILjava/lang/Object;)V
    .registers 4

    return-void
.end method

.method public final S(II)V
    .registers 4

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    iget-object p0, p0, Ltjg;->k:Lokg;

    iget-object v0, p0, Lokg;->c:Llkg;

    invoke-interface {v0, p1, p2}, Llkg;->c(II)V

    iget-object p0, p0, Lokg;->b:Lkjg;

    invoke-virtual {p0}, Lkjg;->b()V

    return-void
.end method

.method public final V(Lcom/opera/android/oauth2/OperaAccessToken;)V
    .registers 4

    new-instance v0, Ldhf;

    iget-object v1, p0, Lqie;->b:Ljava/lang/Object;

    check-cast v1, Lab;

    invoke-direct {v0, p0, p1, v1}, Ldhf;-><init>(Lqie;Lcom/opera/android/oauth2/OperaAccessToken;Lab;)V

    invoke-virtual {v0}, Lyi2;->k()V

    return-void
.end method

.method public final a(Z)V
    .registers 4

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lbx7;

    new-instance v0, Lgh2;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p0, p1}, Lgh2;-><init>(BLjava/lang/Object;Z)V

    const/4 p0, 0x7

    invoke-static {p0, v0}, Lorg/chromium/base/task/PostTask;->d(ILjava/lang/Runnable;)V

    return-void
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lab;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lab;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final c()V
    .registers 2

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lx79;

    iget-object p0, p0, Lx79;->e:Ljava/lang/Object;

    check-cast p0, Lnpf;

    const-string v0, "loadAd: onAdImpression"

    invoke-virtual {p0, v0}, Lnpf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lnpf;->c:Lcom/google/android/gms/ads/mediation/MediationBannerAdCallback;

    if-eqz p0, :cond_14

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdImpression()V

    :cond_14
    return-void
.end method

.method public final d(Landroid/view/View;)I
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Llph;

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/f;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/f;->getDecoratedLeft(Landroid/view/View;)I

    move-result p0

    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr p0, p1

    return p0
.end method

.method public final e(Lwx5;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lgbb;

    invoke-virtual {p0, p1}, Lgbb;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final f(II)V
    .registers 3

    return-void
.end method

.method public final g(Lcm;)V
    .registers 4

    iget-byte v0, p0, Lqie;->a:B

    const-string v1, "loadAd: onAdFailedToLoad, error="

    packed-switch v0, :pswitch_data_52

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lghf;

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lqpf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lqpf;->a(Ljava/lang/String;)V

    iget v0, p1, Lcm;->b:I

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object p0, p0, Lqpf;->b:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :pswitch_2c
    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lx79;

    iget-object p0, p0, Lx79;->e:Ljava/lang/Object;

    check-cast p0, Lnpf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnpf;->a(Ljava/lang/String;)V

    iget v0, p1, Lcm;->b:I

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object p0, p0, Lnpf;->a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    nop

    :pswitch_data_52
    .packed-switch 0x4
        :pswitch_2c
    .end packed-switch
.end method

.method public final h()V
    .registers 3

    iget-object v0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast v0, Landroid/util/Pair;

    if-eqz v0, :cond_14

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ldej;

    sget-object v1, Lhjm;->b:Lhjm;

    iget-object v0, v0, Ldej;->b:Lmej;

    invoke-interface {v0, v1}, Lmej;->Q(Lhjm;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lqie;->b:Ljava/lang/Object;

    :cond_14
    return-void
.end method

.method public final i()I
    .registers 1

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/f;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/f;->getPaddingLeft()I

    move-result p0

    return p0
.end method

.method public final k(Landroid/app/assist/AssistStructure$ViewNode;)Lnf2;
    .registers 5

    invoke-virtual {p1}, Landroid/app/assist/AssistStructure$ViewNode;->getInputType()I

    move-result p1

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lehc;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lehc;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p0

    :cond_d
    move-object v0, p0

    check-cast v0, Lmea;

    invoke-virtual {v0}, Lmea;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-virtual {v0}, Lmea;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/Pair;

    iget-object v1, v0, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    iget-object v0, v0, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v0, Lnf2;

    and-int v2, p1, v1

    if-ne v2, v1, :cond_d

    return-object v0

    :cond_2d
    const/4 p0, 0x0

    return-object p0
.end method

.method public final l(Ljava/lang/Object;Ljava/io/File;Ltrf;)Z
    .registers 7

    check-cast p1, Ljava/io/InputStream;

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Ljl6;

    const/high16 p3, 0x10000

    const-class v0, [B

    invoke-virtual {p0, v0, p3}, Ljl6;->i(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [B

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_12
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_17} :catch_3c
    .catchall {:try_start_12 .. :try_end_17} :catchall_32

    :goto_17
    :try_start_17
    invoke-virtual {p1, p3}, Ljava/io/InputStream;->read([B)I

    move-result p2

    const/4 v1, -0x1

    if-eq p2, v1, :cond_22

    invoke-virtual {v2, p3, v0, p2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_17

    :cond_22
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_25} :catch_30
    .catchall {:try_start_17 .. :try_end_25} :catchall_2d

    :try_start_25
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_28} :catch_28

    :catch_28
    invoke-virtual {p0, p3}, Ljl6;->o(Ljava/lang/Object;)V

    const/4 v0, 0x1

    goto :goto_44

    :catchall_2d
    move-exception p1

    move-object v1, v2

    goto :goto_33

    :catch_30
    move-object v1, v2

    goto :goto_3c

    :catchall_32
    move-exception p1

    :goto_33
    if-eqz v1, :cond_38

    :try_start_35
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_38} :catch_38

    :catch_38
    :cond_38
    invoke-virtual {p0, p3}, Ljl6;->o(Ljava/lang/Object;)V

    throw p1

    :catch_3c
    :goto_3c
    if-eqz v1, :cond_41

    :try_start_3e
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_41} :catch_41

    :catch_41
    :cond_41
    invoke-virtual {p0, p3}, Ljl6;->o(Ljava/lang/Object;)V

    :goto_44
    return v0
.end method

.method public final m()I
    .registers 2

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/f;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/f;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/f;->getPaddingRight()I

    move-result p0

    sub-int/2addr v0, p0

    return v0
.end method

.method public final n(Loml;Ljava/lang/Object;)Lp1j;
    .registers 5

    new-instance v0, Lq1j;

    invoke-direct {v0, p1, p2}, Lq1j;-><init>(Loml;Ljava/lang/Object;)V

    iget-object p1, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayDeque;

    monitor-enter p1

    :try_start_a
    iget-object p2, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayDeque;

    invoke-virtual {p2}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p2

    iget-object v1, p0, Lqie;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1, v0}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    monitor-exit p1
    :try_end_1a
    .catchall {:try_start_a .. :try_end_1a} :catchall_27

    if-eqz p2, :cond_1f

    invoke-virtual {p0}, Lqie;->o()V

    :cond_1f
    new-instance p1, Lp1j;

    invoke-direct {p1, p0, v0}, Lp1j;-><init>(Lqie;Lq1j;)V

    return-object p1

    :goto_25
    :try_start_25
    monitor-exit p1
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_27

    throw p0

    :catchall_27
    move-exception p0

    goto :goto_25
.end method

.method public final o()V
    .registers 6

    iget-object v0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayDeque;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Lqie;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lq1j;

    if-nez v1, :cond_13

    monitor-exit v0

    return-void

    :cond_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_5 .. :try_end_14} :catchall_24

    iget-object v0, v1, Lq1j;->a:Loml;

    iget-object v2, v1, Lq1j;->b:Ljava/lang/Object;

    new-instance v3, Ljri;

    const/4 v4, 0x6

    invoke-direct {v3, p0, v1, v4}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, v3}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-void

    :goto_22
    :try_start_22
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_24

    throw p0

    :catchall_24
    move-exception p0

    goto :goto_22
.end method

.method public final onAdClicked()V
    .registers 2

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lx79;

    iget-object p0, p0, Lx79;->e:Ljava/lang/Object;

    check-cast p0, Lnpf;

    const-string v0, "loadAd: onAdClicked"

    invoke-virtual {p0, v0}, Lnpf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lnpf;->c:Lcom/google/android/gms/ads/mediation/MediationBannerAdCallback;

    if-eqz p0, :cond_14

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdClicked()V

    :cond_14
    return-void
.end method

.method public final onAdLoaded(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lqie;->a:B

    packed-switch v0, :pswitch_data_4e

    check-cast p1, Li2i;

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lghf;

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lqpf;

    const-string v0, "loadAd: onAdLoaded"

    invoke-virtual {p0, v0}, Lqpf;->a(Ljava/lang/String;)V

    iput-object p1, p0, Lqpf;->e:Lm4b;

    iget-object p1, p0, Lqpf;->b:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p1, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onSuccess(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    iput-object p1, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    return-void

    :pswitch_21
    check-cast p1, Lq13;

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lx79;

    iget-object p0, p0, Lx79;->e:Ljava/lang/Object;

    check-cast p0, Lnpf;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "loadAd: onAdLoaded, refresh="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Lq13;->a:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnpf;->a(Ljava/lang/String;)V

    iget-object p1, p0, Lnpf;->c:Lcom/google/android/gms/ads/mediation/MediationBannerAdCallback;

    if-nez p1, :cond_4c

    iget-object p1, p0, Lnpf;->a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p1, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onSuccess(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/ads/mediation/MediationBannerAdCallback;

    iput-object p1, p0, Lnpf;->c:Lcom/google/android/gms/ads/mediation/MediationBannerAdCallback;

    :cond_4c
    return-void

    nop

    :pswitch_data_4e
    .packed-switch 0x4
        :pswitch_21
    .end packed-switch
.end method

.method public final p(Ljava/lang/String;)Landroid/text/SpannableStringBuilder;
    .registers 10

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lwh5;

    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Lpkl;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, Lpkl;-><init>(Ljava/lang/String;Lmt5;)V

    invoke-static {v2}, Lt1j;->a(Lkotlin/jvm/functions/Function2;)Lk1j;

    move-result-object v2

    :cond_18
    :goto_18
    invoke-virtual {v2}, Lk1j;->hasNext()Z

    move-result v4

    const-string v5, "Unhandled end tag "

    const-string v6, " in text "

    if-eqz v4, :cond_9d

    invoke-virtual {v2}, Lk1j;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lokl;

    if-eqz v4, :cond_99

    instance-of v7, v4, Lmkl;

    if-eqz v7, :cond_8d

    check-cast v4, Lmkl;

    iget-object v7, v4, Lmkl;->a:Ljava/lang/String;

    iget-boolean v4, v4, Lmkl;->b:Z

    if-eqz v4, :cond_65

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v7, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_59

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, v7, v0}, Lwh5;->a(Ljava/lang/String;Landroid/text/SpannableStringBuilder;)Z

    move-result v4

    if-nez v4, :cond_18

    invoke-static {v5, v7, v6, p1}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    return-object v3

    :cond_59
    const-string p0, "End tag "

    const-string v0, " with no corresponding start tag in text "

    invoke-static {p0, v7, v0, p1}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    return-object v3

    :cond_65
    invoke-virtual {p0, v7, v0}, Lwh5;->b(Ljava/lang/String;Landroid/text/SpannableStringBuilder;)Ltil;

    move-result-object v4

    instance-of v5, v4, Lril;

    if-eqz v5, :cond_77

    check-cast v4, Lril;

    iget-boolean v4, v4, Lril;->a:Z

    if-eqz v4, :cond_18

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18

    :cond_77
    sget-object p0, Lsil;->a:Lsil;

    invoke-virtual {v4, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_89

    const-string p0, "Unhandled start tag "

    invoke-static {p0, v7, v6, p1}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v3

    :cond_89
    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_8d
    instance-of v5, v4, Lnkl;

    if-eqz v5, :cond_99

    check-cast v4, Lnkl;

    iget-object v4, v4, Lnkl;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_18

    :cond_99
    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_9d
    new-instance v2, Lr1i;

    invoke-direct {v2, v1}, Lr1i;-><init>(Ljava/util/List;)V

    invoke-virtual {v2}, Lr1i;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a6
    move-object v2, v1

    check-cast v2, Lq1i;

    iget-object v2, v2, Lq1i;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ListIterator;

    invoke-interface {v2}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v4

    if-eqz v4, :cond_c7

    invoke-interface {v2}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2, v0}, Lwh5;->a(Ljava/lang/String;Landroid/text/SpannableStringBuilder;)Z

    move-result v4

    if-nez v4, :cond_a6

    invoke-static {v5, v2, v6, p1}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    return-object v3

    :cond_c7
    return-object v0
.end method

.method public final q(Ljava/lang/String;)Lg4h;
    .registers 3

    sget-object v0, Laxn;->q:Lzwn;

    invoke-virtual {v0}, Lzwn;->a()Z

    move-result v0

    if-eqz v0, :cond_1e

    new-instance v0, Lg4h;

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/support_lib_boundary/ProfileStoreBoundaryInterface;

    invoke-interface {p0, p1}, Lorg/chromium/support_lib_boundary/ProfileStoreBoundaryInterface;->getOrCreateProfile(Ljava/lang/String;)Ljava/lang/reflect/InvocationHandler;

    move-result-object p0

    const-class p1, Lorg/chromium/support_lib_boundary/ProfileBoundaryInterface;

    invoke-static {p1, p0}, Lfr3;->m(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/chromium/support_lib_boundary/ProfileBoundaryInterface;

    invoke-direct {v0, p0}, Lg4h;-><init>(Lorg/chromium/support_lib_boundary/ProfileBoundaryInterface;)V

    return-object v0

    :cond_1e
    invoke-static {}, Laxn;->a()Ljava/lang/UnsupportedOperationException;

    move-result-object p0

    throw p0
.end method

.method public final r(Ljava/lang/String;)Ljava/util/regex/Pattern;
    .registers 4

    iget-object v0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast v0, Lisd;

    monitor-enter v0

    :try_start_5
    iget-object v1, v0, Lisd;->b:Ljava/lang/Object;

    check-cast v1, Lyp9;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_2b

    monitor-exit v0

    check-cast v1, Ljava/util/regex/Pattern;

    if-nez v1, :cond_28

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lisd;

    monitor-enter p0

    :try_start_1b
    iget-object v1, p0, Lisd;->b:Ljava/lang/Object;

    check-cast v1, Lyp9;

    invoke-virtual {v1, p1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22
    .catchall {:try_start_1b .. :try_end_22} :catchall_26

    monitor-exit p0

    return-object v0

    :goto_24
    :try_start_24
    monitor-exit p0
    :try_end_25
    .catchall {:try_start_24 .. :try_end_25} :catchall_26

    throw p1

    :catchall_26
    move-exception p1

    goto :goto_24

    :cond_28
    return-object v1

    :goto_29
    :try_start_29
    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_29 .. :try_end_2a} :catchall_2b

    throw p0

    :catchall_2b
    move-exception p0

    goto :goto_29
.end method

.method public final t(II)V
    .registers 3

    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-byte p1, p0, Lqie;->a:B

    packed-switch p1, :pswitch_data_22

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lv7k;

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "speed_dial.enabled"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_15
    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lwzj;

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "speed_dial.large_icons"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x17
        :pswitch_15
    .end packed-switch
.end method

.method public final w(I)Landroid/view/View;
    .registers 2

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/f;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/f;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public final y(Ljava/lang/Object;)Lo94;
    .registers 4

    invoke-static {}, Lxug;->i()V

    new-instance v0, Lmgf;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lk1g;->z(Lm94;)Lo94;

    move-result-object p0

    return-object p0
.end method
