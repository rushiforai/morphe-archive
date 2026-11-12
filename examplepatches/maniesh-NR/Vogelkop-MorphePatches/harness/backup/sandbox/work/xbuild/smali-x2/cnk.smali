.class public final Lcnk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lmgh;

.field public final d:Ljava/util/concurrent/CountDownLatch;

.field public final e:Ljava/lang/Object;

.field public f:Ljava/util/List;

.field public g:Loml;

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lmgh;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcnk;->e:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcnk;->a:Landroid/content/Context;

    iput-object p2, p0, Lcnk;->b:Lumi;

    iput-object p3, p0, Lcnk;->c:Lmgh;

    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    const/4 p3, 0x1

    invoke-direct {p1, p3}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object p1, p0, Lcnk;->d:Ljava/util/concurrent/CountDownLatch;

    new-instance p1, Lxmk;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Lxmk;-><init>(Lcnk;B)V

    invoke-interface {p2, p1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public static c(Lvpb;)Ljava/util/ArrayList;
    .registers 14

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    move v3, v2

    :goto_d
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_63

    invoke-virtual {p0, v3}, Lvpb;->c(I)Lorb;

    move-result-object v4

    const-string v5, "locations"

    invoke-virtual {v4, v5}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v5

    new-instance v6, Ljava/util/ArrayList;

    iget-object v7, v5, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v8

    invoke-direct {v6, v8}, Ljava/util/ArrayList;-><init>(I)V

    move v8, v2

    :goto_29
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v9

    const-string v10, "display_name"

    if-ge v8, v9, :cond_4a

    invoke-virtual {v5, v8}, Lvpb;->c(I)Lorb;

    move-result-object v9

    new-instance v11, Lank;

    const-string v12, "name"

    invoke-virtual {v9, v12}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v10}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v11, v12, v9}, Lank;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_29

    :cond_4a
    new-instance v5, Lbnk;

    const-string v7, "country_code"

    invoke-virtual {v4, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v10}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v6

    invoke-direct {v5, v7, v4, v6}, Lbnk;-><init>(Ljava/lang/String;Ljava/lang/String;Lh1b;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    :cond_63
    return-object v0
.end method


# virtual methods
.method public final a(Ljava/util/Map;)Ljava/util/List;
    .registers 15

    :try_start_0
    iget-object v0, p0, Lcnk;->d:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_5} :catch_aa

    iget-object v0, p0, Lcnk;->e:Ljava/lang/Object;

    monitor-enter v0

    :try_start_8
    iget-object v1, p0, Lcnk;->f:Ljava/util/List;

    monitor-exit v0
    :try_end_b
    .catchall {:try_start_8 .. :try_end_b} :catchall_a8

    if-eqz p1, :cond_a5

    const/4 v0, 0x0

    const/4 v2, 0x0

    move-object v5, v0

    move v3, v2

    move v4, v3

    :goto_12
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    if-ge v3, v6, :cond_84

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lbnk;

    iget-object v7, v6, Lbnk;->a:Ljava/lang/String;

    iget-object v8, v6, Lbnk;->c:Lh1b;

    invoke-interface {p1, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-nez v7, :cond_2c

    sget-object v7, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_2c
    move-object v10, v0

    move v9, v2

    :goto_2e
    invoke-virtual {v8}, Ljava/util/AbstractCollection;->size()I

    move-result v11

    if-ge v9, v11, :cond_58

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lank;

    iget-object v12, v11, Lank;->a:Ljava/lang/String;

    invoke-interface {v7, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4a

    add-int/lit8 v4, v4, 0x1

    if-eqz v10, :cond_55

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_55

    :cond_4a
    if-nez v10, :cond_55

    new-instance v10, Ljava/util/ArrayList;

    invoke-virtual {v8, v2, v9}, Lh1b;->B(II)Lh1b;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :cond_55
    :goto_55
    add-int/lit8 v9, v9, 0x1

    goto :goto_2e

    :cond_58
    if-nez v10, :cond_60

    if-eqz v5, :cond_81

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_81

    :cond_60
    if-nez v5, :cond_6b

    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v1, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :cond_6b
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_81

    new-instance v7, Lbnk;

    iget-object v8, v6, Lbnk;->a:Ljava/lang/String;

    iget-object v6, v6, Lbnk;->b:Ljava/lang/String;

    invoke-static {v10}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v9

    invoke-direct {v7, v8, v6, v9}, Lbnk;-><init>(Ljava/lang/String;Ljava/lang/String;Lh1b;)V

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_81
    :goto_81
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    :cond_84
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    if-ge v4, p1, :cond_a1

    iget-object p0, p0, Lcnk;->a:Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "vpn.subscription_locations_outdated"

    const/4 v2, 0x1

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_a1
    if-nez v5, :cond_a4

    return-object v1

    :cond_a4
    return-object v5

    :cond_a5
    return-object v1

    :goto_a6
    :try_start_a6
    monitor-exit v0
    :try_end_a7
    .catchall {:try_start_a6 .. :try_end_a7} :catchall_a8

    throw p0

    :catchall_a8
    move-exception p0

    goto :goto_a6

    :catch_aa
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method

.method public final b()V
    .registers 15

    iget-object v0, p0, Lcnk;->b:Lumi;

    iget-object v1, p0, Lcnk;->c:Lmgh;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-static {v2}, Lscd;->w(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v1, Lmgh;->b:Ljava/lang/Object;

    check-cast v3, Lhv1;

    invoke-virtual {v3}, Lhv1;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ldnk;

    iget-object v4, v3, Ldnk;->b:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x9

    const/4 v6, 0x0

    if-nez v4, :cond_23

    move-object v1, v6

    goto :goto_87

    :cond_23
    new-instance v4, Lfvh;

    invoke-direct {v4}, Lfvh;-><init>()V

    iget-object v7, v3, Ldnk;->a:Landroid/net/Uri;

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lrma;

    const/4 v9, 0x4

    invoke-direct {v8, v9}, Lrma;-><init>(B)V

    invoke-virtual {v8, v7, v6}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v8}, Lrma;->d()Lhra;

    move-result-object v7

    const-string v8, "api/v1/vpn/xv/locations"

    invoke-virtual {v7, v8}, Lhra;->i(Ljava/lang/String;)Lhra;

    move-result-object v7

    invoke-virtual {v7}, Lhra;->g()Lrma;

    move-result-object v7

    invoke-virtual {v7}, Lrma;->d()Lhra;

    move-result-object v7

    iput-object v7, v4, Lfvh;->a:Lhra;

    const-string v7, "Accept-Language"

    invoke-virtual {v4, v7, v2}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "Authorization"

    iget-object v3, v3, Ldnk;->b:Ljava/lang/String;

    const-string v7, "Token "

    invoke-virtual {v7, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lkvh;

    invoke-direct {v2, v4}, Lkvh;-><init>(Lfvh;)V

    iget-object v1, v1, Lmgh;->c:Ljava/lang/Object;

    check-cast v1, Lii;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt9f;

    invoke-virtual {v1, v2}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v7

    new-instance v8, Lr4k;

    invoke-direct {v8, v5}, Lr4k;-><init>(B)V

    new-instance v9, Lr4k;

    const/16 v1, 0xa

    invoke-direct {v9, v1}, Lr4k;-><init>(B)V

    const-wide/16 v11, 0x0

    const/16 v13, 0x78

    const/4 v10, 0x0

    invoke-static/range {v7 .. v13}, Lvtp;->R(Lokhttp3/internal/connection/RealCall;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;IJI)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lvpb;

    :goto_87
    if-eqz v1, :cond_b1

    :try_start_89
    invoke-static {v1}, Lcnk;->c(Lvpb;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    new-instance v3, Ltxi;

    const/16 v4, 0x15

    invoke-direct {v3, p0, v4}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    iget-object v1, p0, Lcnk;->e:Ljava/lang/Object;

    monitor-enter v1
    :try_end_a2
    .catch Lorg/json/JSONException; {:try_start_89 .. :try_end_a2} :catch_b0

    :try_start_a2
    iput-object v2, p0, Lcnk;->f:Ljava/util/List;

    monitor-exit v1
    :try_end_a5
    .catchall {:try_start_a2 .. :try_end_a5} :catchall_ad

    :try_start_a5
    iget-object p0, p0, Lcnk;->d:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V
    :try_end_aa
    .catch Lorg/json/JSONException; {:try_start_a5 .. :try_end_aa} :catch_b0

    return-void

    :goto_ab
    :try_start_ab
    monitor-exit v1
    :try_end_ac
    .catchall {:try_start_ab .. :try_end_ac} :catchall_ad

    :try_start_ac
    throw p0
    :try_end_ad
    .catch Lorg/json/JSONException; {:try_start_ac .. :try_end_ad} :catch_b0

    :catchall_ad
    move-exception v0

    move-object p0, v0

    goto :goto_ab

    :catch_b0
    return-void

    :cond_b1
    new-instance v1, Lymk;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lymk;-><init>(Lcnk;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lcrk;

    invoke-direct {p0, v1, v5}, Lcrk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v6}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
