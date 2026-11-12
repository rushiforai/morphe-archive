.class public final Lxb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldb;

.field public final b:Lzwk;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Lkze;

.field public final e:Ljze;


# direct methods
.method public constructor <init>(Ldb;Lzwk;Lcom/opera/android/settings/SettingsManager;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lkze;

    sget-object v1, Lepf;->a:Lepf;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lxb;->d:Lkze;

    new-instance v1, Ljze;

    new-instance v2, Ldpf;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lipf;

    invoke-direct {v2, v3}, Ldpf;-><init>(Lipf;)V

    invoke-direct {v1, v2}, Ljze;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lxb;->e:Ljze;

    iput-object p1, p0, Lxb;->a:Ldb;

    iput-object p2, p0, Lxb;->b:Lzwk;

    iput-object p3, p0, Lxb;->c:Lcom/opera/android/settings/SettingsManager;

    new-instance v2, Lk9;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lk9;-><init>(Ljava/lang/Object;B)V

    iget-object v1, v1, Ljze;->l:Lh42;

    invoke-virtual {v1, v0, v2}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v0, Lwb;

    new-instance v1, Lc4;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lwb;-><init>(Lc4;)V

    invoke-virtual {p1, v0}, Ldb;->a(Lcb;)V

    invoke-virtual {p2, v0}, Lzwk;->a(Lywk;)V

    invoke-virtual {p3, v0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p0}, Lxb;->b()V

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 6

    iget-object v0, p0, Lxb;->a:Ldb;

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v1

    iget-object v2, p0, Lxb;->b:Lzwk;

    invoke-static {v0, v2}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1c

    iget-object p0, p0, Lxb;->c:Lcom/opera/android/settings/SettingsManager;

    const-string v4, "enable_sync"

    invoke-virtual {p0, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1c

    move p0, v3

    goto :goto_1d

    :cond_1c
    move p0, v2

    :goto_1d
    if-nez v0, :cond_25

    if-nez p0, :cond_25

    if-eqz v1, :cond_24

    return v2

    :cond_24
    return v3

    :cond_25
    const/4 p0, 0x2

    return p0
.end method

.method public final b()V
    .registers 12

    iget-object v0, p0, Lxb;->a:Ldb;

    iget-object v1, v0, Ldb;->a:Lbb;

    iget-boolean v1, v1, Lbb;->f:Z

    if-eqz v1, :cond_e

    iget-object v1, p0, Lxb;->b:Lzwk;

    iget-boolean v1, v1, Lzwk;->b:Z

    if-nez v1, :cond_f

    :cond_e
    return-void

    :cond_f
    invoke-virtual {v0}, Ldb;->d()Z

    move-result v1

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    const-string v5, ""

    if-eqz v1, :cond_3b

    new-instance v1, Lcpf;

    iget-object v0, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz v0, :cond_2d

    iget-wide v6, v0, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    cmp-long v0, v6, v2

    if-eqz v0, :cond_2d

    invoke-static {v6, v7}, LJ/N;->MIPULsoq(J)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    :cond_2d
    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-eqz v4, :cond_32

    move-object v5, v4

    :cond_32
    invoke-virtual {p0}, Lxb;->a()I

    move-result v0

    invoke-direct {v1, v5, v0}, Lcpf;-><init>(Ljava/lang/String;I)V

    goto/16 :goto_119

    :cond_3b
    invoke-virtual {v0}, Ldb;->f()Z

    move-result v1

    const/4 v6, 0x2

    if-nez v1, :cond_4c

    invoke-virtual {p0}, Lxb;->a()I

    move-result v1

    if-eq v1, v6, :cond_4c

    sget-object v1, Lgpf;->a:Lgpf;

    goto/16 :goto_119

    :cond_4c
    move-wide v7, v2

    new-instance v2, Lfpf;

    iget-object v1, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz v1, :cond_59

    iget-wide v9, v1, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    cmp-long v1, v9, v7

    if-nez v1, :cond_5b

    :cond_59
    move-object v1, v4

    goto :goto_61

    :cond_5b
    invoke-static {v9, v10}, LJ/N;->MIPULsoq(J)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_61
    sget-object v3, Laik;->a:[Ljava/lang/String;

    if-nez v1, :cond_67

    move-object v3, v5

    goto :goto_68

    :cond_67
    move-object v3, v1

    :goto_68
    invoke-virtual {v0}, Ldb;->c()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_6f

    move-object v1, v5

    :cond_6f
    iget-object v7, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez v7, :cond_75

    move-object v7, v4

    goto :goto_85

    :cond_75
    iget-object v7, v7, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object v7, v7, Lrb;->a:Lb59;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/SharedPreferences;

    const-string v8, "full_name"

    invoke-interface {v7, v8, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :goto_85
    const/4 v8, 0x0

    if-nez v7, :cond_b6

    iget-object v7, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez v7, :cond_8e

    move-object v7, v4

    goto :goto_9e

    :cond_8e
    iget-object v7, v7, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object v7, v7, Lrb;->a:Lb59;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/SharedPreferences;

    const-string v9, "display_name"

    invoke-interface {v7, v9, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :goto_9e
    if-nez v7, :cond_b6

    invoke-virtual {v0}, Ldb;->c()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_ae

    const-string v9, "@"

    invoke-virtual {v7, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_b0

    :cond_ae
    move-object v7, v4

    goto :goto_b6

    :cond_b0
    invoke-static {v7, v9}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    aget-object v7, v7, v8

    :cond_b6
    :goto_b6
    if-nez v7, :cond_b9

    move-object v7, v5

    :cond_b9
    iget-object v9, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez v9, :cond_bf

    move v9, v8

    goto :goto_cf

    :cond_bf
    iget-object v9, v9, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object v9, v9, Lrb;->a:Lb59;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/SharedPreferences;

    const-string v10, "has_default_profile_picture"

    invoke-interface {v9, v10, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    :goto_cf
    if-nez v9, :cond_e8

    iget-object v9, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz v9, :cond_e5

    iget-object v9, v9, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object v9, v9, Lrb;->a:Lb59;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/SharedPreferences;

    const-string v10, "profile_picture"

    invoke-interface {v9, v10, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_e5
    if-eqz v4, :cond_e8

    move-object v5, v4

    :cond_e8
    invoke-virtual {p0}, Lxb;->a()I

    move-result v4

    invoke-virtual {v0}, Ldb;->e()Z

    move-result v9

    if-eqz v9, :cond_f7

    const/4 v6, 0x1

    :cond_f3
    :goto_f3
    move-object v8, v5

    move v5, v6

    move-object v6, v1

    goto :goto_115

    :cond_f7
    iget-object v0, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz v0, :cond_f3

    iget-object v0, v0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object v0, v0, Lrb;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v9, "verified"

    invoke-interface {v0, v9}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_f3

    invoke-interface {v0, v9, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_f3

    move v6, v8

    goto :goto_f3

    :goto_115
    invoke-direct/range {v2 .. v8}, Lfpf;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v2

    :goto_119
    iget-object p0, p0, Lxb;->d:Lkze;

    invoke-virtual {p0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
