.class public Lcom/opera/android/downloads/DownloadBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashSet;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ljava/util/HashSet;

    const-string v1, "com.opera.android.action.APP_START"

    const-string v2, "android.intent.action.BOOT_COMPLETED"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/opera/android/downloads/DownloadBroadcastReceiver;->a:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    invoke-static {p1}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_2b

    if-eqz p2, :cond_2b

    sget-object p0, Lcom/opera/android/downloads/DownloadBroadcastReceiver;->a:Ljava/util/HashSet;

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-static {p1}, Lev4;->k(Landroid/content/Context;)V

    :cond_17
    sget-boolean p0, Lcom/opera/android/downloads/DownloadService;->e:Z

    if-nez p0, :cond_2b

    new-instance p0, Landroid/content/ComponentName;

    const-class p2, Lcom/opera/android/downloads/DownloadBroadcastReceiver;

    invoke-direct {p0, p1, p2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const/4 p2, 0x2

    const/4 v0, 0x1

    invoke-virtual {p1, p0, p2, v0}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    :cond_2b
    return-void
.end method
