.class public Ll/i4g0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/i4g0$b;
    }
.end annotation


# static fields
.field public static a:Landroid/content/Context; = null

.field public static b:Z = false

.field public static c:Z = true

.field public static d:Ll/gvl;


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

.method public static varargs A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/i4g0;->b([Ll/pf60;)Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p0, p1, p2}, Ll/i4g0;->z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static varargs B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 6
    .line 7
    invoke-static {p2}, Ll/i4g0;->b([Ll/pf60;)Lorg/json/JSONObject;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {v0, v1, p0, p1, p2}, Ll/m4g0;->m(Lcom/tantanapp/foxstatistics/entity/EventNameEnum;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static C(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/m4g0;->p(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static varargs D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 6
    .line 7
    invoke-static {p2}, Ll/i4g0;->b([Ll/pf60;)Lorg/json/JSONObject;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {v0, v1, p0, p1, p2}, Ll/m4g0;->m(Lcom/tantanapp/foxstatistics/entity/EventNameEnum;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static E(Ll/gvl;)V
    .locals 0

    .line 1
    sput-object p0, Ll/i4g0;->d:Ll/gvl;

    .line 2
    .line 3
    return-void
.end method

.method public static F(Ll/l4g0$b;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/m4g0;->q(Ll/l4g0$b;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static G(Ll/k4g0;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/m4g0;->r(Ll/k4g0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static H(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p0, p1}, Ll/m4g0;->s(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static I(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->c(Landroid/content/Context;)Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->g(Ljava/util/HashMap;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static J()V
    .locals 1

    .line 1
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Ll/i4g0;->a:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->c(Landroid/content/Context;)Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->j()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static K(Ll/ek2;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p0}, Ll/m4g0;->t(Ll/ek2;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static a(Ljava/util/Map;)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    :try_start_0
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-interface {v1}, Ljava/util/Set;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-lez v1, :cond_1

    .line 13
    .line 14
    new-instance v1, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 17
    .line 18
    .line 19
    :try_start_1
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/util/Map$Entry;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Ljava/lang/String;

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catch_0
    move-exception p0

    .line 54
    move-object v0, v1

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    return-object v1

    .line 57
    :catch_1
    move-exception p0

    .line 58
    :goto_1
    invoke-static {p0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-object v0
.end method

.method public static b([Ll/pf60;)Lorg/json/JSONObject;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    array-length v1, p0

    .line 5
    if-lez v1, :cond_1

    .line 6
    .line 7
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 10
    .line 11
    .line 12
    :try_start_1
    array-length v0, p0

    .line 13
    const/4 v2, 0x0

    .line 14
    :goto_0
    if-ge v2, v0, :cond_0

    .line 15
    .line 16
    aget-object v3, p0, v2

    .line 17
    .line 18
    iget-object v4, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v4, Ljava/lang/String;

    .line 21
    .line 22
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 25
    .line 26
    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception p0

    .line 31
    move-object v0, v1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    return-object v1

    .line 34
    :catch_1
    move-exception p0

    .line 35
    :goto_1
    invoke-static {p0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-object v0
.end method

.method public static c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Ll/i4g0;->c:Z

    .line 3
    .line 4
    return-void
.end method

.method public static d()V
    .locals 1

    .line 1
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/m4g0;->c()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static e()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Ll/i4g0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static f()Ll/rg50;
    .locals 1

    .line 1
    sget-object v0, Ll/i4g0;->d:Ll/gvl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    return-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ll/gvl;->a()Ll/rg50;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static g()Ll/l4g0$b;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/m4g0;->d:Ll/l4g0$b;

    .line 6
    .line 7
    return-object v0
.end method

.method public static h()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/i4g0;->c:Z

    .line 2
    .line 3
    return v0
.end method

.method public static i(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/i4g0;->k(Landroid/content/Context;Ll/i4g0$b;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static j(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/i4g0;->i(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/i4g0$a;

    .line 5
    .line 6
    move v0, p3

    .line 7
    move-object p3, p2

    .line 8
    move-object p2, p4

    .line 9
    move-object p4, p5

    .line 10
    move p5, v0

    .line 11
    invoke-direct/range {p0 .. p5}, Ll/i4g0$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Ll/i4g0;->K(Ll/ek2;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static k(Landroid/content/Context;Ll/i4g0$b;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sput-object p0, Ll/i4g0;->a:Landroid/content/Context;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-interface {p1}, Ll/i4g0$b;->init()V

    .line 13
    .line 14
    .line 15
    :cond_1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object p1, Ll/i4g0;->a:Landroid/content/Context;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/m4g0;->g(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static l()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/i4g0;->b:Z

    .line 2
    .line 3
    return v0
.end method

.method public static m(Ll/q4f;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/m4g0;->j(Ll/q4f;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static n(Ll/q4f;Ljava/util/Map;)V
    .locals 0
    .param p0    # Ll/q4f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/q4f;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/i4g0;->a(Ljava/util/Map;)Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-static {p0}, Ll/i4g0;->m(Ll/q4f;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static varargs o(Ll/q4f;[Ll/pf60;)V
    .locals 0
    .param p0    # Ll/q4f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/i4g0;->b([Ll/pf60;)Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-static {p0}, Ll/i4g0;->m(Ll/q4f;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static p(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 6
    .line 7
    invoke-static {p2}, Ll/i4g0;->a(Ljava/util/Map;)Lorg/json/JSONObject;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {v0, v1, p0, p1, p2}, Ll/m4g0;->l(Lcom/tantanapp/foxstatistics/entity/EventNameEnum;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static varargs q(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->BIZ_PAY:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 6
    .line 7
    invoke-static {p2}, Ll/i4g0;->b([Ll/pf60;)Lorg/json/JSONObject;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {v0, v1, p0, p1, p2}, Ll/m4g0;->m(Lcom/tantanapp/foxstatistics/entity/EventNameEnum;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static r(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/i4g0;->a(Ljava/util/Map;)Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p0, p1, p2}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, ""

    .line 9
    .line 10
    :goto_0
    invoke-static {p0, v0}, Ll/ve60;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_CLICK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 18
    .line 19
    invoke-virtual {v0, v1, p0, p1, p2}, Ll/m4g0;->m(Lcom/tantanapp/foxstatistics/entity/EventNameEnum;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static varargs u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/i4g0;->b([Ll/pf60;)Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p0, p1, p2}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static varargs v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 6
    .line 7
    invoke-static {p2}, Ll/i4g0;->b([Ll/pf60;)Lorg/json/JSONObject;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {v0, v1, p0, p1, p2}, Ll/m4g0;->m(Lcom/tantanapp/foxstatistics/entity/EventNameEnum;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static varargs w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_SLIDER:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 6
    .line 7
    invoke-static {p2}, Ll/i4g0;->b([Ll/pf60;)Lorg/json/JSONObject;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {v0, v1, p0, p1, p2}, Ll/m4g0;->m(Lcom/tantanapp/foxstatistics/entity/EventNameEnum;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static x(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/i4g0;->z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/i4g0;->a(Ljava/util/Map;)Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p0, p1, p2}, Ll/i4g0;->z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0, p1, p2}, Ll/m4g0;->m(Lcom/tantanapp/foxstatistics/entity/EventNameEnum;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
