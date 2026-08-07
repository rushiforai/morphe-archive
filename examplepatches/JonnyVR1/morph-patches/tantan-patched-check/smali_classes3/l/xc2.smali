.class public Ll/xc2;
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

.method public static a(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;
    .locals 12

    .line 1
    iget-wide v0, p0, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 2
    .line 3
    const-wide v2, 0x3f7a9fbe76c8b439L    # 0.0065

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    sub-double/2addr v0, v2

    .line 9
    iget-wide v2, p0, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 10
    .line 11
    const-wide v4, 0x3f789374bc6a7efaL    # 0.006

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    sub-double/2addr v2, v4

    .line 17
    mul-double v4, v0, v0

    .line 18
    .line 19
    mul-double v6, v2, v2

    .line 20
    .line 21
    add-double/2addr v4, v6

    .line 22
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide v4

    .line 26
    const-wide v6, 0x404a2e1077c7044eL    # 52.35987755982988

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    mul-double v8, v2, v6

    .line 32
    .line 33
    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    .line 34
    .line 35
    .line 36
    move-result-wide v8

    .line 37
    const-wide v10, 0x3ef4f8b588e368f1L    # 2.0E-5

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    mul-double/2addr v8, v10

    .line 43
    sub-double/2addr v4, v8

    .line 44
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    mul-double/2addr v0, v6

    .line 49
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    const-wide v6, 0x3ec92a737110e454L    # 3.0E-6

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    mul-double/2addr v0, v6

    .line 59
    sub-double/2addr v2, v0

    .line 60
    new-instance p0, Lcom/baidu/mapapi/model/LatLng;

    .line 61
    .line 62
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    mul-double/2addr v0, v4

    .line 67
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 68
    .line 69
    .line 70
    move-result-wide v2

    .line 71
    mul-double/2addr v4, v2

    .line 72
    invoke-direct {p0, v0, v1, v4, v5}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ll/fej;

    .line 76
    .line 77
    iget-wide v1, p0, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 78
    .line 79
    iget-wide v3, p0, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 80
    .line 81
    invoke-direct {v0, v1, v2, v3, v4}, Ll/fej;-><init>(DD)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ll/fej;->c()Ll/dop0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    new-instance v0, Lcom/baidu/mapapi/model/LatLng;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/dmj;->a()D

    .line 91
    .line 92
    .line 93
    move-result-wide v1

    .line 94
    invoke-virtual {p0}, Ll/dmj;->b()D

    .line 95
    .line 96
    .line 97
    move-result-wide v3

    .line 98
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 99
    .line 100
    .line 101
    return-object v0
.end method

.method public static b(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;
    .locals 5

    .line 1
    new-instance v0, Ll/dop0;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 4
    .line 5
    iget-wide v3, p0, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, v3, v4}, Ll/dop0;-><init>(DD)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ll/dop0;->c()Ll/fej;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Lcom/baidu/mapapi/model/LatLng;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/dmj;->a()D

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    invoke-virtual {p0}, Ll/dmj;->b()D

    .line 21
    .line 22
    .line 23
    move-result-wide v3

    .line 24
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Lcom/baidu/mapapi/utils/CoordinateConverter;

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/baidu/mapapi/utils/CoordinateConverter;-><init>()V

    .line 30
    .line 31
    .line 32
    sget-object v1, Lcom/baidu/mapapi/utils/CoordinateConverter$CoordType;->COMMON:Lcom/baidu/mapapi/utils/CoordinateConverter$CoordType;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lcom/baidu/mapapi/utils/CoordinateConverter;->from(Lcom/baidu/mapapi/utils/CoordinateConverter$CoordType;)Lcom/baidu/mapapi/utils/CoordinateConverter;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/baidu/mapapi/utils/CoordinateConverter;->coord(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/utils/CoordinateConverter;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/baidu/mapapi/utils/CoordinateConverter;->convert()Lcom/baidu/mapapi/model/LatLng;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method
