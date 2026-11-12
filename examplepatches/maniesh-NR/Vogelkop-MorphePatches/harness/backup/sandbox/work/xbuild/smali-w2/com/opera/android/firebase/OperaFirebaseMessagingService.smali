.class public Lcom/opera/android/firebase/OperaFirebaseMessagingService;
.super Lcom/google/firebase/messaging/FirebaseMessagingService;
.source "SourceFile"


# static fields
.field public static final synthetic b:I


# instance fields
.field public final a:Lq9c;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lcom/google/firebase/messaging/FirebaseMessagingService;-><init>()V

    new-instance v0, Lq9c;

    invoke-direct {v0}, Lq9c;-><init>()V

    iput-object v0, p0, Lcom/opera/android/firebase/OperaFirebaseMessagingService;->a:Lq9c;

    return-void
.end method


# virtual methods
.method public final c()Z
    .registers 2

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->U()Z

    move-result p0

    return p0
.end method

.method public final onCreate()V
    .registers 2

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    invoke-virtual {p0}, Lcom/opera/android/firebase/OperaFirebaseMessagingService;->c()Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    iget-object v0, p0, Lcom/opera/android/firebase/OperaFirebaseMessagingService;->a:Lq9c;

    iget-object v0, v0, Lq9c;->a:Lcom/leanplum/LeanplumFirebaseServiceHandler;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/leanplum/LeanplumFirebaseServiceHandler;->onCreate(Landroid/content/Context;)V

    return-void
.end method

