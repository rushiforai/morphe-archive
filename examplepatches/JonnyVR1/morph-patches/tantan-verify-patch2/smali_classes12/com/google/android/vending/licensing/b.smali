.class public Lcom/google/android/vending/licensing/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/vending/licensing/b$a;
    }
.end annotation


# static fields
.field public static final j:Ljava/security/SecureRandom;


# instance fields
.field public a:Lcom/google/android/vending/licensing/ILicensingService;

.field public b:Ljava/security/PublicKey;

.field public final c:Landroid/content/Context;

.field public final d:Ll/oi80;

.field public e:Landroid/os/Handler;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ll/xdr;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ll/xdr;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/security/SecureRandom;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/vending/licensing/b;->j:Ljava/security/SecureRandom;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/oi80;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/vending/licensing/b;->h:Ljava/util/Set;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/google/android/vending/licensing/b;->i:Ljava/util/Queue;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/google/android/vending/licensing/b;->c:Landroid/content/Context;

    .line 19
    .line 20
    iput-object p2, p0, Lcom/google/android/vending/licensing/b;->d:Ll/oi80;

    .line 21
    .line 22
    invoke-static {p3}, Lcom/google/android/vending/licensing/b;->j(Ljava/lang/String;)Ljava/security/PublicKey;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iput-object p2, p0, Lcom/google/android/vending/licensing/b;->b:Ljava/security/PublicKey;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iput-object p2, p0, Lcom/google/android/vending/licensing/b;->f:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1, p2}, Lcom/google/android/vending/licensing/b;->k(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/google/android/vending/licensing/b;->g:Ljava/lang/String;

    .line 39
    .line 40
    new-instance p1, Landroid/os/HandlerThread;

    .line 41
    .line 42
    const-string p2, "background thread"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 48
    .line 49
    .line 50
    new-instance p2, Landroid/os/Handler;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-direct {p2, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 57
    .line 58
    .line 59
    iput-object p2, p0, Lcom/google/android/vending/licensing/b;->e:Landroid/os/Handler;

    .line 60
    .line 61
    return-void
.end method

.method public static synthetic a(Lcom/google/android/vending/licensing/b;Ll/xdr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/vending/licensing/b;->l(Ll/xdr;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/google/android/vending/licensing/b;Ll/xdr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/vending/licensing/b;->h(Ll/xdr;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/google/android/vending/licensing/b;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/vending/licensing/b;->h:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/google/android/vending/licensing/b;)Ljava/security/PublicKey;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/vending/licensing/b;->b:Ljava/security/PublicKey;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/google/android/vending/licensing/b;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/vending/licensing/b;->e:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static j(Ljava/lang/String;)Ljava/security/PublicKey;
    .locals 3

    .line 1
    const-string v0, "LicenseChecker"

    .line 2
    .line 3
    :try_start_0
    invoke-static {p0}, Ll/ne2;->a(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, "RSA"

    .line 8
    .line 9
    invoke-static {v1}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ljava/security/spec/X509EncodedKeySpec;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    .line 19
    .line 20
    .line 21
    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/google/android/vending/licensing/util/Base64DecoderException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    return-object p0

    .line 23
    :catch_0
    move-exception p0

    .line 24
    goto :goto_0

    .line 25
    :catch_1
    move-exception p0

    .line 26
    goto :goto_2

    .line 27
    :goto_0
    const-string v1, "Invalid key specification."

    .line 28
    .line 29
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    :goto_1
    const/4 p0, 0x0

    .line 36
    return-object p0

    .line 37
    :goto_2
    const-string v1, "Could not decode from Base64."

    .line 38
    .line 39
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :catch_2
    move-exception p0

    .line 47
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    goto :goto_1
.end method

.method public static k(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 11
    .line 12
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    return-object p0

    .line 17
    :catch_0
    const-string p0, "LicenseChecker"

    .line 18
    .line 19
    const-string p1, "Package not found. could not get version code."

    .line 20
    .line 21
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    const-string p0, ""

    .line 25
    .line 26
    return-object p0
.end method


# virtual methods
.method public declared-synchronized f(Ll/wdr;)V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/google/android/vending/licensing/b;->d:Ll/oi80;

    .line 3
    .line 4
    invoke-interface {v0}, Ll/oi80;->b()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/16 v0, 0x100

    .line 11
    .line 12
    invoke-interface {p1, v0}, Ll/wdr;->a(I)V

    .line 13
    .line 14
    .line 15
    goto :goto_1

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    move-object p1, v0

    .line 18
    goto :goto_2

    .line 19
    :cond_0
    new-instance v0, Ll/xdr;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/google/android/vending/licensing/b;->d:Ll/oi80;

    .line 22
    .line 23
    new-instance v2, Ll/f350;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/f350;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/google/android/vending/licensing/b;->i()I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    iget-object v5, p0, Lcom/google/android/vending/licensing/b;->f:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v6, p0, Lcom/google/android/vending/licensing/b;->g:Ljava/lang/String;

    .line 35
    .line 36
    move-object v3, p1

    .line 37
    invoke-direct/range {v0 .. v6}, Ll/xdr;-><init>(Ll/oi80;Ll/d0e;Ll/wdr;ILjava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/google/android/vending/licensing/b;->a:Lcom/google/android/vending/licensing/ILicensingService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    :try_start_1
    new-instance p1, Landroid/content/Intent;

    .line 45
    .line 46
    new-instance v1, Ljava/lang/String;

    .line 47
    .line 48
    const-string v2, "Y29tLmFuZHJvaWQudmVuZGluZy5saWNlbnNpbmcuSUxpY2Vuc2luZ1NlcnZpY2U="

    .line 49
    .line 50
    invoke-static {v2}, Ll/ne2;->a(Ljava/lang/String;)[B

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .line 55
    .line 56
    .line 57
    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const-string v1, "com.android.vending"

    .line 61
    .line 62
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/google/android/vending/licensing/b;->c:Landroid/content/Context;

    .line 66
    .line 67
    const/4 v2, 0x1

    .line 68
    invoke-virtual {v1, p1, p0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    iget-object p1, p0, Lcom/google/android/vending/licensing/b;->i:Ljava/util/Queue;

    .line 75
    .line 76
    invoke-interface {p1, v0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :catch_0
    move-exception v0

    .line 81
    move-object p1, v0

    .line 82
    goto :goto_0

    .line 83
    :cond_1
    const-string p1, "LicenseChecker"

    .line 84
    .line 85
    const-string v1, "Could not bind to service."

    .line 86
    .line 87
    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v0}, Lcom/google/android/vending/licensing/b;->l(Ll/xdr;)V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/google/android/vending/licensing/util/Base64DecoderException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :goto_0
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :catch_1
    const/4 p1, 0x6

    .line 99
    invoke-interface {v3, p1}, Ll/wdr;->c(I)V

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_2
    iget-object p1, p0, Lcom/google/android/vending/licensing/b;->i:Ljava/util/Queue;

    .line 104
    .line 105
    invoke-interface {p1, v0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/google/android/vending/licensing/b;->m()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 109
    .line 110
    .line 111
    :goto_1
    monitor-exit p0

    .line 112
    return-void

    .line 113
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 114
    throw p1
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/vending/licensing/b;->a:Lcom/google/android/vending/licensing/ILicensingService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-object v0, p0, Lcom/google/android/vending/licensing/b;->c:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_0
    const-string v0, "LicenseChecker"

    .line 12
    .line 13
    const-string v1, "Unable to unbind from licensing service (already unbound)"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    :goto_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/google/android/vending/licensing/b;->a:Lcom/google/android/vending/licensing/ILicensingService;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final declared-synchronized h(Ll/xdr;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/google/android/vending/licensing/b;->h:Ljava/util/Set;

    .line 3
    .line 4
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/google/android/vending/licensing/b;->h:Ljava/util/Set;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/google/android/vending/licensing/b;->g()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p1
.end method

.method public final i()I
    .locals 0

    .line 1
    sget-object p0, Lcom/google/android/vending/licensing/b;->j:Ljava/security/SecureRandom;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/Random;->nextInt()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final declared-synchronized l(Ll/xdr;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/google/android/vending/licensing/b;->d:Ll/oi80;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/16 v2, 0x123

    .line 6
    .line 7
    invoke-interface {v0, v2, v1}, Ll/oi80;->a(ILl/l5d0;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/vending/licensing/b;->d:Ll/oi80;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/oi80;->b()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/xdr;->a()Ll/wdr;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {p1, v2}, Ll/wdr;->a(I)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    invoke-virtual {p1}, Ll/xdr;->a()Ll/wdr;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1, v2}, Ll/wdr;->b(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    :goto_0
    monitor-exit p0

    .line 36
    return-void

    .line 37
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw p1
.end method

.method public final m()V
    .locals 6

    .line 1
    :goto_0
    iget-object v0, p0, Lcom/google/android/vending/licensing/b;->i:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/xdr;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    :try_start_0
    invoke-virtual {v0}, Ll/xdr;->c()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/google/android/vending/licensing/b;->a:Lcom/google/android/vending/licensing/ILicensingService;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/xdr;->b()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    int-to-long v2, v2

    .line 21
    invoke-virtual {v0}, Ll/xdr;->c()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    new-instance v5, Lcom/google/android/vending/licensing/b$a;

    .line 26
    .line 27
    invoke-direct {v5, p0, v0}, Lcom/google/android/vending/licensing/b$a;-><init>(Lcom/google/android/vending/licensing/b;Ll/xdr;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v1, v2, v3, v4, v5}, Lcom/google/android/vending/licensing/ILicensingService;->p3(JLjava/lang/String;Lcom/google/android/vending/licensing/a;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/google/android/vending/licensing/b;->h:Ljava/util/Set;

    .line 34
    .line 35
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catch_0
    invoke-virtual {p0, v0}, Lcom/google/android/vending/licensing/b;->l(Ll/xdr;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    return-void
.end method

.method public declared-synchronized onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p2}, Lcom/google/android/vending/licensing/ILicensingService$a;->O(Landroid/os/IBinder;)Lcom/google/android/vending/licensing/ILicensingService;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    iput-object p1, p0, Lcom/google/android/vending/licensing/b;->a:Lcom/google/android/vending/licensing/ILicensingService;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/google/android/vending/licensing/b;->m()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public declared-synchronized onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    const/4 p1, 0x0

    .line 3
    :try_start_0
    iput-object p1, p0, Lcom/google/android/vending/licensing/b;->a:Lcom/google/android/vending/licensing/ILicensingService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception p1

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw p1
.end method
