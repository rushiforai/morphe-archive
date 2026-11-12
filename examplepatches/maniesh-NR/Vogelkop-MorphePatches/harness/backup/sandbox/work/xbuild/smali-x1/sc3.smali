.class public final Lsc3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrsf;


# instance fields
.field public final a:Lf1p;

.field public final b:Lt56;


# direct methods
.method public constructor <init>(Lf1p;Lt56;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsc3;->a:Lf1p;

    iput-object p2, p0, Lsc3;->b:Lt56;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b(JZ)V
    .registers 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    const/4 p3, -0x1

    iget-object p0, p0, Lsc3;->b:Lt56;

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p3, p1, p2}, Ljf0;->p(IIJ)V

    return-void
.end method

.method public final c()V
    .registers 5

    const/4 v0, 0x7

    const/4 v1, 0x1

    iget-object p0, p0, Lsc3;->b:Lt56;

    const-wide/16 v2, 0x3c9

    invoke-virtual {p0, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    return-void
.end method

.method public final d(Lrsf;)V
    .registers 14

    check-cast p1, Lsc3;

    iget-object p1, p1, Lsc3;->b:Lt56;

    iget-object p0, p0, Lsc3;->b:Lt56;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_17

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    const/4 v2, -0x1

    invoke-virtual {p1, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_17
    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x3

    const/16 v4, 0x879

    const/4 v5, 0x0

    const/4 v6, 0x2

    const/4 v7, 0x1

    if-eqz v2, :cond_5f

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpf0;

    new-instance v8, Lpf0;

    invoke-direct {v8, v4, v7, v3}, Ljf0;-><init>(III)V

    invoke-virtual {v2, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_3e

    invoke-virtual {v2, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v8, v5, v7, v9}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3e
    invoke-virtual {v2, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_4d

    invoke-virtual {v2, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v8, v7, v7, v9}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4d
    invoke-virtual {v2, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_5c

    invoke-virtual {v2, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v8, v6, v7, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5c
    invoke-virtual {p1, v1, v7, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5f
    const/4 v2, 0x6

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_6f

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {p1, v2, v7, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6f
    const/16 v8, 0x8

    invoke-virtual {p0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_80

    invoke-virtual {p0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {p1, v8, v7, v9}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_80
    const/16 v9, 0x9

    invoke-virtual {p0, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_91

    invoke-virtual {p0, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {p1, v9, v7, v10}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_91
    const/16 v10, 0xa

    invoke-virtual {p0, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_13e

    invoke-virtual {p0, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lda0;

    new-instance v11, Lda0;

    invoke-direct {v11, v4, v7, v10}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_b3

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v11, v5, v7, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b3
    invoke-virtual {p0, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_c2

    invoke-virtual {p0, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v11, v7, v7, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c2
    invoke-virtual {p0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_d1

    invoke-virtual {p0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v11, v6, v7, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_d1
    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_e0

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v11, v3, v7, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_e0
    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_ef

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v11, v0, v7, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_ef
    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_fe

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v11, v1, v7, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_fe
    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_10d

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v11, v2, v7, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_10d
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_11d

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v11, v0, v7, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_11d
    invoke-virtual {p0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_12c

    invoke-virtual {p0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v11, v8, v7, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_12c
    invoke-virtual {p0, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_13b

    invoke-virtual {p0, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {v11, v9, v7, p0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_13b
    invoke-virtual {p1, v10, v7, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_13e
    return-void
.end method

.method public final e(Lrsf;)Lrsf;
    .registers 4

    new-instance v0, Lsc3;

    check-cast p1, Lsc3;

    iget-object p1, p1, Lsc3;->b:Lt56;

    iget-object v1, p0, Lsc3;->b:Lt56;

    invoke-virtual {v1, p1}, Lt56;->m(Ljf0;)Ljf0;

    iget-object p0, p0, Lsc3;->a:Lf1p;

    invoke-direct {v0, p0, v1}, Lsc3;-><init>(Lf1p;Lt56;)V

    return-object v0
.end method

.method public final f()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lsc3;->b:Lt56;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final g(III)V
    .registers 4

    return-void
.end method

.method public final h(Ljava/io/ByteArrayOutputStream;J)V
    .registers 4

    iget-object p0, p0, Lsc3;->b:Lt56;

    invoke-virtual {p0, p1, p2, p3}, Ljf0;->t(Ljava/io/ByteArrayOutputStream;J)V

    return-void
.end method

.method public final i(IZ)V
    .registers 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iget-object v0, p0, Lsc3;->b:Lt56;

    const/4 v1, 0x3

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2, p1, p2}, Ljf0;->p(IIJ)V

    const/4 p1, 0x4

    const/4 p2, 0x0

    invoke-virtual {v0, p1, v2, p2}, Ljf0;->o(III)V

    sget-object p1, Lqsf;->a:Ls16;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p1, 0x6

    const/4 v2, 0x1

    const-wide/16 v3, 0x3c9

    invoke-virtual {v0, p1, v2, v3, v4}, Ljf0;->p(IIJ)V

    sget-object p1, Lqsf;->a:Ls16;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v3, 0x68

    const/16 p1, 0x8

    invoke-virtual {v0, p1, v2, v3, v4}, Ljf0;->p(IIJ)V

    sget-object p1, Lqsf;->a:Ls16;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v3, 0x0

    const/16 p1, 0x9

    invoke-virtual {v0, p1, v2, v3, v4}, Ljf0;->p(IIJ)V

    iget-object p0, p0, Lsc3;->a:Lf1p;

    iget-object p0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result p1

    const/4 v3, 0x0

    if-nez p1, :cond_49

    :try_start_45
    invoke-static {p0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v3
    :try_end_49
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_49} :catch_49
    .catch Lcom/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_45 .. :try_end_49} :catch_49
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_45 .. :try_end_49} :catch_49
    .catch Ljava/lang/SecurityException; {:try_start_45 .. :try_end_49} :catch_49

    :catch_49
    :cond_49
    if-eqz v3, :cond_98

    invoke-virtual {v3}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    const/16 p1, 0x879

    if-nez p0, :cond_76

    const/4 p0, 0x5

    invoke-virtual {v0, p0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lpf0;

    if-nez v4, :cond_6f

    new-instance v4, Lpf0;

    invoke-direct {v4, p1, v2, v1}, Ljf0;-><init>(III)V

    invoke-virtual {v0, p0, v2, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, p0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Lpf0;

    :cond_6f
    invoke-virtual {v3}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p2, p0}, Lpf0;->x(ILjava/lang/String;)V

    :cond_76
    const/16 p0, 0xa

    invoke-virtual {v0, p0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lda0;

    if-nez p2, :cond_8f

    new-instance p2, Lda0;

    invoke-direct {p2, p1, v2, p0}, Ljf0;-><init>(III)V

    invoke-virtual {v0, p0, v2, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, p0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object p2, p0

    check-cast p2, Lda0;

    :cond_8f
    invoke-virtual {v3}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result p0

    xor-int/2addr p0, v2

    const/4 p1, 0x7

    invoke-virtual {p2, p1, v2, p0}, Ljf0;->r(IIZ)V

    :cond_98
    return-void
.end method

.method public final isEmpty()Z
    .registers 3

    const/16 v0, 0xb

    iget-object p0, p0, Lsc3;->b:Lt56;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_13

    :cond_12
    move-object v0, v1

    :goto_13
    if-eqz v0, :cond_1b

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e3

    :cond_1b
    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_2a

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_2b

    :cond_2a
    move-object v0, v1

    :goto_2b
    if-eqz v0, :cond_33

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e3

    :cond_33
    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_42

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_43

    :cond_42
    move-object v0, v1

    :goto_43
    if-eqz v0, :cond_4b

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e3

    :cond_4b
    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_5a

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_5b

    :cond_5a
    move-object v0, v1

    :goto_5b
    if-eqz v0, :cond_63

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e3

    :cond_63
    const/16 v0, 0xf

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_72

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_73

    :cond_72
    move-object v0, v1

    :goto_73
    if-eqz v0, :cond_7b

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e3

    :cond_7b
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_8a

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_8b

    :cond_8a
    move-object v0, v1

    :goto_8b
    if-eqz v0, :cond_93

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e3

    :cond_93
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_a2

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_a3

    :cond_a2
    move-object v0, v1

    :goto_a3
    if-eqz v0, :cond_ab

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e3

    :cond_ab
    const/16 v0, 0x13

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_ba

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_bb

    :cond_ba
    move-object v0, v1

    :goto_bb
    if-eqz v0, :cond_c3

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e3

    :cond_c3
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_d1

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    :cond_d1
    if-eqz v1, :cond_d9

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e3

    :cond_d9
    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leh0;

    if-eqz p0, :cond_e5

    :cond_e3
    const/4 p0, 0x0

    return p0

    :cond_e5
    const/4 p0, 0x1

    return p0
.end method

.method public final j(Ljava/lang/String;)V
    .registers 4

    const/4 v0, 0x0

    if-nez p1, :cond_5

    move v1, v0

    goto :goto_6

    :cond_5
    const/4 v1, 0x1

    :goto_6
    iget-object p0, p0, Lsc3;->b:Lt56;

    invoke-virtual {p0, v0, v1, p1}, Ljf0;->q(IILjava/lang/Object;)V

    return-void
.end method