.method public final onMessageReceived(Lrth;)V
    .registers 31

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0}, Lcom/opera/android/firebase/OperaFirebaseMessagingService;->c()Z

    move-result v2

    if-nez v2, :cond_98f

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object v2

    iget-object v3, v1, Lrth;->f:Landroid/os/Bundle;

    const-string v4, "from"

    invoke-virtual {v3, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x8

    const/4 v5, 0x0

    if-eqz v3, :cond_93

    const-string v6, "/topics/"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2d

    move-object v6, v5

    goto :goto_31

    :cond_2d
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    :goto_31
    if-eqz v6, :cond_66

    iget-object v2, v2, Le59;->a:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_62

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lc59;

    invoke-virtual {v7}, Lc59;->c()Ljava/util/Set;

    move-result-object v7

    check-cast v7, Ljava/util/HashSet;

    invoke-virtual {v7, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3d

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ld59;

    goto :goto_63

    :cond_62
    move-object v2, v5

    :goto_63
    if-nez v2, :cond_94

    goto :goto_93

    :cond_66
    iget-object v2, v2, Le59;->a:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_70
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_93

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lc59;

    iget-object v7, v7, Lc59;->c:Lj59;

    iget-object v7, v7, Lj59;->e:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_70

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ld59;

    goto :goto_94

    :cond_93
    :goto_93
    move-object v2, v5

    :cond_94
    :goto_94
    const/4 v3, 0x6

    const/4 v6, 0x7

    if-nez v2, :cond_a1

    new-instance v0, Lvdf;

    invoke-direct {v0, v1, v3}, Lvdf;-><init>(Ljava/lang/Object;B)V

    invoke-static {v6, v0}, Lorg/chromium/base/task/PostTask;->d(ILjava/lang/Runnable;)V

    return-void

    :cond_a1
    iget-object v7, v1, Lrth;->f:Landroid/os/Bundle;

    iget-object v8, v1, Lrth;->h:Li06;

    const/16 v9, 0x1b

    const/4 v10, 0x0

    if-nez v8, :cond_18c

    invoke-static {v7}, Lisd;->B(Landroid/os/Bundle;)Z

    move-result v8

    if-eqz v8, :cond_18c

    new-instance v8, Li06;

    new-instance v11, Lisd;

    invoke-direct {v11, v7}, Lisd;-><init>(Landroid/os/Bundle;)V

    invoke-direct {v8, v9}, Li06;-><init>(B)V

    const-string v7, "gcm.n.title"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v11, v7}, Lisd;->u(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v11, v7}, Lisd;->t(Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_da

    array-length v12, v7

    new-array v12, v12, [Ljava/lang/String;

    move v13, v10

    :goto_cc
    array-length v14, v7

    if-ge v13, v14, :cond_da

    aget-object v14, v7, v13

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    add-int/lit8 v13, v13, 0x1

    goto :goto_cc

    :cond_da
    const-string v7, "gcm.n.body"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v11, v7}, Lisd;->u(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v11, v7}, Lisd;->t(Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_fa

    array-length v12, v7

    new-array v12, v12, [Ljava/lang/String;

    move v13, v10

    :goto_ec
    array-length v14, v7

    if-ge v13, v14, :cond_fa

    aget-object v14, v7, v13

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    add-int/lit8 v13, v13, 0x1

    goto :goto_ec

    :cond_fa
    const-string v7, "gcm.n.icon"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    const-string v7, "gcm.n.sound2"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_110

    const-string v7, "gcm.n.sound"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    :cond_110
    const-string v7, "gcm.n.tag"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    const-string v7, "gcm.n.color"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    const-string v7, "gcm.n.click_action"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    const-string v7, "gcm.n.android_channel_id"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    const-string v7, "gcm.n.link_android"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_136

    const-string v7, "gcm.n.link"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :cond_136
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_13f

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    :cond_13f
    const-string v7, "gcm.n.image"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    const-string v7, "gcm.n.ticker"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    const-string v7, "gcm.n.notification_priority"

    invoke-virtual {v11, v7}, Lisd;->c(Ljava/lang/String;)Ljava/lang/Integer;

    const-string v7, "gcm.n.visibility"

    invoke-virtual {v11, v7}, Lisd;->c(Ljava/lang/String;)Ljava/lang/Integer;

    const-string v7, "gcm.n.notification_count"

    invoke-virtual {v11, v7}, Lisd;->c(Ljava/lang/String;)Ljava/lang/Integer;

    const-string v7, "gcm.n.sticky"

    invoke-virtual {v11, v7}, Lisd;->a(Ljava/lang/String;)Z

    const-string v7, "gcm.n.local_only"

    invoke-virtual {v11, v7}, Lisd;->a(Ljava/lang/String;)Z

    const-string v7, "gcm.n.default_sound"

    invoke-virtual {v11, v7}, Lisd;->a(Ljava/lang/String;)Z

    const-string v7, "gcm.n.default_vibrate_timings"

    invoke-virtual {v11, v7}, Lisd;->a(Ljava/lang/String;)Z

    const-string v7, "gcm.n.default_light_settings"

    invoke-virtual {v11, v7}, Lisd;->a(Ljava/lang/String;)Z

    const-string v7, "gcm.n.event_time"

    invoke-virtual {v11, v7}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_184

    :try_start_17d
    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_180
    .catch Ljava/lang/NumberFormatException; {:try_start_17d .. :try_end_180} :catch_181

    goto :goto_184

    :catch_181
    invoke-static {v7}, Lisd;->N(Ljava/lang/String;)V

    :cond_184
    :goto_184
    invoke-virtual {v11}, Lisd;->s()[I

    invoke-virtual {v11}, Lisd;->A()[J

    iput-object v8, v1, Lrth;->h:Li06;

    :cond_18c
    iget-object v7, v1, Lrth;->h:Li06;

    if-nez v7, :cond_98f

    invoke-super/range {p0 .. p1}, Lcom/google/firebase/messaging/FirebaseMessagingService;->onMessageReceived(Lrth;)V

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/16 v7, 0x15

    const/4 v8, 0x5

    const/4 v12, 0x4

    const/4 v13, 0x2

    const/4 v14, 0x1

    packed-switch v2, :pswitch_data_990

    goto/16 :goto_98f

    :pswitch_1a2
    new-instance v2, Lp71;

    invoke-direct {v2, v1, v0, v5, v7}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v2}, Lscd;->h0(Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    return-void

    :pswitch_1ab
    invoke-virtual {v1}, Lrth;->getData()Ljava/util/Map;

    move-result-object v1

    const-string v2, "type"

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_98f

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const v3, -0x6f74e17e

    if-eq v2, v3, :cond_1e1

    const v3, -0x4e0958db

    if-eq v2, v3, :cond_1d7

    const v3, 0x2c0b62b4

    if-ne v2, v3, :cond_98f

    const-string v2, "changed"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_98f

    goto :goto_1e9

    :cond_1d7
    const-string v2, "expired"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e9

    goto/16 :goto_98f

    :cond_1e1
    const-string v2, "registered"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_98f

    :cond_1e9
    :goto_1e9
    new-instance v1, Lqkf;

    invoke-direct {v1, v0, v14}, Lqkf;-><init>(Lcom/opera/android/firebase/OperaFirebaseMessagingService;B)V

    invoke-static {v1}, Lvml;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_1f2
    invoke-virtual {v1}, Lrth;->getData()Ljava/util/Map;

    move-result-object v2

    iget-object v1, v1, Lrth;->f:Landroid/os/Bundle;

    const-string v4, "google.delivered_priority"

    invoke-virtual {v1, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_214

    const-string v4, "1"

    const-string v6, "google.priority_reduced"

    invoke-virtual {v1, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_223

    const-string v4, "google.priority"

    invoke-virtual {v1, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_214
    const-string v1, "high"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21e

    move v1, v14

    goto :goto_224

    :cond_21e
    const-string v1, "normal"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    :cond_223
    move v1, v10

    :goto_224
    const-string v4, "news_backend"

    const-string v6, "news_icon_url"

    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    const-string v8, "extra"

    move-object v9, v2

    check-cast v9, Ljava/util/HashMap;

    invoke-virtual {v9, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    if-eqz v8, :cond_523

    :try_start_23a
    new-instance v12, Landroid/os/Bundle;

    invoke-direct {v12}, Landroid/os/Bundle;-><init>()V

    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v8

    :goto_248
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_25f

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v5, v16

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v15, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v5, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_25d
    .catch Lorg/json/JSONException; {:try_start_23a .. :try_end_25d} :catch_25e

    goto :goto_248

    :catch_25e
    const/4 v12, 0x0

    :cond_25f
    if-eqz v12, :cond_523

    const-string v3, "ab_li"

    invoke-virtual {v9, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_26e

    invoke-virtual {v7, v6, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_26e
    const-string v3, " is null"

    const-string v5, "match_type"

    const-string v8, "match_id"

    const-string v15, "text"

    const-string v11, "title"

    move/from16 v18, v14

    const-string v14, "backend"

    invoke-virtual {v12, v14}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v7, v4, v13}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v14, "show_news_backend"

    const-string v13, "newsfeed"

    invoke-virtual {v7, v14, v13}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "id"

    invoke-virtual {v12, v13}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_298

    invoke-virtual {v14}, Ljava/lang/String;->hashCode()I

    move-result v14

    invoke-virtual {v7, v13, v14}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_298
    const-string v13, "push_title"

    invoke-virtual {v12, v13}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_2a5

    const-string v14, "news_header_title"

    invoke-virtual {v7, v14, v13}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2a5
    invoke-virtual {v12, v11}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_2b3

    invoke-virtual {v7, v11, v13}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v11, "show_article_title"

    invoke-virtual {v7, v11, v13}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2b3
    invoke-virtual {v12, v15}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_2bc

    invoke-virtual {v7, v15, v11}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2bc
    const-string v11, "large_icon"

    invoke-virtual {v12, v11}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_2c7

    invoke-virtual {v7, v6, v11}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2c7
    const-string v6, "articles"

    invoke-virtual {v12, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2d4

    const-string v11, "news_digest_articles"

    invoke-virtual {v7, v11, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2d4
    const-string v6, "hint_text"

    invoke-virtual {v12, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2e1

    const-string v11, "show_article_hint_text"

    invoke-virtual {v7, v11, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2e1
    const-string v6, "hint_scroll_pos"

    invoke-virtual {v12, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2f2

    :try_start_2e9
    const-string v11, "show_article_hint_scroll_pos"

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v7, v11, v6}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V
    :try_end_2f2
    .catch Ljava/lang/NumberFormatException; {:try_start_2e9 .. :try_end_2f2} :catch_2f2

    :catch_2f2
    :cond_2f2
    const-string v6, "back_dest"

    invoke-virtual {v12, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2ff

    const-string v11, "show_article_back_dest"

    invoke-virtual {v7, v11, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2ff
    const-string v6, "flags"

    invoke-virtual {v12, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_30c

    :try_start_307
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6
    :try_end_30b
    .catch Ljava/lang/NumberFormatException; {:try_start_307 .. :try_end_30b} :catch_30c

    goto :goto_30d

    :catch_30c
    :cond_30c
    move v6, v10

    :goto_30d
    const-string v11, "enable_sound"

    and-int/lit8 v13, v6, 0x1

    if-eqz v13, :cond_316

    move/from16 v13, v18

    goto :goto_317

    :cond_316
    move v13, v10

    :goto_317
    invoke-virtual {v7, v11, v13}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v11, "enable_vibration"

    and-int/lit8 v13, v6, 0x2

    if-eqz v13, :cond_323

    move/from16 v13, v18

    goto :goto_324

    :cond_323
    move v13, v10

    :goto_324
    invoke-virtual {v7, v11, v13}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v11, "enable_lights"

    and-int/lit8 v13, v6, 0x4

    if-eqz v13, :cond_330

    move/from16 v13, v18

    goto :goto_331

    :cond_330
    move v13, v10

    :goto_331
    invoke-virtual {v7, v11, v13}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v11, "force_heads_up"

    and-int/lit8 v13, v6, 0x8

    if-eqz v13, :cond_33d

    move/from16 v13, v18

    goto :goto_33e

    :cond_33d
    move v13, v10

    :goto_33e
    invoke-virtual {v7, v11, v13}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    and-int/lit8 v6, v6, 0x10

    if-eqz v6, :cond_348

    move/from16 v6, v18

    goto :goto_349

    :cond_348
    move v6, v10

    :goto_349
    const-string v11, "show_state"

    xor-int/lit8 v6, v6, 0x1

    invoke-virtual {v7, v11, v6}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v12, v8}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_362

    :try_start_356
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v13

    const-string v6, "action_show_match_id"

    invoke-virtual {v7, v6, v13, v14}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    invoke-virtual {v7, v8, v13, v14}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V
    :try_end_362
    .catch Ljava/lang/NumberFormatException; {:try_start_356 .. :try_end_362} :catch_362

    :catch_362
    :cond_362
    invoke-virtual {v12, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_370

    const-string v8, "action_show_match_type"

    invoke-virtual {v7, v8, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v5, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_370
    const-string v5, "publishers_logo"

    invoke-virtual {v12, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3cd

    :try_start_378
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6, v5}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v10}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    sget-object v8, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v5, v8, :cond_3b8

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move/from16 v10, v18

    invoke-virtual {v6, v10}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    if-eq v6, v8, :cond_3a2

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "home_team_logo"

    sget-object v8, Laik;->a:[Ljava/lang/String;

    invoke-virtual {v7, v6, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "away_team_logo"

    invoke-virtual {v7, v5, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3cd

    :cond_3a2
    new-instance v5, Lorg/json/JSONException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v10, 0x1

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_3b8
    new-instance v5, Lorg/json/JSONException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_3cd
    .catch Lorg/json/JSONException; {:try_start_378 .. :try_end_3cd} :catch_3cd

    :catch_3cd
    :cond_3cd
    :goto_3cd
    const-string v3, "uri"

    invoke-virtual {v9, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_523

    sget-object v5, Lyre;->a:Ljava/util/HashSet;

    const-string v5, "opera://dashboard"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_523

    invoke-virtual {v7, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Lcue;->d(I)Lcue;

    move-result-object v4

    if-eqz v4, :cond_523

    const-string v5, "rule_id"

    const-string v6, "news_category"

    const-string v8, "notification_action_type"

    sget-object v9, Lcue;->c:Lcue;

    const-string v10, ""

    new-instance v11, Landroid/os/Bundle;

    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    sget-object v12, Laik;->a:[Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "opera://dashboard/main_feed"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_418

    new-instance v10, Lxre;

    const/4 v12, 0x3

    const/4 v13, 0x1

    invoke-direct {v10, v13, v12}, Lxre;-><init>(II)V

    goto :goto_460

    :cond_418
    const/4 v12, 0x3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, "opera://dashboard/match"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_42c

    new-instance v10, Lxre;

    const/4 v13, 0x6

    invoke-direct {v10, v12, v13}, Lxre;-><init>(II)V

    goto :goto_460

    :cond_42c
    const-string v12, "type"

    invoke-virtual {v3, v12}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_43d

    const-string v13, "newsfeed_type"

    invoke-virtual {v11, v13, v12}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_43d
    sget-object v13, Lyre;->a:Ljava/util/HashSet;

    if-eqz v12, :cond_442

    move-object v10, v12

    :cond_442
    invoke-virtual {v13, v10}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_44b

    const/4 v5, 0x0

    goto/16 :goto_51e

    :cond_44b
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_454

    const/16 v17, 0x0

    goto :goto_45e

    :cond_454
    sget-object v10, Lyre;->b:Ljava/util/HashMap;

    invoke-virtual {v10, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lxre;

    move-object/from16 v17, v10

    :goto_45e
    move-object/from16 v10, v17

    :goto_460
    if-eqz v10, :cond_480

    iget v12, v10, Lxre;->b:I

    const/4 v13, 0x2

    if-ne v12, v13, :cond_46e

    if-ne v4, v9, :cond_46e

    const/4 v13, 0x6

    invoke-virtual {v11, v8, v13}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    goto :goto_475

    :cond_46e
    invoke-static {v12}, Lv0g;->e(I)B

    move-result v12

    invoke-virtual {v11, v8, v12}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :goto_475
    const-string v8, "notification_type"

    iget v10, v10, Lxre;->a:I

    invoke-static {v10}, Lv0g;->f(I)B

    move-result v10

    invoke-virtual {v11, v8, v10}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_480
    const-string v8, "news_id"

    invoke-virtual {v3, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_48d

    const-string v10, "show_article_news_id"

    invoke-virtual {v11, v10, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_48d
    const-string v8, "news_entry_id"

    invoke-virtual {v3, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_4a4

    const-string v10, "tracking_id"

    invoke-virtual {v11, v10, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "news_article_id"

    invoke-virtual {v11, v10, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "show_article_article_id"

    invoke-virtual {v11, v10, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4a4
    const-string v8, "request_id"

    invoke-virtual {v3, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_4b1

    const-string v10, "show_news_request_id"

    invoke-virtual {v11, v10, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4b1
    const-string v8, "category"

    invoke-virtual {v3, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_4c1

    invoke-virtual {v11, v6, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "newsfeed_category"

    invoke-virtual {v11, v10, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4c1
    const-string v8, "hot_topic_id"

    invoke-virtual {v3, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_4d1

    invoke-virtual {v11, v6, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "newsfeed_hot_topic"

    invoke-virtual {v11, v6, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4d1
    const-string v6, "recommend_type"

    invoke-virtual {v3, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_4de

    const-string v8, "newsfeed_recommend_type"

    invoke-virtual {v11, v8, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4de
    const-string v6, "open_type"

    invoke-virtual {v3, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_4eb

    const-string v8, "show_article_open_type"

    invoke-virtual {v11, v8, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4eb
    const-string v6, "original_url"

    invoke-virtual {v3, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_4f8

    const-string v8, "show_article_final_url"

    invoke-virtual {v11, v8, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4f8
    const-string v6, "transcoded_url"

    invoke-virtual {v3, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_507

    if-ne v4, v9, :cond_507

    const-string v4, "show_article_reader_mode_url"

    invoke-virtual {v11, v4, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_507
    const-string v4, "source"

    invoke-virtual {v3, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_514

    const-string v6, "news_domain"

    invoke-virtual {v11, v6, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_514
    invoke-virtual {v3, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_51d

    invoke-virtual {v11, v5, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_51d
    move-object v5, v11

    :goto_51e
    if-eqz v5, :cond_523

    invoke-virtual {v7, v5}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_523
    const-string v3, "origin"

    const/4 v10, 0x1

    invoke-virtual {v7, v3, v10}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v3, "fcm_data"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v7, v1}, Loup;->X(Landroid/content/Context;Landroid/os/Bundle;Z)V

    goto/16 :goto_98f

    :pswitch_537
    iget-object v2, v0, Lcom/opera/android/firebase/OperaFirebaseMessagingService;->a:Lq9c;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "livescore"

    const-string v4, "id"

    const-string v5, "lp_silent_track"

    invoke-virtual {v1}, Lrth;->getData()Ljava/util/Map;

    move-result-object v6

    const-string v7, "lp_channel"

    check-cast v6, Ljava/util/HashMap;

    const-string v9, "yes"

    const-string v11, "_test_in_app"

    invoke-virtual {v6, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const/4 v11, -0x1

    if-nez v9, :cond_5b2

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5b2

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5b2

    sget-object v9, Ly9c;->a:Lhr5;

    const-string v13, "category"

    invoke-virtual {v6, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13}, Lhr5;->j(Ljava/lang/String;)Ly9c;

    move-result-object v9

    if-nez v9, :cond_57a

    move v9, v11

    goto :goto_582

    :cond_57a
    sget-object v13, Lx9c;->a:[I

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    aget v9, v13, v9

    :goto_582
    packed-switch v9, :pswitch_data_9a0

    const/4 v9, 0x0

    goto :goto_597

    :pswitch_587
    const-string v9, "esim"

    goto :goto_597

    :pswitch_58a
    const-string v9, "weather_alerts"

    goto :goto_597

    :pswitch_58d
    const-string v9, "rewards"

    goto :goto_597

    :pswitch_590
    move-object v9, v3

    goto :goto_597

    :pswitch_592
    const-string v9, "weather_forecast"

    goto :goto_597

    :pswitch_595
    const-string v9, "com_appboy_default_notification_channel"

    :goto_597
    if-eqz v9, :cond_5b2

    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    :try_start_59e
    invoke-static {v9}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v13, v4, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5a5
    .catch Lorg/json/JSONException; {:try_start_59e .. :try_end_5a5} :catch_5ad

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5b2

    :catch_5ad
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_5b2
    :goto_5b2
    const-string v9, "lp_group"

    const-string v13, "yes"

    const-string v14, "_test_in_app"

    invoke-virtual {v6, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_68f

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_68f

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_68f

    sget-object v13, Ly9c;->a:Lhr5;

    const-string v14, "category"

    invoke-virtual {v6, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v14}, Lhr5;->j(Ljava/lang/String;)Ly9c;

    move-result-object v13

    if-nez v13, :cond_5e3

    :goto_5e1
    const/4 v13, 0x2

    goto :goto_5ec

    :cond_5e3
    sget-object v11, Lx9c;->a:[I

    invoke-virtual {v13}, Ljava/lang/Enum;->ordinal()I

    move-result v13

    aget v11, v11, v13

    goto :goto_5e1

    :goto_5ec
    if-eq v11, v13, :cond_64f

    const/4 v13, 0x3

    if-eq v11, v13, :cond_5fd

    if-ne v11, v8, :cond_63e

    new-instance v8, Lw1f;

    const-string v11, "weather_alert_summary"

    const-string v13, "WeatherAlert"

    invoke-direct {v8, v11, v13}, Lw1f;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_658

    :cond_5fd
    invoke-static {v6}, Lqyn;->E(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_63e

    sget-object v11, Lwqm;->a:[Ljava/lang/String;

    const-string v11, "ofa:"

    invoke-virtual {v8, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_63b

    :try_start_60d
    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-static {v8}, Li8f;->a(Landroid/net/Uri;)Li8f;

    move-result-object v8
    :try_end_615
    .catch Lgva; {:try_start_60d .. :try_end_615} :catch_63b

    iget-object v11, v8, Li8f;->a:Ljava/lang/String;

    const-string v13, "ui/live_scores/match"

    invoke-virtual {v11, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_63b

    iget-object v8, v8, Li8f;->b:Ll1b;

    invoke-virtual {v8, v4}, Ll1b;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    if-eqz v8, :cond_63b

    invoke-static {v8}, Lkotlin/text/StringsKt;->k0(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    if-eqz v8, :cond_63b

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    new-instance v8, Ljoc;

    sget-object v11, Lapc;->c:Lapc;

    invoke-direct {v8, v13, v14, v11}, Ljoc;-><init>(JLapc;)V

    goto :goto_63c

    :catch_63b
    :cond_63b
    const/4 v8, 0x0

    :goto_63c
    if-nez v8, :cond_640

    :cond_63e
    const/4 v8, 0x0

    goto :goto_658

    :cond_640
    new-instance v11, Lw1f;

    invoke-static {v8}, Lsgb;->v(Ljoc;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v8}, Lsgb;->t(Ljoc;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v11, v13, v8}, Lw1f;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v8, v11

    goto :goto_658

    :cond_64f
    new-instance v8, Lw1f;

    const-string v11, "weather_forecast_summary"

    const-string v13, "WeatherForecast"

    invoke-direct {v8, v11, v13}, Lw1f;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_658
    if-eqz v8, :cond_68f

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v13, "key"

    iget-object v14, v8, Lw1f;->b:Ljava/lang/String;

    :try_start_663
    invoke-static {v14}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v11, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_66a
    .catch Lorg/json/JSONException; {:try_start_663 .. :try_end_66a} :catch_68a

    :try_start_66a
    invoke-virtual {v11, v4, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_66d
    .catch Lorg/json/JSONException; {:try_start_66a .. :try_end_66d} :catch_685

    const-string v10, "tag"

    iget-object v8, v8, Lw1f;->a:Ljava/lang/String;

    :try_start_671
    invoke-static {v8}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v11, v10, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_678
    .catch Lorg/json/JSONException; {:try_start_671 .. :try_end_678} :catch_680

    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v9, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_68f

    :catch_680
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_685
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_68a
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_68f
    :goto_68f
    const-string v8, "yes"

    const-string v9, "_test_in_app"

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_765

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_765

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6cb

    :try_start_6af
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_6c3

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_6cc

    :cond_6c3
    new-instance v4, Lorg/json/JSONException;

    const-string v5, "id is null"

    invoke-direct {v4, v5}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_6cb
    .catch Lorg/json/JSONException; {:try_start_6af .. :try_end_6cb} :catch_6cb

    :catch_6cb
    :cond_6cb
    const/4 v4, 0x0

    :goto_6cc
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_7d2

    sget-object v5, Lyjf;->a:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7d2

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6fc

    new-instance v5, Lws4;

    invoke-static {}, Lwub;->D()Lwub;

    move-result-object v7

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-direct {v5, v7, v8}, Lws4;-><init>(Lwub;Landroid/content/res/Resources;)V

    if-eqz v4, :cond_6fc

    sget-object v7, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lws4;->c(Ljava/util/Collection;Ljava/util/Collection;)V

    :cond_6fc
    invoke-static {v0, v4}, Lwbh;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    const/4 v10, 0x1

    if-eq v5, v10, :cond_70a

    sget-object v1, Lvn0;->q:Lvn0;

    invoke-static {v0, v6, v1}, Lz9c;->d(Lcom/opera/android/firebase/OperaFirebaseMessagingService;Ljava/util/HashMap;Lvn0;)V

    goto/16 :goto_98f

    :cond_70a
    invoke-static {v6}, Lqyn;->E(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lwqm;->s(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_740

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    sget-object v7, Llk6;->a:Llk6;

    new-instance v7, Lfg6;

    const/4 v8, 0x0

    invoke-direct {v7, v5, v0, v8, v12}, Lfg6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    sget-object v5, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    invoke-static {v5, v7}, Lscd;->g0(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljk6;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    const/4 v10, 0x1

    if-eq v5, v10, :cond_739

    const/4 v13, 0x2

    if-ne v5, v13, :cond_740

    sget-object v1, Lvn0;->o:Lvn0;

    invoke-static {v0, v6, v1}, Lz9c;->d(Lcom/opera/android/firebase/OperaFirebaseMessagingService;Ljava/util/HashMap;Lvn0;)V

    goto/16 :goto_98f

    :cond_739
    sget-object v1, Lvn0;->n:Lvn0;

    invoke-static {v0, v6, v1}, Lz9c;->d(Lcom/opera/android/firebase/OperaFirebaseMessagingService;Ljava/util/HashMap;Lvn0;)V

    goto/16 :goto_98f

    :cond_740
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_765

    const-string v3, "news_rule_id"

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_765

    sget-object v4, Lloc;->c:Lnx1;

    invoke-virtual {v4, v0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lloc;

    invoke-virtual {v4, v3}, Lloc;->b(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_765

    sget-object v1, Lvn0;->i:Lvn0;

    invoke-static {v0, v6, v1}, Lz9c;->d(Lcom/opera/android/firebase/OperaFirebaseMessagingService;Ljava/util/HashMap;Lvn0;)V

    goto/16 :goto_98f

    :cond_765
    iget-object v2, v2, Lq9c;->a:Lcom/leanplum/LeanplumFirebaseServiceHandler;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lcom/leanplum/LeanplumFirebaseServiceHandler;->onMessageReceived(Lrth;Landroid/content/Context;)V

    invoke-static {v6}, Lz9c;->e(Ljava/util/HashMap;)Lcm;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    iget-boolean v3, v2, Lx5f;->h:Z

    if-eqz v3, :cond_78e

    sget-object v3, Lxn0;->d:Lxn0;

    const/4 v10, 0x1

    invoke-virtual {v2, v1, v3, v10}, Lx5f;->b(Lqyl;Lxn0;Z)Lwn0;

    move-result-object v3

    invoke-virtual {v2, v3}, Lx5f;->V0(Lwn0;)V

    :cond_78e
    invoke-static {v6}, Lqyn;->E(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_7b1

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Lc37;

    new-instance v5, Lt1;

    const/16 v6, 0xc

    invoke-direct {v5, v3, v6}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance v3, Lrqd;

    const/16 v6, 0x1a

    invoke-direct {v3, v6}, Lrqd;-><init>(B)V

    invoke-direct {v4, v5, v3}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v4, v2}, Lc37;->A(Ljava/lang/String;)Lz0c;

    move-result-object v3

    if-nez v3, :cond_7b3

    :cond_7b1
    const/4 v5, 0x0

    goto :goto_7b7

    :cond_7b3
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    :goto_7b7
    if-eqz v5, :cond_98f

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->d:Lx5f;

    invoke-virtual {v1}, Lcm;->f()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lsj0;->b:Lsj0;

    sget-object v3, Lxn0;->d:Lxn0;

    invoke-virtual {v0, v1, v5, v2, v3}, Lx5f;->o0(Ljava/lang/String;Landroid/net/Uri;Lsj0;Lxn0;)V

    goto/16 :goto_98f

    :cond_7d2
    sget-object v1, Lvn0;->r:Lvn0;

    invoke-static {v0, v6, v1}, Lz9c;->d(Lcom/opera/android/firebase/OperaFirebaseMessagingService;Ljava/util/HashMap;Lvn0;)V

    goto/16 :goto_98f

    :pswitch_7d9
    invoke-virtual {v1}, Lrth;->getData()Ljava/util/Map;

    move-result-object v1

    const-string v2, "invalidation"

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Llcp;->n:Ljava/lang/Object;

    monitor-enter v2

    :try_start_7ea
    sget-object v3, Llcp;->o:Lbxk;

    if-nez v3, :cond_7f3

    invoke-static {v0, v1}, Lrih;->d(Lcom/opera/android/firebase/OperaFirebaseMessagingService;Ljava/lang/String;)V

    const/4 v5, 0x0

    goto :goto_818

    :cond_7f3
    if-nez v1, :cond_7f9

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v10, 0x1

    goto :goto_7fd

    :cond_7f9
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    :goto_7fd
    sget-object v3, Llcp;->o:Lbxk;

    new-instance v4, Ljava/util/concurrent/FutureTask;

    new-instance v5, Lnxk;

    invoke-direct {v5, v10, v3, v0, v1}, Lnxk;-><init>(ZLbxk;Lcom/opera/android/firebase/OperaFirebaseMessagingService;Ljava/util/List;)V

    invoke-direct {v4, v5}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    iget-object v0, v3, Lbxk;->b:Ljava/lang/Object;

    check-cast v0, Ldxk;

    iget-object v0, v0, Ldxk;->h:Lumi;

    invoke-interface {v0, v4}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Lnml;->a(Ljava/lang/Object;)Loml;

    move-object v5, v4

    :goto_818
    monitor-exit v2
    :try_end_819
    .catchall {:try_start_7ea .. :try_end_819} :catchall_822

    if-eqz v5, :cond_98f

    :try_start_81b
    invoke-interface {v5}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_81e
    .catch Ljava/lang/InterruptedException; {:try_start_81b .. :try_end_81e} :catch_98f
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_81b .. :try_end_81e} :catch_98f

    goto/16 :goto_98f

    :goto_820
    :try_start_820
    monitor-exit v2
    :try_end_821
    .catchall {:try_start_820 .. :try_end_821} :catchall_822

    throw v0

    :catchall_822
    move-exception v0

    goto :goto_820

    :pswitch_824
    iget-object v2, v1, Lrth;->f:Landroid/os/Bundle;

    const-string v3, "google.message_id"

    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_833

    const-string v3, "message_id"

    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    :cond_833
    invoke-virtual {v1}, Lrth;->getData()Ljava/util/Map;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->M:Lj4c;

    new-instance v2, Lnv6;

    invoke-direct {v2, v0}, Lnv6;-><init>(Ljava/lang/Object;)V

    const-string v3, "id"

    const-string v5, "type"

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_98f

    :try_start_856
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5
    :try_end_85a
    .catch Ljava/lang/NumberFormatException; {:try_start_856 .. :try_end_85a} :catch_98f

    const/4 v13, 0x1

    if-eq v5, v13, :cond_987

    const/4 v13, 0x2

    if-eq v5, v13, :cond_97d

    if-eq v5, v8, :cond_96b

    if-eq v5, v6, :cond_961

    if-eq v5, v4, :cond_943

    const/4 v13, 0x3

    if-eq v5, v13, :cond_8c9

    if-eq v5, v12, :cond_8b3

    const/4 v13, 0x6

    if-eq v5, v13, :cond_89f

    const/16 v3, 0x9

    if-eq v5, v3, :cond_889

    if-ne v5, v7, :cond_98f

    const-string v2, "sender_id"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_98f

    new-instance v2, Loe9;

    const/4 v10, 0x1

    invoke-direct {v2, v0, v1, v10}, Loe9;-><init>(Lj4c;Ljava/lang/String;B)V

    invoke-static {v2}, Lvml;->c(Ljava/lang/Runnable;)V

    goto/16 :goto_98f

    :cond_889
    const-string v0, "key_type"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_98f

    new-instance v1, Lcn7;

    const/16 v3, 0x1c

    invoke-direct {v1, v2, v0, v3}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    goto/16 :goto_98f

    :cond_89f
    const-string v2, "group_id"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_98f

    new-instance v2, Loe9;

    invoke-direct {v2, v0, v1, v10}, Loe9;-><init>(Lj4c;Ljava/lang/String;B)V

    invoke-static {v2}, Lvml;->c(Ljava/lang/Runnable;)V

    goto/16 :goto_98f

    :cond_8b3
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_98f

    :try_start_8bb
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_8bf
    .catch Ljava/lang/NumberFormatException; {:try_start_8bb .. :try_end_8bf} :catch_98f

    new-instance v3, Loi2;

    invoke-direct {v3, v0, v1, v2, v8}, Loi2;-><init>(Ljava/lang/Object;JB)V

    invoke-static {v3}, Lvml;->c(Ljava/lang/Runnable;)V

    goto/16 :goto_98f

    :cond_8c9
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "created_by"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v23, v3

    check-cast v23, Ljava/lang/String;

    const-string v3, "metadata"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v24, v3

    check-cast v24, Ljava/lang/String;

    const-string v3, "content"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v25, v3

    check-cast v25, Ljava/lang/String;

    const-string v3, "content_url"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v26, v3

    check-cast v26, Ljava/lang/String;

    const-string v3, "iv_metadata"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-nez v3, :cond_90f

    const-string v3, "iv"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    move-object/from16 v27, v3

    move-object/from16 v28, v27

    goto :goto_91b

    :cond_90f
    const-string v4, "iv_content"

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v28, v1

    move-object/from16 v27, v3

    :goto_91b
    if-eqz v2, :cond_98f

    if-eqz v23, :cond_98f

    if-eqz v24, :cond_98f

    if-eqz v25, :cond_98f

    :try_start_923
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v21
    :try_end_927
    .catch Ljava/lang/NumberFormatException; {:try_start_923 .. :try_end_927} :catch_98f

    if-eqz v27, :cond_936

    if-eqz v28, :cond_936

    new-instance v19, Lne9;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v28}, Lne9;-><init>(Lj4c;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static/range {v19 .. v19}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_98f

    :cond_936
    move-object/from16 v20, v0

    new-instance v19, Lni2;

    const/16 v24, 0x4

    invoke-direct/range {v19 .. v24}, Lni2;-><init>(Ljava/lang/Object;JLjava/lang/Object;B)V

    invoke-static/range {v19 .. v19}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_98f

    :cond_943
    const-string v2, "payload"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_98f

    :try_start_94d
    new-instance v2, Lorb;

    invoke-direct {v2, v1}, Lorb;-><init>(Ljava/lang/String;)V

    const-string v1, "action"

    invoke-virtual {v2, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_958
    .catch Lorg/json/JSONException; {:try_start_94d .. :try_end_958} :catch_98f

    new-instance v3, Ljbd;

    invoke-direct {v3, v0, v1, v2, v9}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_98f

    :cond_961
    new-instance v1, Lxwl;

    const/4 v13, 0x2

    invoke-direct {v1, v0, v13}, Lxwl;-><init>(Lj4c;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_98f

    :cond_96b
    const/4 v13, 0x2

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_98f

    new-instance v2, Loe9;

    invoke-direct {v2, v0, v1, v13}, Loe9;-><init>(Lj4c;Ljava/lang/String;B)V

    invoke-static {v2}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_98f

    :cond_97d
    new-instance v1, Lxwl;

    const/4 v10, 0x1

    invoke-direct {v1, v0, v10}, Lxwl;-><init>(Lj4c;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_98f

    :cond_987
    new-instance v1, Lxwl;

    invoke-direct {v1, v0, v10}, Lxwl;-><init>(Lj4c;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    :catch_98f
    :cond_98f
    :goto_98f
    return-void

    :pswitch_data_990
    .packed-switch 0x1
        :pswitch_824
        :pswitch_7d9
        :pswitch_537
        :pswitch_1f2
        :pswitch_1ab
        :pswitch_1a2
    .end packed-switch

    :pswitch_data_9a0
    .packed-switch 0x1
        :pswitch_595
        :pswitch_592
        :pswitch_590
        :pswitch_58d
        :pswitch_58a
        :pswitch_587
    .end packed-switch
.end method

.method public final onNewToken(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/firebase/OperaFirebaseMessagingService;->c()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    new-instance p1, Lqkf;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lqkf;-><init>(Lcom/opera/android/firebase/OperaFirebaseMessagingService;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method
