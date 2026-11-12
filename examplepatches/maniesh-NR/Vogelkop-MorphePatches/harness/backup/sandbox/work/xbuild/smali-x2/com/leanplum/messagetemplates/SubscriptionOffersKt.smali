.class public final Lcom/leanplum/messagetemplates/SubscriptionOffersKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u001a1\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0001\u001a\u00020\u00002\u0018\u0010\u0006\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u00030\u0002H\u0000\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u001a=\u0010\u000e\u001a\u0014\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\r0\t\u0012\u0004\u0012\u00020\u00050\u00032\u001a\u0010\u000c\u001a\u0016\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000b0\n\u0018\u00010\tH\u0001\u00a2\u0006\u0004\u0008\u000e\u0010\u000f\u001a?\u0010\u0013\u001a\u00020\u00042\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\r0\t2\u0006\u0010\u0012\u001a\u00020\u00112\u0018\u0010\u0006\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u00030\u0002H\u0001\u00a2\u0006\u0004\u0008\u0013\u0010\u0014\u001a?\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\t2\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\r0\t2\u001a\u0010\u0016\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\u00150\tH\u0001\u00a2\u0006\u0004\u0008\u0017\u0010\u0018\u001a?\u0010\u0019\u001a\u00020\u00042\u0006\u0010\u0012\u001a\u00020\u00112\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\r0\t2\u0018\u0010\u0006\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u00030\u0002H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001a\u001a\u001d\u0010\u001c\u001a\u00020\u001b2\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\r0\tH\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u001d\u001a\u0017\u0010\u001f\u001a\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u001f\u0010 \u001a\u001b\u0010!\u001a\u000e\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u00050\u0003H\u0002\u00a2\u0006\u0004\u0008!\u0010\"\u001a/\u0010$\u001a\u0008\u0012\u0004\u0012\u00020\r0\t2\u0018\u0010#\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000b0\n0\tH\u0002\u00a2\u0006\u0004\u0008$\u0010%\u001a\u001f\u0010)\u001a\u00020\u00052\u0006\u0010&\u001a\u00020\u000b2\u0006\u0010(\u001a\u00020\'H\u0002\u00a2\u0006\u0004\u0008)\u0010*\"\u001a\u0010+\u001a\u00020\u000b8\u0000X\u0081T\u00a2\u0006\u000c\n\u0004\u0008+\u0010,\u0012\u0004\u0008-\u0010.\u00a8\u0006/"
    }
    d2 = {
        "Lcom/leanplum/ActionContext;",
        "actionContext",
        "Lcom/opera/api/Callback;",
        "Ltw7;",
        "",
        "Lcom/leanplum/messagetemplates/DiscardInfo;",
        "callback",
        "applySubscriptionOffers",
        "(Lcom/leanplum/ActionContext;Lcom/opera/api/Callback;)V",
        "",
        "",
        "",
        "rawOffers",
        "Lcom/leanplum/messagetemplates/Offer;",
        "parseAndValidateOffers",
        "(Ljava/util/List;)Ltw7;",
        "offers",
        "Lfmk;",
        "subscriptionPlansProvider",
        "applyOffersToProvider",
        "(Ljava/util/List;Lfmk;Lcom/opera/api/Callback;)V",
        "Lkotlin/Pair;",
        "appliedProductOfferIds",
        "findNonAppliedOfferIds",
        "(Ljava/util/List;Ljava/util/List;)Ljava/util/List;",
        "verifyOffersApplied",
        "(Lfmk;Ljava/util/List;Lcom/opera/api/Callback;)V",
        "",
        "validateOffers",
        "(Ljava/util/List;)Z",
        "offer",
        "validateOffer",
        "(Lcom/leanplum/messagetemplates/Offer;)Z",
        "getSubscriptionPlansProvider",
        "()Ltw7;",
        "offerMaps",
        "parseOffers",
        "(Ljava/util/List;)Ljava/util/List;",
        "message",
        "Leg0;",
        "reason",
        "makeDiscardInfo",
        "(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;",
        "DISCARD_MESSAGE_PREFIX",
        "Ljava/lang/String;",
        "getDISCARD_MESSAGE_PREFIX$annotations",
        "()V",
        "app"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final DISCARD_MESSAGE_PREFIX:Ljava/lang/String; = "Subscription: "
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public static synthetic a(Lcom/opera/api/Callback;Ljava/util/List;Lylk;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->verifyOffersApplied$lambda$0(Lcom/opera/api/Callback;Ljava/util/List;Lylk;)V

    return-void
.end method

.method public static final synthetic access$makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;

    move-result-object p0

    return-object p0
.end method

.method public static final applyOffersToProvider(Ljava/util/List;Lfmk;Lcom/opera/api/Callback;)V
    .registers 12
    .param p0    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lfmk;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/opera/api/Callback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/leanplum/messagetemplates/Offer;",
            ">;",
            "Lfmk;",
            "Lcom/opera/api/Callback;",
            ")V"
        }
    .end annotation

    move-object v0, p0

    check-cast v0, Ljava/lang/Iterable;

    const/16 v1, 0xa

    invoke-static {v0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-static {v1}, Lqbd;->a(I)I

    move-result v1

    const/16 v2, 0x10

    if-ge v1, v2, :cond_12

    move v1, v2

    :cond_12
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_40

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/leanplum/messagetemplates/Offer;

    invoke-virtual {v1}, Lcom/leanplum/messagetemplates/Offer;->getProductId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lulk;

    invoke-virtual {v1}, Lcom/leanplum/messagetemplates/Offer;->getOfferId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/leanplum/messagetemplates/Offer;->getExpirationTime()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v1}, Lcom/leanplum/messagetemplates/Offer;->isPersonalized()Z

    move-result v1

    invoke-direct {v4, v5, v6, v1}, Lulk;-><init>(Ljava/lang/String;Ljava/util/Date;Z)V

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1b

    :cond_40
    iget-object v0, p1, Lfmk;->e:Ljvg;

    iget-object v0, v0, Ljvg;->b:Ljava/lang/Object;

    check-cast v0, Lni6;

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v3

    invoke-static {v3}, Lqbd;->a(I)I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lulk;

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "offer_id"

    iget-object v7, v3, Lulk;->a:Ljava/lang/String;

    :try_start_7c
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_83
    .catch Lorg/json/JSONException; {:try_start_7c .. :try_end_83} :catch_b3

    const-string v6, "expiration_time"

    iget-object v7, v3, Lulk;->b:Ljava/util/Date;

    sget-object v8, Lyjb;->a:Lf30;

    invoke-virtual {v8}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/text/SimpleDateFormat;

    invoke-virtual {v8, v7}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    :try_start_93
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9a
    .catch Lorg/json/JSONException; {:try_start_93 .. :try_end_9a} :catch_ae

    const-string v6, "is_personalized"

    iget-boolean v3, v3, Lulk;->c:Z

    :try_start_9e
    invoke-virtual {v5, v6, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_a1
    .catch Lorg/json/JSONException; {:try_start_9e .. :try_end_a1} :catch_a9

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5d

    :catch_a9
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_ae
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_b3
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_b8
    iget-object v0, v0, Lni6;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_cf
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_eb

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_cf

    :cond_eb
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p1, p0, p2}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->verifyOffersApplied(Lfmk;Ljava/util/List;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public static final applySubscriptionOffers(Lcom/leanplum/ActionContext;Lcom/opera/api/Callback;)V
    .registers 4
    .param p0    # Lcom/leanplum/ActionContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/opera/api/Callback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/ActionContext;",
            "Lcom/opera/api/Callback;",
            ")V"
        }
    .end annotation

    :try_start_0
    const-string v0, "Offers"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->objectNamed(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;
    :try_end_8
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_8} :catch_56

    invoke-static {p0}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->parseAndValidateOffers(Ljava/util/List;)Ltw7;

    move-result-object p0

    instance-of v0, p0, Lrw7;

    if-eqz v0, :cond_1f

    check-cast p0, Lrw7;

    iget-object p0, p0, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Lcom/leanplum/messagetemplates/DiscardInfo;

    new-instance v0, Lrw7;

    invoke-direct {v0, p0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_1f
    instance-of v0, p0, Lsw7;

    if-eqz v0, :cond_52

    check-cast p0, Lsw7;

    iget-object p0, p0, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-static {}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->getSubscriptionPlansProvider()Ltw7;

    move-result-object v0

    instance-of v1, v0, Lrw7;

    if-eqz v1, :cond_40

    check-cast v0, Lrw7;

    iget-object p0, v0, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Lcom/leanplum/messagetemplates/DiscardInfo;

    new-instance v0, Lrw7;

    invoke-direct {v0, p0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_40
    instance-of v1, v0, Lsw7;

    if-eqz v1, :cond_4e

    check-cast v0, Lsw7;

    iget-object v0, v0, Lsw7;->a:Ljava/lang/Object;

    check-cast v0, Lfmk;

    invoke-static {p0, v0, p1}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->applyOffersToProvider(Ljava/util/List;Lfmk;Lcom/opera/api/Callback;)V

    return-void

    :cond_4e
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_52
    invoke-static {}, Lh9o;->p()V

    return-void

    :catch_56
    const-string p0, "Invalid offer format"

    sget-object v0, Leg0;->e:Leg0;

    invoke-static {p0, v0}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;

    move-result-object p0

    new-instance v0, Lrw7;

    invoke-direct {v0, p0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public static final findNonAppliedOfferIds(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .registers 7
    .param p0    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/leanplum/messagetemplates/Offer;",
            ">;",
            "Ljava/util/List<",
            "Lkotlin/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    check-cast p0, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_b
    :goto_b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/leanplum/messagetemplates/Offer;

    invoke-virtual {v2}, Lcom/leanplum/messagetemplates/Offer;->getProductId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lcom/leanplum/messagetemplates/Offer;->getOfferId()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v3, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {p1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_2f
    new-instance p0, Ljava/util/ArrayList;

    const/16 p1, 0xa

    invoke-static {v0, p1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p1

    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x0

    :goto_3f
    if-ge v1, p1, :cond_51

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lcom/leanplum/messagetemplates/Offer;

    invoke-virtual {v2}, Lcom/leanplum/messagetemplates/Offer;->getOfferId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_3f

    :cond_51
    return-object p0
.end method

.method public static synthetic getDISCARD_MESSAGE_PREFIX$annotations()V
    .registers 0

    return-void
.end method

.method private static final getSubscriptionPlansProvider()Ltw7;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ltw7;"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v1, v0, Lcom/opera/android/BrowserActivity;

    if-nez v1, :cond_16

    const-string v0, "Invalid activity"

    sget-object v1, Leg0;->f:Leg0;

    invoke-static {v0, v1}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;

    move-result-object v0

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    return-object v1

    :cond_16
    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    invoke-virtual {v0}, Lhx3;->y()Lcom/opera/android/Lazy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfmk;

    new-instance v1, Lsw7;

    invoke-direct {v1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    return-object v1
.end method

.method private static final makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;
    .registers 4

    new-instance v0, Lcom/leanplum/messagetemplates/DiscardInfo;

    const-string v1, "Subscription: "

    invoke-static {v1, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lcom/leanplum/messagetemplates/DiscardInfo;-><init>(Ljava/lang/String;Leg0;)V

    return-object v0
.end method

.method public static final parseAndValidateOffers(Ljava/util/List;)Ltw7;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)",
            "Ltw7;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    sget-object v1, Leg0;->e:Leg0;

    if-eqz v0, :cond_1e

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1e

    :try_start_d
    invoke-static {p0}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->parseOffers(Ljava/util/List;)Ljava/util/List;

    move-result-object p0
    :try_end_11
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d .. :try_end_11} :catch_12

    goto :goto_20

    :catch_12
    const-string p0, "Failed to parse offers"

    invoke-static {p0, v1}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;

    move-result-object p0

    new-instance v0, Lrw7;

    invoke-direct {v0, p0}, Lrw7;-><init>(Ljava/lang/Object;)V

    return-object v0

    :cond_1e
    sget-object p0, Ll08;->a:Ll08;

    :goto_20
    invoke-static {p0}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->validateOffers(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string p0, "Invalid subscription offers"

    invoke-static {p0, v1}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;

    move-result-object p0

    new-instance v0, Lrw7;

    invoke-direct {v0, p0}, Lrw7;-><init>(Ljava/lang/Object;)V

    return-object v0

    :cond_32
    new-instance v0, Lsw7;

    invoke-direct {v0, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method private static final parseOffers(Ljava/util/List;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/List<",
            "Lcom/leanplum/messagetemplates/Offer;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_1
    check-cast p0, Ljava/lang/Iterable;

    sget-object v1, Lcom/leanplum/messagetemplates/Offer;->Companion:Lcom/leanplum/messagetemplates/Offer$Companion;

    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {p0, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_14
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-virtual {v1, v3}, Lcom/leanplum/messagetemplates/Offer$Companion;->parse(Ljava/util/Map;)Lcom/leanplum/messagetemplates/Offer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_27
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_27} :catch_2e
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_27} :catch_29

    goto :goto_14

    :cond_28
    return-object v2

    :catch_29
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v0

    :catch_2e
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method private static final validateOffer(Lcom/leanplum/messagetemplates/Offer;)Z
    .registers 3

    sget-object v0, Lzsk;->f:Ljava/util/Map;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/Offer;->getProductId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_e

    return v1

    :cond_e
    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/Offer;->getExpirationTime()Ljava/util/Date;

    move-result-object p0

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {p0, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result p0

    if-nez p0, :cond_1f

    const/4 p0, 0x1

    return p0

    :cond_1f
    return v1
.end method

.method private static final validateOffers(Ljava/util/List;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/leanplum/messagetemplates/Offer;",
            ">;)Z"
        }
    .end annotation

    move-object v0, p0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_11
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lcom/leanplum/messagetemplates/Offer;

    invoke-virtual {v4}, Lcom/leanplum/messagetemplates/Offer;->getProductId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_2c
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_38

    return v2

    :cond_38
    check-cast p0, Ljava/lang/Iterable;

    instance-of v0, p0, Ljava/util/Collection;

    const/4 v1, 0x1

    if-eqz v0, :cond_49

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_49

    return v1

    :cond_49
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_4d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_60

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/leanplum/messagetemplates/Offer;

    invoke-static {v0}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->validateOffer(Lcom/leanplum/messagetemplates/Offer;)Z

    move-result v0

    if-nez v0, :cond_4d

    return v2

    :cond_60
    return v1
.end method

.method private static final verifyOffersApplied(Lfmk;Ljava/util/List;Lcom/opera/api/Callback;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lfmk;",
            "Ljava/util/List<",
            "Lcom/leanplum/messagetemplates/Offer;",
            ">;",
            "Lcom/opera/api/Callback;",
            ")V"
        }
    .end annotation

    new-instance v0, Lrzj;

    invoke-direct {v0, p2, p1}, Lrzj;-><init>(Lcom/opera/api/Callback;Ljava/util/List;)V

    iget-object p1, p0, Lfmk;->d:Ljava/util/HashSet;

    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lfmk;->b()V

    return-void
.end method

.method private static final verifyOffersApplied$lambda$0(Lcom/opera/api/Callback;Ljava/util/List;Lylk;)V
    .registers 4

    new-instance v0, Lcom/leanplum/messagetemplates/SubscriptionOffersKt$verifyOffersApplied$1$1;

    invoke-direct {v0, p0, p1}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt$verifyOffersApplied$1$1;-><init>(Lcom/opera/api/Callback;Ljava/util/List;)V

    invoke-virtual {p2, v0}, Lylk;->s0(Ldmk;)V

    return-void
.end method
