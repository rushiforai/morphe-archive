.class public final Lwz9;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public t:Z

.field public final synthetic u:Lk5o;


# direct methods
.method public constructor <init>(Lk5o;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lwz9;->u:Lk5o;

    const/4 p1, 0x1

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Lmt5;)Lmt5;
    .registers 3

    new-instance v0, Lwz9;

    iget-object p0, p0, Lwz9;->u:Lk5o;

    invoke-direct {v0, p0, p1}, Lwz9;-><init>(Lk5o;Lmt5;)V

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lmt5;

    invoke-virtual {p0, p1}, Lwz9;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwz9;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwz9;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-object v0, p0, Lwz9;->u:Lk5o;

    iget-object v1, v0, Lk5o;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-boolean v3, p0, Lwz9;->t:Z

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_1a

    if-ne v3, v5, :cond_14

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_67

    :cond_14
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_1a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    const-string p1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v1, p1}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_33

    const-string p1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v1, p1}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_33

    new-instance p0, Lkbb;

    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    throw p0

    :cond_33
    new-instance p1, Lcom/google/android/gms/tasks/CancellationTokenSource;

    invoke-direct {p1}, Lcom/google/android/gms/tasks/CancellationTokenSource;-><init>()V

    iget-object v0, v0, Lk5o;->c:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/location/FusedLocationProviderClient;

    new-instance v1, Lcom/google/android/gms/location/CurrentLocationRequest$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/location/CurrentLocationRequest$Builder;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/google/android/gms/location/CurrentLocationRequest$Builder;->setGranularity(I)Lcom/google/android/gms/location/CurrentLocationRequest$Builder;

    move-result-object v1

    const/16 v3, 0x66

    invoke-virtual {v1, v3}, Lcom/google/android/gms/location/CurrentLocationRequest$Builder;->setPriority(I)Lcom/google/android/gms/location/CurrentLocationRequest$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/location/CurrentLocationRequest$Builder;->build()Lcom/google/android/gms/location/CurrentLocationRequest;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/CancellationTokenSource;->getToken()Lcom/google/android/gms/tasks/CancellationToken;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Lcom/google/android/gms/location/FusedLocationProviderClient;->getCurrentLocation(Lcom/google/android/gms/location/CurrentLocationRequest;Lcom/google/android/gms/tasks/CancellationToken;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    iput-boolean v5, p0, Lwz9;->t:Z

    invoke-static {v0, p1, p0}, La4h;->b(Lcom/google/android/gms/tasks/Task;Lcom/google/android/gms/tasks/CancellationTokenSource;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v2, :cond_67

    return-object v2

    :cond_67
    :goto_67
    check-cast p1, Landroid/location/Location;

    if-eqz p1, :cond_83

    new-instance v5, Luv9;

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v8

    sget-object p0, Lebb;->c:Lebb;

    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide p0

    invoke-static {p0, p1}, Lj06;->m(J)Lebb;

    move-result-object v10

    invoke-direct/range {v5 .. v10}, Luv9;-><init>(DDLebb;)V

    return-object v5

    :cond_83
    return-object v4
.end method
