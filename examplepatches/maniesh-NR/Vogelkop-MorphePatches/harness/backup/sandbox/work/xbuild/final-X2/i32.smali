.class public final Li32;
.super Lldk;
.source "SourceFile"


# instance fields
.field public final synthetic j:B

.field public final k:Ljava/lang/Object;

.field public l:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Ljava/lang/String;Lo8f;)V
    .registers 6

    const/16 v0, 0x9

    iput-byte v0, p0, Li32;->j:B

    .line 57
    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0, p2}, Lldk;-><init>(Ltcl;)V

    .line 58
    iput-object p4, p0, Li32;->l:Ljava/lang/Object;

    const/4 p4, 0x0

    .line 59
    new-array p4, p4, [Lbg1;

    invoke-static {p1, p2, p3, p4}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Li32;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcul;Landroid/content/Context;Lumi;)V
    .registers 5

    const/16 v0, 0xc

    iput-byte v0, p0, Li32;->j:B

    .line 60
    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    .line 61
    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p3}, Lldk;-><init>(Ltcl;)V

    .line 62
    const-string p1, "top_activated_favorites"

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    invoke-static {p2, p3, p1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Li32;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Li16;Landroid/content/Context;Lumi;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Li32;->j:B

    .line 52
    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    .line 53
    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p3}, Lldk;-><init>(Ltcl;)V

    .line 54
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Li32;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Li9c;Lumi;)V
    .registers 4

    const/4 v0, 0x6

    iput-byte v0, p0, Li32;->j:B

    sget-object v0, Lngh;->a:Lr16;

    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    .line 55
    invoke-direct {p0, p2}, Lldk;-><init>(Ltcl;)V

    .line 56
    new-instance p2, Lq4b;

    const/4 v0, 0x5

    invoke-direct {p2, p1, v0}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Li32;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqb7;Landroid/content/Context;Lumi;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Li32;->j:B

    .line 49
    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    .line 50
    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p3}, Lldk;-><init>(Ltcl;)V

    .line 51
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Li32;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ls6h;Landroid/content/Context;Lumi;)V
    .registers 5

    const/4 v0, 0x4

    iput-byte v0, p0, Li32;->j:B

    .line 43
    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    .line 44
    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p3}, Lldk;-><init>(Ltcl;)V

    .line 45
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Li32;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ls9i;Landroid/content/Context;Lumi;)V
    .registers 5

    const/4 v0, 0x5

    iput-byte v0, p0, Li32;->j:B

    .line 40
    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    .line 41
    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p3}, Lldk;-><init>(Ltcl;)V

    .line 42
    const-string p1, "ads_first_impressions"

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    invoke-static {p2, p3, p1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Li32;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lumi;Lcom/opera/android/Lazy;Lj32;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Li32;->j:B

    sget-object v0, Lngh;->a:Lr16;

    iput-object p3, p0, Li32;->l:Ljava/lang/Object;

    .line 66
    invoke-direct {p0, p1}, Lldk;-><init>(Ltcl;)V

    .line 67
    new-instance p1, Lx2;

    const/16 v0, 0x14

    invoke-direct {p1, p2, p3, v0}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Li32;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lumi;Lk32;B)V
    .registers 5

    iput-byte p3, p0, Li32;->j:B

    packed-switch p3, :pswitch_data_28

    sget-object p3, Lngh;->a:Lr16;

    invoke-direct {p0, p1}, Lldk;-><init>(Ltcl;)V

    new-instance p1, Lp2g;

    sget-object p3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v0, 0x0

    invoke-direct {p1, p3, v0}, Lp2g;-><init>(Ljava/util/List;Lc3g;)V

    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    iput-object p2, p0, Li32;->k:Ljava/lang/Object;

    return-void

    :pswitch_17
    sget-object p3, Lngh;->a:Lr16;

    invoke-direct {p0, p1}, Lldk;-><init>(Ltcl;)V

    iput-object p2, p0, Li32;->k:Ljava/lang/Object;

    return-void

    :pswitch_1f
    sget-object p3, Lngh;->a:Lr16;

    invoke-direct {p0, p1}, Lldk;-><init>(Ltcl;)V

    iput-object p2, p0, Li32;->k:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_28
    .packed-switch 0xa
        :pswitch_1f
        :pswitch_17
    .end packed-switch
.end method

.method public constructor <init>(Lxqe;Lumi;Lkqd;)V
    .registers 5

    const/4 v0, 0x7

    iput-byte v0, p0, Li32;->j:B

    .line 63
    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    .line 64
    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p2}, Lldk;-><init>(Ltcl;)V

    .line 65
    iput-object p3, p0, Li32;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lyqa;Landroid/content/Context;Lumi;)V
    .registers 5

    const/4 v0, 0x3

    iput-byte v0, p0, Li32;->j:B

    .line 46
    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    .line 47
    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p3}, Lldk;-><init>(Ltcl;)V

    .line 48
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Li32;->k:Ljava/lang/Object;

    return-void
.end method

