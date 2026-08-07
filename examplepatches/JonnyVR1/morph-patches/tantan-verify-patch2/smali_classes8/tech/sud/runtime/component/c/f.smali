.class public Ltech/sud/runtime/component/c/f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/component/c/f$a;,
        Ltech/sud/runtime/component/c/f$b;
    }
.end annotation


# static fields
.field private static final a:[Ljava/lang/String;


# instance fields
.field private b:Ltech/sud/runtime/component/c/f$a;

.field private c:Ltech/sud/runtime/component/c/f$b;

.field private final d:Ltech/sud/runtime/core/g;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-string v0, "ethernet"

    .line 2
    .line 3
    const-string v1, "unknown"

    .line 4
    .line 5
    const-string v2, "none"

    .line 6
    .line 7
    const-string v3, "wifi"

    .line 8
    .line 9
    const-string v4, "mobile"

    .line 10
    .line 11
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ltech/sud/runtime/component/c/f;->a:[Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Ltech/sud/runtime/core/g;Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltech/sud/runtime/component/c/f;->c:Ltech/sud/runtime/component/c/f$b;

    .line 6
    .line 7
    iput-object p1, p0, Ltech/sud/runtime/component/c/f;->d:Ltech/sud/runtime/core/g;

    .line 8
    .line 9
    new-instance p1, Landroid/content/IntentFilter;

    .line 10
    .line 11
    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ltech/sud/runtime/component/c/f$a;

    .line 20
    .line 21
    invoke-direct {v1, v0}, Ltech/sud/runtime/component/c/f$a;-><init>(Ltech/sud/runtime/component/c/f$1;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Ltech/sud/runtime/component/c/f;->b:Ltech/sud/runtime/component/c/f$a;

    .line 25
    .line 26
    invoke-static {p2, v1, p1}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private static a(Landroid/telephony/TelephonyManager;Landroid/net/ConnectivityManager;)I
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    :cond_0
    const/4 p0, 0x0

    .line 9
    :try_start_1
    invoke-virtual {p1, p0}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    .line 20
    .line 21
    if-eq v0, v1, :cond_1

    .line 22
    .line 23
    sget-object v1, Landroid/net/NetworkInfo$State;->CONNECTING:Landroid/net/NetworkInfo$State;

    .line 24
    .line 25
    if-ne v0, v1, :cond_2

    .line 26
    .line 27
    :cond_1
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 28
    .line 29
    .line 30
    move-result p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 31
    :catch_1
    :cond_2
    return p0
.end method

.method public static synthetic a(I)Ljava/lang/String;
    .locals 0

    .line 39
    invoke-static {p0}, Ltech/sud/runtime/component/c/f;->b(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Ltech/sud/runtime/component/c/f;)Ltech/sud/runtime/core/g;
    .locals 0

    .line 32
    iget-object p0, p0, Ltech/sud/runtime/component/c/f;->d:Ltech/sud/runtime/core/g;

    return-object p0
.end method

.method public static b(Landroid/content/Context;)I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "connectivity"

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Landroid/net/ConnectivityManager;

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    :try_start_0
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception v2

    .line 26
    new-instance v3, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v4, "J: NetworkState: "

    .line 29
    .line 30
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const-string v3, "SudNative"

    .line 45
    .line 46
    invoke-static {v3, v2}, Ltech/sud/runtime/component/h/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    :goto_0
    if-eqz v2, :cond_6

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-nez v3, :cond_2

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_5

    .line 64
    .line 65
    const/4 p0, 0x1

    .line 66
    if-eq v0, p0, :cond_4

    .line 67
    .line 68
    const/16 p0, 0x9

    .line 69
    .line 70
    if-eq v0, p0, :cond_3

    .line 71
    .line 72
    const/4 p0, 0x4

    .line 73
    return p0

    .line 74
    :cond_3
    const/4 p0, 0x3

    .line 75
    :cond_4
    return p0

    .line 76
    :cond_5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string v0, "phone"

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 87
    .line 88
    invoke-static {p0, v1}, Ltech/sud/runtime/component/c/f;->a(Landroid/telephony/TelephonyManager;Landroid/net/ConnectivityManager;)I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    packed-switch p0, :pswitch_data_0

    .line 93
    .line 94
    .line 95
    :pswitch_0
    const/16 p0, 0x602

    .line 96
    .line 97
    return p0

    .line 98
    :pswitch_1
    const/16 p0, 0x502

    .line 99
    .line 100
    return p0

    .line 101
    :pswitch_2
    const/16 p0, 0x402

    .line 102
    .line 103
    return p0

    .line 104
    :pswitch_3
    const/16 p0, 0x302

    .line 105
    .line 106
    return p0

    .line 107
    :pswitch_4
    const/16 p0, 0x202

    .line 108
    .line 109
    return p0

    .line 110
    :pswitch_5
    const/4 p0, 0x2

    .line 111
    return p0

    .line 112
    :cond_6
    :goto_1
    return v0

    .line 113
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private static b(I)Ljava/lang/String;
    .locals 3

    and-int/lit16 v0, p0, 0xff

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    move v0, v1

    .line 113
    :cond_0
    sget-object v1, Ltech/sud/runtime/component/c/f;->a:[Ljava/lang/String;

    aget-object v1, v1, v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    shr-int/lit8 p0, p0, 0x8

    and-int/lit16 p0, p0, 0xff

    if-eqz p0, :cond_1

    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "g"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    return-object v1
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 40
    new-instance v0, Ltech/sud/runtime/component/c/f$b;

    invoke-direct {v0, p0}, Ltech/sud/runtime/component/c/f$b;-><init>(Ltech/sud/runtime/component/c/f;)V

    iput-object v0, p0, Ltech/sud/runtime/component/c/f;->c:Ltech/sud/runtime/component/c/f$b;

    .line 41
    iget-object v0, p0, Ltech/sud/runtime/component/c/f;->b:Ltech/sud/runtime/component/c/f$a;

    new-instance v1, Ljava/lang/ref/WeakReference;

    iget-object p0, p0, Ltech/sud/runtime/component/c/f;->c:Ltech/sud/runtime/component/c/f$b;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Ltech/sud/runtime/component/c/f$a;->a:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Ltech/sud/runtime/component/c/f;->c:Ltech/sud/runtime/component/c/f$b;

    .line 34
    iget-object v1, p0, Ltech/sud/runtime/component/c/f;->b:Ltech/sud/runtime/component/c/f$a;

    if-eqz v1, :cond_0

    .line 35
    iput-object v0, v1, Ltech/sud/runtime/component/c/f$a;->a:Ljava/lang/ref/WeakReference;

    .line 36
    :try_start_0
    invoke-virtual {p1, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 37
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 38
    :goto_0
    iput-object v0, p0, Ltech/sud/runtime/component/c/f;->b:Ltech/sud/runtime/component/c/f$a;

    :cond_0
    return-void
.end method
