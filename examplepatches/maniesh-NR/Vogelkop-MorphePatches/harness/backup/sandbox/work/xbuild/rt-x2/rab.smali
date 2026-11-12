.class public abstract Lrab;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lqab;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lqab;->a:Lqab;

    sput-object v0, Lrab;->a:Lqab;

    return-void
.end method

.method public static final a(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 5

    invoke-static {p1}, Lrab;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :try_start_4
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_c
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_c} :catch_35

    instance-of v0, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_17

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    :cond_17
    new-instance v0, Lixh;

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    invoke-virtual {v0, p0}, Ly7h;->k(Landroid/content/Context;)I

    move-result p0

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p0, p0, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, p0, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-object v0

    :catch_35
    const/4 p0, 0x0

    return-object p0
.end method

.method public static b(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;Lqab;)Ljava/util/HashSet;
    .registers 13

    const/high16 v0, 0x8000000

    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_1d

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->signingInfo:Landroid/content/pm/SigningInfo;

    if-eqz p0, :cond_1d

    invoke-virtual {p0}, Landroid/content/pm/SigningInfo;->hasMultipleSigners()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Landroid/content/pm/SigningInfo;->getApkContentsSigners()[Landroid/content/pm/Signature;

    move-result-object p0

    goto :goto_1e

    :cond_18
    invoke-virtual {p0}, Landroid/content/pm/SigningInfo;->getSigningCertificateHistory()[Landroid/content/pm/Signature;

    move-result-object p0

    goto :goto_1e

    :cond_1d
    move-object p0, p1

    :goto_1e
    const/4 v0, 0x0

    if-nez p0, :cond_23

    new-array p0, v0, [Landroid/content/pm/Signature;

    :cond_23
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    array-length v2, p0

    :goto_29
    if-ge v0, v2, :cond_9c

    aget-object v3, p0, v0

    :try_start_2d
    new-instance v4, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v3}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v3

    invoke-direct {v4, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_36} :catch_8f

    :try_start_36
    const-string v3, "X509"

    invoke-static {v3}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v3

    check-cast v3, Ljava/security/cert/X509Certificate;

    invoke-static {p2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    invoke-virtual {v3}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eqz v5, :cond_7e

    const/16 v6, 0x1e

    const/4 v7, 0x1

    if-eq v5, v7, :cond_70

    const/4 v7, 0x2

    if-ne v5, v7, :cond_6a

    const-string v5, ""

    new-instance v7, Lq9a;

    const/16 v8, 0x1d

    invoke-direct {v7, v8}, Lq9a;-><init>(B)V

    invoke-static {v3, v5, v7, v6}, Le82;->w([BLjava/lang/String;Lkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v3

    goto :goto_84

    :cond_6a
    new-instance v3, Loye;

    invoke-direct {v3}, Ljava/lang/RuntimeException;-><init>()V

    throw v3

    :cond_70
    const-string v5, ":"

    new-instance v7, Lq9a;

    const/16 v8, 0x1c

    invoke-direct {v7, v8}, Lq9a;-><init>(B)V

    invoke-static {v3, v5, v7, v6}, Le82;->w([BLjava/lang/String;Lkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v3

    goto :goto_84

    :cond_7e
    const/16 v5, 0xa

    invoke-static {v3, v5}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v3
    :try_end_84
    .catchall {:try_start_36 .. :try_end_84} :catchall_88

    :goto_84
    :try_start_84
    invoke-virtual {v4}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_87
    .catch Ljava/lang/Exception; {:try_start_84 .. :try_end_87} :catch_8f

    goto :goto_94

    :catchall_88
    move-exception v3

    :try_start_89
    throw v3
    :try_end_8a
    .catchall {:try_start_89 .. :try_end_8a} :catchall_8a

    :catchall_8a
    move-exception v5

    :try_start_8b
    invoke-static {v4, v3}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v5
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_8f} :catch_8f

    :catch_8f
    move-exception v3

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-object v3, p1

    :goto_94
    if-eqz v3, :cond_99

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_99
    add-int/lit8 v0, v0, 0x1

    goto :goto_29

    :cond_9c
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->i0(Ljava/lang/Iterable;)Ljava/util/HashSet;

    move-result-object p0

    return-object p0
.end method

.method public static final c(Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const-string v0, "SHA-512"

    sget-object v1, Lrab;->a:Lqab;

    invoke-static {p0, p1, v0, v1}, Lrab;->b(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;Lqab;)Ljava/util/HashSet;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->L(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_19

    const-string v0, "android://"

    const-string v1, "@"

    invoke-static {v0, p0, v1, p1}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1a

    :cond_19
    const/4 p0, 0x0

    :goto_1a
    if-nez p0, :cond_1e

    const-string p0, ""

    :cond_1e
    return-object p0
.end method

.method public static d(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/util/Set;Lqab;)Z
    .registers 12

    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_63

    check-cast p2, Ljava/lang/Iterable;

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x1

    const-string v4, "SHA-256"

    const-string v5, "SHA-512"

    const/4 v6, 0x0

    if-eqz v2, :cond_3e

    if-eq v2, v3, :cond_31

    const/4 v7, 0x2

    if-ne v2, v7, :cond_2d

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x40

    if-eq v0, v2, :cond_4d

    const/16 v2, 0x80

    if-eq v0, v2, :cond_4c

    goto :goto_4a

    :cond_2d
    invoke-static {}, Lh9o;->p()V

    return v1

    :cond_31
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x5f

    if-eq v0, v2, :cond_4d

    const/16 v2, 0xbf

    if-eq v0, v2, :cond_4c

    goto :goto_4a

    :cond_3e
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x58

    if-eq v0, v2, :cond_4d

    const/16 v2, 0xac

    if-eq v0, v2, :cond_4c

    :goto_4a
    move-object v4, v6

    goto :goto_4d

    :cond_4c
    move-object v4, v5

    :cond_4d
    :goto_4d
    if-eqz v4, :cond_63

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_63

    invoke-static {p0, p1, v4, p3}, Lrab;->b(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;Lqab;)Ljava/util/HashSet;

    move-result-object p0

    invoke-static {p2, p0}, Lkotlin/collections/CollectionsKt;->N(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v3

    return p0

    :cond_63
    return v1
.end method

.method public static final e(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const-string v0, "android"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1a

    const-string v0, "@"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x6

    invoke-static {p0, v0, v1, v2}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    :cond_1a
    return-object p0
.end method