.method public static m(Lvpb;Ljava/net/URI;)Ljava/util/ArrayList;
    .registers 15

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v4, 0x0

    :goto_10
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_89

    invoke-virtual {p0, v4}, Lvpb;->c(I)Lorb;

    move-result-object v5

    iget-object v6, v5, Lorb;->a:Lorg/json/JSONObject;

    const-string v7, "expires"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v7

    cmp-long v9, v7, v0

    if-lez v9, :cond_86

    new-instance v9, Ljava/net/HttpCookie;

    const-string v10, "name"

    invoke-virtual {v5, v10}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "value"

    const/4 v12, 0x0

    invoke-virtual {v5, v11, v12}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Ljava/net/HttpCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "comment"

    invoke-virtual {v5, v10, v12}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/net/HttpCookie;->setComment(Ljava/lang/String;)V

    const-string v10, "domain"

    invoke-virtual {v5, v10, v12}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/net/HttpCookie;->setDomain(Ljava/lang/String;)V

    const-string v10, "path"

    invoke-virtual {v5, v10, v12}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/net/HttpCookie;->setPath(Ljava/lang/String;)V

    const-string v10, "portlist"

    invoke-virtual {v5, v10, v12}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5}, Ljava/net/HttpCookie;->setPortlist(Ljava/lang/String;)V

    const-string v5, "discard"

    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {v9, v5}, Ljava/net/HttpCookie;->setDiscard(Z)V

    const-string v5, "secure"

    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {v9, v5}, Ljava/net/HttpCookie;->setSecure(Z)V

    const-string v5, "version"

    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v9, v5}, Ljava/net/HttpCookie;->setVersion(I)V

    sub-long/2addr v7, v0

    const-wide/16 v5, 0x3e8

    div-long/2addr v7, v5

    invoke-virtual {v9, v7, v8}, Ljava/net/HttpCookie;->setMaxAge(J)V

    new-instance v5, Lpag;

    invoke-direct {v5, p1, v9}, Lpag;-><init>(Ljava/net/URI;Ljava/net/HttpCookie;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_86
    add-int/lit8 v4, v4, 0x1

    goto :goto_10

    :cond_89
    return-object v2
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Li32;->j:B

    const/4 v2, 0x6

    const-string v3, "data"

    const/4 v4, 0x5

    const/4 v5, 0x4

    const/4 v6, 0x2

    const/4 v7, 0x3

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x0

    iget-object v11, v0, Li32;->k:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_344

    check-cast v11, Lb59;

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "favorites_usage"

    invoke-interface {v0, v1, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-eqz v0, :cond_56

    :try_start_28
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    :goto_2d
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v10, v0, :cond_56

    invoke-virtual {v2, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v3, "id"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "activated_count"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v5, "last_activated_time"

    const-wide/16 v6, -0x1

    invoke-virtual {v0, v5, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v5

    new-instance v0, Lbul;

    invoke-direct {v0, v3, v4, v5, v6}, Lbul;-><init>(Ljava/lang/String;IJ)V

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_53
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_53} :catch_56

    add-int/lit8 v10, v10, 0x1

    goto :goto_2d

    :catch_56
    :cond_56
    return-object v1

    :pswitch_57
    check-cast v11, Lk32;

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapk;

    iget-object v0, v0, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v1, Lr4k;

    const/16 v2, 0x11

    invoke-direct {v1, v2}, Lr4k;-><init>(B)V

    invoke-static {v0, v9, v10, v1}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0

    :pswitch_6f
    check-cast v11, Lk32;

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapk;

    iget-object v0, v0, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v1, Lr4k;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Lr4k;-><init>(B)V

    invoke-static {v0, v9, v10, v1}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0

    :pswitch_87
    check-cast v11, Lb59;

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, ""

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9e

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_f3

    :cond_9e
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :try_start_a3
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "any"

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-nez v1, :cond_b2

    move-object v4, v8

    goto :goto_b7

    :cond_b2
    new-instance v4, Lvpb;

    invoke-direct {v4, v1}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    :goto_b7
    if-eqz v4, :cond_c0

    invoke-static {v4, v8}, Li32;->m(Lvpb;Ljava/net/URI;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_c0
    const-string v1, "uris"

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    :goto_ca
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_ec

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    new-instance v5, Lvpb;

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-direct {v5, v6}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    new-instance v6, Ljava/net/URI;

    invoke-direct {v6, v4}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-static {v5, v6}, Li32;->m(Lvpb;Ljava/net/URI;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    :try_end_eb
    .catch Lorg/json/JSONException; {:try_start_a3 .. :try_end_eb} :catch_f1
    .catch Ljava/net/URISyntaxException; {:try_start_a3 .. :try_end_eb} :catch_ee

    goto :goto_ca

    :cond_ec
    move-object v1, v2

    goto :goto_f3

    :catch_ee
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_f3

    :catch_f1
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_f3
    iget-object v0, v0, Li32;->l:Ljava/lang/Object;

    check-cast v0, Lo8f;

    invoke-virtual {v0, v1}, Lo8f;->run(Ljava/lang/Object;)V

    return-object v1

    :pswitch_fb
    new-instance v0, Lp2g;

    check-cast v11, Lk32;

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapk;

    iget-object v1, v1, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v2, Lr4k;

    const/16 v3, 0xd

    invoke-direct {v2, v3}, Lr4k;-><init>(B)V

    invoke-static {v1, v9, v10, v2}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapk;

    iget-object v2, v2, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v3, Lr4k;

    const/16 v4, 0xc

    invoke-direct {v3, v4}, Lr4k;-><init>(B)V

    invoke-static {v2, v9, v10, v3}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc3g;

    invoke-direct {v0, v1, v2}, Lp2g;-><init>(Ljava/util/List;Lc3g;)V

    return-object v0

    :pswitch_12d
    iget-object v0, v0, Li32;->l:Ljava/lang/Object;

    check-cast v0, Lxqe;

    iget-object v1, v0, Lxqe;->d:Landroid/content/Context;

    iget-object v2, v0, Lxqe;->e:Lqre;

    iget-object v7, v0, Lxqe;->f:[Ljava/lang/String;

    check-cast v11, Lkqd;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-static {v1}, Lare;->d(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v4

    const-string v6, "stream_id=?"

    const/4 v8, 0x0

    sget-object v5, Lxqe;->i:[Ljava/lang/String;

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    if-eqz v3, :cond_169

    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_166

    :cond_157
    invoke-static {v1, v2, v3, v11}, Lxqe;->m(Landroid/content/Context;Lqre;Landroid/database/Cursor;Lwqe;)Loqe;

    move-result-object v4

    if-eqz v4, :cond_160

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_160
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-nez v4, :cond_157

    :cond_166
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_169
    return-object v0

    :pswitch_16a
    :try_start_16a
    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Li32;->j()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_192

    new-instance v1, Lkdb;

    new-instance v2, Ljava/io/File;

    invoke-virtual {v0}, Li32;->j()Ljava/io/File;

    move-result-object v0

    const-string v3, "url"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2}, Lx29;->c(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {v1, v0}, Lkdb;-><init>(Landroid/net/Uri;)V
    :try_end_191
    .catch Ljava/io/FileNotFoundException; {:try_start_16a .. :try_end_191} :catch_192

    move-object v8, v1

    :catch_192
    :cond_192
    return-object v8

    :pswitch_193
    check-cast v11, Lb59;

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    new-instance v1, Landroid/util/SparseArray;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/util/SparseArray;-><init>(I)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide v4, 0x9a7ec800L

    sub-long/2addr v2, v4

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1ba
    :goto_1ba
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1f0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    :try_start_1c6
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5
    :try_end_1d4
    .catch Ljava/lang/NumberFormatException; {:try_start_1c6 .. :try_end_1d4} :catch_1eb

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v4, v6, v2

    if-lez v4, :cond_1ba

    new-instance v4, Lr59;

    invoke-direct {v4, v6, v7}, Lr59;-><init>(J)V

    invoke-virtual {v1, v5, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1ba

    :catch_1eb
    move-exception v0

    invoke-static {v0}, Lt3p;->r(Ljava/lang/Throwable;)V

    goto :goto_1f1

    :cond_1f0
    move-object v8, v1

    :goto_1f1
    return-object v8

    :pswitch_1f2
    new-instance v0, Lux8;

    check-cast v11, Landroid/content/Context;

    const-string v1, "not_interested"

    invoke-static {v11, v1}, Ls6h;->K(Landroid/content/Context;Ljava/lang/String;)Landroidx/collection/ArrayMap;

    move-result-object v1

    const-string v2, "report"

    invoke-static {v11, v2}, Ls6h;->K(Landroid/content/Context;Ljava/lang/String;)Landroidx/collection/ArrayMap;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lux8;-><init>(Ljava/util/Map;Ljava/util/Map;)V

    return-object v0

    :pswitch_206
    check-cast v11, Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    invoke-static {v11}, Lare;->b(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v13

    const/16 v16, 0x0

    const/16 v17, 0x0

    sget-object v14, Lyqa;->d:[Ljava/lang/String;

    const/4 v15, 0x0

    invoke-virtual/range {v12 .. v17}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz v1, :cond_26f

    :try_start_222
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_266

    :cond_228
    const/4 v3, 0x7

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    if-ne v3, v7, :cond_231

    move v8, v9

    goto :goto_232

    :cond_231
    move v8, v10

    :goto_232
    new-instance v11, Lg15;

    new-instance v12, Lcre;

    new-instance v13, Lbre;

    invoke-interface {v1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    invoke-direct/range {v13 .. v18}, Lbre;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v12, v13, v8, v14, v15}, Lcre;-><init>(Lbre;ZLjava/lang/String;Ljava/lang/String;)V

    invoke-direct {v11, v12, v3}, Lg15;-><init>(Lcre;I)V

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3
    :try_end_264
    .catchall {:try_start_222 .. :try_end_264} :catchall_26a

    if-nez v3, :cond_228

    :cond_266
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_26f

    :catchall_26a
    move-exception v0

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :cond_26f
    :goto_26f
    return-object v0

    :pswitch_270
    check-cast v11, Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    invoke-static {v11}, Lare;->a(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v13

    sget-object v14, Lqb7;->d:[Ljava/lang/String;

    const/16 v16, 0x0

    const-string v17, "city_index"

    const/4 v15, 0x0

    invoke-virtual/range {v12 .. v17}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz v1, :cond_2ca

    :try_start_28c
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_2c1

    :cond_292
    new-instance v3, Ld15;

    invoke-interface {v1, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    new-instance v11, Lbre;

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    invoke-direct/range {v11 .. v16}, Lbre;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    invoke-direct {v3, v8, v11, v12}, Ld15;-><init>(ILbre;I)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3
    :try_end_2bf
    .catchall {:try_start_28c .. :try_end_2bf} :catchall_2c5

    if-nez v3, :cond_292

    :cond_2c1
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_2ca

    :catchall_2c5
    move-exception v0

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :cond_2ca
    :goto_2ca
    return-object v0

    :pswitch_2cb
    check-cast v11, Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    invoke-static {v11}, Lare;->e(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v13

    sget-object v14, Li16;->e:[Ljava/lang/String;

    const/16 v16, 0x0

    const-string v17, "user_position"

    const/4 v15, 0x0

    invoke-virtual/range {v12 .. v17}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz v1, :cond_330

    :try_start_2e7
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_327

    :cond_2ed
    new-instance v2, Lop4;

    new-instance v3, Lyqe;

    invoke-interface {v1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    if-ne v12, v9, :cond_301

    move v12, v9

    goto :goto_302

    :cond_301
    move v12, v10

    :goto_302
    invoke-direct {v3, v8, v11, v12}, Lyqe;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    if-ne v8, v9, :cond_30d

    move v8, v9

    goto :goto_30e

    :cond_30d
    move v8, v10

    :goto_30e
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    if-ne v11, v9, :cond_316

    move v11, v9

    goto :goto_317

    :cond_316
    move v11, v10

    :goto_317
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    invoke-direct {v2, v3, v8, v11, v12}, Lop4;-><init>(Lyqe;ZZI)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2
    :try_end_325
    .catchall {:try_start_2e7 .. :try_end_325} :catchall_32b

    if-nez v2, :cond_2ed

    :cond_327
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_330

    :catchall_32b
    move-exception v0

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :cond_330
    :goto_330
    return-object v0

    :pswitch_331
    check-cast v11, Lzyk;

    invoke-virtual {v11}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    iget-object v0, v0, Li32;->l:Ljava/lang/Object;

    check-cast v0, Lj32;

    iget-object v0, v0, Lj32;->d:Lqii;

    invoke-static {v1, v0}, Lk1g;->a0(Ljava/io/File;Lqii;)Lu9d;

    move-result-object v0

    return-object v0

    :pswitch_data_344
    .packed-switch 0x0
        :pswitch_331
        :pswitch_2cb
        :pswitch_270
        :pswitch_206
        :pswitch_1f2
        :pswitch_193
        :pswitch_16a
        :pswitch_12d
        :pswitch_fb
        :pswitch_87
        :pswitch_6f
        :pswitch_57
    .end packed-switch
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 16

    iget-byte v0, p0, Li32;->j:B

    const-string v1, "selected_state"

    const-string v2, "origin"

    const-string v3, "zip_code"

    const-string v4, "state"

    const-string v5, "city_id"

    const-string v6, "data"

    const/16 v7, 0x8

    const-string v8, "name"

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    iget-object v12, p0, Li32;->k:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4ca

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_5c

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    :try_start_23
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_27
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbul;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "id"

    iget-object v3, v0, Lbul;->a:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "activated_count"

    iget-object v3, v0, Lbul;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v2, "last_activated_time"

    iget-object v0, v0, Lbul;->c:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_5b
    .catch Lorg/json/JSONException; {:try_start_23 .. :try_end_5b} :catch_78

    goto :goto_27

    :cond_5c
    move-object p0, v9

    :cond_5d
    check-cast v12, Lb59;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    if-eqz p0, :cond_6f

    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v9

    :cond_6f
    const-string p0, "favorites_usage"

    invoke-interface {p1, p0, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :catch_78
    return-void

    :pswitch_79
    check-cast p1, Lnxd;

    check-cast v12, Lk32;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lapk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v1, Ld7k;

    const/16 v2, 0x9

    invoke-direct {v1, p0, p1, v2}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v10, v11, v1}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    return-void

    :pswitch_96
    check-cast p1, Lr7h;

    if-eqz p1, :cond_af

    check-cast v12, Lk32;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lapk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v1, Ld7k;

    invoke-direct {v1, p0, p1, v7}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v10, v11, v1}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    :cond_af
    return-void

    :pswitch_b0
    check-cast p1, Lorb;

    if-eqz p1, :cond_cc

    check-cast v12, Lb59;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v6, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_cc
    return-void

    :pswitch_cd
    check-cast p1, Lp2g;

    check-cast v12, Lk32;

    if-eqz p1, :cond_fa

    iget-object p0, p1, Lp2g;->b:Lc3g;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapk;

    iget-object p1, p1, Lp2g;->a:Ljava/util/List;

    iget-object v1, v0, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v2, Lyok;

    const/4 v3, 0x2

    invoke-direct {v2, v0, p1, v3}, Lyok;-><init>(Lapk;Ljava/util/List;B)V

    invoke-static {v1, v10, v11, v2}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    if-eqz p0, :cond_fa

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lapk;

    iget-object v0, p1, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v1, Lzok;

    invoke-direct {v1, p1, p0, v11}, Lzok;-><init>(Lapk;Lc3g;B)V

    invoke-static {v0, v10, v11, v1}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    :cond_fa
    return-void

    :pswitch_fb
    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Li32;->l:Ljava/lang/Object;

    check-cast p0, Lxqe;

    iget-object v0, p0, Lxqe;->d:Landroid/content/Context;

    iget-object v1, p0, Lxqe;->e:Lqre;

    iget-object p0, p0, Lxqe;->f:[Ljava/lang/String;

    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_119
    :goto_119
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1cb

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Loqe;

    iget-object v5, v4, Loqe;->c:Ljava/lang/String;

    const-string v6, "insta_clip"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_119

    instance-of v5, v4, Lmsh;

    if-eqz v5, :cond_13d

    check-cast v4, Lmsh;

    invoke-static {v1, v4, v9, v3}, Lxqe;->p(Lqre;Lmsh;Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/ContentValues;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_119

    :cond_13d
    instance-of v5, v4, Lere;

    if-eqz v5, :cond_119

    const-string v5, "publishers"

    iget-object v6, v4, Loqe;->c:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_119

    check-cast v4, Lere;

    iget-object v5, v4, Loqe;->c:Ljava/lang/String;

    iget-object v6, v4, Lere;->f:Ljava/util/List;

    new-instance v7, Ljava/util/ArrayList;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v8

    add-int/2addr v8, v11

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    const-string v10, "title"

    iget-object v12, v4, Loqe;->b:Ljava/lang/String;

    invoke-virtual {v8, v10, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v10, v4, Lere;->g:Ljava/lang/String;

    const-string v12, "article_id"

    invoke-virtual {v8, v12, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "secondary_id"

    iget-object v13, v4, Lere;->e:Ljava/lang/String;

    invoke-virtual {v8, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "type"

    invoke-virtual {v8, v12, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "stream_id"

    iget-object v13, v1, Lqre;->a:Ljava/lang/String;

    invoke-virtual {v8, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "more_id"

    iget-object v13, v4, Lere;->h:Ljava/lang/String;

    invoke-virtual {v8, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "carousel"

    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1ab

    iget-object v4, v4, Lere;->i:Lnb8;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Lrpb;->d:Lqpb;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v12, Lnb8;->Companion:Lmb8;

    invoke-virtual {v12}, Lmb8;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v12

    check-cast v12, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v5, v4, v12}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "event_carousel"

    invoke-virtual {v8, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1ab
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1b2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1c6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lmsh;

    invoke-static {v1, v5, v10, v3}, Lxqe;->p(Lqre;Lmsh;Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/ContentValues;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1b2

    :cond_1c6
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_119

    :cond_1cb
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    const-string v1, "stream_id=?"

    if-nez p1, :cond_1f5

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {v0}, Lare;->d(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p1, v4, v1, p0}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Landroid/content/ContentValues;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-static {v0}, Lare;->d(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/content/ContentValues;

    invoke-virtual {v4, v5, p1}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    :cond_1f5
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_21d

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {v0}, Lare;->c(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p1, v2, v1, p0}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [Landroid/content/ContentValues;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {v0}, Lare;->c(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/content/ContentValues;

    invoke-virtual {p1, v0, p0}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    :cond_21d
    return-void

    :pswitch_21e
    check-cast p1, Lldb;

    iget-object v0, p0, Li32;->l:Ljava/lang/Object;

    check-cast v0, Li9c;

    const-string v1, "url"

    if-nez p1, :cond_241

    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Li32;->j()Ljava/io/File;

    move-result-object v2

    invoke-direct {p1, v2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Li32;->j()Ljava/io/File;

    move-result-object p0

    invoke-direct {p1, p0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    goto :goto_292

    :cond_241
    invoke-virtual {p0}, Li32;->j()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Li32;->j()Ljava/io/File;

    move-result-object v3

    const-string v4, ".data"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Li32;->j()Ljava/io/File;

    move-result-object v4

    const-string v5, ".url"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_25e
    iget-object v4, p1, Lldb;->a:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lx29;->d(Ljava/io/File;Ljava/lang/String;)V

    iget-object p1, p1, Lldb;->b:[B

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_26e
    .catchall {:try_start_25e .. :try_end_26e} :catchall_2b1

    :try_start_26e
    invoke-virtual {v4, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_271
    .catchall {:try_start_26e .. :try_end_271} :catchall_2aa

    :try_start_271
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Li32;->j()Ljava/io/File;

    move-result-object v4

    invoke-direct {p1, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Li32;->j()Ljava/io/File;

    move-result-object p0

    invoke-direct {p1, p0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_28c
    .catchall {:try_start_271 .. :try_end_28c} :catchall_2b1

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    :goto_292
    iget-object p0, v0, Li9c;->c:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance p1, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p1, v1, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Lgbb;

    invoke-direct {p0, v0, v7}, Lgbb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0}, Lrml;->c(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void

    :catchall_2aa
    move-exception p0

    :try_start_2ab
    throw p0
    :try_end_2ac
    .catchall {:try_start_2ab .. :try_end_2ac} :catchall_2ac

    :catchall_2ac
    move-exception p1

    :try_start_2ad
    invoke-static {v4, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p1
    :try_end_2b1
    .catchall {:try_start_2ad .. :try_end_2b1} :catchall_2b1

    :catchall_2b1
    move-exception p0

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    throw p0

    :pswitch_2b9
    check-cast p1, Landroid/util/SparseArray;

    check-cast v12, Lb59;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    :goto_2ca
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-ge v10, v0, :cond_2e6

    invoke-virtual {p1, v10}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v10}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr59;

    iget-wide v1, v1, Lr59;->a:J

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    add-int/lit8 v10, v10, 0x1

    goto :goto_2ca

    :cond_2e6
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :pswitch_2ea
    check-cast p1, Lux8;

    check-cast v12, Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {v12}, Lare;->f(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0, v9, v9}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    if-eqz p1, :cond_337

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p1, Lux8;->a:Ljava/util/Map;

    if-eqz v0, :cond_30d

    const-string v1, "not_interested"

    invoke-static {v1, v0}, Ls6h;->R(Ljava/lang/String;Ljava/util/Map;)Landroid/content/ContentValues;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_30d
    iget-object p1, p1, Lux8;->b:Ljava/util/Map;

    if-eqz p1, :cond_31a

    const-string v0, "report"

    invoke-static {v0, p1}, Ls6h;->R(Ljava/lang/String;Ljava/util/Map;)Landroid/content/ContentValues;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_31a
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_337

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Landroid/content/ContentValues;

    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v12}, Lare;->f(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/content/ContentValues;

    invoke-virtual {v0, v1, p0}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    :cond_337
    return-void

    :pswitch_338
    check-cast p1, Ljava/util/List;

    check-cast v12, Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {v12}, Lare;->b(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0, v9, v9}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    if-eqz p1, :cond_3b5

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_3b5

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    new-array p0, p0, [Landroid/content/ContentValues;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_359
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3aa

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lg15;

    add-int/lit8 v6, v10, 0x1

    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    iget-object v9, v0, Lg15;->a:Lcre;

    iget-object v9, v9, Lcre;->a:Lbre;

    iget-object v11, v9, Lbre;->a:Ljava/lang/String;

    invoke-virtual {v7, v5, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v11, v9, Lbre;->b:Ljava/lang/String;

    invoke-virtual {v7, v8, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v11, v9, Lbre;->c:Ljava/lang/String;

    invoke-virtual {v7, v4, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v11, v9, Lbre;->d:Ljava/lang/String;

    invoke-virtual {v7, v3, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget v9, v9, Lbre;->e:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v2, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v9, v0, Lg15;->a:Lcre;

    iget-object v11, v9, Lcre;->c:Ljava/lang/String;

    const-string v13, "country_code"

    invoke-virtual {v7, v13, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v11, "language_code"

    iget-object v9, v9, Lcre;->d:Ljava/lang/String;

    invoke-virtual {v7, v11, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget v0, v0, Lg15;->b:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v7, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    aput-object v7, p0, v10

    move v10, v6

    goto :goto_359

    :cond_3aa
    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {v12}, Lare;->b(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0, p0}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    :cond_3b5
    return-void

    :pswitch_3b6
    check-cast p1, Ljava/util/List;

    check-cast v12, Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {v12}, Lare;->a(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0, v9, v9}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    if-eqz p1, :cond_42c

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_42c

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    new-array p0, p0, [Landroid/content/ContentValues;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_3d7
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_421

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld15;

    add-int/lit8 v6, v10, 0x1

    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    iget v9, v0, Ld15;->a:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v11, "city_index"

    invoke-virtual {v7, v11, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v9, v0, Ld15;->b:Lbre;

    iget-object v11, v9, Lbre;->a:Ljava/lang/String;

    invoke-virtual {v7, v5, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v11, v9, Lbre;->b:Ljava/lang/String;

    invoke-virtual {v7, v8, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v11, v9, Lbre;->c:Ljava/lang/String;

    invoke-virtual {v7, v4, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v11, v9, Lbre;->d:Ljava/lang/String;

    invoke-virtual {v7, v3, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget v9, v9, Lbre;->e:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v2, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget v0, v0, Ld15;->c:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v7, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    aput-object v7, p0, v10

    move v10, v6

    goto :goto_3d7

    :cond_421
    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {v12}, Lare;->a(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0, p0}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    :cond_42c
    return-void

    :pswitch_42d
    check-cast p1, Ljava/util/List;

    check-cast v12, Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {v12}, Lare;->e(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0, v9, v9}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    if-eqz p1, :cond_4ac

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_4ac

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    new-array p0, p0, [Landroid/content/ContentValues;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_44e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4a1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lop4;

    add-int/lit8 v1, v10, 0x1

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    iget-object v3, v0, Lop4;->a:Lyqe;

    iget-object v3, v3, Lyqe;->a:Ljava/lang/String;

    const-string v4, "code"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v0, Lop4;->a:Lyqe;

    iget-object v4, v3, Lyqe;->b:Ljava/lang/String;

    invoke-virtual {v2, v8, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v3, v3, Lyqe;->c:Z

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "subscribed"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-boolean v3, v0, Lop4;->b:Z

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "supported"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-boolean v3, v0, Lop4;->c:Z

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "selected"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget v0, v0, Lop4;->d:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v3, "user_position"

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    aput-object v2, p0, v10

    move v10, v1

    goto :goto_44e

    :cond_4a1
    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {v12}, Lare;->e(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0, p0}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    :cond_4ac
    return-void

    :pswitch_4ad
    check-cast p1, Ljava/util/Map;

    check-cast v12, Lzyk;

    invoke-virtual {v12}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    if-nez p1, :cond_4bd

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    goto :goto_4c9

    :cond_4bd
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_4c6

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_4c6
    invoke-static {p0, p1}, Lk1g;->k0(Ljava/io/File;Ljava/util/Map;)V

    :goto_4c9
    return-void

    :pswitch_data_4ca
    .packed-switch 0x0
        :pswitch_4ad
        :pswitch_42d
        :pswitch_3b6
        :pswitch_338
        :pswitch_2ea
        :pswitch_2b9
        :pswitch_21e
        :pswitch_fb
        :pswitch_cd
        :pswitch_b0
        :pswitch_96
        :pswitch_79
    .end packed-switch
.end method

.method public final c()I
    .registers 1

    iget-byte p0, p0, Li32;->j:B

    packed-switch p0, :pswitch_data_a

    :pswitch_5
    const/4 p0, 0x2

    return p0

    :pswitch_7
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_7
        :pswitch_5
        :pswitch_7
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_7
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 13

    iget-byte v0, p0, Li32;->j:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_1ce

    :pswitch_8
    return-void

    :pswitch_9
    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Li32;->l:Ljava/lang/Object;

    check-cast p0, Lcul;

    iget-object v0, p0, Lcul;->c:Ljava/util/HashMap;

    iget-object v4, p0, Lcul;->f:Ljava/util/ArrayList;

    if-eqz p1, :cond_7e

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7e

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move v5, v1

    :goto_20
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_73

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lbul;

    iget-object v7, p0, Lcul;->e:Ljava/util/HashSet;

    if-eqz v7, :cond_38

    iget-object v8, v6, Lbul;->a:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6b

    :cond_38
    iget-object v7, v6, Lbul;->a:Ljava/lang/String;

    iget-object v8, v6, Lbul;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lbul;

    if-eqz v7, :cond_4b

    iget-object v9, v7, Lbul;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v9

    goto :goto_4c

    :cond_4b
    move v9, v1

    :goto_4c
    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v10

    add-int/2addr v10, v9

    invoke-virtual {v8, v10}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    if-eqz v7, :cond_63

    iget-object v7, v7, Lbul;->c:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v9

    iget-object v7, v6, Lbul;->c:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v7, v9, v10}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    move v7, v2

    goto :goto_64

    :cond_63
    move v7, v1

    :goto_64
    or-int/2addr v5, v7

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v7

    if-nez v7, :cond_6d

    :cond_6b
    move v5, v2

    goto :goto_20

    :cond_6d
    iget-object v7, v6, Lbul;->a:Ljava/lang/String;

    invoke-virtual {v0, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_20

    :cond_73
    iput-object v3, p0, Lcul;->e:Ljava/util/HashSet;

    if-eqz v5, :cond_7a

    invoke-virtual {p0}, Lcul;->d()V

    :cond_7a
    invoke-virtual {p0}, Lcul;->e()V

    goto :goto_80

    :cond_7e
    iput-object v3, p0, Lcul;->e:Ljava/util/HashSet;

    :goto_80
    iput-boolean v2, p0, Lcul;->d:Z

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_86
    if-ge v1, p0, :cond_94

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    add-int/lit8 v1, v1, 0x1

    check-cast p1, Lcom/opera/api/Callback;

    invoke-interface {p1, v3}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_86

    :cond_94
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    return-void

    :pswitch_98
    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_a4

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    goto :goto_d0

    :cond_a4
    new-instance v0, Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Li32;->l:Ljava/lang/Object;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_b3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnxd;

    iget-object v1, p0, Li32;->l:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    new-instance v2, Lhpk;

    iget-object v3, v0, Lnxd;->a:Ljava/lang/String;

    iget v4, v0, Lnxd;->b:I

    invoke-direct {v2, v3, v4}, Lhpk;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b3

    :cond_d0
    :goto_d0
    return-void

    :pswitch_d1
    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_dd

    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    goto :goto_102

    :cond_dd
    new-instance v0, Landroid/util/SparseArray;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Li32;->l:Ljava/lang/Object;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_ec
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_102

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr7h;

    iget-object v1, p0, Li32;->l:Ljava/lang/Object;

    check-cast v1, Landroid/util/SparseArray;

    iget v2, v0, Lr7h;->a:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_ec

    :cond_102
    :goto_102
    return-void

    :pswitch_103
    check-cast p1, Lp2g;

    if-eqz p1, :cond_109

    iput-object p1, p0, Li32;->l:Ljava/lang/Object;

    :cond_109
    return-void

    :pswitch_10a
    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Li32;->l:Ljava/lang/Object;

    check-cast v0, Lxqe;

    if-nez p1, :cond_117

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    :cond_117
    iput-object p1, v0, Lxqe;->g:Ljava/util/List;

    iget-object v1, v0, Lxqe;->h:Ljava/util/ArrayList;

    invoke-interface {p1, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_12b

    new-instance p1, Ljava/util/ArrayList;

    iget-object v0, v0, Lxqe;->g:Ljava/util/List;

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, p1}, Lldk;->g(Ljava/lang/Object;)V

    :cond_12b
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    return-void

    :pswitch_12f
    check-cast p1, Lkdb;

    iget-object p0, p0, Li32;->l:Ljava/lang/Object;

    check-cast p0, Li9c;

    if-nez p1, :cond_13c

    new-instance p1, Lkdb;

    invoke-direct {p1, v3}, Lkdb;-><init>(Landroid/net/Uri;)V

    :cond_13c
    iput-object p1, p0, Li9c;->f:Ljava/lang/Object;

    iget-object v0, p0, Li9c;->e:Ljava/lang/Object;

    check-cast v0, Lhx5;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljd7;

    if-eqz v0, :cond_14f

    iget-object p1, p1, Lkdb;->a:Landroid/net/Uri;

    invoke-virtual {p0, v0, p1}, Li9c;->b(Ljd7;Landroid/net/Uri;)V

    :cond_14f
    return-void

    :pswitch_150
    check-cast p1, Landroid/util/SparseArray;

    if-nez p1, :cond_159

    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    :cond_159
    iget-object p0, p0, Li32;->l:Ljava/lang/Object;

    check-cast p0, Ls9i;

    iput-object p1, p0, Ls9i;->d:Ljava/lang/Object;

    return-void

    :pswitch_160
    check-cast p1, Lux8;

    iget-object p0, p0, Li32;->l:Ljava/lang/Object;

    check-cast p0, Ls6h;

    iput-object p1, p0, Ls6h;->b:Ljava/lang/Object;

    return-void

    :pswitch_169
    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Li32;->l:Ljava/lang/Object;

    check-cast p0, Lyqa;

    if-nez p1, :cond_173

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_173
    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    return-void

    :pswitch_176
    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Li32;->l:Ljava/lang/Object;

    check-cast p0, Lqb7;

    if-eqz p1, :cond_198

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_182
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_198

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld15;

    iget v2, v1, Ld15;->c:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_196

    const/4 v3, 0x3

    if-ne v2, v3, :cond_182

    :cond_196
    iput-object v1, p0, Lqb7;->c:Ljava/lang/Object;

    :cond_198
    iput-object p1, p0, Lqb7;->b:Ljava/lang/Object;

    return-void

    :pswitch_19b
    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_1a1

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_1a1
    iget-object p0, p0, Li32;->l:Ljava/lang/Object;

    check-cast p0, Li16;

    iput-object p1, p0, Li16;->c:Ljava/lang/Object;

    return-void

    :pswitch_1a8
    check-cast p1, Ljava/util/Map;

    iget-object p0, p0, Li32;->l:Ljava/lang/Object;

    check-cast p0, Lj32;

    iget-object v0, p0, Lj32;->h:Lc32;

    if-eqz p1, :cond_1b9

    iget-object v4, v0, Lc32;->b:Ljava/util/LinkedHashMap;

    invoke-interface {v4, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    iput-boolean v1, p0, Lj32;->f:Z

    :cond_1b9
    iget-object v4, p0, Le32;->c:Lcv2;

    if-eqz v4, :cond_1c7

    if-nez p1, :cond_1c0

    move v1, v2

    :cond_1c0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v4, p1}, Lcv2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1c7
    iput-object v3, p0, Le32;->c:Lcv2;

    invoke-virtual {p0, v0}, Lf12;->i(Ld12;)V

    return-void

    nop

    :pswitch_data_1ce
    .packed-switch 0x0
        :pswitch_1a8
        :pswitch_19b
        :pswitch_176
        :pswitch_169
        :pswitch_160
        :pswitch_150
        :pswitch_12f
        :pswitch_10a
        :pswitch_103
        :pswitch_8
        :pswitch_d1
        :pswitch_98
        :pswitch_9
    .end packed-switch
.end method

.method public final j()Ljava/io/File;
    .registers 1

    iget-object p0, p0, Li32;->k:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0
.end method

.method public final k(ILjava/lang/String;)Lnxd;
    .registers 14

    sget-object v0, Lf8a;->d:Lf8a;

    invoke-virtual {v0, p2}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance p2, Lhpk;

    invoke-direct {p2, v2, p1}, Lhpk;-><init>(Ljava/lang/String;I)V

    invoke-virtual {p0}, Lldk;->i()V

    iget-object v0, p0, Li32;->l:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnxd;

    if-eqz v0, :cond_1b

    return-object v0

    :cond_1b
    new-instance v1, Lnxd;

    const-wide/16 v8, 0x0

    const/4 v10, 0x0

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    move v3, p1

    invoke-direct/range {v1 .. v10}, Lnxd;-><init>(Ljava/lang/String;IJJJZ)V

    iget-object p0, p0, Li32;->l:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v1
.end method

.method public final l(I)Lr7h;
    .registers 5

    invoke-virtual {p0}, Lldk;->i()V

    iget-object v0, p0, Li32;->l:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr7h;

    if-eqz v0, :cond_10

    return-object v0

    :cond_10
    new-instance v0, Lr7h;

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    invoke-direct {v0, p1, v1, v2}, Lr7h;-><init>(ID)V

    iget-object p0, p0, Li32;->l:Ljava/lang/Object;

    check-cast p0, Landroid/util/SparseArray;

    invoke-virtual {p0, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-object v0
.end method
