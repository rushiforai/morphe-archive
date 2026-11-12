.class public final Ls6e;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lnx1;


# instance fields
.field public final a:I

.field public final b:Lvq8;

.field public final c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnx1;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lnx1;-><init>(B)V

    sput-object v0, Ls6e;->d:Lnx1;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x2

    invoke-static {v2, v1}, Ls6e;->d(ILandroid/content/Context;)Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v3, :cond_16

    invoke-static {v4, v1}, Ls6e;->d(ILandroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_15

    move v2, v4

    goto :goto_16

    :cond_15
    move v2, v5

    :cond_16
    :goto_16
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const-string v3, ""

    iput-object v3, v0, Ls6e;->c:Ljava/lang/String;

    const/4 v3, 0x0

    if-eqz v2, :cond_117

    invoke-static {v1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v6

    iget-object v6, v6, Lno7;->a:Landroid/content/Context;

    invoke-static {v6}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v6

    iget-object v6, v6, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v7, "dcc.rs.mock.disable"

    invoke-interface {v6, v7, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_117

    iput v2, v0, Ls6e;->a:I

    :try_start_36
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    const-string v6, "content"

    invoke-virtual {v1, v6}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-static {v2}, Lj7c;->h(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    const-string v2, "all"

    invoke-static {v1, v2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_5f} :catch_110
    .catchall {:try_start_36 .. :try_end_5f} :catchall_10b

    if-eqz v1, :cond_111

    :try_start_61
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_111

    new-instance v6, Lvq8;

    const-string v2, "sim_mcc"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ls6e;->f(Ljava/lang/String;)V

    const-string v2, "sim_mnc"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ls6e;->f(Ljava/lang/String;)V

    const-string v2, "sim_iso"

    invoke-static {v1, v2}, Ls6e;->e(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ls6e;->g(Ljava/lang/String;)V

    const-string v2, "net_mcc"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ls6e;->f(Ljava/lang/String;)V

    const-string v2, "net_mnc"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ls6e;->f(Ljava/lang/String;)V

    const-string v2, "net_iso"

    invoke-static {v1, v2}, Ls6e;->e(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ls6e;->g(Ljava/lang/String;)V

    const-string v2, "gps_iso"

    invoke-static {v1, v2}, Ls6e;->e(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ls6e;->g(Ljava/lang/String;)V

    const-string v2, "branding"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ls6e;->g(Ljava/lang/String;)V

    const-string v2, "ab_test"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ls6e;->g(Ljava/lang/String;)V

    invoke-static {v1}, Ls6e;->a(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v14

    const-string v2, "adset"

    invoke-static {v1, v2}, Ls6e;->e(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ls6e;->g(Ljava/lang/String;)V

    const-string v2, "af_adset"

    invoke-static {v1, v2}, Ls6e;->e(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Ls6e;->g(Ljava/lang/String;)V

    const-string v2, "ad_server"

    invoke-static {v1, v2}, Ls6e;->e(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v2, "show_overlay"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-lez v2, :cond_fd

    move/from16 v18, v4

    goto :goto_ff

    :cond_fd
    move/from16 v18, v5

    :goto_ff
    invoke-direct/range {v6 .. v18}, Lvq8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_102
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_102} :catch_111
    .catchall {:try_start_61 .. :try_end_102} :catchall_109

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    move-object v3, v6

    goto :goto_114

    :goto_107
    move-object v3, v1

    goto :goto_10c

    :catchall_109
    move-exception v0

    goto :goto_107

    :catchall_10b
    move-exception v0

    :goto_10c
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :catch_110
    move-object v1, v3

    :catch_111
    :cond_111
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    :goto_114
    iput-object v3, v0, Ls6e;->b:Lvq8;

    return-void

    :cond_117
    iput v5, v0, Ls6e;->a:I

    iput-object v3, v0, Ls6e;->b:Lvq8;

    return-void
.end method

.method public static a(Landroid/database/Cursor;)Ljava/lang/String;
    .registers 6

    const-string v0, "utm_campaign"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ls6e;->g(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_16

    const-string p0, ""

    return-object p0

    :cond_16
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "utm_source="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "utm_source"

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ls6e;->g(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const-string v4, "mock"

    if-eqz v3, :cond_33

    move-object v2, v4

    :cond_33
    const-string v3, "&utm_campaign="

    invoke-static {v1, v2, v3, v0}, Lp3p;->v(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "utm_medium"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ls6e;->g(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4c

    move-object v4, v0

    :cond_4c
    const-string v0, "&utm_medium="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "utm_term"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ls6e;->g(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6f

    const-string v2, "&utm_term="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6f
    const-string v0, "utm_content"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls6e;->g(Ljava/lang/String;)V

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8a

    const-string v0, "&utm_content="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_8a
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static b(Landroid/content/Context;)Ls6e;
    .registers 2

    sget-object v0, Ls6e;->d:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ls6e;

    return-object p0
.end method

.method public static d(ILandroid/content/Context;)Z
    .registers 8

    invoke-static {p0}, Lj7c;->h(I)Ljava/lang/String;

    move-result-object v0

    const-wide/16 v1, 0x40

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    :try_start_9
    invoke-static {p1, v0, v1, v2}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object p1

    if-eqz p1, :cond_38

    iget-object p1, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-eqz p1, :cond_19

    array-length v0, p1

    if-ne v0, v4, :cond_19

    aget-object p1, p1, v3

    goto :goto_1a

    :cond_19
    move-object p1, v5

    :goto_1a
    if-eqz p1, :cond_38

    const-string v0, "X509"

    invoke-static {v0}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v0

    if-eqz v0, :cond_38

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p1}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v0, v1}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object p1

    check-cast p1, Ljava/security/cert/X509Certificate;

    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object p1
    :try_end_37
    .catch Ljava/security/cert/CertificateException; {:try_start_9 .. :try_end_37} :catch_38

    goto :goto_39

    :catch_38
    :cond_38
    move-object p1, v5

    :goto_39
    if-nez p1, :cond_3c

    return v3

    :cond_3c
    if-eq p0, v4, :cond_45

    const/4 v0, 0x2

    if-ne p0, v0, :cond_44

    const-string p0, "5d6afbf87f652af04647ada0df634cf22370900b164b09d50bd23aa2cb5285b8"

    goto :goto_47

    :cond_44
    throw v5

    :cond_45
    const-string p0, "57acbc525f1b2ebd19196cd6f014397cc910fd18841e0ae850febc3e1e593ff2"

    :goto_47
    const-string v0, "%0"

    :try_start_49
    const-string v1, "SHA256"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    if-eqz v1, :cond_77

    invoke-virtual {v1, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p1

    new-instance v1, Ljava/math/BigInteger;

    invoke-direct {v1, v4, p1}, Ljava/math/BigInteger;-><init>(I[B)V

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length p1, p1

    shl-int/2addr p1, v4

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "x"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v2, p1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5
    :try_end_77
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_49 .. :try_end_77} :catch_77

    :catch_77
    :cond_77
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static e(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p1

    if-gez p1, :cond_9

    const-string p0, ""

    return-object p0

    :cond_9
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static f(Ljava/lang/String;)V
    .registers 3

    if-eqz p0, :cond_12

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x3

    if-gt v0, v1, :cond_12

    const-string v0, "^[0-9]*$"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_12

    return-void

    :cond_12
    invoke-static {}, Lhai;->d()V

    return-void
.end method

.method public static g(Ljava/lang/String;)V
    .registers 3

    if-eqz p0, :cond_13

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xc8

    if-gt v0, v1, :cond_13

    const-string v0, "^[a-zA-Z0-9._-]*$"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_13

    return-void

    :cond_13
    invoke-static {}, Lhai;->d()V

    return-void
.end method


# virtual methods
.method public final c()Z
    .registers 1

    iget-object p0, p0, Ls6e;->b:Lvq8;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method
