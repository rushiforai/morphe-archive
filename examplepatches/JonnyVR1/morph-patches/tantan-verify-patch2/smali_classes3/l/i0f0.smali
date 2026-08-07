.class public Ll/i0f0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/i0f0$a;,
        Ll/i0f0$b;
    }
.end annotation


# static fields
.field public static a:Ll/jxd0;

.field public static b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/i0f0$b;",
            ">;"
        }
    .end annotation
.end field

.field public static final d:Ll/e7y;

.field public static e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Locale;",
            ">;"
        }
    .end annotation
.end field

.field public static f:Landroid/content/res/Resources;

.field public static g:Landroid/content/res/Configuration;

.field public static h:Landroid/graphics/Paint;

.field public static final i:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "debug_shadow_test"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/i0f0;->a:Ll/jxd0;

    .line 11
    .line 12
    new-instance v0, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/i0f0;->b:Ljava/util/HashMap;

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object v0, Ll/i0f0;->c:Ljava/util/List;

    .line 25
    .line 26
    const-string v0, "application/json; charset=utf-8"

    .line 27
    .line 28
    invoke-static {v0}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sput-object v0, Ll/i0f0;->d:Ll/e7y;

    .line 33
    .line 34
    new-instance v0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    sput-object v0, Ll/i0f0;->e:Ljava/util/List;

    .line 40
    .line 41
    new-instance v0, Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 44
    .line 45
    .line 46
    sput-object v0, Ll/i0f0;->h:Landroid/graphics/Paint;

    .line 47
    .line 48
    const-class v0, Landroid/content/Context;

    .line 49
    .line 50
    const-class v1, Landroid/util/AttributeSet;

    .line 51
    .line 52
    filled-new-array {v0, v1}, [Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sput-object v0, Ll/i0f0;->i:[Ljava/lang/Class;

    .line 57
    .line 58
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

.method public static synthetic a(Ll/rg50;Ll/x1d0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 7
    .line 8
    .line 9
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    invoke-static {p0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception p0

    .line 17
    :try_start_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :goto_0
    invoke-static {v0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 25
    .line 26
    .line 27
    throw p0
.end method

.method public static b()V
    .locals 3

    .line 1
    sget-object v0, Ll/i0f0;->a:Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/i0f0;->g:Landroid/content/res/Configuration;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object v1, Ll/i0f0;->f:Landroid/content/res/Resources;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v0, v2}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static c()V
    .locals 2

    .line 1
    sget-object v0, Ll/i0f0;->a:Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static d()V
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->D:Ll/rg50;

    .line 2
    .line 3
    sget-object v1, Ll/i0f0;->d:Ll/e7y;

    .line 4
    .line 5
    sget-object v2, Ll/i0f0;->c:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v2}, Ll/i0f0$a;->a(Ljava/util/List;)Ll/i0f0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/i0f0$a;->b()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v1, v2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/x1d0$a;

    .line 20
    .line 21
    invoke-direct {v2}, Ll/x1d0$a;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v3, "https://ones-api.tantanapp.com/ci-proxy/lokalise/save-shadow-key"

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2, v1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-instance v2, Ll/h0f0;

    .line 39
    .line 40
    invoke-direct {v2, v0, v1}, Ll/h0f0;-><init>(Ll/rg50;Ll/x1d0;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v2}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
