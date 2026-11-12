.class public final Lk32;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;B)V
    .registers 3

    iput-byte p2, p0, Lk32;->e:B

    iput-object p1, p0, Lk32;->f:Landroid/content/Context;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/content/Context;B)V
    .registers 4

    .line 8
    iput-byte p3, p0, Lk32;->e:B

    iput-object p2, p0, Lk32;->f:Landroid/content/Context;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lk32;->e:B

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object p0, p0, Lk32;->f:Landroid/content/Context;

    packed-switch v0, :pswitch_data_1dc

    invoke-static {p0}, Lufn;->t(Landroid/content/Context;)Lufn;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltfn;

    iget-wide v0, p0, Ltfn;->a:J

    const-wide/16 v4, 0x4

    and-long/2addr v0, v4

    const-wide/16 v4, 0x0

    cmp-long p0, v0, v4

    if-nez p0, :cond_20

    move v2, v3

    :cond_20
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_25
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-class v0, Lcom/opera/android/translate_web_pages/TranslateWebPagesDatabase;

    const-string v1, "translate_web_pages"

    invoke-static {p0, v0, v1}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object p0

    invoke-virtual {p0}, Lu5i;->b()Ly5i;

    move-result-object p0

    check-cast p0, Lcom/opera/android/translate_web_pages/TranslateWebPagesDatabase;

    invoke-virtual {p0}, Lcom/opera/android/translate_web_pages/TranslateWebPagesDatabase;->x()Lo3m;

    move-result-object p0

    return-object p0

    :pswitch_3c
    sget-object v0, Li0l;->b:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbu6;

    invoke-virtual {v0, p0, v3}, Lbu6;->a(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5a

    invoke-static {p0}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcj9;

    iget-object v0, p0, Lcj9;->b:Ljava/lang/String;

    :cond_5a
    sget-object p0, Laik;->a:[Ljava/lang/String;

    if-nez v0, :cond_60

    const-string v0, ""

    :cond_60
    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, p0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_67
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-class v0, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;

    const-string v1, "suggested_sites"

    invoke-static {p0, v0, v1}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object p0

    new-array v0, v2, [Lryd;

    sget-object v1, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->l:Lbpk;

    aput-object v1, v0, v3

    invoke-virtual {p0, v0}, Lu5i;->a([Lryd;)V

    new-array v0, v2, [Lryd;

    sget-object v1, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->m:Lbpk;

    aput-object v1, v0, v3

    invoke-virtual {p0, v0}, Lu5i;->a([Lryd;)V

    new-array v0, v2, [Lryd;

    sget-object v1, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->n:Lbpk;

    aput-object v1, v0, v3

    invoke-virtual {p0, v0}, Lu5i;->a([Lryd;)V

    new-array v0, v2, [Lryd;

    sget-object v1, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->o:Lbpk;

    aput-object v1, v0, v3

    invoke-virtual {p0, v0}, Lu5i;->a([Lryd;)V

    new-array v0, v2, [Lryd;

    sget-object v1, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->p:Lbpk;

    aput-object v1, v0, v3

    invoke-virtual {p0, v0}, Lu5i;->a([Lryd;)V

    new-array v0, v2, [Lryd;

    sget-object v1, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->q:Lbpk;

    aput-object v1, v0, v3

    invoke-virtual {p0, v0}, Lu5i;->a([Lryd;)V

    invoke-virtual {p0}, Lu5i;->b()Ly5i;

    move-result-object p0

    check-cast p0, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;

    invoke-virtual {p0}, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->x()Lapk;

    move-result-object p0

    return-object p0

    :pswitch_b4
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "bsi"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0

    :pswitch_c0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-class v0, Lcom/opera/android/redirect_store/RedirectStoreDatabase;

    const-string v1, "redirect_store"

    invoke-static {p0, v0, v1}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object p0

    invoke-virtual {p0}, Lu5i;->b()Ly5i;

    move-result-object p0

    check-cast p0, Lcom/opera/android/redirect_store/RedirectStoreDatabase;

    invoke-virtual {p0}, Lcom/opera/android/redirect_store/RedirectStoreDatabase;->x()Ljqh;

    move-result-object p0

    return-object p0

    :pswitch_d7
    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object v0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "downloadprovider.secret.key"

    const/4 v4, 0x0

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_104

    const/16 v0, 0x20

    new-array v0, v0, [B

    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v4, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_104
    invoke-static {v0, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    return-object p0

    :pswitch_109
    invoke-static {p0}, Li0l;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_10e
    invoke-static {p0}, Li0l;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_113
    const-string v0, "compression_stats"

    invoke-virtual {p0, v0, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "version"

    invoke-interface {p0, v0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-eq v1, v2, :cond_132

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "data_savings_history"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_132
    return-object p0

    :pswitch_133
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-class v0, Lcom/opera/android/wallet/WalletDatabase;

    const-string v4, "wallet"

    invoke-static {p0, v0, v4}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object p0

    const/16 v0, 0x17

    new-array v0, v0, [Lryd;

    sget-object v4, Lcom/opera/android/wallet/WalletDatabase;->l:Lbpk;

    aput-object v4, v0, v3

    sget-object v3, Lcom/opera/android/wallet/WalletDatabase;->m:Lbpk;

    aput-object v3, v0, v2

    sget-object v2, Lcom/opera/android/wallet/WalletDatabase;->n:Lbpk;

    aput-object v2, v0, v1

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->o:Lbpk;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->p:Lbpk;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->q:Lbpk;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->r:Lbpk;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->s:Lbpk;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->t:Lbpk;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->u:Lbpk;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->v:Lbpk;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->w:Lbpk;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->x:Lbpk;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->y:Lbpk;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->z:Lbpk;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->A:Lbpk;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->B:Lbpk;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->C:Lbpk;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->D:Lbpk;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->E:Lbpk;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->F:Lbpk;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->G:Lbpk;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/wallet/WalletDatabase;->H:Lbpk;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    invoke-virtual {p0, v0}, Lu5i;->a([Lryd;)V

    invoke-virtual {p0}, Lu5i;->b()Ly5i;

    move-result-object p0

    check-cast p0, Lcom/opera/android/wallet/WalletDatabase;

    invoke-virtual {p0}, Lcom/opera/android/wallet/WalletDatabase;->x()Lsin;

    move-result-object p0

    return-object p0

    :pswitch_1d0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "aisq"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0

    :pswitch_data_1dc
    .packed-switch 0x0
        :pswitch_1d0
        :pswitch_133
        :pswitch_113
        :pswitch_10e
        :pswitch_109
        :pswitch_d7
        :pswitch_c0
        :pswitch_b4
        :pswitch_67
        :pswitch_3c
        :pswitch_25
    .end packed-switch
.end method
