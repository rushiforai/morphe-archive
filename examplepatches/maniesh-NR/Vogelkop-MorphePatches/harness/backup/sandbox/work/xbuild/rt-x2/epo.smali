.class public abstract Lepo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;


# direct methods
.method public static final a(Landroid/content/Context;Lkuk;)Ljava/lang/Object;
    .registers 5

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lbb7;->a:Lcv6;

    sget-object v0, Lmr6;->b:Lmr6;

    new-instance v1, Lnmo;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lnmo;-><init>(Landroid/content/Context;Lmt5;)V

    invoke-static {v0, v1, p1}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_17

    return-object p0

    :cond_17
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
