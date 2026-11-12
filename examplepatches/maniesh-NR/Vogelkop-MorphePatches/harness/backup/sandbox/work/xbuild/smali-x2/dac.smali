.class public final Ldac;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;
.implements Lf7f;
.implements Ldue;


# instance fields
.field public final a:Ldj9;

.field public final b:Lcac;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    const/4 v2, 0x0

    new-array v3, v2, [Lbg1;

    const-string v4, "c.o.a.lp_attributes"

    invoke-static {p1, v1, v4, v3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v1

    if-eqz p2, :cond_29

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/SharedPreferences;

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_29
    new-instance p2, Lcac;

    new-instance v3, Le84;

    invoke-direct {v3, v1}, Le84;-><init>(Lb59;)V

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->t()Lr9c;

    move-result-object v1

    invoke-direct {p2, p1, v3, v1}, Lcac;-><init>(Landroid/content/Context;Le84;Lr9c;)V

    iput-object p2, p0, Ldac;->b:Lcac;

    invoke-static {p1}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object p1

    iput-object p1, p0, Ldac;->a:Ldj9;

    invoke-virtual {p1, p0}, Lno7;->g(Lmo7;)V

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object p1

    invoke-virtual {p1, p0}, Lfue;->b(Ldue;)V

    iget-object p1, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->l0:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lx0f;

    const-string v0, "com_appboy_default_notification_channel"

    invoke-virtual {p1, v0}, Lx0f;->a(Ljava/lang/String;)Lode;

    move-result-object p1

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    new-array p1, v2, [Ljava/lang/Void;

    invoke-static {p2, p1}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    new-instance p1, Ldnb;

    const/4 p2, 0x7

    invoke-direct {p1, p0, p2}, Ldnb;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lcak;->d:Lavj;

    const/4 p0, 0x2

    invoke-static {p0, p1}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final b(Lcue;)V
    .registers 4

    iget-object p0, p0, Ldac;->b:Lcac;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcac;->e:Z

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_13

    if-eq p1, v0, :cond_10

    const-string p1, ""

    goto :goto_15

    :cond_10
    const-string p1, "newsfeed"

    goto :goto_15

    :cond_13
    const-string p1, "none"

    :goto_15
    iget-object v0, p0, Lcac;->b:Le84;

    const-string v1, "News backend"

    invoke-virtual {v0, v1, p1}, Le84;->c(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-static {v1, p1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcac;->b(Ljava/util/Map;)V

    :cond_26
    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Lv0f;

    iget-object p0, p0, Ldac;->b:Lcac;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lv0f;->b:Lv0f;

    if-eq p1, v0, :cond_d

    const/4 p1, 0x1

    goto :goto_e

    :cond_d
    const/4 p1, 0x0

    :goto_e
    invoke-static {p1}, Lcac;->a(Z)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcac;->b:Le84;

    const-string v1, "Notifications enabled"

    invoke-virtual {v0, v1, p1}, Le84;->c(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-static {v1, p1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcac;->b(Ljava/util/Map;)V

    :cond_23
    return-void
.end method

.method public final o(Z)V
    .registers 4

    iget-object p1, p0, Ldac;->a:Ldj9;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcj9;

    invoke-virtual {v0}, Lcj9;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_29

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcj9;

    iget-object p1, p1, Lcj9;->a:Ljava/lang/String;

    iget-object p0, p0, Ldac;->b:Lcac;

    iget-object v0, p0, Lcac;->b:Le84;

    const-string v1, "Home country"

    invoke-virtual {v0, v1, p1}, Le84;->c(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-static {v1, p1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcac;->b(Ljava/util/Map;)V

    :cond_29
    return-void
.end method
