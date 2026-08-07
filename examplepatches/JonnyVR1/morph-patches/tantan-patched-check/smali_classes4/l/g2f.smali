.class public Ll/g2f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static f:Ll/g2f;


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end field


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

.method public static a()Ll/g2f;
    .locals 2

    .line 1
    sget-object v0, Ll/g2f;->f:Ll/g2f;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/g2f;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/g2f;->f:Ll/g2f;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/g2f;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/g2f;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/g2f;->f:Ll/g2f;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/g2f;->f:Ll/g2f;

    .line 27
    .line 28
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/putong/core/data/Coupon;)Ll/pf60;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ")",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Ll/pf60;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    const-string v1, "1\u5929"

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 14
    .line 15
    double-to-long v0, v0

    .line 16
    invoke-static {}, Ll/pzi0;->o()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    sub-long/2addr v0, v2

    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    cmp-long p0, v0, v2

    .line 24
    .line 25
    if-gtz p0, :cond_1

    .line 26
    .line 27
    new-instance p0, Ll/pf60;

    .line 28
    .line 29
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 30
    .line 31
    const-string v1, "00:00:00"

    .line 32
    .line 33
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    const-wide/32 v2, 0x5265c00

    .line 38
    .line 39
    .line 40
    cmp-long p0, v0, v2

    .line 41
    .line 42
    if-lez p0, :cond_2

    .line 43
    .line 44
    div-long/2addr v0, v2

    .line 45
    long-to-int p0, v0

    .line 46
    new-instance v0, Ll/pf60;

    .line 47
    .line 48
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 49
    .line 50
    new-instance v2, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p0, "\u5929"

    .line 59
    .line 60
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    return-object v0

    .line 71
    :cond_2
    const-wide/32 v2, 0x36ee80

    .line 72
    .line 73
    .line 74
    div-long v4, v0, v2

    .line 75
    .line 76
    long-to-int p0, v4

    .line 77
    rem-long/2addr v0, v2

    .line 78
    const-wide/32 v2, 0xea60

    .line 79
    .line 80
    .line 81
    div-long v4, v0, v2

    .line 82
    .line 83
    long-to-int v4, v4

    .line 84
    rem-long/2addr v0, v2

    .line 85
    const-wide/16 v2, 0x3e8

    .line 86
    .line 87
    div-long/2addr v0, v2

    .line 88
    long-to-int v0, v0

    .line 89
    new-instance v1, Ll/pf60;

    .line 90
    .line 91
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 92
    .line 93
    new-instance v3, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-static {p0}, Ll/g2f;->i(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string p0, ":"

    .line 106
    .line 107
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-static {v4}, Ll/g2f;->i(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-static {v0}, Ll/g2f;->i(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-direct {v1, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    return-object v1
.end method

.method public static d(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const-string v1, "lowPriceCallback3SVIP"

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_1
    const-string v1, "lowPriceCallback3VIP"

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    return-object v1

    .line 24
    :cond_2
    const-string v1, "lowPriceCustomerVIP"

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    return-object v1

    .line 33
    :cond_3
    const-string v1, "lowPriceCustomerSVIP"

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_4

    .line 40
    .line 41
    return-object v1

    .line 42
    :cond_4
    const-string v1, "lowPrice3Month"

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_5

    .line 49
    .line 50
    return-object v1

    .line 51
    :cond_5
    const-string v1, "lowPriceFirstTime12MSVIP"

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_6

    .line 58
    .line 59
    return-object v1

    .line 60
    :cond_6
    const-string v1, "giftDurationSVIP"

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_7

    .line 67
    .line 68
    return-object v1

    .line 69
    :cond_7
    const-string v1, "lowPriceODiamond"

    .line 70
    .line 71
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_8

    .line 76
    .line 77
    return-object v1

    .line 78
    :cond_8
    const-string v1, "lowPriceCustomerUpliftSVIP"

    .line 79
    .line 80
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_9

    .line 85
    .line 86
    return-object v1

    .line 87
    :cond_9
    return-object v0
.end method

.method public static e()I
    .locals 3

    .line 1
    const/16 v0, 0x18

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "vas_enhanced_promotion_perception"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    new-instance v2, Lorg/json/JSONObject;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v1, "show_promotion_hours_limit"

    .line 25
    .line 26
    invoke-virtual {v2, v1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 27
    .line 28
    .line 29
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    :catch_0
    :cond_0
    return v0
.end method

.method public static h(Lcom/p1/mobile/putong/core/data/Coupon;)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 10
    .line 11
    double-to-long v3, v3

    .line 12
    sub-long/2addr v3, v1

    .line 13
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 14
    .line 15
    long-to-double v1, v1

    .line 16
    cmpg-double p0, v5, v1

    .line 17
    .line 18
    if-gez p0, :cond_1

    .line 19
    .line 20
    const-wide/16 v1, 0x0

    .line 21
    .line 22
    cmp-long p0, v3, v1

    .line 23
    .line 24
    if-lez p0, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/g2f;->e()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    int-to-long v1, p0

    .line 31
    const-wide/32 v5, 0x36ee80

    .line 32
    .line 33
    .line 34
    mul-long/2addr v1, v5

    .line 35
    cmp-long p0, v3, v1

    .line 36
    .line 37
    if-gez p0, :cond_1

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    return v0
.end method

.method public static i(I)Ljava/lang/String;
    .locals 2

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    if-le p0, v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v1, "0"

    .line 21
    .line 22
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method


# virtual methods
.method public b()Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/g2f;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/g2f;->b:Ljava/util/List;

    .line 10
    .line 11
    const-string v1, "lowPriceCallback3SVIP"

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Ll/g2f;->g(Ljava/util/List;Ljava/lang/String;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/g2f;->d:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/g2f;->d:Ljava/util/List;

    .line 30
    .line 31
    const-string v1, "lowPriceCustomerSVIP"

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Ll/g2f;->g(Ljava/util/List;Ljava/lang/String;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_1
    return-object v0
.end method

.method public f(Ljava/lang/String;)Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "lowPriceCallback3SVIP"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/g2f;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Ll/g2f;->g(Ljava/util/List;Ljava/lang/String;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string v0, "lowPriceCustomerSVIP"

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Ll/g2f;->d:Ljava/util/List;

    .line 25
    .line 26
    invoke-virtual {p0, p1, v0}, Ll/g2f;->g(Ljava/util/List;Ljava/lang/String;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    const-string v0, "lowPriceCallback3VIP"

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object p1, p0, Ll/g2f;->a:Ljava/util/List;

    .line 40
    .line 41
    invoke-virtual {p0, p1, v0}, Ll/g2f;->g(Ljava/util/List;Ljava/lang/String;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    const-string v0, "lowPriceCustomerVIP"

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_3

    .line 53
    .line 54
    iget-object p1, p0, Ll/g2f;->c:Ljava/util/List;

    .line 55
    .line 56
    invoke-virtual {p0, p1, v0}, Ll/g2f;->g(Ljava/util/List;Ljava/lang/String;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_3
    const-string v0, "lowPrice3Month"

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    iget-object p1, p0, Ll/g2f;->e:Ljava/util/List;

    .line 70
    .line 71
    invoke-virtual {p0, p1, v0}, Ll/g2f;->g(Ljava/util/List;Ljava/lang/String;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_4
    const-string p0, "lowPriceFirstTime12MSVIP"

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_5

    .line 83
    .line 84
    invoke-static {}, Ll/efh0;->j()Ll/efh0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Ll/efh0;->k()Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0

    .line 93
    :cond_5
    const-string p0, "giftDurationSVIP"

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_6

    .line 100
    .line 101
    invoke-static {}, Ll/deh0;->d()Ll/deh0;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Ll/deh0;->e()Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0

    .line 110
    :cond_6
    const-string p0, "lowPriceODiamond"

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    invoke-static {}, Ll/p550;->h()Ll/p550;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Ll/p550;->i()Ll/pf60;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0

    .line 127
    :cond_7
    const/4 p0, 0x0

    .line 128
    return-object p0
.end method

.method public final g(Ljava/util/List;Ljava/lang/String;)Ll/pf60;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    move-object p1, v0

    .line 14
    move-object v1, p1

    .line 15
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_3

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 26
    .line 27
    invoke-virtual {v2, p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->getCouponForPromotion(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Coupon;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {v3}, Ll/g2f;->h(Lcom/p1/mobile/putong/core/data/Coupon;)Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_1

    .line 36
    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    iget v4, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 40
    .line 41
    iget v5, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 42
    .line 43
    if-le v4, v5, :cond_1

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_1

    .line 50
    .line 51
    :cond_2
    move-object p1, v2

    .line 52
    move-object v1, v3

    .line 53
    goto :goto_0

    .line 54
    :cond_3
    if-eqz p1, :cond_5

    .line 55
    .line 56
    if-nez v1, :cond_4

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_4
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_5
    :goto_1
    return-object v0
.end method
