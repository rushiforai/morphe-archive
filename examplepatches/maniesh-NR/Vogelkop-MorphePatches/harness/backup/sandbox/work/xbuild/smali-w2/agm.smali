.class public Lagm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljw1;
.implements Lovm;
.implements Lrba;
.implements Lbpo;
.implements Lcpp;
.implements Ljrp;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/UserSettingsContentProvider;Landroid/content/ContentValues;Landroid/net/Uri;)V
    .registers 5

    const/4 v0, 0x3

    iput-byte v0, p0, Lagm;->a:B

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lagm;->b:Ljava/lang/Object;

    iput-object p3, p0, Lagm;->c:Ljava/lang/Object;

    iput-object p1, p0, Lagm;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ldx3;)V
    .registers 3

    const/4 v0, 0x7

    iput-byte v0, p0, Lagm;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lagm;->b:Ljava/lang/Object;

    invoke-virtual {p1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->fontScale:F

    new-instance v0, Lyyn;

    invoke-direct {v0, p0, p1}, Lyyn;-><init>(Lagm;F)V

    iput-object v0, p0, Lagm;->c:Ljava/lang/Object;

    new-instance p1, Lit5;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lit5;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lagm;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 4

    const/4 v0, 0x5

    iput-byte v0, p0, Lagm;->a:B

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lnb9;

    const/4 v1, 0x1

    .line 38
    invoke-direct {v0, v1}, Lnb9;-><init>(B)V

    .line 39
    iput-object v0, p0, Lagm;->c:Ljava/lang/Object;

    .line 40
    new-instance v0, Lnb9;

    const/4 v1, 0x2

    .line 41
    invoke-direct {v0, v1}, Lnb9;-><init>(B)V

    .line 42
    iput-object v0, p0, Lagm;->d:Ljava/lang/Object;

    .line 43
    iput-object p1, p0, Lagm;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 34
    iput-byte p4, p0, Lagm;->a:B

    iput-object p1, p0, Lagm;->b:Ljava/lang/Object;

    iput-object p2, p0, Lagm;->c:Ljava/lang/Object;

    iput-object p3, p0, Lagm;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/functions/Function0;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lagm;->a:B

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lagm;->b:Ljava/lang/Object;

    return-void
.end method

.method public static o(Ljava/lang/String;)Landroid/content/Intent;
    .registers 2

    :try_start_0
    sget-object v0, Lt0i;->b:Lp0i;

    const/4 v0, 0x1

    invoke-static {p0, v0}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "android.intent.category.BROWSABLE"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;
    :try_end_c
    .catchall {:try_start_0 .. :try_end_c} :catchall_d

    goto :goto_16

    :catchall_d
    move-exception p0

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, v0

    :goto_16
    instance-of v0, p0, Lq0i;

    if-eqz v0, :cond_1b

    const/4 p0, 0x0

    :cond_1b
    check-cast p0, Landroid/content/Intent;

    return-object p0
.end method


# virtual methods
.method public final a()V
    .registers 1

    .line 42
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .registers 8

    iget-object v0, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v0, Lguo;

    iget-object v1, v0, Lpxo;->c:Luuj;

    if-eqz v1, :cond_b

    invoke-virtual {v1}, Luuj;->onAdClicked()V

    :cond_b
    new-instance v1, Lagm;

    iget-object v2, v0, Lpxo;->a:Landroid/content/Context;

    sget-object v3, Lsm;->d:Lsm;

    const/16 v4, 0x9

    const/4 v5, 0x0

    invoke-direct {v1, v2, v3, v5, v4}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lh1p;

    iget-object p0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast p0, Lylp;

    iget-object v3, p0, Lvoo;->o:Ljava/lang/String;

    iget-object p0, p0, Lvoo;->p:Ljava/lang/String;

    invoke-direct {v2, v3, p0, p1, v5}, Lh1p;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, v0, Lpxo;->i:Lp7p;

    invoke-virtual {v1, v2, p0}, Lagm;->e(Lh1p;Lp7p;)V

    return-void
.end method

.method public final a(Z)V
    .registers 2

    .line 43
    iget-object p0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast p0, Lof3;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lof3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final b()V
    .registers 1

    return-void
.end method

.method public final c()V
    .registers 1

    return-void
.end method

.method public final d()V
    .registers 5

    iget-object p0, p0, Lagm;->b:Ljava/lang/Object;

    check-cast p0, Lkdo;

    iget-object v0, p0, Lkdo;->a:Lru9;

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "default_zoom.page_menu_hint.shown"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    invoke-virtual {p0}, Lkdo;->X()V

    iget-object v0, p0, Lkdo;->k:Lf6l;

    if-nez v0, :cond_1f

    return-void

    :cond_1f
    iget-object v1, p0, Lkdo;->c:Lk6l;

    invoke-virtual {v1, v0}, Lk6l;->x(Lj6l;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lkdo;->k:Lf6l;

    return-void
.end method

.method public final e(Lh1p;Lp7p;)V
    .registers 14

    iget-object v0, p1, Lh1p;->a:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_32

    invoke-static {v0}, Lagm;->o(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_32

    const-string v3, "browser_fallback_url"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    sget-object v3, Lk0l;->G:Lk0l;

    invoke-virtual {p0, v2, v3}, Lagm;->j(Landroid/content/Intent;Lkotlin/jvm/functions/Function1;)Z

    move-result v2

    if-eqz v2, :cond_24

    new-instance v2, Lxmo;

    const-string v3, "app"

    invoke-direct {v2, v3, v0}, Lxmo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_25

    :cond_24
    move-object v2, v1

    :goto_25
    if-nez v2, :cond_33

    invoke-virtual {p0, v0}, Lagm;->m(Ljava/lang/String;)Lxmo;

    move-result-object v2

    if-nez v2, :cond_33

    invoke-virtual {p0, v4}, Lagm;->m(Ljava/lang/String;)Lxmo;

    move-result-object v2

    goto :goto_33

    :cond_32
    move-object v2, v1

    :cond_33
    :goto_33
    if-nez v2, :cond_57

    iget-object v0, p1, Lh1p;->b:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lagm;->l(Ljava/lang/String;)Lxmo;

    move-result-object v2

    if-nez v2, :cond_57

    iget-object v0, p1, Lh1p;->c:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lagm;->l(Ljava/lang/String;)Lxmo;

    move-result-object v2

    if-nez v2, :cond_57

    iget-object p1, p1, Lh1p;->d:Ljava/lang/String;

    iget-object v0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast v0, Lsm;

    sget-object v2, Lsm;->c:Lsm;

    if-ne v0, v2, :cond_53

    invoke-virtual {p0, p1}, Lagm;->l(Ljava/lang/String;)Lxmo;

    move-result-object v1

    :cond_53
    if-nez v1, :cond_56

    return-void

    :cond_56
    move-object v2, v1

    :cond_57
    if-eqz p2, :cond_7c

    iget-object v8, v2, Lxmo;->a:Ljava/lang/String;

    iget-object v9, v2, Lxmo;->b:Ljava/lang/String;

    iget-object p0, p0, Lagm;->d:Ljava/lang/Object;

    move-object v10, p0

    check-cast v10, Ljava/lang/String;

    iget-object p0, p2, Lp7p;->a:Lvoo;

    new-instance v3, Li1p;

    iget-object v4, p0, Lvoo;->c:Ljava/lang/String;

    iget-object p1, p0, Lvoo;->b:Lpro;

    iget-object v5, p1, Lpro;->a:Ljava/lang/String;

    iget-object v6, p0, Lvoo;->j:Ljava/lang/String;

    iget-object v7, p0, Lvoo;->l:Lfuo;

    invoke-direct/range {v3 .. v10}, Li1p;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lvoo;->b()Ljava/util/List;

    move-result-object p0

    iget-object p1, p2, Lp7p;->b:Ljava/util/LinkedHashSet;

    invoke-static {v3, p0, p1}, Lp7p;->e(Lp8p;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    :cond_7c
    return-void
.end method

.method public final f(Ljava/lang/String;)I
    .registers 8

    iget-object v0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v0, v0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    invoke-static {p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/ContentValues;

    invoke-virtual {v2, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lagm;->d:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v3, v3, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    invoke-interface {v3, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_2b

    invoke-interface {v3, p1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_40

    :cond_2b
    invoke-interface {v3, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_36

    invoke-interface {v3, v1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_40

    :cond_36
    iget-object v1, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/ContentValues;

    const-string v4, "__uscp_predefined_default"

    invoke-virtual {v1, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_40
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3, p1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5f

    iget-object p1, p0, Lagm;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object p0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/UserSettingsContentProvider;->i(Landroid/net/Uri;)V

    const/4 p0, 0x1

    monitor-exit v0

    return p0

    :cond_5f
    monitor-exit v0

    const/4 p0, 0x0

    return p0

    :goto_62
    monitor-exit v0
    :try_end_63
    .catchall {:try_start_7 .. :try_end_63} :catchall_64

    throw p0

    :catchall_64
    move-exception p0

    goto :goto_62
.end method

.method public final g(Lylp;Ln1p;)V
    .registers 11

    invoke-virtual {p1}, Lylp;->e()Lyjo;

    move-result-object v1

    iget-object v0, v1, Lyjo;->c:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_f

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_f
    iget-object v0, p0, Lagm;->c:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lwjh;

    iget-object v0, v6, Lwjh;->e:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Lzyk;

    new-instance v0, Lgep;

    const/4 v5, 0x0

    move-object v3, p0

    move-object v4, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lgep;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v7}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyjo;

    invoke-virtual {p0}, Lyjo;->a()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_43

    sget-object p0, Lt0i;->b:Lp0i;

    invoke-virtual {v7}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyjo;

    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Lgep;->invoke(Ljava/lang/Object;)V

    return-void

    :cond_43
    sget-object p0, Ll1p;->a:Lsa7;

    invoke-virtual {v7}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyjo;

    invoke-virtual {p0}, Lyjo;->a()Ljava/io/File;

    move-result-object p0

    new-instance p1, Ll5b;

    const/16 p2, 0xe

    const/4 v1, 0x0

    invoke-direct {p1, p2, v1}, Ll5b;-><init>(BZ)V

    new-instance p2, Lgqo;

    invoke-direct {p2, v0, v6, v1}, Lgqo;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-string v0, "https://img-odx.op-mobile.opera.com/a/js/mraid.js"

    const/4 v1, 0x0

    invoke-static {v0, p0, p1, v1, p2}, Ll1p;->a(Ljava/lang/String;Ljava/io/File;Ll5b;Ljava/util/Set;Ln1p;)V

    return-void
.end method

.method public final h(Ljava/lang/String;)I
    .registers 10

    iget-object v0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v0, v0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    invoke-static {p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/ContentValues;

    invoke-virtual {v2, p1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iget-object v4, p0, Lagm;->d:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v4, v4, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    invoke-interface {v4, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    const-wide/16 v6, 0x0

    if-eqz v5, :cond_30

    invoke-interface {v4, p1, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    goto :goto_49

    :cond_30
    invoke-interface {v4, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3b

    invoke-interface {v4, v1, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    goto :goto_49

    :cond_3b
    iget-object v1, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/ContentValues;

    const-string v5, "__uscp_predefined_default"

    invoke-virtual {v1, v5}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    :goto_49
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, p1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    cmp-long p1, v5, v2

    if-eqz p1, :cond_66

    iget-object p1, p0, Lagm;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object p0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/UserSettingsContentProvider;->i(Landroid/net/Uri;)V

    const/4 p0, 0x1

    monitor-exit v0

    return p0

    :cond_66
    monitor-exit v0

    const/4 p0, 0x0

    return p0

    :goto_69
    monitor-exit v0
    :try_end_6a
    .catchall {:try_start_7 .. :try_end_6a} :catchall_6b

    throw p0

    :catchall_6b
    move-exception p0

    goto :goto_69
.end method

.method public final i(Ljava/lang/String;)I
    .registers 8

    iget-object v0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v0, v0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    const-string v1, "previous_version_code"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_12

    monitor-exit v0

    return v2

    :cond_12
    const-string v1, "version_code"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    iget-object v1, p0, Lagm;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/UserSettingsContentProvider;

    invoke-virtual {v1}, Lcom/opera/android/settings/UserSettingsContentProvider;->h()V

    :cond_21
    invoke-static {p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v3, Landroid/content/ContentValues;

    invoke-virtual {v3, p1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lagm;->d:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v4, v4, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    invoke-interface {v4, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_48

    invoke-interface {v4, p1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    goto :goto_61

    :cond_48
    invoke-interface {v4, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_53

    invoke-interface {v4, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    goto :goto_61

    :cond_53
    iget-object v1, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/ContentValues;

    const-string v5, "__uscp_predefined_default"

    invoke-virtual {v1, v5}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :goto_61
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4, p1, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-eq v1, v3, :cond_7c

    iget-object p1, p0, Lagm;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object p0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/UserSettingsContentProvider;->i(Landroid/net/Uri;)V

    const/4 p0, 0x1

    monitor-exit v0

    return p0

    :cond_7c
    monitor-exit v0

    return v2

    :goto_7e
    monitor-exit v0
    :try_end_7f
    .catchall {:try_start_7 .. :try_end_7f} :catchall_80

    throw p0

    :catchall_80
    move-exception p0

    goto :goto_7e
.end method

.method public final j(Landroid/content/Intent;Lkotlin/jvm/functions/Function1;)Z
    .registers 4

    iget-object p0, p0, Lagm;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    if-eqz v0, :cond_50

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_50

    invoke-interface {p2, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_50

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    const/high16 v0, 0x20000

    invoke-static {p2, p1, v0}, Ln5p;->a(Landroid/content/pm/PackageManager;Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_50

    :try_start_34
    sget-object p2, Lt0i;->b:Lp0i;

    const/high16 p2, 0x10000000

    invoke-virtual {p1, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_40
    .catchall {:try_start_34 .. :try_end_40} :catchall_41

    goto :goto_4a

    :catchall_41
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, p1

    :goto_4a
    instance-of p0, p0, Lq0i;

    if-nez p0, :cond_50

    const/4 p0, 0x1

    goto :goto_51

    :cond_50
    const/4 p0, 0x0

    :goto_51
    return p0
.end method

.method public final k(Lwj5;Lcom/opera/api/Callback;)V
    .registers 7

    iget-object v0, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v0, Lz77;

    new-instance v1, Lyj5;

    iget-object v2, p0, Lagm;->d:Ljava/lang/Object;

    check-cast v2, Lx5f;

    new-instance v3, Lwtm;

    check-cast p2, Lsu;

    invoke-direct {v3, p0, p1, p2}, Lwtm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v1, p1, v2, v3}, Lyj5;-><init>(Lwj5;Lx5f;Lwtm;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final l(Ljava/lang/String;)Lxmo;
    .registers 5

    const/4 v0, 0x0

    if-eqz p1, :cond_19

    invoke-static {p1}, Lagm;->o(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_19

    sget-object v2, Lk0l;->H:Lk0l;

    invoke-virtual {p0, v1, v2}, Lagm;->j(Landroid/content/Intent;Lkotlin/jvm/functions/Function1;)Z

    move-result v1

    if-eqz v1, :cond_19

    new-instance v1, Lxmo;

    const-string v2, "app"

    invoke-direct {v1, v2, p1}, Lxmo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1a

    :cond_19
    move-object v1, v0

    :goto_1a
    if-nez v1, :cond_43

    invoke-virtual {p0, p1}, Lagm;->m(Ljava/lang/String;)Lxmo;

    move-result-object v1

    if-nez v1, :cond_43

    if-eqz p1, :cond_42

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_42

    sget-object v1, Lblp;->a:Ljava/util/Set;

    iget-object p0, p0, Lagm;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {p0, v1}, Lblp;->c(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    if-eqz p0, :cond_42

    new-instance p0, Lxmo;

    const-string v0, "browser"

    invoke-direct {p0, v0, p1}, Lxmo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    :cond_42
    return-object v0

    :cond_43
    return-object v1
.end method

.method public final m(Ljava/lang/String;)Lxmo;
    .registers 20

    move-object/from16 v0, p1

    if-eqz v0, :cond_15b

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_15b

    sget-object v2, Lblp;->a:Ljava/util/Set;

    move-object/from16 v2, p0

    iget-object v2, v2, Lagm;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_15b

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.intent.action.VIEW"

    invoke-direct {v5, v6, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v7, "android.intent.category.DEFAULT"

    invoke-virtual {v5, v7}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    const-string v8, "android.intent.category.BROWSABLE"

    invoke-virtual {v5, v8}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    const v9, 0x20040

    invoke-static {v4, v5, v9}, Ln5p;->a(Landroid/content/pm/PackageManager;Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v9

    invoke-static {v9}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v9

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_4b
    :goto_4b
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_e7

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/content/pm/ResolveInfo;

    iget-object v13, v12, Landroid/content/pm/ResolveInfo;->filter:Landroid/content/IntentFilter;

    iget v14, v12, Landroid/content/pm/ResolveInfo;->match:I

    const/4 v15, -0x2

    if-eq v14, v15, :cond_df

    const/high16 v16, 0xfff0000

    and-int v14, v14, v16

    const/high16 v1, 0x300000

    if-lt v14, v1, :cond_df

    if-eqz v13, :cond_da

    invoke-virtual {v13, v6}, Landroid/content/IntentFilter;->matchAction(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_df

    invoke-virtual {v13, v7}, Landroid/content/IntentFilter;->hasCategory(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_df

    invoke-virtual {v13, v8}, Landroid/content/IntentFilter;->hasCategory(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_df

    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/content/IntentFilter;->hasDataScheme(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_df

    invoke-virtual {v13}, Landroid/content/IntentFilter;->schemesIterator()Ljava/util/Iterator;

    move-result-object v14

    invoke-static {v14}, Lv1j;->b(Ljava/util/Iterator;)Ldo5;

    move-result-object v14

    invoke-virtual {v14}, Ldo5;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_90
    :goto_90
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_af

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v1, v17

    check-cast v1, Ljava/lang/String;

    const-string v15, "http"

    invoke-static {v1, v15}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_90

    const-string v15, "https"

    invoke-static {v1, v15}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_df

    goto :goto_90

    :cond_af
    invoke-virtual {v13}, Landroid/content/IntentFilter;->countDataAuthorities()I

    move-result v1

    if-lez v1, :cond_df

    invoke-virtual {v13}, Landroid/content/IntentFilter;->authoritiesIterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-static {v1}, Lv1j;->b(Ljava/util/Iterator;)Ldo5;

    move-result-object v1

    invoke-virtual {v1}, Ldo5;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_c1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_df

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/content/IntentFilter$AuthorityEntry;

    invoke-virtual {v13, v3}, Landroid/content/IntentFilter$AuthorityEntry;->match(Landroid/net/Uri;)I

    move-result v13

    const/4 v14, -0x2

    if-eq v13, v14, :cond_c1

    and-int v13, v13, v16

    const/high16 v15, 0x300000

    if-lt v13, v15, :cond_c1

    :cond_da
    invoke-static {v12}, Lblp;->a(Landroid/content/pm/ResolveInfo;)Landroid/content/ComponentName;

    move-result-object v1

    goto :goto_e0

    :cond_df
    const/4 v1, 0x0

    :goto_e0
    if-eqz v1, :cond_4b

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4b

    :cond_e7
    invoke-static {v10}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_15b

    invoke-static {v4, v5}, Ln5p;->d(Landroid/content/pm/PackageManager;Landroid/content/Intent;)Landroid/content/pm/ResolveInfo;

    move-result-object v3

    if-eqz v3, :cond_fc

    invoke-static {v3}, Lblp;->a(Landroid/content/pm/ResolveInfo;)Landroid/content/ComponentName;

    move-result-object v3

    goto :goto_fd

    :cond_fc
    const/4 v3, 0x0

    :goto_fd
    if-eqz v3, :cond_109

    invoke-interface {v1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10a

    invoke-virtual {v5, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    goto :goto_14b

    :cond_109
    const/4 v3, 0x0

    :cond_10a
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1e

    if-lt v1, v4, :cond_116

    const/16 v1, 0x400

    invoke-virtual {v5, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    goto :goto_14b

    :cond_116
    if-eqz v3, :cond_14b

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_11c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_134

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Landroid/content/pm/ResolveInfo;

    invoke-static {v6}, Lblp;->a(Landroid/content/pm/ResolveInfo;)Landroid/content/ComponentName;

    move-result-object v6

    invoke-static {v6, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11c

    goto :goto_135

    :cond_134
    const/4 v4, 0x0

    :goto_135
    check-cast v4, Landroid/content/pm/ResolveInfo;

    if-eqz v4, :cond_14b

    :try_start_139
    const-class v1, Landroid/content/pm/ResolveInfo;

    const-string v3, "handleAllWebDataURI"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1
    :try_end_149
    .catchall {:try_start_139 .. :try_end_149} :catchall_14b

    if-nez v1, :cond_15b

    :catchall_14b
    :cond_14b
    :goto_14b
    const/high16 v1, 0x10000000

    invoke-virtual {v5, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :try_start_150
    invoke-virtual {v2, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_153
    .catch Ljava/lang/RuntimeException; {:try_start_150 .. :try_end_153} :catch_15b

    new-instance v1, Lxmo;

    const-string v2, "app"

    invoke-direct {v1, v2, v0}, Lxmo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_15c

    :catch_15b
    :cond_15b
    const/4 v1, 0x0

    :goto_15c
    return-object v1
.end method

.method public final n(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    iget-object p0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast p0, Lru9;

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "wallpaper.rotation.list"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_1d

    const-string v1, ","

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x6

    invoke-static {p0, v1, v0, v2}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object p0

    if-nez p0, :cond_1f

    :cond_1d
    sget-object p0, Ll08;->a:Ll08;

    :cond_1f
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_26

    return-object p1

    :cond_26
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_40

    add-int/lit8 v0, v0, 0x1

    goto :goto_2a

    :cond_3f
    const/4 v0, -0x1

    :cond_40
    add-int/lit8 v0, v0, 0x1

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    rem-int/2addr v0, p1

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final p()Z
    .registers 3

    iget-object p0, p0, Lagm;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v1, "wallpaper_rotation_enabled"

    invoke-interface {v0, v1}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public final q()Lab2;
    .registers 2

    iget-object v0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast v0, Lab2;

    if-nez v0, :cond_18

    iget-object v0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast v0, Lab2;

    if-nez v0, :cond_18

    iget-object v0, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lab2;

    iput-object v0, p0, Lagm;->c:Ljava/lang/Object;

    :cond_18
    return-object v0
.end method

.method public final r()Lab2;
    .registers 3

    iget-object v0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast v0, Lab2;

    if-eqz v0, :cond_c

    const/4 v1, 0x0

    iput-object v1, p0, Lagm;->c:Ljava/lang/Object;

    iput-object v0, p0, Lagm;->d:Ljava/lang/Object;

    return-object v0

    :cond_c
    iget-object v0, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lab2;

    iput-object v0, p0, Lagm;->d:Ljava/lang/Object;

    return-object v0
.end method

.method public final s()V
    .registers 3

    iget-object v0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast v0, Lrn9;

    sget-object v1, Lkf0;->b:Lkf0;

    invoke-virtual {v0, v1}, Lrn9;->J(Lkf0;)V

    iget-object v0, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v0, Lkdo;

    iget-object v0, v0, Lkdo;->f:Lkwf;

    const v1, 0x7f0a07fc

    iput v1, v0, Lo73;->i:I

    iget-object p0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    return-void
.end method

.method public final t()V
    .registers 2

    iget-object p0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast p0, Lrn9;

    sget-object v0, Lkf0;->e:Lkf0;

    invoke-virtual {p0, v0}, Lrn9;->J(Lkf0;)V

    return-void
.end method

.method public final u(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V
    .registers 12

    iget-object v0, p0, Lagm;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    const-string v1, "wallpaper_rotation_category"

    invoke-virtual {v0, v1, p1}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    iget-object p2, p0, Lagm;->d:Ljava/lang/Object;

    check-cast p2, Lonn;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v1, p1

    check-cast v1, Ljava/lang/Iterable;

    new-instance p1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v1, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {p1, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_29
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Laln;

    invoke-interface {v4}, Laln;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_29

    :cond_3d
    iget-object p2, p2, Lonn;->d:Lx5f;

    new-instance v3, Ljava/util/ArrayList;

    invoke-static {p1, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v4, 0x0

    move v5, v4

    :goto_4e
    if-ge v5, v2, :cond_71

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Ljava/lang/String;

    const-string v7, "FILE_storefront_wallpaper_"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_63

    const-string v6, "store-wallpaper"

    goto :goto_6d

    :cond_63
    const-string v7, "FILE_user_wallpaper_"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6d

    const-string v6, "user-wallpaper"

    :cond_6d
    :goto_6d
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4e

    :cond_71
    iget-boolean p1, p2, Lx5f;->h:Z

    if-eqz p1, :cond_9d

    iget-object p1, p2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v5, Lnu0;

    const/16 v6, 0x98b

    const/4 v7, 0x3

    const/4 v8, 0x1

    invoke-direct {v5, v6, v8, v7}, Ljf0;-><init>(III)V

    if-eqz v0, :cond_87

    move v4, v8

    :cond_87
    invoke-virtual {v5, v8, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v0, 0x2

    invoke-virtual {v5, v0, v8, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, p1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v0, 0x46

    invoke-virtual {p1, v0, v8, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p2, v2}, Lx5f;->U0(Lx56;)V

    :cond_9d
    iget-object p0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast p0, Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    new-instance v6, Lq0n;

    const/4 p1, 0x7

    invoke-direct {v6, p1}, Lq0n;-><init>(B)V

    const/16 v7, 0x1e

    const-string v2, ","

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p2, Landroid/content/SharedPreferences$Editor;

    const-string v0, "wallpaper.rotation.list"

    invoke-interface {p2, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final v()Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Lagm;->b:Ljava/lang/Object;

    iget-object v1, p0, Lagm;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/reflect/Field;

    iget-object p0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Class;

    :try_start_a
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_12} :catch_13

    return-object p0

    :catch_13
    move-exception v2

    new-instance v3, Le22;

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v4, " of type "

    const-string v5, " on object of type "

    const-string v6, "Failed to get value of field "

    invoke-static {v6, v1, v4, v0, v5}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v3, p0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public final w(Ljava/lang/Object;)V
    .registers 8

    iget-object v0, p0, Lagm;->b:Ljava/lang/Object;

    iget-object v1, p0, Lagm;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/reflect/Field;

    :try_start_6
    invoke-virtual {v1, v0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_9} :catch_a

    return-void

    :catch_a
    move-exception p1

    new-instance v2, Le22;

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v3, " of type "

    const-string v4, " on object of type "

    const-string v5, "Failed to set value of field "

    invoke-static {v5, v1, v3, v0, v4}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public final z()V
    .registers 2

    iget-object p0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast p0, Lrn9;

    sget-object v0, Lkf0;->d:Lkf0;

    invoke-virtual {p0, v0}, Lrn9;->J(Lkf0;)V

    return-void
.end method

.method public final zza()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lagm;->a:B

    iget-object v1, p0, Lagm;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_46

    check-cast v1, Ljrp;

    invoke-static {v1}, Larp;->a(Ljrp;)Larp;

    move-result-object v0

    iget-object v1, p0, Lagm;->c:Ljava/lang/Object;

    check-cast v1, Ljrp;

    invoke-static {v1}, Larp;->a(Ljrp;)Larp;

    move-result-object v1

    iget-object p0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast p0, Ljrp;

    invoke-static {p0}, Larp;->a(Ljrp;)Larp;

    move-result-object p0

    new-instance v2, Lktp;

    invoke-direct {v2, v0, v1, p0}, Lktp;-><init>(Larp;Larp;Larp;)V

    return-object v2

    :pswitch_23
    check-cast v1, Lcpp;

    invoke-interface {v1}, Lcpp;->zza()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lagm;->c:Ljava/lang/Object;

    check-cast v1, Lcpp;

    invoke-interface {v1}, Lcpp;->zza()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lerp;

    iget-object p0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast p0, Luto;

    iget-object p0, p0, Luto;->b:Ljava/lang/Object;

    check-cast p0, Ln0c;

    iget-object p0, p0, Ln0c;->a:Landroid/content/Context;

    new-instance v2, Lrsp;

    check-cast v0, Ljup;

    invoke-direct {v2, v0, v1, p0}, Lrsp;-><init>(Ljup;Lerp;Landroid/content/Context;)V

    return-object v2

    nop

    :pswitch_data_46
    .packed-switch 0xd
        :pswitch_23
    .end packed-switch
.end method
