.class public final Lfyk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw1n;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 13
    iput-byte p4, p0, Lfyk;->a:B

    iput-object p1, p0, Lfyk;->b:Ljava/lang/Object;

    iput-object p2, p0, Lfyk;->c:Ljava/lang/Object;

    iput-object p3, p0, Lfyk;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lwv1;Ltt3;Lwv1;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lfyk;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfyk;->b:Ljava/lang/Object;

    iput-object p2, p0, Lfyk;->d:Ljava/lang/Object;

    iput-object p3, p0, Lfyk;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final apply(I)V
    .registers 7

    iget-byte v0, p0, Lfyk;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lfyk;->d:Ljava/lang/Object;

    iget-object v3, p0, Lfyk;->b:Ljava/lang/Object;

    iget-object v4, p0, Lfyk;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_e6

    check-cast v4, Ltt3;

    if-lez p1, :cond_38

    const p0, 0x71dcdd60

    if-ge p1, p0, :cond_38

    invoke-virtual {v4}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "webapp_shortcut_migration_pending"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    check-cast v3, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v4}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lru9;

    check-cast v2, Lumi;

    invoke-static {v3, p0, v2}, Lsyn;->a(Lcom/opera/android/BrowserActivity;Lru9;Lumi;)V

    :cond_38
    return-void

    :pswitch_39
    if-lez p1, :cond_6b

    const p0, 0x71b6c378    # 1.8100025E30f

    if-ge p1, p0, :cond_6b

    check-cast v3, Lwv1;

    iget-object p0, v3, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzwk;

    check-cast v4, Lwv1;

    iget-object p1, v4, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldb;

    check-cast v2, Ltt3;

    invoke-virtual {v2}, Ltt3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ljbd;

    const/16 v3, 0x15

    invoke-direct {v2, p0, v0, p1, v3}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p0, Lcak;->d:Lavj;

    invoke-static {v1, v2}, Lavj;->g(ILjava/lang/Runnable;)V

    :cond_6b
    return-void

    :pswitch_6c
    const p0, 0x71cc2bf0

    if-ge p1, p0, :cond_a8

    check-cast v3, Lcom/opera/android/BrowserActivity;

    check-cast v4, Lumi;

    check-cast v2, Ltt3;

    invoke-virtual {v2}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    sget-object p1, Ljlm;->a:Lnx1;

    new-instance v0, Landroid/util/Pair;

    invoke-direct {v0, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lhlm;

    const-string v0, "ga_usage_statistics"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_a4

    new-instance p0, Lilm;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lilm;-><init>(Ljava/lang/Object;B)V

    sget-object p1, Lcak;->d:Lavj;

    new-instance p1, Ln32;

    const/4 v0, 0x6

    invoke-direct {p1, p0, v0}, Ln32;-><init>(Lcom/opera/api/Callback;B)V

    invoke-static {v1, p1}, Lavj;->g(ILjava/lang/Runnable;)V

    goto :goto_a8

    :cond_a4
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lhlm;->a(Ljava/lang/String;)V

    :cond_a8
    :goto_a8
    return-void

    :pswitch_a9
    if-eqz p1, :cond_e4

    const v0, 0x71c1ac70

    if-ge p1, v0, :cond_e4

    check-cast v3, Lwv1;

    iget-object p1, v3, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldb;

    invoke-virtual {p1}, Ldb;->f()Z

    move-result p1

    if-eqz p1, :cond_d0

    check-cast v2, Ltt3;

    invoke-virtual {v2}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    const-string v0, "enable_sync"

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_e4

    :cond_d0
    check-cast v4, Lwv1;

    iget-object p1, v4, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnr8;

    new-instance v0, Lqlk;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Lqlk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lnr8;->f(Ljava/lang/Runnable;)V

    :cond_e4
    return-void

    nop

    :pswitch_data_e6
    .packed-switch 0x0
        :pswitch_a9
        :pswitch_6c
        :pswitch_39
    .end packed-switch
.end method
