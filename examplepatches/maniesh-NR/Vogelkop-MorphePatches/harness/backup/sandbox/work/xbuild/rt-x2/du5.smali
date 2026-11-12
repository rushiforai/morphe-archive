.class public final Ldu5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Lju5;


# instance fields
.field public final a:Lku5;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lzyk;

.field public final d:Ltsd;


# direct methods
.method public constructor <init>(Lndc;Lku5;Lcom/opera/android/settings/SettingsManager;Lzyk;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ldu5;->a:Lku5;

    iput-object p3, p0, Ldu5;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Ldu5;->c:Lzyk;

    new-instance v0, Ltsd;

    new-instance v1, Lyt8;

    invoke-virtual {p4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lru9;

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "startpage.continue_booking_shown"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    const-string v5, "enable_continue_booking"

    invoke-virtual {p3, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v1, v2, v6}, Lyt8;-><init>(ZZ)V

    invoke-direct {v0, v1}, Ltsd;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ldu5;->d:Ltsd;

    new-instance v1, Lyt8;

    invoke-virtual {p4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lru9;

    iget-object p4, p4, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {p4, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p4

    invoke-virtual {p3, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    invoke-direct {v1, p4, v2}, Lyt8;-><init>(ZZ)V

    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    new-instance p4, Lvme;

    const/16 v0, 0x13

    invoke-direct {p4, v0}, Lvme;-><init>(B)V

    invoke-static {p3, p1, p0, p4}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance p3, Lvme;

    invoke-direct {p3, v0}, Lvme;-><init>(B)V

    invoke-static {p2, p1, p0, p3}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 11

    const-string v0, "enable_continue_booking"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_73

    iget-object p1, p0, Ldu5;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {v1, v0}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_55

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    xor-int/lit8 v3, v1, 0x1

    iget-object v4, p0, Ldu5;->a:Lku5;

    iget-object v5, v4, Lku5;->a:Lc5o;

    invoke-virtual {v5}, Lc5o;->s()Llu5;

    move-result-object v6

    sget-object v7, Llu5;->d:Llu5;

    const/4 v8, 0x1

    if-ne v6, v7, :cond_28

    move v6, v8

    goto :goto_29

    :cond_28
    move v6, v2

    :goto_29
    if-eq v6, v3, :cond_55

    if-nez v1, :cond_4a

    iget-object v1, v5, Lc5o;->a:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "state"

    const-string v5, "dismissed"

    invoke-interface {v1, v3, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v4}, Lku5;->g()V

    goto :goto_55

    :cond_4a
    invoke-virtual {v5}, Lc5o;->A()V

    new-instance v1, Lgu5;

    invoke-direct {v1, v4, v8}, Lgu5;-><init>(Lku5;B)V

    invoke-virtual {v4, v1}, Lku5;->f(Ljava/lang/Runnable;)V

    :cond_55
    :goto_55
    new-instance v1, Lyt8;

    iget-object v3, p0, Ldu5;->c:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lru9;

    iget-object v3, v3, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "startpage.continue_booking_shown"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    invoke-direct {v1, v2, p1}, Lyt8;-><init>(ZZ)V

    iget-object p0, p0, Ldu5;->d:Ltsd;

    invoke-static {p0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_73
    return-void
.end method

.method public final e(Z)V
    .registers 8

    iget-object v0, p0, Ldu5;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "enable_continue_booking"

    invoke-virtual {v0, p1, v1}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    const-string v2, "startpage.continue_booking_shown"

    iget-object v3, p0, Ldu5;->c:Lzyk;

    if-eqz p1, :cond_22

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lru9;

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v4, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    const/4 v5, 0x1

    invoke-interface {v4, v2, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    :cond_22
    new-instance p1, Lyt8;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lru9;

    const/4 v4, 0x0

    iget-object v3, v3, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v3, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-direct {p1, v2, v0}, Lyt8;-><init>(ZZ)V

    iget-object p0, p0, Ldu5;->d:Ltsd;

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final onDataChanged()V
    .registers 1

    return-void
.end method
