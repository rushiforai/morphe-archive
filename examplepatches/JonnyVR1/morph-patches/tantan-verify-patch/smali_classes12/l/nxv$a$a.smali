.class Ll/nxv$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/location/LocationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nxv$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/nxv$a;


# direct methods
.method public constructor <init>(Ll/nxv$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxv$a$a;->a:Ll/nxv$a;

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
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/nxv$a$a;->a:Ll/nxv$a;

    .line 4
    .line 5
    iget-object v0, v0, Ll/nxv$a;->c:Ll/nxv;

    .line 6
    .line 7
    invoke-static {v0}, Ll/nxv;->a(Ll/nxv;)Ll/nxv$b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    double-to-float v1, v1

    .line 16
    iput v1, v0, Ll/nxv$b;->b:F

    .line 17
    .line 18
    iget-object v0, p0, Ll/nxv$a$a;->a:Ll/nxv$a;

    .line 19
    .line 20
    iget-object v0, v0, Ll/nxv$a;->c:Ll/nxv;

    .line 21
    .line 22
    invoke-static {v0}, Ll/nxv;->a(Ll/nxv;)Ll/nxv$b;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    double-to-float p1, v1

    .line 31
    iput p1, v0, Ll/nxv$b;->a:F

    .line 32
    .line 33
    iget-object p1, p0, Ll/nxv$a$a;->a:Ll/nxv$a;

    .line 34
    .line 35
    iget-object p1, p1, Ll/nxv$a;->a:Landroid/location/LocationManager;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method
