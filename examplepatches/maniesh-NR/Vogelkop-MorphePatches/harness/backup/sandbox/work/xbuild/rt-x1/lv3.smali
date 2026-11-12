.class public final Llv3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    iput-object p1, p0, Llv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 12

    iget-object p0, p0, Llv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v1, v0, Ltw3;->G0:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le7k;

    iget-boolean v2, v1, Le7k;->f:Z

    const/4 v3, 0x1

    if-eq v2, p1, :cond_24

    iput-boolean p1, v1, Le7k;->f:Z

    if-eqz p1, :cond_24

    iget-object v2, v1, Le7k;->e:Lza9;

    iget-object v1, v1, Le7k;->a:Lcw3;

    invoke-virtual {v1}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru9;

    iput-boolean v3, v2, Lza9;->a:Z

    invoke-virtual {v2, v1}, Lza9;->d(Lru9;)V

    :cond_24
    if-eqz p1, :cond_f4

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object p1

    invoke-virtual {p1}, Ljtg;->b()Z

    move-result p1

    if-eqz p1, :cond_f1

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result p1

    if-eqz p1, :cond_f1

    iget-object p1, v0, Ltw3;->U:Lhw3;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmen;

    iget-object v0, p1, Lmen;->c:Lmw0;

    iget-object v0, v0, Lmw0;->a:Lru9;

    iget-object v1, p1, Lmen;->d:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "feedback_in_app_notification"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f1

    iget-object v1, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "vpn.vpnpro.feedback_dialog_shown_count"

    const/4 v4, 0x0

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-ge v1, v3, :cond_f1

    iget-object v1, p1, Lmen;->a:Lm2n;

    invoke-virtual {v1}, Lm2n;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_f1

    iget-object v1, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "vpn.vpnpro_first_enable_timestamp"

    const-wide/16 v6, -0x1

    invoke-interface {v1, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    cmp-long v1, v8, v6

    if-eqz v1, :cond_f1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v8

    const-wide/32 v7, 0x5265c00

    div-long/2addr v5, v7

    const-wide/16 v7, 0x6

    cmp-long v1, v5, v7

    if-ltz v1, :cond_f1

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v1

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    add-int/2addr v0, v3

    iget-object v4, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1}, Lnv6;->w()V

    iget-object p1, p1, Lmen;->b:Lben;

    iget-object v0, p1, Lben;->c:Lwt3;

    invoke-virtual {v0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqim;

    iget-object v1, v0, Lqim;->c:Lz77;

    new-instance v2, Lnen;

    new-instance v4, Lwtm;

    iget-object p1, p1, Lben;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->d:Lx5f;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object p1, v4, Lwtm;->a:Ljava/lang/Object;

    new-instance p1, Lkze;

    sget-object v5, Loen;->d:Loen;

    invoke-direct {p1, v5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, v4, Lwtm;->c:Ljava/lang/Object;

    new-instance v5, Lh42;

    invoke-direct {v5}, Lh42;-><init>()V

    new-instance v6, Lx9e;

    invoke-direct {v6, v5, v4, v3}, Lx9e;-><init>(Lh42;Ljava/lang/Object;B)V

    new-instance v3, Lglm;

    const/4 v7, 0x3

    invoke-direct {v3, v6, v7}, Lglm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, p1, v3}, Lh42;->s(Lekc;Lf7f;)V

    invoke-static {v5}, Lb8h;->d(Lekc;)Lh42;

    move-result-object p1

    iput-object p1, v4, Lwtm;->b:Ljava/lang/Object;

    iget-object p1, v0, Lqim;->e:Lysj;

    invoke-direct {v2, v4, p1}, Lnen;-><init>(Lwtm;Lysj;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {v1, v2, p1}, Lr22;->b(Ljjm;Lijm;)V

    :cond_f1
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->b1()V

    :cond_f4
    return-void
.end method
