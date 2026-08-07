.class public Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Ll/edg0;",
        "Ll/hdg0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic X1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;->a2()Ll/edg0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic Y1()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;->b2()Ll/hdg0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final Z1()Ll/c;
    .locals 0

    .line 1
    new-instance p0, Ll/h1n;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h1n;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public a2()Ll/edg0;
    .locals 2

    .line 1
    new-instance v0, Ll/edg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;->Z1()Ll/c;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1}, Ll/edg0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;Ll/c;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public b2()Ll/hdg0;
    .locals 2

    .line 1
    new-instance v0, Ll/hdg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;->Z1()Ll/c;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1}, Ll/hdg0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;Ll/c;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_auto_renew_subscriptions_management_view"

    .line 2
    .line 3
    return-object p0
.end method
