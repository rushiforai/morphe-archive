.class public Lcom/immomo/hdata/android/MDevice;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/hdata/android/MDevice$MmuidCallBack;,
        Lcom/immomo/hdata/android/MDevice$Config;
    }
.end annotation


# static fields
.field public static volatile config:Lcom/immomo/hdata/android/MDevice$Config;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static collect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/bej0;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p6}, Ll/qnk0;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/bej0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getMMuidV3(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 10
    invoke-static {p0}, Ll/rmw;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getMMuidV3(Ljava/lang/String;Lcom/immomo/hdata/android/MDevice$MmuidCallBack;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/hdata/android/MDevice$2;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/immomo/hdata/android/MDevice$2;-><init>(Lcom/immomo/hdata/android/MDevice$MmuidCallBack;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/rmw;->c(Ljava/lang/String;Ll/rmw$b;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static getmmuid(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    :try_start_0
    invoke-static {p0, p1}, Ll/piw;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-static {p0}, Ll/kmw;->a(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public static init(Landroid/content/Context;Lcom/immomo/hdata/android/MDevice$Config;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/immomo/hdata/android/MDevice$Config;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Ll/xiw;->e(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 5
    .line 6
    new-instance v0, Lcom/immomo/hdata/android/MDevice$1;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lcom/immomo/hdata/android/MDevice$1;-><init>(Lcom/immomo/hdata/android/MDevice$Config;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/rmw;->f(Landroid/content/Context;Ll/rmw$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
