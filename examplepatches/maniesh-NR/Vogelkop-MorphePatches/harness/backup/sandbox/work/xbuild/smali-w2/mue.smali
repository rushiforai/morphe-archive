.class public final Lmue;
.super Llim;
.source "SourceFile"

# interfaces
.implements Ldue;
.implements Lp5j;
.implements Lxxf;


# instance fields
.field public final a:Lru9;

.field public final b:Lfue;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Lzxf;

.field public final e:Lnr8;

.field public f:Z

.field public g:Z

.field public final h:Lkze;


# direct methods
.method public constructor <init>(Lru9;Lfue;Lcom/opera/android/settings/SettingsManager;Ldyf;Lnr8;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lkze;

    sget-object v1, Llue;->a:Llue;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lmue;->h:Lkze;

    iput-object p1, p0, Lmue;->a:Lru9;

    iput-object p2, p0, Lmue;->b:Lfue;

    iput-object p3, p0, Lmue;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p4}, Ldyf;->b()Lzxf;

    move-result-object p1

    iput-object p1, p0, Lmue;->d:Lzxf;

    iput-object p5, p0, Lmue;->e:Lnr8;

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "enable_newsfeed"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Lmue;->S()V

    :cond_b
    return-void
.end method

.method public final R()Llue;
    .registers 5

    iget-boolean v0, p0, Lmue;->g:Z

    if-eqz v0, :cond_3e

    iget-object v0, p0, Lmue;->b:Lfue;

    invoke-virtual {v0}, Lfue;->d()V

    iget-object v0, v0, Lfue;->a:Lcue;

    sget-object v1, Lcue;->b:Lcue;

    if-eq v0, v1, :cond_5d

    iget-object v0, p0, Lmue;->c:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "enable_newsfeed"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5d

    iget-boolean v0, p0, Lmue;->f:Z

    if-nez v0, :cond_3e

    iget-object v0, p0, Lmue;->d:Lzxf;

    iget-object v1, v0, Lzxf;->c:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2b

    iget-object v1, v0, Lzxf;->a:Ljava/util/ArrayList;

    if-nez v1, :cond_2f

    :cond_2b
    invoke-virtual {v0}, Lzxf;->a()Ljava/util/ArrayList;

    move-result-object v1

    :cond_2f
    const-string v0, "startpage.feed_has_categories"

    const/4 v2, 0x1

    iget-object p0, p0, Lmue;->a:Lru9;

    if-nez v1, :cond_41

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_5a

    :cond_3e
    sget-object p0, Llue;->a:Llue;

    return-object p0

    :cond_41
    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    xor-int/2addr v3, v2

    iget-object v2, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_5d

    :cond_5a
    sget-object p0, Llue;->c:Llue;

    return-object p0

    :cond_5d
    sget-object p0, Llue;->b:Llue;

    return-object p0
.end method

.method public final S()V
    .registers 3

    invoke-virtual {p0}, Lmue;->R()Llue;

    move-result-object v0

    iget-object p0, p0, Lmue;->h:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_d

    return-void

    :cond_d
    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 4

    iget-object p1, p0, Lmue;->d:Lzxf;

    invoke-virtual {p1, p0}, Lzxf;->F(Ljava/lang/Object;)V

    iget-object p1, p0, Lmue;->b:Lfue;

    invoke-virtual {p1, p0}, Lfue;->b(Ldue;)V

    iget-object p1, p0, Lmue;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    const-string v0, "speed_dial.enabled"

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_26

    iput-boolean v0, p0, Lmue;->f:Z

    new-instance p1, Lyqd;

    const/16 v1, 0xf

    invoke-direct {p1, p0, v1}, Lyqd;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lmue;->e:Lnr8;

    invoke-virtual {v1, p1}, Lnr8;->f(Ljava/lang/Runnable;)V

    :cond_26
    iput-boolean v0, p0, Lmue;->g:Z

    iget-object p1, p0, Lmue;->h:Lkze;

    invoke-virtual {p0}, Lmue;->R()Llue;

    move-result-object p0

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final b(Lcue;)V
    .registers 2

    invoke-virtual {p0}, Lmue;->S()V

    return-void
.end method

.method public final f()V
    .registers 1

    invoke-virtual {p0}, Lmue;->S()V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lmue;->g:Z

    iget-object p1, p0, Lmue;->d:Lzxf;

    invoke-virtual {p1, p0}, Lzxf;->H(Ljava/lang/Object;)V

    iget-object p1, p0, Lmue;->b:Lfue;

    invoke-virtual {p1, p0}, Lfue;->e(Ldue;)V

    iget-object p1, p0, Lmue;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
