.class public final Lz9c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw9c;


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/opera/android/OperaApplication;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lz9c;->a:Landroid/content/Context;

    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/os/Bundle;)Landroid/net/Uri;
    .registers 6

    const-string v0, "_lpx"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_f

    :try_start_9
    new-instance v1, Lorb;

    invoke-direct {v1, p1}, Lorb;-><init>(Ljava/lang/String;)V
    :try_end_e
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_e} :catch_f

    goto :goto_10

    :catch_f
    :cond_f
    move-object v1, v0

    :goto_10
    if-eqz v1, :cond_2b

    const-string p1, "__name__"

    invoke-virtual {v1, p1, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1c

    const/4 p1, 0x0

    goto :goto_22

    :cond_1c
    const-string v2, "Open URL"

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    :goto_22
    if-eqz p1, :cond_2b

    const-string p1, "URL"

    invoke-virtual {v1, p1, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_2c

    :cond_2b
    move-object p1, v0

    :goto_2c
    if-eqz p1, :cond_4b

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    new-instance v1, Lc37;

    new-instance v2, Lt1;

    const/16 v3, 0xc

    invoke-direct {v2, p0, v3}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance p0, Lrqd;

    const/16 v3, 0x1a

    invoke-direct {p0, v3}, Lrqd;-><init>(B)V

    invoke-direct {v1, v2, p0}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, p1}, Lc37;->A(Ljava/lang/String;)Lz0c;

    move-result-object p0

    if-nez p0, :cond_4c

    :cond_4b
    return-object v0

    :cond_4c
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static b(Landroid/os/Bundle;)I
    .registers 3

    const/4 v0, 0x1

    if-nez p0, :cond_4

    return v0

    :cond_4
    invoke-virtual {p0}, Landroid/os/BaseBundle;->size()I

    move-result v1

    if-ne v1, v0, :cond_14

    const-string v0, "lp_version"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 p0, 0x2

    return p0

    :cond_14
    sget-object v0, Ly9c;->a:Lhr5;

    const-string v1, "category"

    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lhr5;->j(Ljava/lang/String;)Ly9c;

    move-result-object p0

    invoke-static {p0}, Lz9c;->c(Ly9c;)I

    move-result p0

    return p0
.end method

.method public static c(Ly9c;)I
    .registers 2

    if-eqz p0, :cond_12

    sget-object v0, Ly9c;->d:Ly9c;

    if-eq v0, p0, :cond_12

    sget-object v0, Ly9c;->e:Ly9c;

    if-eq v0, p0, :cond_12

    sget-object v0, Ly9c;->b:Ly9c;

    if-eq v0, p0, :cond_12

    sget-object v0, Ly9c;->g:Ly9c;

    if-ne v0, p0, :cond_14

    :cond_12
    const/4 p0, 0x1

    return p0

    :cond_14
    sget-object v0, Ly9c;->c:Ly9c;

    if-ne v0, p0, :cond_1a

    const/4 p0, 0x3

    return p0

    :cond_1a
    sget-object v0, Ly9c;->f:Ly9c;

    if-ne v0, p0, :cond_20

    const/4 p0, 0x4

    return p0

    :cond_20
    new-instance p0, Ljava/lang/RuntimeException;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0
.end method

.method public static d(Lcom/opera/android/firebase/OperaFirebaseMessagingService;Ljava/util/HashMap;Lvn0;)V
    .registers 4

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    invoke-static {p1}, Lz9c;->e(Ljava/util/HashMap;)Lcm;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lx5f;->r0(Lqyl;Lvn0;)V

    return-void
.end method

.method public static e(Ljava/util/HashMap;)Lcm;
    .registers 5

    new-instance v0, Lcm;

    const-string v1, "_lpm"

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_28

    const-string v1, "_lpu"

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_28

    const-string v1, "_lpn"

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_28

    const-string v1, "_lpv"

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :cond_28
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_39

    const-string v2, "lp_version"

    invoke-virtual {p0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_39

    const/4 p0, 0x2

    goto :goto_4e

    :cond_39
    sget-object v2, Ly9c;->a:Lhr5;

    const-string v3, "category"

    invoke-virtual {p0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lhr5;->j(Ljava/lang/String;)Ly9c;

    move-result-object p0

    invoke-static {p0}, Lz9c;->c(Ly9c;)I

    move-result p0

    :goto_4e
    const/4 v2, 0x3

    invoke-direct {v0, v1, p0, v2}, Lcm;-><init>(Ljava/lang/String;IB)V

    return-object v0
.end method


# virtual methods
.method public final h(Landroid/os/Bundle;)Z
    .registers 7

    new-instance v0, Lcm;

    if-eqz p1, :cond_b

    const-string v1, "lp_messageId"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_c

    :cond_b
    const/4 v1, 0x0

    :goto_c
    invoke-static {p1}, Lz9c;->b(Landroid/os/Bundle;)I

    move-result v2

    const/4 v3, 0x3

    invoke-direct {v0, v1, v2, v3}, Lcm;-><init>(Ljava/lang/String;IB)V

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lz9c;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lx5f;->s0(Lqyl;Z)V

    invoke-static {p0, p1}, Lz9c;->a(Landroid/content/Context;Landroid/os/Bundle;)Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_45

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    invoke-virtual {v0}, Lcm;->f()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Lsj0;->b:Lsj0;

    sget-object v4, Lxn0;->f:Lxn0;

    invoke-virtual {p0, v0, v1, v3, v4}, Lx5f;->o0(Ljava/lang/String;Landroid/net/Uri;Lsj0;Lxn0;)V

    :cond_45
    const-string p0, "c.o.a.lp.created"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, p0, v0, v1}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    const-string p0, "lp_occurrence_id"

    invoke-virtual {p1, p0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_69

    const-string v0, "internal_occurrence_id"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_69

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_69
    return v2
.end method
