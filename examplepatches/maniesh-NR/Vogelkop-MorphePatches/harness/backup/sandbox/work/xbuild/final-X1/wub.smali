.class public final Lwub;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhti;
.implements Lkkd;
.implements Lhsd;
.implements Lhc2;
.implements Lbwe;
.implements Lcom/leanplum/MessageDisplayController;
.implements Lvm;
.implements Lvwf;
.implements Lqc6;
.implements Lcom/android/installreferrer/api/InstallReferrerStateListener;
.implements Lelf;
.implements Ls87;
.implements Lsth;
.implements Lzqb;


# static fields
.field public static b:Lwub;


# instance fields
.field public a:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    packed-switch p1, :pswitch_data_1a

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lwub;->a:Ljava/lang/Object;

    return-void

    .line 39
    :pswitch_e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lwub;->a:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x1c
        :pswitch_e
    .end packed-switch
.end method

.method public constructor <init>(Landroid/os/ParcelFileDescriptor;)V
    .registers 4

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Lqfb;

    const/16 v1, 0x13

    invoke-direct {v0, p1, v1}, Lqfb;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lwub;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/StatusBarDrawingFrameLayout;Lbvl;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwub;->a:Ljava/lang/Object;

    new-instance v0, Llzb;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, v0}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    invoke-interface {p3}, Lbvl;->F()Lkze;

    move-result-object p2

    new-instance p3, Lrkc;

    const/16 v0, 0xb

    invoke-direct {p3, p0, v0}, Lrkc;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Liwa;

    const/4 v0, 0x7

    invoke-direct {p0, p3, v0}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Ld4d;I)V
    .registers 6

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, p2, [Lp8f;

    iput-object v0, p0, Lwub;->a:Ljava/lang/Object;

    const/4 v0, 0x0

    :goto_8
    if-ge v0, p2, :cond_18

    iget-object v1, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v1, [Lp8f;

    new-instance v2, Lp8f;

    invoke-direct {v2, p1}, Lp8f;-><init>(Ld4d;)V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_18
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 36
    iput-object p1, p0, Lwub;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lrpb;)V
    .registers 3

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lwub;->a:Ljava/lang/Object;

    .line 44
    instance-of p0, p1, Lrpb;

    if-eqz p0, :cond_a

    return-void

    .line 45
    :cond_a
    const-string p0, "Only binary and string formats are supported, "

    .line 46
    const-string v0, " is not supported."

    .line 47
    invoke-static {p1, v0, p0}, Lj9h;->t(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public static D()Lwub;
    .registers 4

    sget-object v0, Lwub;->b:Lwub;

    if-nez v0, :cond_1c

    new-instance v0, Lwub;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const-string v1, "NotificationManagerProxyImpl()"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v1

    new-instance v2, Lyqd;

    const/16 v3, 0x16

    invoke-direct {v2, v0, v3}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v2}, Lwub;->N(Lorg/chromium/base/TraceEvent;Ljava/lang/Runnable;)V

    sput-object v0, Lwub;->b:Lwub;

    :cond_1c
    return-object v0
.end method

.method public static N(Lorg/chromium/base/TraceEvent;Ljava/lang/Runnable;)V
    .registers 2

    :try_start_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_9

    if-eqz p0, :cond_15

    :try_start_5
    invoke-virtual {p0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_8} :catch_15

    return-void

    :catchall_9
    move-exception p1

    if-eqz p0, :cond_14

    :try_start_c
    invoke-virtual {p0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_10

    goto :goto_14

    :catchall_10
    move-exception p0

    :try_start_11
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_14
    :goto_14
    throw p1
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_15} :catch_15

    :catch_15
    :cond_15
    return-void
.end method


# virtual methods
.method public final A(Ljava/lang/String;)V
    .registers 5

    const-string v0, "NotificationManagerProxyImpl.deleteNotificationChannel"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    new-instance v1, Lm2f;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lm2f;-><init>(Lwub;Ljava/lang/String;B)V

    invoke-static {v0, v1}, Lwub;->N(Lorg/chromium/base/TraceEvent;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final B(Ljava/lang/String;)V
    .registers 8

    iget-object v0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v0, Ldvc;

    iget-object v0, v0, Ldvc;->r:Lpyl;

    new-instance v1, Lhu5;

    const/16 v2, 0x16

    invoke-direct {v1, p0, p1, v2}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget p0, v0, Lpyl;->b:I

    add-int/lit8 p0, p0, 0x1

    iput p0, v0, Lpyl;->b:I

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, v0, Lpyl;->c:Ljava/lang/Object;

    check-cast v3, Lx77;

    iget-object v3, v3, Lx77;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_6b

    iget-object v3, v0, Lpyl;->d:Ljava/lang/Object;

    check-cast v3, Ls14;

    if-eqz v3, :cond_6b

    iput-object v1, v0, Lpyl;->f:Ljava/lang/Object;

    new-instance v1, Lso4;

    const/4 v4, 0x4

    invoke-direct {v1, v0, p0, v2, v4}, Lso4;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    new-instance p0, Lz7;

    iget-object v0, v3, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri$Builder;

    iget-object v2, v3, Ls14;->e:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    const-string v4, "country"

    invoke-virtual {v0, v4, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    iget-object v4, v3, Ls14;->f:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    const-string v5, "language"

    invoke-virtual {v2, v5, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v4, "query"

    invoke-virtual {v2, v4, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->clearQuery()Landroid/net/Uri$Builder;

    invoke-direct {p0, p1}, Lz7;-><init>(Ljava/lang/String;)V

    iget-object p1, v3, Ls14;->c:Ljava/lang/Object;

    check-cast p1, Lywh;

    new-instance v0, Lk82;

    invoke-direct {v0, v3, v1}, Lk82;-><init>(Ls14;Lso4;)V

    invoke-interface {p1, p0, v0}, Lywh;->a(Lz7;Lz4o;)V

    return-void

    :cond_6b
    const/4 p0, 0x0

    iput-object p0, v0, Lpyl;->f:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lhu5;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final C(Lcm;)V
    .registers 4

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lmpf;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "showAd: onAdFailedToShow, error="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lmpf;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lmpf;->c:Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;

    if-eqz v0, :cond_26

    iget v0, p1, Lcm;->b:I

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object v0, p0, Lmpf;->c:Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;

    invoke-interface {v0, p1}, Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;->onAdFailedToShow(Lcom/google/android/gms/ads/AdError;)V

    :cond_26
    iget-object p1, p0, Lmpf;->d:Lvt1;

    if-eqz p1, :cond_30

    invoke-virtual {p1}, Lk8;->P()V

    const/4 p1, 0x0

    iput-object p1, p0, Lmpf;->d:Lvt1;

    :cond_30
    return-void
.end method

.method public final E(Ljava/lang/Class;)Ljnf;
    .registers 5

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljnf;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_8

    goto :goto_22

    :cond_21
    move-object v0, v1

    :goto_22
    instance-of p0, v0, Ljnf;

    if-eqz p0, :cond_29

    move-object v1, v0

    check-cast v1, Ljnf;

    :cond_29
    if-eqz v1, :cond_2c

    return-object v1

    :cond_2c
    new-instance p0, Ljava/lang/ClassNotFoundException;

    const-string p1, "Navigation class not registered"

    invoke-direct {p0, p1}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final F()Ljava/util/List;
    .registers 3

    const-string v0, "NotificationManagerProxyImpl.getNotificationChannels"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    :try_start_7
    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ll2f;

    iget-object p0, p0, Ll2f;->b:Landroid/app/NotificationManager;

    invoke-virtual {p0}, Landroid/app/NotificationManager;->getNotificationChannels()Ljava/util/List;

    move-result-object p0
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_17

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    :cond_16
    return-object p0

    :catchall_17
    move-exception p0

    if-eqz v0, :cond_22

    :try_start_1a
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_1d
    .catchall {:try_start_1a .. :try_end_1d} :catchall_1e

    goto :goto_22

    :catchall_1e
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_22
    :goto_22
    throw p0
.end method

.method public final G()V
    .registers 16

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v2, [Lp8f;

    array-length v3, v2

    if-ge v1, v3, :cond_5b

    aget-object v2, v2, v1

    iget-object v2, v2, Lp8f;->b:Ljava/lang/Object;

    check-cast v2, [I

    const/4 v3, 0x1

    const/16 v4, 0x100

    move v5, v4

    :goto_13
    if-ge v3, v4, :cond_45

    move v6, v0

    :goto_16
    if-ge v6, v4, :cond_42

    sget-object v7, Lcqp;->h:[I

    add-int/lit8 v5, v5, -0x1

    aget v7, v7, v5

    mul-int/lit8 v7, v7, -0x1

    move v8, v6

    :goto_21
    add-int v9, v6, v3

    if-ge v8, v9, :cond_3f

    aget v9, v2, v8

    add-int v10, v8, v3

    aget v11, v2, v10

    add-int/2addr v11, v9

    aput v11, v2, v8

    aget v11, v2, v10

    sub-int/2addr v9, v11

    aput v9, v2, v10

    int-to-long v11, v7

    int-to-long v13, v9

    mul-long/2addr v11, v13

    invoke-static {v11, v12}, Lhyg;->j(J)I

    move-result v9

    aput v9, v2, v10

    add-int/lit8 v8, v8, 0x1

    goto :goto_21

    :cond_3f
    add-int v6, v8, v3

    goto :goto_16

    :cond_42
    shl-int/lit8 v3, v3, 0x1

    goto :goto_13

    :cond_45
    move v3, v0

    :goto_46
    if-ge v3, v4, :cond_58

    aget v5, v2, v3

    int-to-long v5, v5

    const-wide/32 v7, 0xa3fa

    mul-long/2addr v5, v7

    invoke-static {v5, v6}, Lhyg;->j(J)I

    move-result v5

    aput v5, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_46

    :cond_58
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_5b
    return-void
.end method

.method public final H(Li16;)V
    .registers 5

    if-eqz p1, :cond_19

    iget-object v0, p1, Li16;->b:Ljava/lang/Object;

    check-cast v0, Landroid/app/Notification;

    if-eqz v0, :cond_19

    const-string v0, "NotificationManagerProxyImpl.notify(notification)"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    new-instance v1, Lhpd;

    const/16 v2, 0x14

    invoke-direct {v1, p0, p1, v2}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lwub;->N(Lorg/chromium/base/TraceEvent;Ljava/lang/Runnable;)V

    :cond_19
    return-void
.end method

.method public final I()V
    .registers 14

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v2, [Lp8f;

    array-length v3, v2

    if-ge v1, v3, :cond_45

    aget-object v2, v2, v1

    iget-object v2, v2, Lp8f;->b:Ljava/lang/Object;

    check-cast v2, [I

    const/16 v3, 0x80

    move v4, v0

    :goto_12
    if-lez v3, :cond_42

    move v5, v0

    :goto_15
    const/16 v6, 0x100

    if-ge v5, v6, :cond_3f

    sget-object v6, Lcqp;->h:[I

    add-int/lit8 v4, v4, 0x1

    aget v6, v6, v4

    move v7, v5

    :goto_20
    add-int v8, v5, v3

    if-ge v7, v8, :cond_3c

    int-to-long v8, v6

    add-int v10, v7, v3

    aget v11, v2, v10

    int-to-long v11, v11

    mul-long/2addr v8, v11

    invoke-static {v8, v9}, Lhyg;->j(J)I

    move-result v8

    aget v9, v2, v7

    sub-int/2addr v9, v8

    aput v9, v2, v10

    aget v9, v2, v7

    add-int/2addr v9, v8

    aput v9, v2, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_20

    :cond_3c
    add-int v5, v7, v3

    goto :goto_15

    :cond_3f
    ushr-int/lit8 v3, v3, 0x1

    goto :goto_12

    :cond_42
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_45
    return-void
.end method

.method public final J(Lwub;)V
    .registers 10

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v2, [Lp8f;

    array-length v3, v2

    if-ge v1, v3, :cond_31

    aget-object v2, v2, v1

    iget-object v3, p1, Lwub;->a:Ljava/lang/Object;

    check-cast v3, [Lp8f;

    aget-object v3, v3, v1

    iget-object v2, v2, Lp8f;->b:Ljava/lang/Object;

    check-cast v2, [I

    iget-object v3, v3, Lp8f;->b:Ljava/lang/Object;

    check-cast v3, [I

    move v4, v0

    :goto_1a
    const/16 v5, 0x100

    if-ge v4, v5, :cond_2e

    aget v5, v2, v4

    add-int/lit16 v6, v5, 0xfff

    and-int/lit16 v7, v6, -0x2000

    sub-int/2addr v5, v7

    shr-int/lit8 v6, v6, 0xd

    aput v6, v2, v4

    aput v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1a

    :cond_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_31
    return-void
.end method

.method public final K()V
    .registers 8

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v2, [Lp8f;

    array-length v3, v2

    if-ge v1, v3, :cond_28

    aget-object v2, v2, v1

    iget-object v2, v2, Lp8f;->b:Ljava/lang/Object;

    check-cast v2, [I

    move v3, v0

    :goto_10
    const/16 v4, 0x100

    if-ge v3, v4, :cond_25

    aget v4, v2, v3

    const/high16 v5, 0x400000

    add-int/2addr v5, v4

    shr-int/lit8 v5, v5, 0x17

    const v6, 0x7fe001

    mul-int/2addr v5, v6

    sub-int/2addr v4, v5

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    :cond_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_28
    return-void
.end method

.method public final L(Ljnf;)V
    .registers 2

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final M()Landroid/os/ParcelFileDescriptor;
    .registers 5

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lqfb;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Landroid/os/ParcelFileDescriptor;

    :try_start_8
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v0

    sget v1, Landroid/system/OsConstants;->SEEK_SET:I

    const-wide/16 v2, 0x0

    invoke-static {v0, v2, v3, v1}, Landroid/system/Os;->lseek(Ljava/io/FileDescriptor;JI)J
    :try_end_13
    .catch Landroid/system/ErrnoException; {:try_start_8 .. :try_end_13} :catch_14

    return-object p0

    :catch_14
    move-exception p0

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final O(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-static {p2}, Lqqb;->c(Ljava/lang/String;)Lkotlinx/serialization/json/d;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_12
    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void
.end method

.method public final P()V
    .registers 4

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lhld;

    iget-object v0, p0, Lhld;->e:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v0, v1, v0

    const/high16 v2, 0x43160000    # 150.0f

    mul-float/2addr v0, v2

    float-to-int v0, v0

    iget-object p0, p0, Lhld;->e:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    sget-object v0, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final Q(S[B)V
    .registers 16

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v2, [Lp8f;

    array-length v3, v2

    if-ge v1, v3, :cond_65

    aget-object v4, v2, v1

    add-int/lit8 v2, p1, 0x1

    int-to-short v2, v2

    iget-object v3, v4, Lp8f;->d:Ljava/lang/Object;

    check-cast v3, Liuh;

    iget-object v3, v3, Liuh;->c:Ljava/lang/Object;

    check-cast v3, Lvci;

    iget-object v5, v4, Lp8f;->c:Ljava/lang/Object;

    check-cast v5, Ld4d;

    iget-byte v9, v5, Ld4d;->e:B

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-ne v9, v5, :cond_22

    move v7, v6

    goto :goto_26

    :cond_22
    const/4 v7, 0x4

    if-ne v9, v7, :cond_60

    move v7, v5

    :goto_26
    const/16 v10, 0x88

    mul-int/lit16 v8, v7, 0x88

    new-array v7, v8, [B

    invoke-virtual {v3}, Lgub;->reset()V

    int-to-byte v11, p1

    shr-int/lit8 p1, p1, 0x8

    int-to-byte p1, p1

    new-array v12, v5, [B

    aput-byte v11, v12, v0

    aput-byte p1, v12, v6

    array-length p1, p2

    invoke-virtual {v3, v0, p1, p2}, Lgub;->g(II[B)V

    invoke-virtual {v3, v0, v5, v12}, Lgub;->g(II[B)V

    invoke-virtual {v3, v0, v8, v7}, Lvci;->p(II[B)V

    const/4 v5, 0x0

    const/16 v6, 0x100

    invoke-static/range {v4 .. v9}, Lp8f;->A(Lp8f;II[BII)I

    move-result p1

    move v5, p1

    :goto_4b
    const/16 p1, 0x100

    if-ge v5, p1, :cond_5c

    invoke-virtual {v3, v0, v10, v7}, Lvci;->p(II[B)V

    rsub-int v6, v5, 0x100

    const/16 v8, 0x88

    invoke-static/range {v4 .. v9}, Lp8f;->A(Lp8f;II[BII)I

    move-result p1

    add-int/2addr v5, p1

    goto :goto_4b

    :cond_5c
    add-int/lit8 v1, v1, 0x1

    move p1, v2

    goto :goto_2

    :cond_60
    const-string p0, "Wrong Dilithium Eta!"

    invoke-static {p0}, Lh9o;->r(Ljava/lang/String;)V

    :cond_65
    return-void
.end method

.method public final a()V
    .registers 4

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lard;

    iget-object v0, p0, Lard;->u:Lk03;

    const-wide/16 v1, -0x1

    iput-wide v1, v0, Lk03;->a:J

    iput-wide v1, v0, Lk03;->b:J

    invoke-virtual {p0}, Lard;->e()Z

    move-result v0

    if-nez v0, :cond_1b

    iget-object p0, p0, Lard;->j:Lzqd;

    iget-object p0, p0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Lorg/chromium/content_public/browser/MediaSession;->f()V

    :cond_1b
    return-void
.end method

.method public final b(I)V
    .registers 3

    if-ltz p1, :cond_13

    const/16 v0, 0x15

    if-gt p1, v0, :cond_13

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lard;

    iget-object p0, p0, Lard;->j:Lzqd;

    if-eqz p0, :cond_13

    iget-object p0, p0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    invoke-virtual {p0, p1}, Lorg/chromium/content_public/browser/MediaSession;->b(I)V

    :cond_13
    return-void
.end method

.method public final c()V
    .registers 1

    return-void
.end method

.method public final d()V
    .registers 4

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lard;

    iget-object v0, p0, Lard;->u:Lk03;

    const-wide/16 v1, -0x1

    iput-wide v1, v0, Lk03;->a:J

    iput-wide v1, v0, Lk03;->b:J

    invoke-virtual {p0}, Lard;->e()Z

    move-result v0

    if-nez v0, :cond_18

    iget-object p0, p0, Lard;->j:Lzqd;

    iget-object p0, p0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    if-nez p0, :cond_19

    :cond_18
    return-void

    :cond_19
    invoke-virtual {p0}, Lorg/chromium/content_public/browser/MediaSession;->g()V

    return-void
.end method

.method public final e(Lcie;)V
    .registers 7

    iget-object v0, p1, Lcie;->Z:Llxo;

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ljsd;

    iget-object v1, p0, Ljsd;->a:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfjo;

    instance-of v3, v2, Laoo;

    if-eqz v3, :cond_15

    check-cast v2, Laoo;

    goto :goto_46

    :cond_15
    iget-object v2, v0, Llxo;->s:Ltmo;

    invoke-virtual {v2}, Li7c;->a()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v3, Lnjo;->a:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_33

    new-instance v2, Lcom/opera/ad/mraid/MRAIDView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/opera/ad/mraid/MRAIDView;-><init>(Landroid/content/Context;)V

    goto :goto_3e

    :cond_33
    :try_start_33
    new-instance v2, Ly9p;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v0, Llxo;->p:Ldcl;

    invoke-direct {v2, v3, v4}, Ly9p;-><init>(Landroid/content/Context;Ldcl;)V
    :try_end_3e
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_33 .. :try_end_3e} :catch_c1

    :goto_3e
    new-instance v3, Ltvk;

    invoke-direct {v3, v0}, Ltvk;-><init>(Ljava/lang/Object;)V

    invoke-static {v2, p1, v3}, Ljsd;->d(Laoo;Lcie;Lloo;)V

    :goto_46
    invoke-static {v2}, Lupj;->j(Landroid/view/View;)V

    invoke-virtual {p0, v2}, Ljsd;->a(Laoo;)V

    iput-object v2, p1, Lcie;->w0:Laoo;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_93

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    instance-of p0, v2, Lcom/opera/ad/mraid/MRAIDView;

    if-eqz p0, :cond_c1

    check-cast v2, Lcom/opera/ad/mraid/MRAIDView;

    iget-object p0, v0, Llxo;->s:Ltmo;

    invoke-virtual {p0}, Li7c;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    sget-object p1, Lnjo;->a:Ljava/util/regex/Pattern;

    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1, p0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    sget-object p0, Lnjo;->a:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_85

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->start()I

    move-result v0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->end()I

    move-result p0

    const-string v1, "<script src=\"https://img-odx.op-mobile.opera.com/a/js/mraid.js\"></script>"

    invoke-virtual {p1, v0, p0, v1}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    :cond_85
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v2, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    const-string v0, "text/html"

    const-string v1, "UTF-8"

    invoke-virtual {p1, p0, v0, v1}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_93
    instance-of p0, v2, Ly9p;

    if-eqz p0, :cond_ae

    check-cast v2, Ly9p;

    iget-object p0, v2, Ly9p;->u:Ldcl;

    iget-object p1, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p1, Ldzo;

    iget-object p1, p1, Ldzo;->c:Lnyo;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Ldcl;->i()V

    return-void

    :cond_ae
    check-cast v2, Lcom/opera/ad/mraid/MRAIDView;

    iget-object p0, v2, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    if-eqz p0, :cond_c1

    iget-boolean p1, p0, Lb5d;->a:Z

    if-eqz p1, :cond_c1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {p0}, Landroid/webkit/WebView;->onResume()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lb5d;->a:Z

    :catch_c1
    :cond_c1
    return-void
.end method

.method public final f()Z
    .registers 5

    const/4 v0, 0x0

    :try_start_1
    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Landroid/nfc/tech/NdefFormatable;

    new-instance v1, Landroid/nfc/NdefMessage;

    new-instance v2, Landroid/nfc/NdefRecord;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3, v3, v3}, Landroid/nfc/NdefRecord;-><init>(S[B[B[B)V

    new-array v3, v0, [Landroid/nfc/NdefRecord;

    invoke-direct {v1, v2, v3}, Landroid/nfc/NdefMessage;-><init>(Landroid/nfc/NdefRecord;[Landroid/nfc/NdefRecord;)V

    invoke-virtual {p0, v1}, Landroid/nfc/tech/NdefFormatable;->formatReadOnly(Landroid/nfc/NdefMessage;)V
    :try_end_15
    .catch Landroid/nfc/FormatException; {:try_start_1 .. :try_end_15} :catch_17

    const/4 p0, 0x1

    return p0

    :catch_17
    return v0
.end method

.method public final g()V
    .registers 2

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lmpf;

    const-string v0, "showAd: onAdDisplayed"

    invoke-virtual {p0, v0}, Lmpf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lmpf;->c:Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;

    if-eqz p0, :cond_10

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdImpression()V

    :cond_10
    return-void
.end method

.method public final bridge synthetic h()Ljava/lang/Object;
    .registers 1

    invoke-virtual {p0}, Lwub;->M()Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    return-object p0
.end method

.method public final i(J)V
    .registers 3

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lard;

    iget-object p0, p0, Lard;->j:Lzqd;

    if-nez p0, :cond_9

    return-void

    :cond_9
    iget-object p0, p0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    invoke-virtual {p0, p1, p2}, Lorg/chromium/content_public/browser/MediaSession;->e(J)V

    return-void
.end method

.method public final j()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final k()Lkotlinx/serialization/json/b;
    .registers 2

    new-instance v0, Lkotlinx/serialization/json/c;

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, p0}, Lkotlinx/serialization/json/c;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public final l()V
    .registers 2

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lard;

    invoke-virtual {p0}, Lard;->e()Z

    move-result v0

    if-nez v0, :cond_10

    iget-object p0, p0, Lard;->j:Lzqd;

    iget-object p0, p0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    if-nez p0, :cond_11

    :cond_10
    return-void

    :cond_11
    invoke-virtual {p0}, Lorg/chromium/content_public/browser/MediaSession;->d()V

    return-void
.end method

.method public final m()V
    .registers 1

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/PageDotIndicator;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public final n(Landroid/nfc/NdefMessage;)V
    .registers 2

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Landroid/nfc/tech/NdefFormatable;

    invoke-virtual {p0, p1}, Landroid/nfc/tech/NdefFormatable;->format(Landroid/nfc/NdefMessage;)V

    return-void
.end method

.method public final o()V
    .registers 1

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/PageDotIndicator;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final onAdClicked()V
    .registers 2

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lmpf;

    const-string v0, "showAd: onAdClicked"

    invoke-virtual {p0, v0}, Lmpf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lmpf;->c:Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;

    if-eqz p0, :cond_10

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->reportAdClicked()V

    :cond_10
    return-void
.end method

.method public final onAdDismissed()V
    .registers 2

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lmpf;

    const-string v0, "showAd: onAdDismissed"

    invoke-virtual {p0, v0}, Lmpf;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lmpf;->c:Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;

    if-eqz v0, :cond_10

    invoke-interface {v0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->onAdClosed()V

    :cond_10
    iget-object v0, p0, Lmpf;->d:Lvt1;

    if-eqz v0, :cond_1a

    invoke-virtual {v0}, Lk8;->P()V

    const/4 v0, 0x0

    iput-object v0, p0, Lmpf;->d:Lvt1;

    :cond_1a
    return-void
.end method

.method public final onAdOpened()V
    .registers 2

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lmpf;

    const-string v0, "showAd: onAdOpened"

    invoke-virtual {p0, v0}, Lmpf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lmpf;->c:Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;

    if-eqz p0, :cond_10

    invoke-interface {p0}, Lcom/google/android/gms/ads/mediation/MediationAdCallback;->onAdOpened()V

    :cond_10
    return-void
.end method

.method public final onInstallReferrerServiceDisconnected()V
    .registers 1

    return-void
.end method

.method public final onInstallReferrerSetupFinished(I)V
    .registers 6

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lkhg;

    iget-object v0, p0, Lkhg;->b:Lcom/android/installreferrer/api/InstallReferrerClient;

    iget-object p0, p0, Lkhg;->a:Lg9;

    sget-object v1, Lhg0;->b:Lhg0;

    const/4 v2, 0x0

    if-eqz p1, :cond_26

    const/4 v3, 0x1

    if-eq p1, v3, :cond_20

    const/4 v3, 0x2

    if-eq p1, v3, :cond_1a

    const/4 v3, 0x4

    if-eq p1, v3, :cond_20

    invoke-virtual {p0, v1, v2}, Lg9;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_33

    :cond_1a
    sget-object p1, Lhg0;->c:Lhg0;

    invoke-virtual {p0, p1, v2}, Lg9;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_33

    :cond_20
    sget-object p1, Lhg0;->d:Lhg0;

    invoke-virtual {p0, p1, v2}, Lg9;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_33

    :cond_26
    :try_start_26
    invoke-virtual {v0}, Lcom/android/installreferrer/api/InstallReferrerClient;->getInstallReferrer()Lcom/android/installreferrer/api/ReferrerDetails;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Lg9;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2d
    .catch Landroid/os/RemoteException; {:try_start_26 .. :try_end_2d} :catch_2e

    goto :goto_33

    :catch_2e
    sget-object p1, Lhg0;->e:Lhg0;

    invoke-virtual {p0, p1, v2}, Lg9;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_33
    invoke-virtual {v0}, Lcom/android/installreferrer/api/InstallReferrerClient;->endConnection()V

    return-void
.end method

.method public final onProgress(I)V
    .registers 6

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lhch;

    if-nez p1, :cond_20

    iget-object p1, p0, Lhch;->c:Lcom/opera/android/custom_views/OperaIntroView;

    const/16 v0, 0xec

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/16 v3, 0x9d

    invoke-virtual {p1, v2, v3, v0, v1}, Lcom/opera/android/widget/LottieAnimationView;->s(IIILjava/lang/Runnable;)V

    iget-object p0, p0, Lhch;->d:Lnu5;

    iget-object p1, p0, Lnu5;->b:Landroid/os/Handler;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const p1, 0x3f4ccccd    # 0.8f

    iput p1, p0, Lnu5;->d:F

    invoke-virtual {p0}, Lnu5;->run()V

    :cond_20
    return-void
.end method

.method public final p(Ljava/lang/String;)V
    .registers 2

    if-nez p1, :cond_4

    const-string p1, ""

    :cond_4
    invoke-virtual {p0, p1}, Lwub;->B(Ljava/lang/String;)V

    return-void
.end method

.method public final q(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    check-cast p2, Ljava/lang/String;

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lmhe;

    iget-object v0, p0, Lmhe;->a:Lknm;

    iget-object v1, v0, Lknm;->a:Lt5h;

    iget-object p0, p0, Lmhe;->b:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p2

    iget-boolean v2, v0, Lknm;->b:Z

    add-int/2addr p2, v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v1, p1, p2}, Lt5h;->q(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_2d

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    iget-boolean p2, v0, Lknm;->b:Z

    sub-int/2addr p1, p2

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_2d
    const/4 p0, 0x0

    return-object p0
.end method

.method public final r(F)Z
    .registers 5

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/f;->canScrollVertically()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_11

    float-to-int p1, p1

    move v0, p1

    move p1, v1

    goto :goto_1e

    :cond_11
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_1c

    float-to-int p1, p1

    move v0, v1

    goto :goto_1e

    :cond_1c
    move p1, v1

    move v0, p1

    :goto_1e
    if-nez p1, :cond_23

    if-nez v0, :cond_23

    return v1

    :cond_23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->L0()V

    const v2, 0x7fffffff

    invoke-virtual {p0, p1, v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->P(IIII)Z

    move-result p0

    return p0
.end method

.method public final read()Landroid/nfc/NdefMessage;
    .registers 4

    new-instance p0, Landroid/nfc/NdefMessage;

    new-instance v0, Landroid/nfc/NdefRecord;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v1, v1}, Landroid/nfc/NdefRecord;-><init>(S[B[B[B)V

    new-array v1, v2, [Landroid/nfc/NdefRecord;

    invoke-direct {p0, v0, v1}, Landroid/nfc/NdefMessage;-><init>(Landroid/nfc/NdefRecord;[Landroid/nfc/NdefRecord;)V

    return-object p0
.end method

.method public final reorderPriorityZeroMessages(Ljava/util/List;)Ljava/util/List;
    .registers 2

    return-object p1
.end method

.method public final s()F
    .registers 2

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/f;->canScrollVertically()Z

    move-result v0

    if-eqz v0, :cond_10

    iget p0, p0, Landroidx/recyclerview/widget/RecyclerView;->c0:F

    :goto_e
    neg-float p0, p0

    return p0

    :cond_10
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_1b

    iget p0, p0, Landroidx/recyclerview/widget/RecyclerView;->b0:F

    goto :goto_e

    :cond_1b
    const/4 p0, 0x0

    return p0
.end method

.method public final shouldDisplayMessage(Lcom/leanplum/ActionContext;)Z
    .registers 5

    invoke-static {}, Lcom/leanplum/Leanplum;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_45

    invoke-virtual {p1}, Lcom/leanplum/ActionContext;->actionName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Config Bundle Sheet"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_47

    invoke-static {p1}, Lcom/leanplum/messagetemplates/UtilsKt;->getCategories(Lcom/leanplum/ActionContext;)Ljava/util/Set;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_47

    sget-object v0, Lxsk;->g:Lh58;

    invoke-static {v0, v0}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v0

    :cond_25
    invoke-virtual {v0}, Lw4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_47

    invoke-virtual {v0}, Lw4;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxsk;

    iget-object v2, v1, Lxsk;->a:Ljava/lang/String;

    invoke-interface {p1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    iget-object v2, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/settings/SettingsManager;

    iget-object v1, v1, Lxsk;->b:Ljava/lang/String;

    invoke-virtual {v2, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_25

    :cond_45
    const/4 p0, 0x0

    return p0

    :cond_47
    const/4 p0, 0x1

    return p0
.end method

.method public final t()V
    .registers 1

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->L0()V

    return-void
.end method

.method public final u(Lwub;)V
    .registers 9

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v2, [Lp8f;

    array-length v3, v2

    if-ge v1, v3, :cond_2b

    aget-object v2, v2, v1

    iget-object v3, p1, Lwub;->a:Ljava/lang/Object;

    check-cast v3, [Lp8f;

    aget-object v3, v3, v1

    iget-object v2, v2, Lp8f;->b:Ljava/lang/Object;

    check-cast v2, [I

    iget-object v3, v3, Lp8f;->b:Ljava/lang/Object;

    check-cast v3, [I

    move v4, v0

    :goto_1a
    const/16 v5, 0x100

    if-ge v4, v5, :cond_28

    aget v5, v2, v4

    aget v6, v3, v4

    add-int/2addr v5, v6

    aput v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1a

    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2b
    return-void
.end method

.method public final v(Ljava/lang/String;)V
    .registers 2

    if-nez p1, :cond_4

    const-string p1, ""

    :cond_4
    invoke-virtual {p0, p1}, Lwub;->B(Ljava/lang/String;)V

    return-void
.end method

.method public final w()V
    .registers 8

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v2, [Lp8f;

    array-length v3, v2

    if-ge v1, v3, :cond_25

    aget-object v2, v2, v1

    iget-object v2, v2, Lp8f;->b:Ljava/lang/Object;

    check-cast v2, [I

    move v3, v0

    :goto_10
    const/16 v4, 0x100

    if-ge v3, v4, :cond_22

    aget v4, v2, v3

    shr-int/lit8 v5, v4, 0x1f

    const v6, 0x7fe001

    and-int/2addr v5, v6

    add-int/2addr v4, v5

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_25
    return-void
.end method

.method public final x(Landroid/app/NotificationChannel;)V
    .registers 5

    const-string v0, "NotificationManagerProxyImpl.createNotificationChannel"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    new-instance v1, Lhpd;

    const/16 v2, 0x12

    invoke-direct {v1, p0, p1, v2}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lwub;->N(Lorg/chromium/base/TraceEvent;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final y(Landroid/app/NotificationChannelGroup;)V
    .registers 5

    const-string v0, "NotificationManagerProxyImpl.createNotificationChannelGroup"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    new-instance v1, Lhpd;

    const/16 v2, 0x13

    invoke-direct {v1, p0, p1, v2}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lwub;->N(Lorg/chromium/base/TraceEvent;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final z(Lorb;)V
    .registers 2

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    return-void
.end method
