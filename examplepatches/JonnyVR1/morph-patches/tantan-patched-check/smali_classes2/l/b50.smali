.class public final Ll/b50;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z

.field private static b:Ljava/lang/String;

.field private static final c:Landroid/app/Application$ActivityLifecycleCallbacks;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/b50$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/b50$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/b50;->c:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/b50;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b(Landroid/app/Application;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/b50;->c(Landroid/app/Application;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static c(Landroid/app/Application;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, "Application instance is null/system API is too old"

    .line 4
    .line 5
    invoke-static {p0}, Lcom/clevertap/android/sdk/Logger;->i(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-boolean v0, Ll/b50;->a:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const-string p0, "Lifecycle callbacks have already been registered"

    .line 14
    .line 15
    invoke-static {p0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    sput-object p1, Ll/b50;->b:Ljava/lang/String;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    sput-boolean p1, Ll/b50;->a:Z

    .line 23
    .line 24
    sget-object p1, Ll/b50;->c:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 30
    .line 31
    .line 32
    const-string p0, "Activity Lifecycle Callback successfully registered"

    .line 33
    .line 34
    invoke-static {p0}, Lcom/clevertap/android/sdk/Logger;->i(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
