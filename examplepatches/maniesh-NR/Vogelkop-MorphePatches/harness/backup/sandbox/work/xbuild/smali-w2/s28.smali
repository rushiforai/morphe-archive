.class public final Ls28;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final synthetic a:B

.field public final b:Lb59;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public d:Z

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lumi;Lk6l;Lcom/opera/android/settings/SettingsManager;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Ls28;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ll76;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ll76;-><init>(I)V

    iput-object v0, p0, Ls28;->e:Ljava/lang/Object;

    new-instance v0, Lqz;

    const/16 v1, 0x17

    invoke-direct {v0, p0, v1}, Lqz;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ls28;->g:Ljava/lang/Object;

    const-string v0, "recent_searches"

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    invoke-static {p1, p2, v0, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Ls28;->b:Lb59;

    iput-object p4, p0, Ls28;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p4, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iput-object p3, p0, Ls28;->f:Ljava/lang/Object;

    new-instance p1, Lko7;

    invoke-direct {p1, p0, p2}, Lko7;-><init>(Ls28;Lumi;)V

    iput-object p1, p0, Ls28;->h:Ljava/lang/Object;

    const-string p1, "enable_recent_searches"

    invoke-virtual {p0, p1}, Ls28;->M(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lt28;Lumi;Lcom/opera/android/settings/SettingsManager;Lt1;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Ls28;->a:B

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls28;->h:Ljava/lang/Object;

    .line 55
    iput-object p2, p0, Ls28;->e:Ljava/lang/Object;

    .line 56
    iput-object p3, p0, Ls28;->c:Lcom/opera/android/settings/SettingsManager;

    .line 57
    iput-object p4, p0, Ls28;->f:Ljava/lang/Object;

    .line 58
    iget-object p1, p1, Lt28;->a:Landroid/content/Context;

    const-string p3, "enc_bkgmgr"

    new-array p4, v0, [Lbg1;

    invoke-static {p1, p2, p3, p4}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Ls28;->b:Lb59;

    .line 59
    new-instance p1, Lr28;

    invoke-direct {p1, p0, v0}, Lr28;-><init>(Ls28;B)V

    invoke-interface {p2, p1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 4

    iget-byte v0, p0, Ls28;->a:B

    iget-object v1, p0, Ls28;->c:Lcom/opera/android/settings/SettingsManager;

    packed-switch v0, :pswitch_data_4a

    const-string v0, "enable_recent_searches"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-virtual {v1, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    iget-object v0, p0, Ls28;->g:Ljava/lang/Object;

    check-cast v0, Lqz;

    iget-boolean v1, p0, Ls28;->d:Z

    if-eq v1, p1, :cond_3a

    iput-boolean p1, p0, Ls28;->d:Z

    iget-object v1, p0, Ls28;->f:Ljava/lang/Object;

    check-cast v1, Lk6l;

    if-eqz p1, :cond_2e

    invoke-virtual {v1, v0}, Lk6l;->b(La2l;)V

    iget-object p0, p0, Ls28;->h:Ljava/lang/Object;

    check-cast p0, Lko7;

    invoke-virtual {p0}, Lldk;->h()V

    goto :goto_3a

    :cond_2e
    invoke-virtual {v1, v0}, Lk6l;->v(La2l;)V

    new-instance p1, Lrl;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Lrl;-><init>(B)V

    invoke-virtual {p0, p1}, Ls28;->b(Ljava/lang/Runnable;)V

    :cond_3a
    :goto_3a
    return-void

    :pswitch_3b
    const-string v0, "eula_accepted.gdpr"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_49

    invoke-virtual {v1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    invoke-virtual {p0}, Ls28;->e()V

    :cond_49
    return-void

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_3b
    .end packed-switch
.end method

.method public final a()V
    .registers 2

    iget-object v0, p0, Ls28;->g:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    if-eqz v0, :cond_d

    iget-boolean p0, p0, Ls28;->d:Z

    if-eqz p0, :cond_d

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_d
    return-void
.end method

.method public final b(Ljava/lang/Runnable;)V
    .registers 6

    iget-object v0, p0, Ls28;->h:Ljava/lang/Object;

    check-cast v0, Lko7;

    iget-boolean v1, p0, Ls28;->d:Z

    if-nez v1, :cond_b

    invoke-virtual {v0}, Lldk;->h()V

    :cond_b
    new-instance v1, Lwr9;

    const/16 v2, 0x10

    const/4 v3, 0x0

    invoke-direct {v1, v2, p0, p1, v3}, Lwr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0, v1}, Lldk;->f(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c(Ljava/io/File;Ljavax/crypto/spec/SecretKeySpec;)V
    .registers 7

    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_6} :catch_4f
    .catchall {:try_start_1 .. :try_end_6} :catchall_56

    :try_start_6
    invoke-static {v1, p2}, Lo36;->a(Ljava/io/FileInputStream;Ljavax/crypto/spec/SecretKeySpec;)Ljavax/crypto/CipherInputStream;

    move-result-object v0

    iget-object v2, p0, Ls28;->h:Ljava/lang/Object;

    check-cast v2, Lt28;

    iget-object v3, p0, Ls28;->e:Ljava/lang/Object;

    check-cast v3, Lumi;

    invoke-virtual {v2, v0, v3}, Lt28;->b(Ljavax/crypto/CipherInputStream;Lumi;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    iget-object v0, p0, Ls28;->b:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    iget-object p0, p0, Ls28;->f:Ljava/lang/Object;

    check-cast p0, Lt1;

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc36;

    invoke-virtual {p2}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    move-result-object p2

    invoke-virtual {p0, p2}, Lc36;->d([B)[B

    move-result-object p0

    if-eqz p0, :cond_46

    const/4 p2, 0x2

    invoke-static {p0, p2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string v0, "k2"

    invoke-interface {p2, v0, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_46
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_46} :catch_4e
    .catchall {:try_start_6 .. :try_end_46} :catchall_4c

    :cond_46
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    return-void

    :goto_4a
    move-object v0, v1

    goto :goto_57

    :catchall_4c
    move-exception p0

    goto :goto_4a

    :catch_4e
    move-object v0, v1

    :catch_4f
    :try_start_4f
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_52
    .catchall {:try_start_4f .. :try_end_52} :catchall_56

    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    return-void

    :catchall_56
    move-exception p0

    :goto_57
    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0
.end method

.method public final d()V
    .registers 3

    iget-object v0, p0, Ls28;->h:Ljava/lang/Object;

    check-cast v0, Lko7;

    new-instance v1, Ljava/util/ArrayList;

    iget-object p0, p0, Ls28;->e:Ljava/lang/Object;

    check-cast p0, Ll76;

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Lldk;->g(Ljava/lang/Object;)V

    return-void
.end method

.method public final e()V
    .registers 8

    const-string v0, "eula_accepted.gdpr"

    iget-object v1, p0, Ls28;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_37

    iget-object v0, p0, Ls28;->h:Ljava/lang/Object;

    check-cast v0, Lt28;

    iget-object v0, v0, Lt28;->c:Lck3;

    new-instance v2, Lkw3;

    const/4 v1, 0x7

    invoke-direct {v2, v1}, Lkw3;-><init>(B)V

    new-instance v5, Ldg7;

    const/16 v1, 0x8

    invoke-direct {v5, p0, v1}, Ldg7;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lrl;

    const/4 p0, 0x4

    invoke-direct {v3, p0}, Lrl;-><init>(B)V

    iget-object p0, v0, Lck3;->a:Landroid/content/Context;

    invoke-static {p0}, Lcom/google/android/gms/auth/blockstore/Blockstore;->getClient(Landroid/content/Context;)Lcom/google/android/gms/auth/blockstore/BlockstoreClient;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/android/gms/auth/blockstore/BlockstoreClient;->isEndToEndEncryptionAvailable()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance v1, Lws1;

    const/4 v6, 0x3

    invoke-direct/range {v1 .. v6}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    return-void

    :cond_37
    invoke-virtual {v1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method
