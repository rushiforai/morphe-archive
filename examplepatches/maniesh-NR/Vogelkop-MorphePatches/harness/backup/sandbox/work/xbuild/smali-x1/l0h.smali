.class public final Ll0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Lcom/opera/android/BrowserActivity;

.field public final d:Loz3;

.field public final e:Lgbf;

.field public final f:Lk6l;

.field public final g:Lqz;

.field public h:I

.field public final i:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Loz3;Lgbf;Lk6l;Lcom/opera/android/settings/SettingsManager;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lqz;

    const/16 v1, 0x12

    invoke-direct {v0, p0, v1}, Lqz;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ll0h;->g:Lqz;

    iput-object p1, p0, Ll0h;->a:Lcom/opera/android/BrowserActivity;

    iput-object p4, p0, Ll0h;->d:Loz3;

    iput-object p5, p0, Ll0h;->e:Lgbf;

    iput-object p6, p0, Ll0h;->f:Lk6l;

    iput-object p2, p0, Ll0h;->b:Lcom/opera/android/BrowserActivity;

    iput-object p3, p0, Ll0h;->c:Lcom/opera/android/BrowserActivity;

    iput-object p7, p0, Ll0h;->i:Lcom/opera/android/settings/SettingsManager;

    invoke-interface {p2}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    invoke-virtual {p6, v0}, Lk6l;->b(La2l;)V

    return-void
.end method

.method public static a(Lcom/opera/android/BrowserActivity;Lcom/opera/android/settings/SettingsManager;)Z
    .registers 5

    const-string v0, "feature_tips_notification"

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_29

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "privacy_monitor.shown"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_29

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p1, "privacy_monitor.promotion.shown.timestamp"

    const-wide/16 v1, 0x0

    invoke-interface {p0, p1, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide p0

    cmp-long p0, p0, v1

    if-eqz p0, :cond_2a

    :cond_29
    return v0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 2

    iget-object p1, p0, Ll0h;->b:Lcom/opera/android/BrowserActivity;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Ll0h;->f:Lk6l;

    iget-object p0, p0, Ll0h;->g:Lqz;

    invoke-virtual {p1, p0}, Lk6l;->v(La2l;)V

    return-void
.end method
