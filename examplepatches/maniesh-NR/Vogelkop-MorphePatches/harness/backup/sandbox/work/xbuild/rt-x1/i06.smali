.class public final Li06;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk06;
.implements Lu38;
.implements Lo7h;
.implements Lds9;
.implements Lkotlin/coroutines/g;
.implements Lp9d;
.implements Llse;
.implements Ldxg;
.implements Lf06;


# static fields
.field public static b:Li06;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 29
    iput-byte p1, p0, Li06;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>([BLjava/security/Provider;)V
    .registers 3

    const/16 p2, 0x19

    iput-byte p2, p0, Li06;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p0, 0x1

    invoke-static {p0}, Lfki;->d(I)Z

    move-result p0

    if-eqz p0, :cond_16

    new-instance p0, Ljavax/crypto/spec/SecretKeySpec;

    const-string p2, "AES"

    invoke-direct {p0, p1, p2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    return-void

    :cond_16
    const-string p0, "Cannot use AES-CMAC in FIPS-mode, as BoringCrypto module is not available"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public static b(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljwk;)V
    .registers 3

    iget-boolean v0, p1, Ljwk;->a:Z

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    goto :goto_8

    :cond_6
    const/16 v0, 0x8

    :goto_8
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    iget-boolean p1, p1, Ljwk;->b:Z

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    return-void
.end method

.method public static e(Ljava/lang/String;)Lr1e;
    .registers 4

    sget-object v0, Lr1e;->e:Lh58;

    invoke-static {v0, v0}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v0

    :cond_6
    invoke-virtual {v0}, Lw4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-virtual {v0}, Lw4;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr1e;

    iget-object v2, v1, Lr1e;->a:Ljava/lang/String;

    invoke-static {v2, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    return-object v1

    :cond_1b
    const-string p0, "Collection contains no element matching the predicate."

    invoke-static {p0}, Lh9o;->h(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static g(Lz16;Lbp;)Lasc;
    .registers 4

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Ljava/io/IOException;

    instance-of v0, p1, Lloa;

    if-eqz v0, :cond_44

    check-cast p1, Lloa;

    iget p1, p1, Lloa;->c:I

    const/16 v0, 0x193

    if-eq p1, v0, :cond_24

    const/16 v0, 0x194

    if-eq p1, v0, :cond_24

    const/16 v0, 0x19a

    if-eq p1, v0, :cond_24

    const/16 v0, 0x1a0

    if-eq p1, v0, :cond_24

    const/16 v0, 0x1f4

    if-eq p1, v0, :cond_24

    const/16 v0, 0x1f7

    if-ne p1, v0, :cond_44

    :cond_24
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lz16;->a(I)Z

    move-result v0

    if-eqz v0, :cond_34

    new-instance p0, Lasc;

    const-wide/32 v0, 0x493e0

    invoke-direct {p0, p1, v0, v1}, Lasc;-><init>(IJ)V

    return-object p0

    :cond_34
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lz16;->a(I)Z

    move-result p0

    if-eqz p0, :cond_44

    new-instance p0, Lasc;

    const-wide/32 v0, 0xea60

    invoke-direct {p0, p1, v0, v1}, Lasc;-><init>(IJ)V

    return-object p0

    :cond_44
    const/4 p0, 0x0

    return-object p0
.end method

.method public static j()Li06;
    .registers 2

    sget-object v0, Li06;->b:Li06;

    if-nez v0, :cond_d

    new-instance v0, Li06;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Li06;-><init>(B)V

    sput-object v0, Li06;->b:Li06;

    :cond_d
    return-object v0
.end method

.method public static l(Lbp;)J
    .registers 4

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Ljava/io/IOException;

    instance-of v1, v0, Ls1g;

    if-nez v1, :cond_36

    instance-of v1, v0, Ljava/io/FileNotFoundException;

    if-nez v1, :cond_36

    instance-of v1, v0, Lioa;

    if-nez v1, :cond_36

    instance-of v1, v0, Lvsc;

    if-nez v1, :cond_36

    :goto_14
    if-eqz v0, :cond_28

    instance-of v1, v0, Lid6;

    if-eqz v1, :cond_23

    move-object v1, v0

    check-cast v1, Lid6;

    iget v1, v1, Lid6;->a:I

    const/16 v2, 0x7d8

    if-eq v1, v2, :cond_36

    :cond_23
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_14

    :cond_28
    iget p0, p0, Lbp;->a:I

    add-int/lit8 p0, p0, -0x1

    mul-int/lit16 p0, p0, 0x3e8

    const/16 v0, 0x1388

    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    move-result p0

    int-to-long v0, p0

    return-wide v0

    :cond_36
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    return-wide v0
.end method

.method public static m(Ljava/lang/String;)Z
    .registers 4

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    :try_start_a
    invoke-virtual {v0, p0, v1, v2}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result p0
    :try_end_e
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_e} :catch_f

    goto :goto_10

    :catch_f
    const/4 p0, -0x1

    :goto_10
    if-nez p0, :cond_14

    const/4 p0, 0x1

    goto :goto_15

    :cond_14
    const/4 p0, 0x0

    :goto_15
    return p0
.end method

.method public static n()Z
    .registers 3

    sget-object v0, Lt8;->a:Landroid/content/Context;

    const-string v1, "user"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/UserManager;

    const-string v2, "no_share_location"

    invoke-virtual {v1, v2}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_24

    const-string v1, "location"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    if-eqz v0, :cond_24

    invoke-virtual {v0}, Landroid/location/LocationManager;->isLocationEnabled()Z

    move-result v0

    if-eqz v0, :cond_24

    const/4 v0, 0x1

    return v0

    :cond_24
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public final A(Lorg/json/JSONObject;)Ljava/lang/Object;
    .registers 15

    const-string p0, "news_device_id"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string p0, "news_feed_host"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string p0, "fcm_token"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string p0, "push_level"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_24

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_25

    :cond_24
    move-object p0, v1

    :goto_25
    const-string v0, "fb_campaign"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "appsflyer_campaign"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "appsflyer_source"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "appsflyer_adgroup_id"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v0, "appsflyer_af_adset_id"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v0, "install_referrer"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v0, "abgroup"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v0, "user_mode"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    new-instance v0, Ljse;

    move-object v1, p0

    invoke-direct/range {v0 .. v12}, Ljse;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final D(Ljava/lang/Object;[Ljava/lang/String;)V
    .registers 7

    const-string p0, "data"

    check-cast p1, Lorg/json/JSONObject;

    if-eqz p2, :cond_1a

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    :try_start_b
    array-length v1, p2

    const/4 v2, 0x0

    :goto_d
    if-ge v2, v1, :cond_17

    aget-object v3, p2, v2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_17
    invoke-virtual {p1, p0, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1a
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_1a} :catch_1a

    :catch_1a
    :cond_1a
    return-void
.end method

.method public final a(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    check-cast p1, Leo2;

    iget p0, p1, Leo2;->c:I

    const-string v1, "Can\'t convert "

    const-string v0, "Invalid postview image format : "

    iget-object v2, p1, Leo2;->a:Ljava/lang/Object;

    iget p1, p1, Leo2;->f:I

    const/16 v3, 0x23

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-ne p0, v3, :cond_6c

    :try_start_12
    check-cast v2, Lqya;

    rem-int/lit16 v0, p1, 0xb4

    const/4 v6, 0x1

    if-eqz v0, :cond_1b

    move v0, v6

    goto :goto_1c

    :cond_1b
    move v0, v4

    :goto_1c
    if-eqz v0, :cond_23

    invoke-interface {v2}, Lqya;->getHeight()I

    move-result v7

    goto :goto_27

    :cond_23
    invoke-interface {v2}, Lqya;->getWidth()I

    move-result v7

    :goto_27
    if-eqz v0, :cond_2e

    invoke-interface {v2}, Lqya;->getWidth()I

    move-result v0

    goto :goto_32

    :cond_2e
    invoke-interface {v2}, Lqya;->getHeight()I

    move-result v0

    :goto_32
    new-instance v8, Lbl9;

    const/4 v9, 0x2

    invoke-static {v7, v0, v6, v9}, Laib;->u(IIII)Lrn9;

    move-result-object v0

    invoke-direct {v8, v0}, Lbl9;-><init>(Luya;)V
    :try_end_3c
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_12 .. :try_end_3c} :catch_ad
    .catchall {:try_start_12 .. :try_end_3c} :catchall_cd

    :try_start_3c
    invoke-interface {v2}, Lqya;->getWidth()I

    move-result v0

    invoke-interface {v2}, Lqya;->getHeight()I

    move-result v6

    mul-int/2addr v0, v6

    shl-int/2addr v0, v9

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {v2, v8, v0, p1, v4}, Landroidx/camera/core/ImageProcessingUtil;->d(Lqya;Luya;Ljava/nio/ByteBuffer;IZ)Lvva;

    move-result-object p1

    invoke-interface {v2}, Ljava/lang/AutoCloseable;->close()V

    if-eqz p1, :cond_5c

    invoke-static {p1}, Lsfe;->K(Lqya;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p1}, Lvva;->close()V

    move-object v5, v8

    goto :goto_a7

    :cond_5c
    new-instance p1, Lgwa;

    const-string v0, "Can\'t covert YUV to RGB"

    invoke-direct {p1, v4, v0, v5}, Lgwa;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p1
    :try_end_64
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_3c .. :try_end_64} :catch_68
    .catchall {:try_start_3c .. :try_end_64} :catchall_64

    :catchall_64
    move-exception v0

    move-object p0, v0

    move-object v5, v8

    goto :goto_cf

    :catch_68
    move-exception v0

    move-object p1, v0

    move-object v5, v8

    goto :goto_af

    :cond_6c
    const/16 v6, 0x100

    if-eq p0, v6, :cond_86

    const/16 v6, 0x1005

    if-eq p0, v6, :cond_86

    :try_start_74
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_86
    check-cast v2, Lqya;

    invoke-static {v2}, Lsfe;->K(Lqya;)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-interface {v2}, Ljava/lang/AutoCloseable;->close()V

    new-instance v11, Landroid/graphics/Matrix;

    invoke-direct {v11}, Landroid/graphics/Matrix;-><init>()V

    int-to-float p1, p1

    invoke-virtual {v11, p1}, Landroid/graphics/Matrix;->postRotate(F)Z

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    const/4 v12, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v6 .. v12}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_a7
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_74 .. :try_end_a7} :catch_ad
    .catchall {:try_start_74 .. :try_end_a7} :catchall_cd

    :goto_a7
    if-eqz v5, :cond_ac

    invoke-virtual {v5}, Lbl9;->close()V

    :cond_ac
    return-object v0

    :catch_ad
    move-exception v0

    move-object p1, v0

    :goto_af
    if-ne p0, v3, :cond_b4

    :try_start_b1
    const-string p0, "YUV"

    goto :goto_b6

    :cond_b4
    const-string p0, "JPEG"

    :goto_b6
    new-instance v0, Lgwa;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to bitmap"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v4, p0, p1}, Lgwa;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0
    :try_end_cd
    .catchall {:try_start_b1 .. :try_end_cd} :catchall_cd

    :catchall_cd
    move-exception v0

    move-object p0, v0

    :goto_cf
    if-eqz v5, :cond_d4

    invoke-virtual {v5}, Lbl9;->close()V

    :cond_d4
    throw p0
.end method

.method public final d(Ljava/lang/String;Ljava/security/Provider;)Ljava/lang/Object;
    .registers 3

    if-nez p2, :cond_7

    invoke-static {p1}, Ljavax/crypto/KeyAgreement;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyAgreement;

    move-result-object p0

    return-object p0

    :cond_7
    invoke-static {p1, p2}, Ljavax/crypto/KeyAgreement;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/KeyAgreement;

    move-result-object p0

    return-object p0
.end method

.method public final f()Lh06;
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Not supported yet."

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final get()Ljava/lang/Object;
    .registers 2

    new-instance p0, Ltjb;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-direct {p0, v0}, Ltjb;-><init>(Ljava/util/concurrent/ExecutorService;)V

    return-object p0
.end method

.method public final h(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    check-cast p1, Lorg/json/JSONObject;

    if-nez p3, :cond_a

    :try_start_4
    sget-object p0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p1, p2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void

    :cond_a
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_d} :catch_d

    :catch_d
    return-void
.end method

.method public final i(Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Lj8a;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lj8a;

    iget v1, v0, Lj8a;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lj8a;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lj8a;

    invoke-direct {v0, p0, p1}, Lj8a;-><init>(Li06;Lnt5;)V

    :goto_18
    iget-object p0, v0, Lj8a;->t:Ljava/lang/Object;

    sget-object p1, Lpx5;->a:Lpx5;

    iget v1, v0, Lj8a;->v:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x2

    if-eqz v1, :cond_35

    if-eq v1, v3, :cond_31

    if-ne v1, v4, :cond_2b

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    return-object p0

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_31
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_44

    :cond_35
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lcak;->d:Lavj;

    iput v3, v0, Lj8a;->v:I

    const/16 p0, 0x8

    invoke-static {p0, v0}, Lmfh;->w(ILmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, p1, :cond_57

    :goto_44
    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    iget-object p0, p0, Ld7a;->e:Ld7a;

    new-instance v1, Lwv0;

    invoke-direct {v1, v4, v2, v4}, Lwv0;-><init>(ILmt5;B)V

    iput v4, v0, Lj8a;->v:I

    invoke-static {p0, v1, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p1, :cond_58

    :cond_57
    return-object p1

    :cond_58
    return-object p0
.end method

.method public final k(I)I
    .registers 2

    const/4 p0, 0x7

    if-ne p1, p0, :cond_5

    const/4 p0, 0x6

    return p0

    :cond_5
    const/4 p0, 0x3

    return p0
.end method

.method public final o(Ljava/util/List;Lud6;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p3, Lgc6;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lgc6;

    iget v1, v0, Lgc6;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lgc6;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lgc6;

    invoke-direct {v0, p0, p3}, Lgc6;-><init>(Li06;Lnt5;)V

    :goto_18
    iget-object p0, v0, Lgc6;->v:Ljava/lang/Object;

    sget-object p3, Lpx5;->a:Lpx5;

    iget v1, v0, Lgc6;->x:I

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v1, :cond_3f

    if-eq v1, v4, :cond_37

    if-ne v1, v3, :cond_31

    iget-object p1, v0, Lgc6;->u:Ljava/util/Iterator;

    iget-object p2, v0, Lgc6;->t:Ljava/io/Serializable;

    check-cast p2, Lpqh;

    :try_start_2d
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_30
    .catchall {:try_start_2d .. :try_end_30} :catchall_7c

    goto :goto_63

    :cond_31
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_37
    iget-object p1, v0, Lgc6;->t:Ljava/io/Serializable;

    check-cast p1, Ljava/util/List;

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_57

    :cond_3f
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lqa6;

    invoke-direct {v1, p1, p0, v2, v4}, Lqa6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-object p0, v0, Lgc6;->t:Ljava/io/Serializable;

    iput v4, v0, Lgc6;->x:I

    invoke-virtual {p2, v1, v0}, Lud6;->a(Lqa6;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, p3, :cond_7b

    move-object p1, p0

    :goto_57
    new-instance p0, Lpqh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move-object p2, p0

    :cond_63
    :goto_63
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_8a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlin/jvm/functions/Function1;

    :try_start_6f
    iput-object p2, v0, Lgc6;->t:Ljava/io/Serializable;

    iput-object p1, v0, Lgc6;->u:Ljava/util/Iterator;

    iput v3, v0, Lgc6;->x:I

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_79
    .catchall {:try_start_6f .. :try_end_79} :catchall_7c

    if-ne p0, p3, :cond_63

    :cond_7b
    return-object p3

    :catchall_7c
    move-exception p0

    iget-object v1, p2, Lpqh;->a:Ljava/lang/Object;

    if-nez v1, :cond_84

    iput-object p0, p2, Lpqh;->a:Ljava/lang/Object;

    goto :goto_63

    :cond_84
    check-cast v1, Ljava/lang/Throwable;

    invoke-static {v1, p0}, Lwf8;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_63

    :cond_8a
    iget-object p0, p2, Lpqh;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Throwable;

    if-nez p0, :cond_93

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_93
    throw p0
.end method

.method public final t(Lvdg;)Ljava/lang/Object;
    .registers 2

    iget p0, p1, Lvdg;->J:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 5

    iget-byte v0, p0, Li06;->a:B

    packed-switch v0, :pswitch_data_2e

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    const/16 v0, 0x10

    invoke-static {v0}, Lkotlin/text/CharsKt;->checkRadix(I)I

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object p0

    const-class v0, Lw7n;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-virtual {v0}, Ls15;->c()Ljava/lang/String;

    move-result-object v0

    const-string v1, "<"

    const-string v2, ">"

    const-string v3, "CreationExtras.Key@"

    invoke-static {v3, p0, v1, v0, v2}, Lsko;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_2e
    .packed-switch 0x1c
        :pswitch_a
    .end packed-switch
.end method

.method public final v()Ljava/lang/Object;
    .registers 1

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    return-object p0
.end method

.method public final y(Ljava/lang/Object;)Lorg/json/JSONObject;
    .registers 4

    check-cast p1, Ljse;

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "news_device_id"

    iget-object v1, p1, Ljse;->a:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "news_feed_host"

    iget-object v1, p1, Ljse;->b:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "fcm_token"

    iget-object v1, p1, Ljse;->c:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v0, p1, Ljse;->d:Ljava/lang/Integer;

    if-eqz v0, :cond_29

    const-string v1, "push_level"

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_29
    iget-object v0, p1, Ljse;->e:Ljava/lang/String;

    if-eqz v0, :cond_32

    const-string v1, "fb_campaign"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_32
    iget-object v0, p1, Ljse;->f:Ljava/lang/String;

    if-eqz v0, :cond_3b

    const-string v1, "appsflyer_campaign"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_3b
    iget-object v0, p1, Ljse;->g:Ljava/lang/String;

    if-eqz v0, :cond_44

    const-string v1, "appsflyer_source"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_44
    iget-object v0, p1, Ljse;->h:Ljava/lang/String;

    if-eqz v0, :cond_4d

    const-string v1, "appsflyer_adgroup_id"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_4d
    iget-object v0, p1, Ljse;->i:Ljava/lang/String;

    if-eqz v0, :cond_56

    const-string v1, "appsflyer_af_adset_id"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_56
    iget-object v0, p1, Ljse;->j:Ljava/lang/String;

    if-eqz v0, :cond_5f

    const-string v1, "install_referrer"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_5f
    iget-object v0, p1, Ljse;->k:Ljava/lang/String;

    if-eqz v0, :cond_68

    const-string v1, "abgroup"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_68
    iget-object p1, p1, Ljse;->l:Ljava/lang/String;

    if-eqz p1, :cond_71

    const-string v0, "user_mode"

    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_71
    const-string p1, "product"

    const-string v0, "opera"

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-object p0
.end method
