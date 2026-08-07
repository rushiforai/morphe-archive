.class public Lcom/p1/mobile/putong/location/IntlLocationProvider$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/location/LocationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/location/IntlLocationProvider;->G()V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider$a;->a:Lcom/p1/mobile/putong/location/IntlLocationProvider;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/x95;->q(Landroid/location/Location;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/location/Location;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/location/Location;-><init>(Landroid/location/Location;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    const-string p1, "location_provider"

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->y()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    filled-new-array {p1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v1, "e_location_provider"

    .line 40
    .line 41
    const-string v2, ""

    .line 42
    .line 43
    invoke-static {v1, v2, p1}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->y()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string v1, "android system location provider: %s"

    .line 55
    .line 56
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const-string v1, "LocationProvider"

    .line 61
    .line 62
    invoke-static {v1, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v1, "onLocationChanged location = "

    .line 68
    .line 69
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v1, "[putong-common][location]"

    .line 80
    .line 81
    invoke-static {v1, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider$a;->a:Lcom/p1/mobile/putong/location/IntlLocationProvider;

    .line 85
    .line 86
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/location/IntlLocationProvider;->E(Lcom/p1/mobile/putong/location/IntlLocationProvider;Lcom/p1/mobile/putong/location/Location;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider$a;->a:Lcom/p1/mobile/putong/location/IntlLocationProvider;

    .line 90
    .line 91
    const/4 p1, 0x1

    .line 92
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/location/a;->s(Lcom/p1/mobile/putong/location/Location;Z)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0

    return-void
.end method
