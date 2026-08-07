.class public Ll/xww;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:D

.field public d:D


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;DD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xww;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xww;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/xww;->c:D

    .line 9
    .line 10
    iput-wide p5, p0, Ll/xww;->d:D

    .line 11
    .line 12
    return-void
.end method

.method public static a(Landroid/location/Address;)Ll/xww;
    .locals 7

    .line 1
    new-instance v0, Ll/xww;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/location/Address;->getFeatureName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p0, v2}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p0}, Landroid/location/Address;->getLatitude()D

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    invoke-virtual {p0}, Landroid/location/Address;->getLongitude()D

    .line 17
    .line 18
    .line 19
    move-result-wide v5

    .line 20
    invoke-direct/range {v0 .. v6}, Ll/xww;-><init>(Ljava/lang/String;Ljava/lang/String;DD)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static b(Lcom/p1/mobile/putong/core/data/PlaceDetailsResult;)Ll/xww;
    .locals 7

    .line 1
    new-instance v0, Ll/xww;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PlaceDetailsResult;->name:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/PlaceDetailsResult;->formatted_address:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PlaceDetailsResult;->geometry:Lcom/p1/mobile/putong/core/data/PlaceGeometry;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PlaceGeometry;->location:Lcom/p1/mobile/putong/data/PlaceLocation;

    .line 10
    .line 11
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/PlaceLocation;->lat:D

    .line 12
    .line 13
    iget-wide v5, p0, Lcom/p1/mobile/putong/data/PlaceLocation;->lng:D

    .line 14
    .line 15
    invoke-direct/range {v0 .. v6}, Ll/xww;-><init>(Ljava/lang/String;Ljava/lang/String;DD)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xww;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/xww;->c:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public e()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/xww;->d:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xww;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
