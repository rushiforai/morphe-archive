.class public Lcom/p1/mobile/putong/location/IntlLocationProvider$b;
.super Lcom/google/android/gms/location/LocationCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/location/IntlLocationProvider;->A(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/location/IntlLocationProvider;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/location/IntlLocationProvider;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider$b;->a:Lcom/p1/mobile/putong/location/IntlLocationProvider;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/location/LocationCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLocationResult(Lcom/google/android/gms/location/LocationResult;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/location/LocationResult;->getLastLocation()Landroid/location/Location;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/x95;->q(Landroid/location/Location;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider$b;->a:Lcom/p1/mobile/putong/location/IntlLocationProvider;

    .line 17
    .line 18
    new-instance v1, Lcom/p1/mobile/putong/location/Location;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/location/Location;-><init>(Landroid/location/Location;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/location/IntlLocationProvider;->E(Lcom/p1/mobile/putong/location/IntlLocationProvider;Lcom/p1/mobile/putong/location/Location;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider$b;->a:Lcom/p1/mobile/putong/location/IntlLocationProvider;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/location/IntlLocationProvider;->E(Lcom/p1/mobile/putong/location/IntlLocationProvider;Lcom/p1/mobile/putong/location/Location;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider$b;->a:Lcom/p1/mobile/putong/location/IntlLocationProvider;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/p1/mobile/putong/location/IntlLocationProvider;->D(Lcom/p1/mobile/putong/location/IntlLocationProvider;)Lcom/p1/mobile/putong/location/Location;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider$b;->a:Lcom/p1/mobile/putong/location/IntlLocationProvider;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/p1/mobile/putong/location/IntlLocationProvider;->D(Lcom/p1/mobile/putong/location/IntlLocationProvider;)Lcom/p1/mobile/putong/location/Location;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const/4 v0, 0x1

    .line 52
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/location/a;->s(Lcom/p1/mobile/putong/location/Location;Z)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method
