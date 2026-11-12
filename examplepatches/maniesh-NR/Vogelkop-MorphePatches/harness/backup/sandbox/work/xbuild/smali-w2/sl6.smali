.class public final Lsl6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/pm/ResolveInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lsl6;->a()Landroid/content/Intent;

    move-result-object v0

    :try_start_7
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const/high16 v1, 0x10000

    invoke-virtual {p1, v0, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object p1
    :try_end_11
    .catch Ljava/lang/NullPointerException; {:try_start_7 .. :try_end_11} :catch_12

    goto :goto_13

    :catch_12
    const/4 p1, 0x0

    :goto_13
    iput-object p1, p0, Lsl6;->a:Landroid/content/pm/ResolveInfo;

    return-void
.end method

.method public static a()Landroid/content/Intent;
    .registers 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "http://www.opera.com/mobile/operabrowser"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    return-object v0
.end method


# virtual methods
.method public final b()Z
    .registers 2

    invoke-virtual {p0}, Lsl6;->c()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object p0, p0, Lsl6;->a:Landroid/content/pm/ResolveInfo;

    iget-object p0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const-string v0, "com.opera.browser.beta"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public final c()Z
    .registers 2

    const/4 v0, 0x0

    iget-object p0, p0, Lsl6;->a:Landroid/content/pm/ResolveInfo;

    if-nez p0, :cond_6

    return v0

    :cond_6
    iget p0, p0, Landroid/content/pm/ResolveInfo;->match:I

    if-lez p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    return v0
.end method
