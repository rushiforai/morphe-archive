.class public final Lq6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Liri;

.field public final c:Lwzg;

.field public final d:Lh7f;

.field public final e:Landroid/content/res/Resources;

.field public final f:Lkze;

.field public final g:Lode;

.field public final h:Lk6e;

.field public final i:Ljbf;

.field public final j:Lb59;

.field public final k:Lumi;

.field public final l:Lqie;

.field public final m:Lp1;

.field public final n:Lcom/opera/android/Lazy;

.field public final o:Lx5f;

.field public final p:Li3j;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lnx5;Lwjh;Ljbf;Lplh;Liri;Luu1;Lkze;Lode;Lcom/opera/android/Lazy;Lx5f;Lk6e;)V
    .registers 30

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p5

    move-object/from16 v4, p9

    move-object/from16 v5, p10

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, v0, Lq6e;->a:Ljava/util/ArrayList;

    new-instance v6, Lh7f;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    iput-object v6, v0, Lq6e;->d:Lh7f;

    new-instance v6, Lqie;

    const/16 v7, 0x13

    invoke-direct {v6, v7}, Lqie;-><init>(B)V

    iput-object v6, v0, Lq6e;->l:Lqie;

    new-instance v7, Lwub;

    invoke-direct {v7, v0}, Lwub;-><init>(Ljava/lang/Object;)V

    iput-object v2, v0, Lq6e;->k:Lumi;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    iput-object v8, v0, Lq6e;->e:Landroid/content/res/Resources;

    iput-object v4, v0, Lq6e;->f:Lkze;

    iput-object v5, v0, Lq6e;->g:Lode;

    move-object/from16 v9, p13

    iput-object v9, v0, Lq6e;->h:Lk6e;

    iput-object v3, v0, Lq6e;->i:Ljbf;

    new-instance v10, Lwzg;

    move-object/from16 v11, p8

    invoke-direct {v10, v8, v11}, Lwzg;-><init>(Landroid/content/res/Resources;Luu1;)V

    iput-object v10, v0, Lq6e;->c:Lwzg;

    const/4 v8, 0x0

    new-array v11, v8, [Lbg1;

    const-string v12, "search engine manager"

    invoke-static {v1, v2, v12, v11}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v11

    iput-object v11, v0, Lq6e;->j:Lb59;

    move-object/from16 v11, p7

    iput-object v11, v0, Lq6e;->b:Liri;

    new-instance v11, Lp1;

    invoke-direct {v11, v3}, Lp1;-><init>(Ljbf;)V

    iput-object v11, v0, Lq6e;->m:Lp1;

    move-object/from16 v12, p11

    iput-object v12, v0, Lq6e;->n:Lcom/opera/android/Lazy;

    move-object/from16 v12, p12

    iput-object v12, v0, Lq6e;->o:Lx5f;

    new-instance v12, Li3j;

    new-instance v13, Lq4b;

    const/16 v14, 0x1c

    invoke-direct {v13, v0, v14}, Lq4b;-><init>(Ljava/lang/Object;B)V

    new-instance v14, Lvg4;

    const/16 v15, 0xe

    invoke-direct {v14, v1, v15}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-direct {v12, v1, v13, v14, v2}, Li3j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v12, v0, Lq6e;->p:Li3j;

    new-instance v12, Lo6e;

    invoke-direct {v12, v0, v8}, Lo6e;-><init>(Lq6e;B)V

    invoke-static {v4, v12}, Lxf8;->h0(Lekc;Lf7f;)V

    new-instance v4, Lo6e;

    const/4 v12, 0x1

    invoke-direct {v4, v0, v12}, Lo6e;-><init>(Lq6e;B)V

    invoke-static {v5, v4}, Lxf8;->h0(Lekc;Lf7f;)V

    new-instance v4, Lvy;

    const/4 v5, 0x7

    invoke-direct {v4, v0, v5}, Lvy;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Lno7;->g(Lmo7;)V

    new-instance v3, Lm6e;

    invoke-direct {v3, v0, v8}, Lm6e;-><init>(Lq6e;B)V

    invoke-virtual {v2, v3}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v3

    new-instance v4, Lm6e;

    invoke-direct {v4, v0, v12}, Lm6e;-><init>(Lq6e;B)V

    invoke-virtual {v2, v4}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {v3, v0}, Lnml;->b(Lnml;)V

    new-instance v0, Loml;

    invoke-direct {v0, v3}, Loml;-><init>(Lnml;)V

    const/4 v2, 0x0

    invoke-virtual {v6, v0, v2}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    new-instance v0, Lych;

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v8, p6

    move-object v6, v9

    move-object v4, v10

    move-object v5, v11

    invoke-direct/range {v0 .. v8}, Lych;-><init>(Landroid/content/Context;Lnx5;Lwjh;Lwzg;Lp1;Lk6e;Lwub;Lplh;)V

    return-void
.end method

.method public static e(Leri;)Ljava/lang/String;
    .registers 2

    invoke-interface {p0}, Leri;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 p0, 0x0

    return-object p0

    :cond_c
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lkri;

    invoke-virtual {p0, p1}, Lq6e;->a(Lkri;)V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lkri;

    invoke-virtual {p0, p1}, Lq6e;->m(Lkri;)V

    return-void
.end method

.method public final a(Lkri;)V
    .registers 3

    iget-object v0, p0, Lq6e;->d:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v0, p0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-interface {p1, p0}, Lkri;->a(Lq6e;)V

    :cond_10
    return-void
.end method

.method public final b()Leri;
    .registers 6

    iget-object v0, p0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_10

    sget-object p0, Leri;->a:Lcri;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lcri;->b:Lbri;

    return-object p0

    :cond_10
    iget-object v1, p0, Lq6e;->j:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "default_search_engine_long"

    const-wide/16 v3, -0x1

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-gez v3, :cond_28

    const/4 p0, 0x0

    goto :goto_2c

    :cond_28
    invoke-virtual {p0, v1, v2}, Lq6e;->c(J)Ll6e;

    move-result-object p0

    :goto_2c
    if-eqz p0, :cond_2f

    return-object p0

    :cond_2f
    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ll6e;

    iget v0, p0, Ll6e;->h:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_45

    const/4 v1, 0x2

    if-eq v0, v1, :cond_45

    sget-object p0, Leri;->a:Lcri;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lcri;->b:Lbri;

    :cond_45
    return-object p0
.end method

.method public final c(J)Ll6e;
    .registers 8

    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-eqz v0, :cond_1e

    iget-object p0, p0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_d
    if-ge v1, v0, :cond_1e

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Ll6e;

    iget-wide v3, v2, Ll6e;->b:J

    cmp-long v3, v3, p1

    if-nez v3, :cond_d

    return-object v2

    :cond_1e
    const/4 p0, 0x0

    return-object p0
.end method

.method public final f(Leri;)Ll6e;
    .registers 9

    invoke-interface {p1}, Leri;->getId()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lq6e;->c(J)Ll6e;

    move-result-object v0

    if-eqz v0, :cond_b

    return-object v0

    :cond_b
    invoke-interface {p1}, Leri;->getTitle()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :cond_17
    const/4 v4, 0x0

    if-ge v3, v1, :cond_2b

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v3, v3, 0x1

    check-cast v5, Ll6e;

    iget-object v6, v5, Ll6e;->c:Ljava/lang/String;

    invoke-static {v6, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_17

    goto :goto_2c

    :cond_2b
    move-object v5, v4

    :goto_2c
    invoke-static {p1}, Lq6e;->e(Leri;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_4b

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_36
    if-ge v2, v0, :cond_4b

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, v2, 0x1

    check-cast v1, Ll6e;

    invoke-static {v1}, Lq6e;->e(Leri;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    move-object v4, v1

    :cond_4b
    if-eq v5, v4, :cond_53

    if-eqz v5, :cond_50

    return-object v5

    :cond_50
    if-eqz v4, :cond_53

    return-object v4

    :cond_53
    return-object v5
.end method

.method public final g(Z)Z
    .registers 19

    move-object/from16 v0, p0

    iget-object v1, v0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_95

    move v2, v3

    :goto_c
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const-wide v5, 0x7ffffffffffffffcL

    const/4 v7, -0x1

    if-ge v2, v4, :cond_27

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ll6e;

    iget-wide v8, v4, Ll6e;->b:J

    cmp-long v4, v8, v5

    if-eqz v4, :cond_28

    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_27
    move v2, v7

    :cond_28
    const/4 v4, 0x1

    if-eqz p1, :cond_93

    if-ne v2, v7, :cond_95

    const-string v11, "https://chatgpt.com/?q=%s"

    invoke-static {v11}, Ll6e;->p(Ljava/lang/String;)Z

    move-result v2

    const-string v10, "ChatGPT"

    const-string v12, "ic_search_engine_chatgpt"

    const/4 v13, 0x0

    const/4 v9, 0x4

    if-eqz v2, :cond_55

    new-instance v8, Lf1a;

    new-instance v14, Li6e;

    iget-object v2, v0, Lq6e;->h:Lk6e;

    invoke-direct {v14, v2, v3}, Li6e;-><init>(Lk6e;B)V

    new-instance v15, Li6e;

    invoke-direct {v15, v2, v4}, Li6e;-><init>(Lk6e;B)V

    move-object/from16 v16, v13

    move v13, v9

    move-object v9, v10

    move-object v10, v11

    move-object v11, v12

    move-object/from16 v12, v16

    invoke-direct/range {v8 .. v15}, Lf1a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILi6e;Li6e;)V

    goto :goto_7e

    :cond_55
    sget-object v2, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v11}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v7, "\\."

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v7, v2

    :goto_62
    if-ge v3, v7, :cond_77

    aget-object v8, v2, v3

    const-string v14, "yandex"

    invoke-virtual {v14, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_74

    new-instance v8, Lfco;

    invoke-direct/range {v8 .. v13}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7e

    :cond_74
    add-int/lit8 v3, v3, 0x1

    goto :goto_62

    :cond_77
    sget-object v2, Ll6e;->k:Lhr5;

    new-instance v8, Liu4;

    invoke-direct/range {v8 .. v13}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_7e
    iget-object v0, v0, Lq6e;->c:Lwzg;

    iput-object v0, v8, Ll6e;->i:Lwzg;

    iput-wide v5, v8, Ll6e;->b:J

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x2

    if-lt v0, v2, :cond_8f

    invoke-virtual {v1, v2, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return v4

    :cond_8f
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return v4

    :cond_93
    if-ne v2, v7, :cond_96

    :cond_95
    return v3

    :cond_96
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    return v4
.end method

.method public final h(Liri;)Ljava/util/ArrayList;
    .registers 12

    iget-object v0, p0, Lq6e;->c:Lwzg;

    iget-object v1, p0, Lq6e;->m:Lp1;

    iget-object v2, p0, Lq6e;->h:Lk6e;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    const/4 v5, 0x1

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v6, p0, Lq6e;->n:Lcom/opera/android/Lazy;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "ru"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    iget-object p0, p0, Lq6e;->e:Landroid/content/res/Resources;

    if-eqz v6, :cond_31

    const v6, 0x7f180008

    invoke-virtual {p0, v6}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object p0

    goto :goto_38

    :cond_31
    const v6, 0x7f180007

    invoke-virtual {p0, v6}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object p0

    :goto_38
    :try_start_38
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-interface {p0, v6, v7, v7}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    const-string v8, "search"

    const/4 v9, 0x2

    invoke-interface {p0, v9, v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    :cond_49
    :goto_49
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    if-eq v7, v5, :cond_6e

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v7

    if-ne v7, v9, :cond_49

    invoke-static {p0, v0, v1, v2}, Lx1p;->I(Landroid/content/res/XmlResourceParser;Lwzg;Lp1;Lk6e;)Lj6e;

    move-result-object v7

    iget-object v8, v7, Lj6e;->a:Ll6e;

    iget v8, v8, Ll6e;->h:I

    if-eq v8, v5, :cond_63

    if-eq v8, v9, :cond_63

    move v8, v6

    goto :goto_64

    :cond_63
    move v8, v5

    :goto_64
    if-eqz v8, :cond_6a

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_49

    :cond_6a
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_6d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_38 .. :try_end_6d} :catch_6e
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_6d} :catch_6e

    goto :goto_49

    :catch_6e
    :cond_6e
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p1, v4}, Liri;->m(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public final i(Leri;)V
    .registers 6

    invoke-static {p1}, Lq6e;->e(Leri;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_18

    invoke-interface {p1}, Leri;->d()Z

    move-result p1

    if-eqz p1, :cond_12

    const-string p1, "u_"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_12
    iget-object p0, p0, Lq6e;->o:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-nez p1, :cond_19

    :cond_18
    return-void

    :cond_19
    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, p1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x1

    const/16 v3, 0x8

    invoke-virtual {p1, v3, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final j()Z
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_41

    iget-object v2, v0, Lq6e;->f:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    const/16 v4, 0x9

    if-eqz v2, :cond_ef

    const-wide v5, 0x7ffffffffffffffdL

    invoke-virtual {v0, v5, v6}, Lq6e;->c(J)Ll6e;

    move-result-object v2

    if-eqz v2, :cond_29

    iget-object v2, v2, Ll6e;->c:Ljava/lang/String;

    goto :goto_2a

    :cond_29
    const/4 v2, 0x0

    :goto_2a
    iget-object v7, v0, Lq6e;->g:Lode;

    invoke-virtual {v7}, Lekc;->g()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Li0a;

    iget-object v7, v0, Lq6e;->e:Landroid/content/res/Resources;

    const v8, 0x7f1401dc

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_42

    :cond_41
    return v3

    :cond_42
    new-instance v2, Lnn;

    invoke-direct {v2, v4}, Lnn;-><init>(B)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    const-string v2, "opera-aria://ui/"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v7, "language"

    invoke-static {}, Lorg/chromium/base/LocaleUtils;->getDefaultLocaleString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v7, "q"

    const-string v8, "PLACEHOLDER"

    invoke-virtual {v4, v7, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v7, "%s"

    invoke-virtual {v4, v8, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ll6e;->p(Ljava/lang/String;)Z

    move-result v4

    const/4 v7, 0x1

    const-string v13, "ic_ask_ai_engine"

    const/4 v14, 0x0

    const/4 v10, 0x4

    if-eqz v4, :cond_a2

    new-instance v9, Lf1a;

    new-instance v15, Li6e;

    iget-object v2, v0, Lq6e;->h:Lk6e;

    invoke-direct {v15, v2, v3}, Li6e;-><init>(Lk6e;B)V

    new-instance v3, Li6e;

    invoke-direct {v3, v2, v7}, Li6e;-><init>(Lk6e;B)V

    move-object/from16 v16, v14

    move v14, v10

    move-object v10, v11

    move-object v11, v12

    move-object v12, v13

    move-object/from16 v13, v16

    move-object/from16 v16, v3

    invoke-direct/range {v9 .. v16}, Lf1a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILi6e;Li6e;)V

    goto :goto_e5

    :cond_a2
    sget-object v4, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v12}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v8, "\\."

    invoke-virtual {v4, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v8, v4

    :goto_af
    if-ge v3, v8, :cond_c4

    aget-object v9, v4, v3

    const-string v15, "yandex"

    invoke-virtual {v15, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c1

    new-instance v9, Lfco;

    invoke-direct/range {v9 .. v14}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e5

    :cond_c1
    add-int/lit8 v3, v3, 0x1

    goto :goto_af

    :cond_c4
    sget-object v3, Ll6e;->k:Lhr5;

    invoke-virtual {v12, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d2

    new-instance v9, Ll42;

    invoke-direct/range {v9 .. v14}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e5

    :cond_d2
    const-string v2, "https://chatgpt.com/?q"

    invoke-virtual {v12, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e0

    new-instance v9, Liu4;

    invoke-direct/range {v9 .. v14}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e5

    :cond_e0
    new-instance v9, Ll6e;

    invoke-direct/range {v9 .. v14}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_e5
    iget-object v0, v0, Lq6e;->c:Lwzg;

    iput-object v0, v9, Ll6e;->i:Lwzg;

    iput-wide v5, v9, Ll6e;->b:J

    invoke-virtual {v1, v7, v9}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return v7

    :cond_ef
    new-instance v0, Lnn;

    invoke-direct {v0, v4}, Lnn;-><init>(B)V

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    move-result v0

    return v0
.end method

.method public final k(Leri;)V
    .registers 5

    instance-of v0, p1, Ll6e;

    if-eqz v0, :cond_28

    iget-object v0, p0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {p1}, Leri;->d()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {p1}, Leri;->k()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_28

    check-cast p1, Ll6e;

    iget-object v0, p1, Ll6e;->d:Ljava/lang/String;

    new-instance v1, Ljkc;

    const/16 v2, 0xd

    invoke-direct {v1, p0, p1, v2}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lq6e;->p:Li3j;

    invoke-virtual {p0, v0, v1}, Li3j;->s(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    :cond_28
    return-void
.end method

.method public final l()V
    .registers 3

    iget-object v0, p0, Lq6e;->d:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkri;

    invoke-interface {v1, p0}, Lkri;->a(Lq6e;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final m(Lkri;)V
    .registers 2

    iget-object p0, p0, Lq6e;->d:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final n(Leri;)V
    .registers 9

    instance-of v0, p1, Ll6e;

    if-eqz v0, :cond_4d

    check-cast p1, Ll6e;

    iget-object v0, p0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4d

    iget v1, p1, Ll6e;->h:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_4d

    const/4 v2, 0x2

    if-eq v1, v2, :cond_4d

    iget-object v1, p0, Lq6e;->j:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    iget-wide v2, p1, Ll6e;->b:J

    const-wide/16 v4, -0x1

    const-string v6, "default_search_engine_long"

    invoke-interface {v1, v6, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_2f

    invoke-static {v1, v6}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    :cond_2f
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    new-instance v0, Lhpd;

    const/16 v1, 0xc

    invoke-direct {v0, p0, p1, v1}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Lq6e;->k:Lumi;

    invoke-interface {p1, v0}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    const/4 p1, 0x0

    iget-object v1, p0, Lq6e;->l:Lqie;

    invoke-virtual {v1, v0, p1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    invoke-virtual {p0}, Lq6e;->l()V

    :cond_4d
    return-void
.end method

.method public final o(Leri;)V
    .registers 6

    instance-of v0, p1, Ll6e;

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lq6e;->j:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "default_search_engine_long"

    invoke-interface {p1}, Leri;->getId()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lq6e;->l()V

    invoke-virtual {p0, p1}, Lq6e;->i(Leri;)V

    :cond_2b
    return-void
.end method
