.class public final Lxk3;
.super Lcom/opera/android/suggestion/SuggestionProviderBridge;
.source "SourceFile"


# instance fields
.field public final d:Ljava/util/ArrayList;

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltcc;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lxk3;->e:Z

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v1

    new-instance v2, Lty;

    invoke-direct {v2, p0, v1, v0}, Lty;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, p2, v2}, Laib;->C(Lw6f;Ltcc;Ljava/lang/Object;)V

    new-instance p2, Ljava/util/TreeSet;

    const-string v0, "hotels"

    const-string v1, "hotel"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p2, v0}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    const-string v0, "\ud83c\udfe8"

    invoke-virtual {p2, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f14083f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f14083e

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lxk3;->d:Ljava/util/ArrayList;

    return-void
.end method

.method public static h(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "https"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "www.booking.com"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "searchresults.html"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "ss"

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "aid"

    const-string v1, "1759515"

    invoke-virtual {p0, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "label"

    const-string v1, "obs_mdot"

    invoke-virtual {p0, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final cancel()V
    .registers 1

    return-void
.end method

.method public final g(Ljava/lang/String;ZZLyv4;)V
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    if-nez p3, :cond_104

    iget-boolean v2, v0, Lxk3;->e:Z

    if-nez v2, :cond_104

    invoke-static/range {p1 .. p1}, Lwqm;->x(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_104

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    move-object/from16 v3, p1

    invoke-virtual {v3, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iget-object v0, v0, Lxk3;->d:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    move v6, v5

    :cond_26
    const-string v7, ""

    if-ge v6, v4, :cond_5c

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v6, v6, 0x1

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_26

    invoke-static {v7}, Lxk3;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    new-instance v9, Lcom/opera/android/suggestion/Suggestion;

    const/16 v18, 0x0

    const/16 v10, 0x10

    const-string v11, "Booking.com"

    const-string v12, ""

    const/4 v14, 0x0

    const/4 v15, 0x0

    const v16, 0x7fffffff

    const/16 v19, -0x1

    const/16 v20, 0x0

    move-object/from16 v17, v12

    invoke-direct/range {v9 .. v20}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    invoke-static {v9}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v1, v0}, Lyv4;->d(Ljava/util/List;)V

    return-void

    :cond_5c
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2}, Ln6h;->h(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v4

    const/4 v6, 0x6

    if-nez v4, :cond_75

    new-instance v4, Lbpd;

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-direct {v4, v2, v8, v6}, Lbpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    goto :goto_83

    :cond_75
    new-instance v8, Lbpd;

    invoke-static {v2, v4}, Ln6h;->q(Ljava/lang/String;Ljava/util/Locale;)Lehc;

    move-result-object v2

    invoke-static {v3, v4}, Ln6h;->q(Ljava/lang/String;Ljava/util/Locale;)Lehc;

    move-result-object v4

    invoke-direct {v8, v2, v4, v6}, Lbpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v4, v8

    :goto_83
    iget-object v2, v4, Lbpd;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move v8, v5

    move v9, v8

    :goto_8e
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v10

    if-ge v8, v10, :cond_c1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    move v11, v5

    :cond_99
    if-ge v11, v10, :cond_b1

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    check-cast v12, Ljava/lang/String;

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_99

    if-nez v9, :cond_b1

    const/4 v9, 0x1

    goto :goto_be

    :cond_b1
    iget-object v10, v4, Lbpd;->c:Ljava/lang/Object;

    check-cast v10, Ljava/util/List;

    invoke-interface {v10, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_be
    add-int/lit8 v8, v8, 0x1

    goto :goto_8e

    :cond_c1
    if-eqz v9, :cond_d7

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_d7

    const-string v0, " "

    invoke-virtual {v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_d2

    move-object v7, v0

    :cond_d2
    invoke-static {v7, v6}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    goto :goto_d8

    :cond_d7
    const/4 v0, 0x0

    :goto_d8
    if-nez v0, :cond_e0

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {v1, v0}, Lyv4;->d(Ljava/util/List;)V

    return-void

    :cond_e0
    const-string v2, "Booking.com: "

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0}, Lxk3;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v3, Lcom/opera/android/suggestion/Suggestion;

    const/4 v12, 0x0

    const/16 v4, 0x10

    const-string v6, ""

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v10, 0x7fffffff

    const/4 v13, -0x1

    const/4 v14, 0x0

    move-object v11, v6

    invoke-direct/range {v3 .. v14}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v1, v0}, Lyv4;->d(Ljava/util/List;)V

    return-void

    :cond_104
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {v1, v0}, Lyv4;->d(Ljava/util/List;)V

    return-void
.end method
