.class public Lcom/p1/mobile/putong/miniwidget/MiniWidgetProvider;
.super Landroid/appwidget/AppWidgetProvider;
.source "SourceFile"


# static fields
.field public static final KEY_TYPE:Ljava/lang/String; = "type"

.field public static final TYPE_UPDATE:Ljava/lang/String; = "update"

.field public static final UPDATE_ACTION:Ljava/lang/String; = "android.appwidget.action.APPWIDGET_UPDATE"

.field public static isAutoAddWidget:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/appwidget/AppWidgetProvider;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private onWidgetUpdate(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Landroid/content/ComponentName;

    .line 6
    .line 7
    const-class v1, Lcom/p1/mobile/putong/miniwidget/MiniWidgetProvider;

    .line 8
    .line 9
    invoke-direct {v0, p1, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetManager;->getAppWidgetIds(Landroid/content/ComponentName;)[I

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    array-length p0, p0

    .line 17
    if-gtz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    new-instance p0, Landroid/content/Intent;

    .line 31
    .line 32
    const-class v0, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;

    .line 33
    .line 34
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 35
    .line 36
    .line 37
    const/16 v1, 0x64

    .line 38
    .line 39
    :try_start_0
    invoke-static {p1, v0, v1, p0}, Landroidx/core/app/JobIntentService;->enqueueWork(Landroid/content/Context;Ljava/lang/Class;ILandroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catch_0
    move-exception p0

    .line 44
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    return-void

    .line 48
    :cond_1
    invoke-static {p1}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->updateViewsNotLogin(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetProvider;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "android.appwidget.action.APPWIDGET_UPDATE onReceive"

    .line 5
    .line 6
    invoke-static {v0}, Ll/yhi0;->a(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "android.appwidget.action.APPWIDGET_UPDATE"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const-string v0, "type"

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "update"

    .line 28
    .line 29
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetProvider;->onWidgetUpdate(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    sget-boolean p0, Lcom/p1/mobile/putong/miniwidget/MiniWidgetProvider;->isAutoAddWidget:Z

    .line 39
    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p1, "android.appwidget.action.APPWIDGET_ENABLED"

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_1

    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    :cond_1
    const/4 p0, 0x0

    .line 65
    sput-boolean p0, Lcom/p1/mobile/putong/miniwidget/MiniWidgetProvider;->isAutoAddWidget:Z

    .line 66
    .line 67
    const-string p0, "e_widget_add_alert_confirm"

    .line 68
    .line 69
    const-string p1, "p_widget_add_alert"

    .line 70
    .line 71
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    invoke-static {}, Ll/yhi0;->b()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/appwidget/AppWidgetProvider;->onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    .line 2
    .line 3
    .line 4
    const-string p2, "android.appwidget.action.APPWIDGET_UPDATE onUpdate"

    .line 5
    .line 6
    invoke-static {p2}, Ll/yhi0;->a(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetProvider;->onWidgetUpdate(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/yhi0;->b()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
