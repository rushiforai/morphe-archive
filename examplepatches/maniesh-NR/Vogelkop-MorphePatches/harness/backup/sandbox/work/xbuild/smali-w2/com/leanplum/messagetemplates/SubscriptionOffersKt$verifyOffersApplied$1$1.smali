.class public final Lcom/leanplum/messagetemplates/SubscriptionOffersKt$verifyOffersApplied$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldmk;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->verifyOffersApplied(Lfmk;Ljava/util/List;Lcom/opera/api/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\tJ\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "com/leanplum/messagetemplates/SubscriptionOffersKt$verifyOffersApplied$1$1",
        "Ldmk;",
        "Lcmk;",
        "loading",
        "",
        "handleSubscriptionPlans",
        "(Lcmk;)V",
        "Lbmk;",
        "list",
        "(Lbmk;)V",
        "Lzlk;",
        "failure",
        "(Lzlk;)V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $callback:Lcom/opera/api/Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/opera/api/Callback;"
        }
    .end annotation
.end field

.field final synthetic $offers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/leanplum/messagetemplates/Offer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/opera/api/Callback;Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Ljava/util/List<",
            "Lcom/leanplum/messagetemplates/Offer;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/leanplum/messagetemplates/SubscriptionOffersKt$verifyOffersApplied$1$1;->$callback:Lcom/opera/api/Callback;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/SubscriptionOffersKt$verifyOffersApplied$1$1;->$offers:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleSubscriptionPlans(Lbmk;)V
    .registers 10

    iget-object p1, p1, Lbmk;->c:Lcsh;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget v1, p1, Lcsh;->d:I

    const/4 v2, 0x0

    :goto_10
    if-ge v2, v1, :cond_2b

    invoke-virtual {p1, v2}, Lcsh;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lamk;

    iget-object v4, v3, Lamk;->a:Lzsk;

    iget-object v4, v4, Lzsk;->a:Ljava/lang/String;

    iget-object v3, v3, Lamk;->c:Lxlk;

    iget-object v3, v3, Lxlk;->e:Ljava/lang/String;

    new-instance v5, Lkotlin/Pair;

    invoke-direct {v5, v4, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_10

    :cond_2b
    iget-object p1, p0, Lcom/leanplum/messagetemplates/SubscriptionOffersKt$verifyOffersApplied$1$1;->$offers:Ljava/util/List;

    invoke-static {p1, v0}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->findNonAppliedOfferIds(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    iget-object p0, p0, Lcom/leanplum/messagetemplates/SubscriptionOffersKt$verifyOffersApplied$1$1;->$callback:Lcom/opera/api/Callback;

    if-eqz v0, :cond_44

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v0, Lsw7;

    invoke-direct {v0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_44
    move-object v1, p1

    check-cast v1, Ljava/lang/Iterable;

    const/4 v6, 0x0

    const/16 v7, 0x3e

    const-string v2, ", "

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Non-applied offers: "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Leg0;->e:Leg0;

    # invokes: Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;
    invoke-static {p1, v0}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->access$makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;

    move-result-object p1

    new-instance v0, Lrw7;

    invoke-direct {v0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public handleSubscriptionPlans(Lcmk;)V
    .registers 3

    .line 104
    iget-object p0, p0, Lcom/leanplum/messagetemplates/SubscriptionOffersKt$verifyOffersApplied$1$1;->$callback:Lcom/opera/api/Callback;

    .line 105
    const-string p1, "Failed to load subscriptions"

    .line 106
    sget-object v0, Leg0;->f:Leg0;

    .line 107
    # invokes: Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;
    invoke-static {p1, v0}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->access$makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;

    move-result-object p1

    .line 108
    new-instance v0, Lrw7;

    invoke-direct {v0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    .line 109
    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public handleSubscriptionPlans(Lzlk;)V
    .registers 3

    .line 110
    iget-object p0, p0, Lcom/leanplum/messagetemplates/SubscriptionOffersKt$verifyOffersApplied$1$1;->$callback:Lcom/opera/api/Callback;

    .line 111
    const-string p1, "Failed to load subscriptions"

    .line 112
    sget-object v0, Leg0;->f:Leg0;

    .line 113
    # invokes: Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;
    invoke-static {p1, v0}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->access$makeDiscardInfo(Ljava/lang/String;Leg0;)Lcom/leanplum/messagetemplates/DiscardInfo;

    move-result-object p1

    .line 114
    new-instance v0, Lrw7;

    invoke-direct {v0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    .line 115
    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method
