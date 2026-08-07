.class public Ll/vxq0;
.super Ljava/lang/Object;


# static fields
.field private static volatile b:Ll/vxq0;


# instance fields
.field private final a:Ll/grq0;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/grq0;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/grq0;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/vxq0;->a:Ll/grq0;

    .line 10
    .line 11
    return-void
.end method

.method public static a(Landroid/content/Context;)Ll/vxq0;
    .locals 2

    .line 1
    sget-object v0, Ll/vxq0;->b:Ll/vxq0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/vxq0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/vxq0;->b:Ll/vxq0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/vxq0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/vxq0;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/vxq0;->b:Ll/vxq0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Ll/vxq0;->b:Ll/vxq0;

    .line 27
    .line 28
    return-object p0
.end method

.method public static b()Lorg/json/JSONArray;
    .locals 1

    .line 1
    new-instance v0, Lorg/json/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(J)Lorg/json/JSONObject;
    .locals 0

    .line 1
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public static e()V
    .locals 1

    .line 1
    sget-object v0, Ll/vxq0;->b:Ll/vxq0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/vxq0;->b:Ll/vxq0;

    .line 6
    .line 7
    iget-object v0, v0, Ll/vxq0;->a:Ll/grq0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/vxq0;->b:Ll/vxq0;

    .line 12
    .line 13
    iget-object v0, v0, Ll/vxq0;->a:Ll/grq0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/grq0;->m()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static f()V
    .locals 1

    .line 1
    sget-object v0, Ll/vxq0;->b:Ll/vxq0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/vxq0;->b:Ll/vxq0;

    .line 6
    .line 7
    iget-object v0, v0, Ll/vxq0;->a:Ll/grq0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/vxq0;->b:Ll/vxq0;

    .line 12
    .line 13
    iget-object v0, v0, Ll/vxq0;->a:Ll/grq0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/grq0;->t()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vxq0;->a:Ll/grq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/grq0;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
