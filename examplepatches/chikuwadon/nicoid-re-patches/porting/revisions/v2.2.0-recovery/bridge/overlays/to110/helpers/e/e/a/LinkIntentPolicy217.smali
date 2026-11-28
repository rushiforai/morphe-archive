.class public final Le/e/a/LinkIntentPolicy217;
.super Ljava/lang/Object;
.source "LinkIntentPolicy217.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# static fields
.field private static final KEY:Ljava/lang/String; = "intent_type"

.field private static final PACKAGE:Ljava/lang/String; = "com.sauzask.nicoid."

.field private static final TAG:Ljava/lang/String; = "nicoid-link-mode"

.field private static final TARGETS:[Ljava/lang/String;

.field private static active:Le/e/a/LinkIntentPolicy217;


# instance fields
.field private final app:Landroid/content/Context;

.field private final prefs:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 24
    const-string v0, "com.sauzask.nicoid.intent.NicoidVideoInfoActivityIntent"

    const-string v1, "com.sauzask.nicoid.intent.NicoidPopupViewActivityIntent"

    const-string v2, "com.sauzask.nicoid.intent.NicoidIntentSelect"

    const-string v3, "com.sauzask.nicoid.intent.NicoidVideoActivityIntent"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/LinkIntentPolicy217;->TARGETS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Le/e/a/LinkIntentPolicy217;->app:Landroid/content/Context;

    .line 36
    iget-object p1, p0, Le/e/a/LinkIntentPolicy217;->app:Landroid/content/Context;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Le/e/a/LinkIntentPolicy217;->prefs:Landroid/content/SharedPreferences;

    .line 37
    return-void
.end method

.method private declared-synchronized applyMode()V
    .registers 6

    monitor-enter p0

    .line 64
    :try_start_0
    iget-object v0, p0, Le/e/a/LinkIntentPolicy217;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "intent_type"

    const-string v2, "1"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    goto :goto_0

    .line 63
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 65
    :catch_0
    move-exception v0

    .line 66
    :try_start_1
    const-string v1, "nicoid-link-mode"

    const-string v2, "Invalid stored link playback type; using normal route"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 67
    const-string v0, "1"

    .line 69
    :goto_0
    const-string v1, "0"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "3"

    .line 70
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "4"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 71
    const-string v0, "nicoid-link-mode"

    const-string v1, "Unknown link playback mode; using the original normal route"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    const-string v0, "1"

    .line 74
    :cond_0
    invoke-static {v0}, Le/e/a/LinkIntentPolicy217;->selectedTarget(Ljava/lang/String;)I

    move-result v0

    .line 75
    iget-object v1, p0, Le/e/a/LinkIntentPolicy217;->app:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 78
    const/4 v2, 0x1

    invoke-direct {p0, v1, v0, v2}, Le/e/a/LinkIntentPolicy217;->applyTarget(Landroid/content/pm/PackageManager;IZ)V

    .line 79
    const/4 v2, 0x0

    move v3, v2

    :goto_1
    sget-object v4, Le/e/a/LinkIntentPolicy217;->TARGETS:[Ljava/lang/String;

    array-length v4, v4

    if-ge v3, v4, :cond_2

    .line 80
    if-eq v3, v0, :cond_1

    invoke-direct {p0, v1, v3, v2}, Le/e/a/LinkIntentPolicy217;->applyTarget(Landroid/content/pm/PackageManager;IZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 82
    :cond_2
    monitor-exit p0

    return-void

    .line 63
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method private applyTarget(Landroid/content/pm/PackageManager;IZ)V
    .registers 9

    .line 85
    const-string v0, "nicoid-link-mode"

    new-instance v1, Landroid/content/ComponentName;

    iget-object v2, p0, Le/e/a/LinkIntentPolicy217;->app:Landroid/content/Context;

    sget-object v3, Le/e/a/LinkIntentPolicy217;->TARGETS:[Ljava/lang/String;

    aget-object v3, v3, p2

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 86
    const/4 v2, 0x1

    if-eqz p3, :cond_0

    .line 87
    move v3, v2

    goto :goto_0

    .line 88
    :cond_0
    const/4 v3, 0x2

    :goto_0
    nop

    .line 90
    :try_start_0
    invoke-virtual {p1, v1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result v4

    if-ne v4, v3, :cond_1

    return-void

    .line 91
    :cond_1
    invoke-virtual {p1, v1, v3, v2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 92
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Link entry "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    if-eqz p3, :cond_2

    const-string p3, "enabled"

    goto :goto_1

    :cond_2
    const-string p3, "disabled"

    :goto_1
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    goto :goto_2

    .line 93
    :catch_0
    move-exception p1

    .line 94
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Cannot update link entry "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 96
    :goto_2
    return-void
.end method

.method public static declared-synchronized install(Landroid/content/Context;)V
    .registers 3

    const-class v0, Le/e/a/LinkIntentPolicy217;

    monitor-enter v0

    .line 40
    if-nez p0, :cond_0

    monitor-exit v0

    return-void

    .line 41
    :cond_0
    :try_start_0
    sget-object v1, Le/e/a/LinkIntentPolicy217;->active:Le/e/a/LinkIntentPolicy217;

    if-nez v1, :cond_1

    .line 42
    new-instance v1, Le/e/a/LinkIntentPolicy217;

    invoke-direct {v1, p0}, Le/e/a/LinkIntentPolicy217;-><init>(Landroid/content/Context;)V

    sput-object v1, Le/e/a/LinkIntentPolicy217;->active:Le/e/a/LinkIntentPolicy217;

    .line 43
    sget-object p0, Le/e/a/LinkIntentPolicy217;->active:Le/e/a/LinkIntentPolicy217;

    iget-object p0, p0, Le/e/a/LinkIntentPolicy217;->prefs:Landroid/content/SharedPreferences;

    sget-object v1, Le/e/a/LinkIntentPolicy217;->active:Le/e/a/LinkIntentPolicy217;

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 45
    :cond_1
    sget-object p0, Le/e/a/LinkIntentPolicy217;->active:Le/e/a/LinkIntentPolicy217;

    invoke-direct {p0}, Le/e/a/LinkIntentPolicy217;->applyMode()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    monitor-exit v0

    return-void

    .line 39
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private static selectedTarget(Ljava/lang/String;)I
    .registers 2

    .line 50
    const-string v0, "0"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 51
    :cond_0
    const-string v0, "2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x2

    return p0

    .line 52
    :cond_1
    const-string v0, "3"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "4"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    goto :goto_0

    .line 53
    :cond_2
    const/4 p0, 0x1

    return p0

    .line 52
    :cond_3
    :goto_0
    const/4 p0, 0x3

    return p0
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    .line 58
    const-string p1, "intent_type"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Le/e/a/LinkIntentPolicy217;->applyMode()V

    .line 59
    :cond_0
    return-void
.end method
