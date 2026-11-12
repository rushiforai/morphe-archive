.class public final Lpp6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .registers 2

    iput-object p1, p0, Lpp6;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 5

    iget v0, p1, Lbp;->a:I

    const/16 v1, 0xc8

    if-lt v0, v1, :cond_68

    const/16 v1, 0x12c

    if-ge v0, v1, :cond_68

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Lgzd;

    invoke-virtual {p1}, Lgzd;->h()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_68

    new-instance v0, Lrne;

    iget-object p0, p0, Lpp6;->a:Landroid/content/Context;

    invoke-direct {v0, p0}, Lrne;-><init>(Landroid/content/Context;)V

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-nez v0, :cond_30

    const-string v0, "UNKNOWN"

    goto :goto_59

    :cond_30
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    if-nez v1, :cond_55

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-le v1, v2, :cond_41

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v1

    goto :goto_4d

    :cond_41
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v1

    :goto_4d
    invoke-static {v1}, Laik;->l(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_55

    move-object v0, v1

    goto :goto_59

    :cond_55
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v0

    :goto_59
    sput-object v0, Llcp;->r:Ljava/lang/String;

    :try_start_5b
    new-instance v0, Lsne;

    invoke-direct {v0, p1, p0}, Lsne;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    sget-object p0, Lhe2;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p0, p1}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_68
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_5b .. :try_end_68} :catch_68

    :catch_68
    :cond_68
    return-void
.end method
