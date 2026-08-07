.class public Ll/zp50;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Landroid/content/Context;

.field private static b:Z

.field static c:Z

.field private static d:Ll/cpl;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
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

.method public static synthetic a()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Ll/zp50;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b(Landroid/content/Context;Ll/cpl;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sput-object p1, Ll/zp50;->d:Ll/cpl;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sput-object p0, Ll/zp50;->a:Landroid/content/Context;

    .line 11
    .line 12
    return-void
.end method

.method public static c()Ll/cpl;
    .locals 1

    .line 1
    sget-object v0, Ll/zp50;->d:Ll/cpl;

    .line 2
    .line 3
    return-object v0
.end method

.method public static d()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Ll/zp50;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static e()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/zp50;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    sget-object v0, Ll/xp50;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Ll/m4f0;->c()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    return-object v0

    .line 21
    :cond_1
    sget-object v0, Ll/xp50;->a:Ljava/lang/String;

    .line 22
    .line 23
    return-object v0
.end method

.method public static f()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/zp50;->b:Z

    .line 2
    .line 3
    return v0
.end method

.method public static g()V
    .locals 4

    .line 1
    sget-object v0, Ll/zp50;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/up50;->b()Ll/up50;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/zp50$a;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/zp50$a;-><init>()V

    .line 13
    .line 14
    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, v3}, Ll/up50;->a(Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static h(Ll/r1m;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/xp50;->h(Ll/r1m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i(Ll/w4m;)V
    .locals 0

    .line 1
    sput-object p0, Ll/xp50;->d:Ll/w4m;

    .line 2
    .line 3
    return-void
.end method

.method public static j(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/zp50;->c:Z

    .line 2
    .line 3
    return-void
.end method
