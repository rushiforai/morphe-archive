.class public Ll/rk60;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;ZLjava/lang/String;Ljava/lang/String;Ll/bn50;)V
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-static/range {v0 .. v6}, Ll/rk60;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;ZLjava/lang/String;Ljava/lang/String;Ll/bn50;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;ZLjava/lang/String;Ljava/lang/String;Ll/bn50;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/bn50;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/hso;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/hso;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p5}, Ll/hso;->t(Ll/bn50;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p6}, Ll/hso;->s(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    instance-of p1, p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    move-object p1, p0

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/bbm;->i()Lcom/android/billingclient/api/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    :goto_0
    invoke-static {p0, p1}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0, p2, p3, p4}, Ll/hso;->q(Ll/aso;ZLjava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
