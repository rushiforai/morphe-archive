.class public Ll/huq0;
.super Ll/jrq0;


# static fields
.field private static d:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/huq0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/huq0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/huq0;->d:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;JJLandroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/jrq0;-><init>(Landroid/os/Handler;JJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static e()V
    .locals 4

    .line 1
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/huq0;->d:Ljava/lang/Runnable;

    .line 6
    .line 7
    const-wide/16 v2, 0x64

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Ll/n0r0;->b()Ll/ayq0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ayq0;->d()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    :try_start_1
    invoke-static {}, Ll/k5r0;->c()Ll/k5r0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Ll/vuq0;->i()Lorg/json/JSONArray;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, p0, v1}, Ll/k5r0;->f(Ljava/util/Map;Lorg/json/JSONArray;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 20
    .line 21
    .line 22
    :catchall_1
    return-void
.end method
